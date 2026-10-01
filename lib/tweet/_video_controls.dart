import 'dart:async';

import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:pref/pref.dart';
import 'package:squawker/generated/l10n.dart';
import 'package:squawker/tweet/video_quality.dart';
import 'package:squawker/utils/downloads.dart';

const _kSeekSeconds = 10;

/// The current playback value, or a zeroed one before the data source has
/// initialized. Read fresh from the controller so it survives the underlying
/// [videoPlayerController] being swapped on a quality change.
VideoPlayerValue _valueOf(BetterPlayerController controller) =>
    controller.videoPlayerController?.value ?? VideoPlayerValue(duration: Duration.zero);

class SquawkerControls extends StatefulWidget {
  final BetterPlayerController controller;
  final String username;
  final List<TweetVideoQuality> qualities;
  final String? downloadUrl;

  const SquawkerControls({
    super.key,
    required this.controller,
    required this.username,
    required this.qualities,
    required this.downloadUrl,
  });

  @override
  State<SquawkerControls> createState() => _SquawkerControlsState();
}

class _SquawkerControlsState extends State<SquawkerControls> {
  bool _visible = true;
  Timer? _hideTimer;

  double _lastTapX = 0;
  int _seekFeedback = 0;
  Timer? _feedbackTimer;

  BetterPlayerController get _controller => widget.controller;

  @override
  void initState() {
    super.initState();
    _scheduleHide();
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    _feedbackTimer?.cancel();
    super.dispose();
  }

  void _scheduleHide() {
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 3), () {
      if (mounted) setState(() => _visible = false);
    });
  }

  void _toggle() {
    setState(() => _visible = !_visible);
    if (_visible) {
      _scheduleHide();
    } else {
      _hideTimer?.cancel();
    }
  }

  void _onDoubleTap() {
    final width = context.size?.width ?? 0;
    final value = _valueOf(_controller);
    final back = _lastTapX < width / 2;
    final delta = Duration(seconds: back ? -_kSeekSeconds : _kSeekSeconds);
    var target = value.position + delta;
    final duration = value.duration ?? Duration.zero;
    if (target < Duration.zero) target = Duration.zero;
    if (target > duration) target = duration;
    _controller.seekTo(target);

    setState(() => _seekFeedback = back ? -_kSeekSeconds : _kSeekSeconds);
    _feedbackTimer?.cancel();
    _feedbackTimer = Timer(const Duration(milliseconds: 600), () {
      if (mounted) setState(() => _seekFeedback = 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _toggle,
            onDoubleTapDown: (d) => _lastTapX = d.localPosition.dx,
            onDoubleTap: _onDoubleTap,
            child: AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: Stack(
                children: [
                  // IgnorePointer so the opaque scrim never swallows taps,
                  // which would make the controls impossible to dismiss.
                  const Positioned.fill(
                    child: IgnorePointer(child: ColoredBox(color: Colors.black45)),
                  ),
                  Positioned.fill(
                    child: IgnorePointer(
                      ignoring: !_visible,
                      child: Listener(
                        onPointerDown: (_) {
                          if (_visible) _scheduleHide();
                        },
                        child: _controls(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Buffering spinner, shown even while the controls are hidden.
        Positioned.fill(
          child: IgnorePointer(child: _BufferingIndicator(controller: _controller)),
        ),
        if (_seekFeedback != 0)
          Positioned.fill(
            child: IgnorePointer(
              child: Align(
                alignment: _seekFeedback < 0 ? Alignment.centerLeft : Alignment.centerRight,
                child: _seekFeedbackBadge(),
              ),
            ),
          ),
      ],
    );
  }

  Widget _controls() {
    final accent = Theme.of(context).colorScheme.secondary;
    return Stack(
      children: [
        Center(child: _PlayPauseButton(controller: _controller)),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: _BottomBar(
            controller: _controller,
            username: widget.username,
            qualities: widget.qualities,
            downloadUrl: widget.downloadUrl,
            accentColor: accent,
          ),
        ),
      ],
    );
  }

  Widget _seekFeedbackBadge() {
    final back = _seekFeedback < 0;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(back ? Icons.fast_rewind : Icons.fast_forward, color: Colors.white),
          const SizedBox(height: 4),
          Text('$_kSeekSeconds s', style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}

/// Rebuilds [builder] whenever the player emits an event, always reading the
/// live [VideoPlayerValue] — so it keeps tracking after a quality switch swaps
/// the underlying player.
class _PlayerListenable extends StatefulWidget {
  final BetterPlayerController controller;
  final Widget Function(BuildContext, VideoPlayerValue) builder;

  const _PlayerListenable({required this.controller, required this.builder});

  @override
  State<_PlayerListenable> createState() => _PlayerListenableState();
}

class _PlayerListenableState extends State<_PlayerListenable> {
  late final void Function(BetterPlayerEvent) _listener;

  @override
  void initState() {
    super.initState();
    _listener = (_) {
      if (mounted) setState(() {});
    };
    widget.controller.addEventsListener(_listener);
  }

  @override
  void dispose() {
    widget.controller.removeEventsListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, _valueOf(widget.controller));
}

class _BufferingIndicator extends StatelessWidget {
  final BetterPlayerController controller;

  const _BufferingIndicator({required this.controller});

  @override
  Widget build(BuildContext context) {
    return _PlayerListenable(
      controller: controller,
      builder: (context, value) => value.isBuffering
          ? const Center(child: CircularProgressIndicator())
          : const SizedBox.shrink(),
    );
  }
}

class _BottomBar extends StatelessWidget {
  final BetterPlayerController controller;
  final String username;
  final List<TweetVideoQuality> qualities;
  final String? downloadUrl;
  final Color accentColor;

  const _BottomBar({
    required this.controller,
    required this.username,
    required this.qualities,
    required this.downloadUrl,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14, right: 4),
          child: Row(
            children: [
              _PositionIndicator(controller: controller),
              const Spacer(),
              _MuteButton(controller: controller),
              _MoreButton(
                controller: controller,
                username: username,
                qualities: qualities,
                downloadUrl: downloadUrl,
              ),
              _FullscreenButton(controller: controller),
            ],
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -8),
          child: Padding(
            padding: const EdgeInsets.only(left: 14, right: 16, bottom: 6),
            child: _SeekBar(controller: controller, accentColor: accentColor),
          ),
        ),
      ],
    );
  }
}

class _PlayPauseButton extends StatefulWidget {
  final BetterPlayerController controller;

  const _PlayPauseButton({required this.controller});

  @override
  State<_PlayPauseButton> createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<_PlayPauseButton> {
  late final void Function(BetterPlayerEvent) _listener;
  bool _playing = false;
  bool _completed = false;
  bool _buffering = false;

  @override
  void initState() {
    super.initState();
    _playing = widget.controller.isPlaying() ?? false;
    _buffering = widget.controller.isBuffering() ?? false;
    _listener = (event) {
      if (!mounted) return;
      switch (event.betterPlayerEventType) {
        case BetterPlayerEventType.play:
          setState(() {
            _playing = true;
            _completed = false;
          });
          break;
        case BetterPlayerEventType.pause:
          setState(() => _playing = false);
          break;
        case BetterPlayerEventType.seekTo:
          setState(() => _completed = false);
          break;
        case BetterPlayerEventType.finished:
          setState(() {
            _playing = false;
            _completed = true;
          });
          break;
        case BetterPlayerEventType.bufferingStart:
          setState(() => _buffering = true);
          break;
        case BetterPlayerEventType.bufferingEnd:
          setState(() => _buffering = false);
          break;
        case BetterPlayerEventType.progress:
          setState(() => _playing = widget.controller.isPlaying() ?? _playing);
          break;
        default:
          break;
      }
    };
    widget.controller.addEventsListener(_listener);
  }

  @override
  void dispose() {
    widget.controller.removeEventsListener(_listener);
    super.dispose();
  }

  void _onTap() {
    if (_completed) {
      widget.controller.seekTo(Duration.zero);
      widget.controller.play();
    } else if (widget.controller.isPlaying() ?? false) {
      widget.controller.pause();
    } else {
      widget.controller.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    // While buffering, yield the center to the spinner instead of overlapping it.
    if (_buffering) return const SizedBox(width: 64, height: 64);
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        width: 64,
        height: 64,
        decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
        child: Center(
          child: _completed
              ? const Icon(Icons.replay, color: Colors.white, size: 32)
              : AnimatedPlayPause(playing: _playing, color: Colors.white, size: 32),
        ),
      ),
    );
  }
}

class AnimatedPlayPause extends StatefulWidget {
  final bool playing;
  final double? size;
  final Color? color;

  const AnimatedPlayPause({super.key, required this.playing, this.size, this.color});

  @override
  State<AnimatedPlayPause> createState() => _AnimatedPlayPauseState();
}

class _AnimatedPlayPauseState extends State<AnimatedPlayPause>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    value: widget.playing ? 1 : 0,
    duration: const Duration(milliseconds: 250),
  );

  @override
  void didUpdateWidget(AnimatedPlayPause oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.playing != oldWidget.playing) {
      widget.playing ? _controller.forward() : _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedIcon(
      icon: AnimatedIcons.play_pause,
      progress: _controller,
      size: widget.size,
      color: widget.color,
    );
  }
}

class _PositionIndicator extends StatelessWidget {
  final BetterPlayerController controller;

  const _PositionIndicator({required this.controller});

  static String _fmt(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes.remainder(60);
    final s = d.inSeconds.remainder(60);
    final mm = h > 0 ? m.toString().padLeft(2, '0') : m.toString();
    final ss = s.toString().padLeft(2, '0');
    return h > 0 ? '$h:$mm:$ss' : '$mm:$ss';
  }

  @override
  Widget build(BuildContext context) {
    return _PlayerListenable(
      controller: controller,
      builder: (context, value) {
        final duration = value.duration ?? Duration.zero;
        return RichText(
          text: TextSpan(
            text: '${_fmt(value.position)} ',
            style: const TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: '/ ${_fmt(duration)}',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white.withValues(alpha: 0.75),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Custom because the library's default progress bar draws square-cornered bars.
class _SeekBar extends StatefulWidget {
  final BetterPlayerController controller;
  final Color accentColor;

  const _SeekBar({required this.controller, required this.accentColor});

  @override
  State<_SeekBar> createState() => _SeekBarState();
}

class _SeekBarState extends State<_SeekBar> with SingleTickerProviderStateMixin {
  late final void Function(BetterPlayerEvent) _listener;
  late final _ticker = createTicker(_onTick);

  Duration _base = Duration.zero; // player position at the last sync
  Duration _baseElapsed = Duration.zero; // ticker time at that sync
  Duration _elapsed = Duration.zero; // latest ticker time
  Duration _duration = Duration.zero;
  Duration _buffer = Duration.zero;
  double _rate = 1.0;
  bool _playing = false;
  bool _buffering = false;
  double? _dragFraction;

  @override
  void initState() {
    super.initState();
    _sync();
    _listener = (_) {
      if (mounted) setState(_sync);
    };
    widget.controller.addEventsListener(_listener);
    _ticker.start();
  }

  // The player only samples position ~every 300ms; interpolate between samples
  // off the ticker so the played bar advances smoothly at ~60fps.
  void _onTick(Duration elapsed) {
    _elapsed = elapsed;
    if (_playing && !_buffering && _dragFraction == null && mounted) {
      setState(() {});
    }
  }

  void _sync() {
    final value = _valueOf(widget.controller);
    _duration = value.duration ?? Duration.zero;
    _buffer = value.buffered.isNotEmpty ? value.buffered.last.end : Duration.zero;
    _rate = value.speed <= 0 ? 1.0 : value.speed;
    _playing = value.isPlaying;
    _buffering = value.isBuffering;
    // Re-anchor interpolation to the real position (unless the user is dragging).
    if (_dragFraction == null) {
      _base = value.position;
      _baseElapsed = _elapsed;
    }
  }

  @override
  void dispose() {
    _ticker.dispose();
    widget.controller.removeEventsListener(_listener);
    super.dispose();
  }

  Duration get _livePosition {
    if (!_playing || _buffering) return _base;
    var p = _base + (_elapsed - _baseElapsed) * _rate;
    if (p < Duration.zero) p = Duration.zero;
    if (_duration > Duration.zero && p > _duration) p = _duration;
    return p;
  }

  double _fraction(Duration d) {
    final total = _duration.inMilliseconds;
    return total == 0 ? 0.0 : (d.inMilliseconds / total).clamp(0.0, 1.0);
  }

  double get _playedFraction => _dragFraction ?? _fraction(_livePosition);

  void _commitSeek() {
    final f = _dragFraction;
    if (f != null) {
      final target = _duration * f;
      widget.controller.seekTo(target);
      _base = target; // hold the bar at the seeked spot until the next sample
      _baseElapsed = _elapsed;
    }
    setState(() => _dragFraction = null);
  }

  @override
  Widget build(BuildContext context) {
    const trackHeight = 10.0;
    const thumbSize = 12.0;
    final trackColor = Theme.of(context).disabledColor.withValues(alpha: 0.5);
    final bufferColor = Theme.of(context).colorScheme.surface.withValues(alpha: 0.5);
    final radius = BorderRadius.circular(trackHeight / 2);

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final played = _playedFraction;
        final buffered = _fraction(_buffer);

        void update(double dx) {
          setState(() => _dragFraction = (dx / width).clamp(0.0, 1.0));
        }

        // Explicit width + left anchor so the fill grows from the left edge; an
        // unpositioned child in this centered Stack would grow from the middle.
        Widget bar(double w, Color color) => Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: w,
                height: trackHeight,
                decoration: BoxDecoration(color: color, borderRadius: radius),
              ),
            );

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: (d) => update(d.localPosition.dx),
          onTapUp: (_) => _commitSeek(),
          onHorizontalDragUpdate: (d) => update(d.localPosition.dx),
          onHorizontalDragEnd: (_) => _commitSeek(),
          child: SizedBox(
            width: width,
            height: thumbSize + 12,
            child: Stack(
              alignment: Alignment.center,
              // Clip.none lets the thumb overflow into the padding at the ends,
              // so near 0 it isn't pinned and left lagging behind the played bar.
              clipBehavior: Clip.none,
              children: [
                bar(width, trackColor),
                bar(width * buffered, bufferColor),
                bar(width * played, widget.accentColor),
                Positioned(
                  left: width * played - thumbSize / 2,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: Container(
                      width: thumbSize,
                      height: thumbSize,
                      decoration: BoxDecoration(color: widget.accentColor, shape: BoxShape.circle),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MuteButton extends StatelessWidget {
  final BetterPlayerController controller;

  const _MuteButton({required this.controller});

  @override
  Widget build(BuildContext context) {
    return _PlayerListenable(
      controller: controller,
      builder: (context, value) {
        final muted = value.volume <= 0;
        return IconButton(
          iconSize: 24.0,
          color: Colors.white,
          icon: Icon(muted ? Icons.volume_off : Icons.volume_up),
          onPressed: () => controller.setVolume(muted ? 1.0 : 0.0),
        );
      },
    );
  }
}

class _FullscreenButton extends StatelessWidget {
  final BetterPlayerController controller;

  const _FullscreenButton({required this.controller});

  @override
  Widget build(BuildContext context) {
    return _PlayerListenable(
      controller: controller,
      builder: (context, _) => IconButton(
        iconSize: 24.0,
        color: Colors.white,
        icon: Icon(controller.isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen),
        onPressed: controller.toggleFullScreen,
      ),
    );
  }
}

class _MoreButton extends StatefulWidget {
  final BetterPlayerController controller;
  final String username;
  final List<TweetVideoQuality> qualities;
  final String? downloadUrl;

  const _MoreButton({
    required this.controller,
    required this.username,
    required this.qualities,
    required this.downloadUrl,
  });

  @override
  State<_MoreButton> createState() => _MoreButtonState();
}

class _MoreButtonState extends State<_MoreButton> {
  bool _subtitlesEnabled = false;

  bool get _hasSubtitles => widget.controller.betterPlayerSubtitlesSourceList
      .any((s) => s.type != BetterPlayerSubtitlesSourceType.none);

  void _toggleSubtitles() {
    final list = widget.controller.betterPlayerSubtitlesSourceList;
    BetterPlayerSubtitlesSource? target;
    for (final source in list) {
      final isNone = source.type == BetterPlayerSubtitlesSourceType.none;
      if (_subtitlesEnabled ? isNone : !isNone) {
        target = source;
        break;
      }
    }
    if (target != null) widget.controller.setupSubtitleSource(target);
    setState(() => _subtitlesEnabled = !_subtitlesEnabled);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 24.0,
      color: Colors.white,
      icon: const Icon(Icons.more_vert),
      onPressed: () => _openMenu(context),
    );
  }

  Future<void> _openMenu(BuildContext context) async {
    await showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      builder: (sheetContext) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.speed),
              title: Text(L10n.of(sheetContext).playback_speed),
              onTap: () {
                Navigator.of(sheetContext).pop();
                _openSpeedSheet(context, widget.controller);
              },
            ),
            if (widget.qualities.length > 1)
              ListTile(
                leading: const Icon(Icons.high_quality),
                title: Text(L10n.of(sheetContext).quality),
                onTap: () {
                  Navigator.of(sheetContext).pop();
                  _openQualitySheet(context, widget.controller, widget.qualities);
                },
              ),
            if (_hasSubtitles)
              ListTile(
                leading: Icon(_subtitlesEnabled ? Icons.closed_caption : Icons.closed_caption_off),
                title: Text(L10n.of(sheetContext).subtitles),
                trailing: _subtitlesEnabled ? const Icon(Icons.check) : null,
                onTap: () {
                  Navigator.of(sheetContext).pop();
                  _toggleSubtitles();
                },
              ),
            ListTile(
              leading: const Icon(Icons.download),
              title: Text(L10n.of(sheetContext).download),
              onTap: () {
                Navigator.of(sheetContext).pop();
                downloadTweetVideo(context, widget.username, widget.downloadUrl);
              },
            ),
          ],
        ),
      ),
    );
  }
}

const _kSpeeds = [0.25, 0.5, 0.75, 1.0, 1.25, 1.5, 1.75, 2.0];

Future<void> _openSpeedSheet(BuildContext context, BetterPlayerController controller) async {
  final current = _valueOf(controller).speed;
  final chosen = await showModalBottomSheet<double>(
    context: context,
    isScrollControlled: true,
    useRootNavigator: true,
    builder: (_) => _SpeedSheet(speeds: _kSpeeds, selected: current),
  );
  if (chosen != null) {
    await controller.setSpeed(chosen);
  }
}

Future<void> _openQualitySheet(
    BuildContext context, BetterPlayerController controller, List<TweetVideoQuality> qualities) async {
  final chosen = await showModalBottomSheet<TweetVideoQuality>(
    context: context,
    isScrollControlled: true,
    useRootNavigator: true,
    builder: (_) => _QualitySheet(
      qualities: qualities,
      selectedUrl: controller.betterPlayerDataSource?.url,
    ),
  );
  if (chosen == null || chosen.url == controller.betterPlayerDataSource?.url) {
    return;
  }
  // setResolution preserves position and play/pause state but re-inits the data
  // source without re-applying volume, so a muted video would come back audible.
  final volume = _valueOf(controller).volume;
  await controller.setResolution(chosen.url);
  await controller.setVolume(volume);
}

Future<void> downloadTweetVideo(BuildContext context, String username, String? downloadUrl) async {
  if (downloadUrl == null) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(L10n.current.download_media_no_url),
    ));
    return;
  }

  final videoUri = Uri.parse(downloadUrl);
  final fileName = '$username-${path.basename(videoUri.path)}';

  await downloadUriToPickedFile(
    context,
    videoUri,
    fileName,
    prefs: PrefService.of(context),
    onStart: () {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(L10n.of(context).downloading_media),
      ));
    },
    onSuccess: () {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(L10n.of(context).successfully_saved_the_media),
      ));
    },
  );
}

class _SpeedSheet extends StatelessWidget {
  final List<double> speeds;
  final double selected;

  const _SpeedSheet({required this.speeds, required this.selected});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        shrinkWrap: true,
        children: speeds.reversed.map((speed) {
          final isSelected = (speed - selected).abs() < 0.01;
          return ListTile(
            leading: isSelected ? const Icon(Icons.check) : const SizedBox(width: 24),
            title: Text('${speed}x'),
            onTap: () => Navigator.of(context).pop(speed),
          );
        }).toList(),
      ),
    );
  }
}

class _QualitySheet extends StatelessWidget {
  final List<TweetVideoQuality> qualities;
  final String? selectedUrl;

  const _QualitySheet({required this.qualities, required this.selectedUrl});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        shrinkWrap: true,
        children: qualities.map((quality) {
          final isSelected = quality.url == selectedUrl;
          return ListTile(
            leading: isSelected ? const Icon(Icons.check) : const SizedBox(width: 24),
            title: Text(quality.label),
            onTap: () => Navigator.of(context).pop(quality),
          );
        }).toList(),
      ),
    );
  }
}

/// A small "GIF" label, shown over a GIF that is displayed statically (not
/// animating — e.g. a grid cell the playback gate didn't grant, or a GIF whose
/// hardware decoder couldn't be allocated) so it's clear it's an animated GIF.
class GifBadge extends StatelessWidget {
  const GifBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Text(
        'GIF',
        style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold, height: 1.0),
      ),
    );
  }
}

class FritterCenterPlayButton extends StatelessWidget {
  const FritterCenterPlayButton({
    super.key,
    required this.backgroundColor,
    this.iconColor,
    required this.show,
    required this.isPlaying,
    required this.isFinished,
    this.onPressed,
    this.size = 64.0,
  });

  final Color backgroundColor;
  final Color? iconColor;
  final bool show;
  final bool isPlaying;
  final bool isFinished;
  final VoidCallback? onPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: AnimatedOpacity(
          opacity: show ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: GestureDetector(
            onTap: onPressed,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: backgroundColor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                iconSize: size / 2,
                icon: isFinished
                    ? Icon(Icons.replay, color: iconColor)
                    : AnimatedPlayPause(playing: isPlaying, color: iconColor, size: size / 2),
                onPressed: onPressed,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
