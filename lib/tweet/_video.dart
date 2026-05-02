import 'package:chewie/chewie.dart';
import 'package:chewie/src/center_play_button.dart';
import 'package:dart_twitter_api/twitter_api.dart';
import 'package:flutter/material.dart';
import 'package:pref/pref.dart';
import 'package:squawker/constants.dart';
import 'package:squawker/generated/l10n.dart';
import 'package:squawker/tweet/_video_controls.dart';
import 'package:squawker/utils/downloads.dart';
import 'package:squawker/utils/iterables.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class TweetVideoUrls {
  final String streamUrl;
  final String? downloadUrl;

  TweetVideoUrls(this.streamUrl, this.downloadUrl);
}

class TweetVideoMetadata {
  final double aspectRatio;
  final String? imageUrl;
  final Future<TweetVideoUrls> Function() streamUrlsBuilder;

  TweetVideoMetadata(this.aspectRatio, this.imageUrl, this.streamUrlsBuilder);

  static Future<TweetVideoUrls> Function() streamUrlsBuilderFromVariants(List<Variant> variants) {
    var streamUrl = variants[0].url!;
    var downloadUrl = variants
        .where((e) => e.bitrate != null)
        .where((e) => e.url != null)
        .where((e) => e.contentType == 'video/mp4')
        .sorted((a, b) => -(a.bitrate!.compareTo(b.bitrate!)))
        .map((e) => e.url)
        .firstWhereOrNull((e) => e != null);

    return () async => TweetVideoUrls(streamUrl, downloadUrl);
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

  const TweetVideo({
    super.key,
    required this.username,
    required this.loop,
    required this.metadata,
    this.alwaysPlay = false,
    this.disableControls = false,
  });

  @override
  State<StatefulWidget> createState() => _TweetVideoState();
}

class _TweetVideoState extends State<TweetVideo> {
  VideoPlayerController? _videoController;
  ChewieController? _chewieController;
  bool? _autoPlay;
  bool _userRequestedPlay = false;
  final GlobalKey<FritterMaterialControlsState> _controllerKey = GlobalKey();

  Future<void> _restartVideo(bool prefLoop, prefAutoPlay, prefBackgroundPlayback, prefMixWithOthers) async {
    try {
      await _chewieController?.pause();
    } catch (_) {}
    _chewieController?.dispose();
    await _videoController?.dispose();

    setState(() {
      _chewieController = null;
      _videoController = null;
    });

    try {
      await _loadVideo(prefLoop, prefAutoPlay, prefBackgroundPlayback, prefMixWithOthers);
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      debugPrint('Failed to restart video: $e');
    }
  }

  Future<void> _loadVideo(bool prefLoop, bool prefAutoPlay, bool prefBackgroundPlayback, bool prefMixWithOthers) async {
    var urls = await widget.metadata.streamUrlsBuilder();
    var streamUrl = urls.streamUrl;
    var downloadUrl = urls.downloadUrl;

    _videoController = VideoPlayerController.networkUrl(Uri.parse(streamUrl),
        videoPlayerOptions:
            VideoPlayerOptions(mixWithOthers: widget.disableControls || prefMixWithOthers, allowBackgroundPlayback: prefBackgroundPlayback));

    var model = context.read<VideoContextState>();
    var volume = model.isMuted ? 0.0 : _videoController!.value.volume;
    _videoController!.setVolume(volume);

    _videoController!.addListener(() {
      model.setIsMuted(_videoController!.value.volume);
    });

    _autoPlay = prefAutoPlay;

    _chewieController = ChewieController(
      aspectRatio: widget.metadata.aspectRatio,
      autoInitialize: true,
      autoPlay: widget.alwaysPlay || _userRequestedPlay,
      allowFullScreen: false,
      placeholder: widget.metadata.imageUrl != null
          ? Image.network(widget.metadata.imageUrl!, fit: BoxFit.cover)
          : null,
      allowMuting: !widget.disableControls,
      showControls: !widget.disableControls,
      allowedScreenSleep: false,
      customControls: FritterMaterialControls(key: _controllerKey),
      additionalOptions: (context) => [
        OptionItem(
          onTap: (BuildContext _) async {
            var video = downloadUrl;
            if (video == null) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(L10n.current.download_media_no_url),
              ));
              return;
            }

            var videoUri = Uri.parse(video);
            var fileName = '${widget.username}-${path.basename(videoUri.path)}';

            await downloadUriToPickedFile(
              context,
              videoUri,
              fileName,
              PrefService.of(context).get(optionDownloadType) as String,
              PrefService.of(context).get(optionDownloadPath) as String,
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
          },
          iconData: Icons.download,
          title: L10n.of(context).download,
        )
      ],
      looping: widget.loop || prefLoop,
      videoPlayerController: _videoController!,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.white,
                size: 42,
              ),
              Text(errorMessage)
            ],
          ),
        );
      },
    );
    _videoController!.addListener(() {
      // Change wake lock screen
      if (_chewieController!.isPlaying) {
        WakelockPlus.enable();
      } else {
        WakelockPlus.disable();
      }
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    final prefs = PrefService.of(context);
    final prefLoop = false; //prefs.get(optionMediaDefaultLoop);
    final prefAutoPlay = false; //prefs.get(optionMediaDefaultAutoPlay);
    final prefBackgroundPlayback = prefs.get(optionMediaAllowBackgroundPlay);
    final prefMixWithOthers = prefs.get(optionMediaAllowBackgroundPlayOtherApps);
    if (!prefAutoPlay && !widget.alwaysPlay && !_userRequestedPlay) {
      return GestureDetector(
        onTap: () => setState(() => _userRequestedPlay = true),
        child: AspectRatio(
          aspectRatio: widget.metadata.aspectRatio,
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (widget.metadata.imageUrl != null)
                Positioned.fill(child: Image.network(widget.metadata.imageUrl!, fit: BoxFit.cover)),
              CenterPlayButton(
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

    return FutureBuilder(
      future: _chewieController == null ? _loadVideo(prefLoop, prefAutoPlay, prefBackgroundPlayback, prefMixWithOthers) : Future.value(),
      builder: (context, snapshot) {
        final hasError = snapshot.hasError;
        final isLoading = snapshot.connectionState == ConnectionState.waiting;
        final hasVideo = _chewieController != null;

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

        if (hasError && !hasVideo) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: Colors.white, size: 48),
                const SizedBox(height: 12),
                const Text('Failed to load video'),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () => _restartVideo(prefLoop, prefAutoPlay, prefBackgroundPlayback, prefMixWithOthers),
                  child: const Text('Restart Video Player'),
                ),
              ],
            ),
          );
        }

        return Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio: widget.metadata.aspectRatio,
              child: hasVideo
                  ? VisibilityDetector(
                      key: ObjectKey(_chewieController),
                      onVisibilityChanged: (info) {
                        if (mounted) {
                          if (!widget.alwaysPlay && info.visibleFraction <= 0.5 && !_chewieController!.isFullScreen) {
                            _chewieController?.pause();
                          }
                          if (info.visibleFraction >= 0.75 && _autoPlay! && !_chewieController!.isPlaying) {
                            _chewieController!.play();
                            _controllerKey.currentState?.notifier.hideStuff = true;
                          }
                        }
                      },
                      child: Chewie(
                        controller: _chewieController!,
                      ))
                  : const SizedBox.shrink(),
            ),
            if (hasError)
              Positioned(
                right: 8,
                bottom: 8,
                child: IconButton(
                  icon: const Icon(Icons.refresh, color: Colors.white),
                  onPressed: () => _restartVideo(prefLoop, prefAutoPlay, prefBackgroundPlayback, prefMixWithOthers),
                  tooltip: 'Restart player',
                ),
              ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    if (_chewieController?.isFullScreen ?? false) return;
    if (mounted) {
      _chewieController?.dispose();
      _videoController?.dispose();
      WakelockPlus.disable();
    }
    super.dispose();
  }
}

class VideoContextState extends ChangeNotifier {
  bool isMuted;

  VideoContextState(this.isMuted);

  void setIsMuted(double volume) {
    if (isMuted && volume > 0 || !isMuted && volume == 0) {
      isMuted = !isMuted;
    }

    notifyListeners();
  }
}
