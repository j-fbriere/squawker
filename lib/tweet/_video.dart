import 'dart:async';

import 'package:better_player_plus/better_player_plus.dart' hide VisibilityDetector, VisibilityInfo;
import 'package:dart_twitter_api/twitter_api.dart';
import 'package:flutter/material.dart';
import 'package:pref/pref.dart';
import 'package:squawker/constants.dart';
import 'package:squawker/generated/l10n.dart';
import 'package:squawker/tweet/_video_controls.dart';
import 'package:squawker/tweet/video_controller_pool.dart';
import 'package:squawker/tweet/video_quality.dart';
import 'package:squawker/tweet/video_wakelock.dart';
import 'package:squawker/utils/iterables.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// Disk cache so replaying a finished video, scrolling back to it, or a GIF
/// looping reads from disk instead of re-downloading — the player keeps no
/// back-buffer, so without this a seek to 0 re-fetches from the network.
const _videoCacheConfiguration = BetterPlayerCacheConfiguration(
  useCache: true,
  maxCacheSize: 256 * 1024 * 1024,
  maxCacheFileSize: 50 * 1024 * 1024,
);

class TweetVideoUrls {
  final String streamUrl;
  final String? downloadUrl;
  final List<TweetVideoQuality> qualities;

  TweetVideoUrls(this.streamUrl, this.downloadUrl, {this.qualities = const []});
}

class TweetVideoMetadata {
  final double aspectRatio;
  final String? imageUrl;
  final Future<TweetVideoUrls> Function() streamUrlsBuilder;

  TweetVideoMetadata(this.aspectRatio, this.imageUrl, this.streamUrlsBuilder);

  static Future<TweetVideoUrls> Function() streamUrlsBuilderFromVariants(List<Variant> variants) {
    // Use the progressive MP4 variants (highest bitrate first), not X's HLS
    // master playlist (variants[0]): the MP4 list is what powers the in-player
    // quality picker. Fall back to variants[0] only when no MP4 exists (e.g.
    // live broadcasts), which the player handles over HLS natively.
    var mp4Variants = variants
        .where((e) => e.bitrate != null)
        .where((e) => e.url != null)
        .where((e) => e.contentType == 'video/mp4')
        .sorted((a, b) => -(a.bitrate!.compareTo(b.bitrate!)))
        .toList();

    var qualities =
        mp4Variants.map((e) => TweetVideoQuality(e.url!, _qualityLabel(e.url!, e.bitrate))).toList();

    var mp4Url = qualities.isNotEmpty ? qualities.first.url : null;
    var streamUrl = mp4Url ?? variants.firstWhereOrNull((e) => e.url != null)?.url ?? '';

    return () async => TweetVideoUrls(streamUrl, mp4Url, qualities: qualities);
  }

  // Resolution tag from X's MP4 URL path (`.../1280x720/...`), else the bitrate.
  static String _qualityLabel(String url, int? bitrate) {
    var match = RegExp(r'/(\d+)x(\d+)/').firstMatch(url);
    if (match != null) {
      return '${match.group(2)}p';
    }
    if (bitrate != null) {
      return '${(bitrate / 1000000).toStringAsFixed(1)} Mbps';
    }
    return '—';
  }

  factory TweetVideoMetadata.fromMedia(Media media) {
    var aspectRatio = media.videoInfo?.aspectRatio == null
        ? 1.0
        : media.videoInfo!.aspectRatio![0] / media.videoInfo!.aspectRatio![1];

    var variants = media.videoInfo?.variants ?? [];
    var imageUrl = media.mediaUrlHttps!;

    return TweetVideoMetadata(aspectRatio, imageUrl, streamUrlsBuilderFromVariants(variants));
  }
}

class TweetVideo extends StatefulWidget {
  final String username;
  final bool loop;
  final TweetVideoMetadata metadata;
  final bool alwaysPlay;
  final bool disableControls;
  final String? tweetId;
  final int mediaIndex;

  const TweetVideo({
    super.key,
    required this.username,
    required this.loop,
    required this.metadata,
    this.alwaysPlay = false,
    this.disableControls = false,
    this.tweetId,
    this.mediaIndex = 0,
  });

  // GIFs play on their own, silently and on a loop, all over the timeline.
  bool get keepsScreenAwake => !disableControls;

  @override
  State<StatefulWidget> createState() => _TweetVideoState();
}

class _TweetVideoState extends State<TweetVideo> with WidgetsBindingObserver {
  VideoControllerPool? _pool;
  PooledVideo? _pooled;
  Future<PooledVideo>? _acquireFuture;
  bool _ownsControllers = false;
  bool _holdsPoolRef = false;

  bool _autoPlay = false;
  bool _userRequestedPlay = false;
  bool _playbackError = false;
  bool _firstFrameRendered = false;
  bool _posterGone = false;
  bool _prefBackground = true;
  final Key _visibilityKey = UniqueKey();
  double _lastVisibleFraction = 0.0;
  Timer? _pauseTimer;
  void Function(BetterPlayerEvent)? _onEvent;

  String? get _cacheKey => widget.tweetId == null ? null : '${widget.tweetId}:${widget.mediaIndex}';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    try {
      _pool = context.read<VideoControllerPool>();
    } on ProviderNotFoundException {
      _pool = null;
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // With background playback off, pause when the app leaves the foreground.
    if (_prefBackground) return;
    if (state == AppLifecycleState.paused || state == AppLifecycleState.hidden) {
      if (_pooled?.isPlaying ?? false) _pooled?.controller.pause();
    }
  }

  // Default variant from [optionMediaVideoQuality]; qualities are sorted highest-first.
  static String _defaultQualityUrl(TweetVideoUrls urls, String quality) {
    final q = urls.qualities;
    if (q.isEmpty) return urls.streamUrl;
    final i = switch (quality) {
      'thumb' => q.length - 1,
      'small' => (q.length * 3) ~/ 4,
      'medium' => q.length ~/ 2,
      _ => 0,
    };
    return q[i.clamp(0, q.length - 1)].url;
  }

  // Map the prefetch pref to the player's buffering. These are targets, not a
  // hard cap (it loads in byte-sized chunks and honours an internal byte budget
  // too), so the buffered amount is only approximate — min == max keeps it close.
  static BetterPlayerBufferingConfiguration _bufferingFor(int prefetchSeconds) {
    if (prefetchSeconds <= 0) {
      // "Unlimited": buffer the whole clip. Large but bounded — enough to cover
      // any realistic clip without leaving the buffer effectively unbounded.
      return const BetterPlayerBufferingConfiguration(
        minBufferMs: 50000,
        maxBufferMs: 600000,
        bufferForPlaybackMs: 2500,
        bufferForPlaybackAfterRebufferMs: 5000,
      );
    }
    final ms = prefetchSeconds * 1000;
    return BetterPlayerBufferingConfiguration(
      minBufferMs: ms,
      maxBufferMs: ms,
      bufferForPlaybackMs: ms < 2500 ? ms : 2500,
      bufferForPlaybackAfterRebufferMs: ms < 5000 ? ms : 5000,
    );
  }

  Future<PooledVideo> _createPooled(bool prefLoop, bool startMuted, String quality,
      int prefetchSeconds, bool mixWithOthers) async {
    final urls = await widget.metadata.streamUrlsBuilder();
    final streamUrl = _defaultQualityUrl(urls, quality);
    final username = widget.username;
    final qualities = urls.qualities;
    final downloadUrl = urls.downloadUrl;

    final controlsConfiguration = widget.disableControls
        ? const BetterPlayerControlsConfiguration(showControls: false)
        : BetterPlayerControlsConfiguration(
            playerTheme: BetterPlayerTheme.custom,
            customControlsBuilder: (controller, onControlsVisibilityChanged, config) => SquawkerControls(
              controller: controller,
              username: username,
              qualities: qualities,
              downloadUrl: downloadUrl,
            ),
          );

    final configuration = BetterPlayerConfiguration(
      aspectRatio: widget.metadata.aspectRatio,
      fit: BoxFit.contain,
      autoPlay: widget.alwaysPlay || _userRequestedPlay,
      looping: widget.loop || prefLoop,
      // The pool owns the controller's lifetime, not the widget.
      autoDispose: false,
      // The app owns lifecycle: its own visibility detector drives play/pause and
      // the single-audio policy. Letting the library also handle lifecycle makes
      // the two fight (auto-resume that bypasses pauseOthers). Background-off is
      // enforced by pausing on app background in didChangeAppLifecycleState.
      handleLifecycle: false,
      // GIFs may let the screen sleep; a real video keeps it awake while playing.
      allowedScreenSleep: widget.disableControls,
      autoDetectFullscreenDeviceOrientation: true,
      autoDetectFullscreenAspectRatio: true,
      controlsConfiguration: controlsConfiguration,
      // The player's own error UI is suppressed; errors surface via events and
      // the widget's own retry affordance.
      errorBuilder: (context, error) => const SizedBox.shrink(),
    );

    final controller = BetterPlayerController(configuration);
    final dataSource = BetterPlayerDataSource.network(
      streamUrl,
      cacheConfiguration: _videoCacheConfiguration,
      bufferingConfiguration: _bufferingFor(prefetchSeconds),
    );
    await controller.setupDataSource(dataSource);
    // Silent looping GIFs must never grab audio focus and pause other apps.
    controller.setMixWithOthers(widget.disableControls || mixWithOthers);
    await controller.setVolume(startMuted ? 0.0 : 1.0);

    return PooledVideo(
      controller: controller,
      downloadUrl: downloadUrl,
      qualities: qualities,
      pausableByPolicy: !widget.disableControls,
    );
  }

  Future<PooledVideo> _acquire(bool prefLoop) async {
    final prefs = PrefService.of(context, listen: false);
    final startMuted = context.read<VideoContextState>().isMuted;
    final quality = prefs.get(optionMediaVideoQuality);
    final prefetchSeconds = prefs.get<int>(optionMediaVideoPrefetchSeconds) ?? 0;
    final mixWithOthers = prefs.get<bool>(optionMediaAllowBackgroundPlayOtherApps) ?? false;
    create() => _createPooled(prefLoop, startMuted, quality, prefetchSeconds, mixWithOthers);

    final key = _cacheKey;
    final pool = _pool;
    PooledVideo pooled;
    if (key == null || pool == null) {
      _ownsControllers = true;
      pooled = await create();
      if (!mounted) {
        await pooled.dispose();
        return pooled;
      }
    } else {
      pooled = await pool.acquire(key, create);
      if (!mounted) {
        pool.release(key);
        return pooled;
      }
      _holdsPoolRef = true;
    }

    _pooled = pooled;
    _attachListeners(pooled);
    return pooled;
  }

  void _attachListeners(PooledVideo pooled) {
    final controller = pooled.controller;
    final model = context.read<VideoContextState>();
    controller.setVolume(model.isMuted ? 0.0 : 1.0);

    // A reused pooled controller is already initialized — skip the poster fade.
    if (controller.isVideoInitialized() ?? false) {
      _firstFrameRendered = true;
      _posterGone = true;
    }

    _onEvent = (event) {
      if (!mounted) return;
      switch (event.betterPlayerEventType) {
        case BetterPlayerEventType.initialized:
          if (!_firstFrameRendered) setState(() => _firstFrameRendered = true);
          break;
        case BetterPlayerEventType.play:
          if (_playbackError) setState(() => _playbackError = false);
          _pool?.pauseOthers(pooled);
          if (widget.keepsScreenAwake) VideoWakelock.acquire(this);
          break;
        case BetterPlayerEventType.pause:
        case BetterPlayerEventType.finished:
          VideoWakelock.release(this);
          break;
        case BetterPlayerEventType.hideFullscreen:
          // Leaving fullscreen, the player disables the wakelock itself even
          // though playback goes on inline, so put it back once it has.
          WidgetsBinding.instance.addPostFrameCallback((_) => VideoWakelock.reapply());
          break;
        case BetterPlayerEventType.setVolume:
          final volume = event.parameters?['volume'] as double?;
          if (volume != null) model.setIsMuted(volume);
          break;
        case BetterPlayerEventType.exception:
          // Never recreate the player on error. Under hardware-decoder pressure
          // (a grid of GIFs) a codec init fails with NO_MEMORY; recreating spawns
          // another decoder and floods the heap with exceptions until the process
          // OOM-crashes. A GIF that fails just shows its poster; a video shows the
          // retry affordance. The player already retries recoverable errors itself.
          VideoWakelock.release(this);
          if (!widget.disableControls && !_firstFrameRendered) {
            setState(() => _playbackError = true);
          }
          break;
        default:
          break;
      }
    };
    controller.addEventsListener(_onEvent!);
  }

  void _detachListeners() {
    VideoWakelock.release(this);
    if (_onEvent != null) {
      _pooled?.controller.removeEventsListener(_onEvent!);
      _onEvent = null;
    }
  }

  void _onVisibilityChanged(VisibilityInfo info, PooledVideo pooled) {
    if (!mounted) return;
    final key = _cacheKey;
    final wasVisible = _lastVisibleFraction >= 0.5;
    final isVisible = info.visibleFraction >= 0.5;
    _lastVisibleFraction = info.visibleFraction;

    if (isVisible) {
      if (key != null) _pool?.markVisible(key, this);
      _pauseTimer?.cancel();
      _pauseTimer = null;
      if (_autoPlay && !wasVisible && !pooled.isPlaying) {
        pooled.controller.play();
      }
    } else if (!widget.alwaysPlay && wasVisible) {
      if (key != null) _pool?.markHidden(key, this);
      _pauseTimer ??= Timer(const Duration(milliseconds: 100), () {
        _pauseTimer = null;
        if (key != null && (_pool?.anyVisible(key) ?? false)) return;
        if (mounted && !pooled.controller.isFullScreen) {
          pooled.controller.pause();
        }
      });
    }
  }

  Future<void> _restartVideo() async {
    _detachListeners();
    final key = _cacheKey;
    if (key != null && _pool != null) {
      if (_holdsPoolRef) {
        _pool!.release(key);
        _holdsPoolRef = false;
      }
      _pool!.invalidate(key);
    } else {
      _pooled?.pause();
      await _pooled?.dispose();
    }

    setState(() {
      _pooled = null;
      _acquireFuture = null;
      _playbackError = false;
      _firstFrameRendered = false;
      _posterGone = false;
    });
  }

  Widget _buildVideo(PooledVideo pooled) {
    final video = BetterPlayer(controller: pooled.controller);

    if (_posterGone) {
      return video;
    }

    // Poster + spinner over the video, fading out on the first frame so there's
    // no flash on the swap.
    return Stack(
      fit: StackFit.expand,
      children: [
        video,
        IgnorePointer(
          child: AnimatedOpacity(
            opacity: _firstFrameRendered ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 200),
            onEnd: () {
              if (_firstFrameRendered && !_posterGone) setState(() => _posterGone = true);
            },
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                if (widget.metadata.imageUrl != null)
                  Image.network(widget.metadata.imageUrl!, fit: BoxFit.cover),
                if (!widget.disableControls) const Center(child: CircularProgressIndicator()),
                // A GIF shown static (still buffering, or no decoder available)
                // gets a "GIF" label; it fades out with the poster once it plays.
                if (widget.disableControls)
                  const Positioned(left: 6, bottom: 6, child: GifBadge()),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final prefs = PrefService.of(context);
    final prefLoop = prefs.get(optionMediaDefaultLoop);
    final prefAutoPlay = prefs.get(optionMediaDefaultAutoPlay);
    _prefBackground = prefs.get<bool>(optionMediaBackgroundPlayback) ?? true;

    final key = _cacheKey;
    final alreadyCached = key != null && (_pool?.contains(key) ?? false);

    if (!prefAutoPlay && !widget.alwaysPlay && !_userRequestedPlay && !alreadyCached) {
      return GestureDetector(
        onTap: () => setState(() => _userRequestedPlay = true),
        child: AspectRatio(
          aspectRatio: widget.metadata.aspectRatio,
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (widget.metadata.imageUrl != null)
                Positioned.fill(child: Image.network(widget.metadata.imageUrl!, fit: BoxFit.cover)),
              FritterCenterPlayButton(
                backgroundColor: Colors.black54,
                iconColor: Colors.white,
                show: true,
                isPlaying: false,
                isFinished: false,
                onPressed: () => setState(() => _userRequestedPlay = true),
              ),
            ],
          ),
        ),
      );
    }

    _autoPlay = prefAutoPlay;
    _acquireFuture ??= _acquire(prefLoop);

    return FutureBuilder(
      future: _acquireFuture,
      builder: (context, snapshot) {
        final hasError = snapshot.hasError || _playbackError;
        final isLoading = snapshot.connectionState == ConnectionState.waiting;
        final pooled = _pooled ?? (key != null ? _pool?.peek(key) : null);
        final hasVideo = pooled != null;

        if (isLoading && !hasVideo) {
          return AspectRatio(
            aspectRatio: widget.metadata.aspectRatio,
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (widget.metadata.imageUrl != null)
                  Positioned.fill(child: Image.network(widget.metadata.imageUrl!, fit: BoxFit.cover)),
                const CircularProgressIndicator(),
              ],
            ),
          );
        }

        if (hasError && !_firstFrameRendered) {
          return AspectRatio(
            aspectRatio: widget.metadata.aspectRatio,
            // FittedBox so the error block scales down instead of overflowing in
            // short/narrow video areas (a wide clip in the feed, a grid cell...).
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.error_outline, color: Colors.white, size: 48),
                      const SizedBox(height: 12),
                      Text(L10n.of(context).failed_to_load_video),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: _restartVideo,
                        child: Text(L10n.of(context).restart_video_player),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        return AspectRatio(
          aspectRatio: widget.metadata.aspectRatio,
          child: hasVideo
              ? VisibilityDetector(
                  key: _visibilityKey,
                  onVisibilityChanged: (info) => _onVisibilityChanged(info, pooled),
                  child: _buildVideo(pooled))
              : const SizedBox.shrink(),
        );
      },
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _pauseTimer?.cancel();
    _detachListeners();
    final key = _cacheKey;
    if (key != null) _pool?.markHidden(key, this);
    // Keep the controller alive across the fullscreen route; just don't
    // dispose/release it here. Detaching listeners and releasing the pool ref,
    // though, is always safe (the pool owns the controller) and must happen even
    // in fullscreen, or this widget leaks its subscriptions and pins the entry.
    final fullscreen = _pooled?.controller.isFullScreen ?? false;
    if (!fullscreen) {
      if (_ownsControllers) {
        _pooled?.dispose();
      } else if (key != null && _holdsPoolRef) {
        // A fast fling can dispose this widget before the debounced pause timer
        // fires; releasing the pool ref alone leaves the player running off-screen.
        // Pause it now, unless the same video is still on screen in another widget.
        if (!widget.alwaysPlay && !(_pool?.anyVisible(key) ?? false)) {
          _pooled?.pause();
        }
        _pool?.release(key);
        _holdsPoolRef = false;
      }
    }
    super.dispose();
  }
}

/// Mute is an app-wide toggle: muting one video keeps the next one muted, on
/// every screen. Tweet tiles each sit under their own [VideoContextState]
/// provider, so a single shared [ValueNotifier] is the source of truth and every
/// per-scope instance forwards its changes — that way all scopes stay in sync and
/// rebuild together (a plain static field only notified the one scope that fired).
class VideoContextState extends ChangeNotifier {
  static final ValueNotifier<bool> _muted = ValueNotifier(false);
  static bool _initialised = false;

  VideoContextState(bool initialMuted) {
    // The pref is only the initial default; once set, mute is user-controlled.
    if (!_initialised) {
      _initialised = true;
      _muted.value = initialMuted;
    }
    _muted.addListener(notifyListeners);
  }

  @override
  void dispose() {
    _muted.removeListener(notifyListeners);
    super.dispose();
  }

  bool get isMuted => _muted.value;

  void setIsMuted(double volume) {
    final muted = _muted.value;
    if (muted && volume > 0 || !muted && volume == 0) {
      _muted.value = !muted;
    }
  }
}
