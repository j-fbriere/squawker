import 'dart:math' as math;
import 'dart:typed_data';

import 'package:async_button_builder/async_button_builder.dart';
import 'package:dart_twitter_api/twitter_api.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:squawker/constants.dart';
import 'package:squawker/generated/l10n.dart';
import 'package:squawker/profile/profile.dart';
import 'package:squawker/tweet/_photo.dart';
import 'package:squawker/tweet/_video.dart';
import 'package:squawker/ui/errors.dart';
import 'package:squawker/utils/downloads.dart';
import 'package:squawker/utils/share_util.dart';
import 'package:path/path.dart' as path;
import 'package:pref/pref.dart';
import 'package:provider/provider.dart';

class _TweetMediaItem extends StatefulWidget {
  final int index;
  final int total;
  final Media media;
  final String username;

  const _TweetMediaItem(
      {Key? key, required this.index, required this.total, required this.media, required this.username})
      : super(key: key);

  @override
  State<_TweetMediaItem> createState() => _TweetMediaItemState();
}

class _TweetMediaItemState extends State<_TweetMediaItem> {
  bool _showMedia = false;

  @override
  void initState() {
    super.initState();

    var mediaSize = PrefService.of(context, listen: false).get(optionMediaSize);
    if (mediaSize == 'disabled') {
      // If the image is cached already, show the media
      cachedImageExists(widget.media.mediaUrlHttps!).then((value) {
        if (mounted) {
          setState(() {
            _showMedia = value;
          });
        }
      });
    } else {
      setState(() {
        _showMedia = true;
      });
    }
  }

  String getMediaType(String? type) {
    switch (type) {
      case 'animated_gif':
        return 'GIF';
      case 'photo':
        return 'photo';
      case 'video':
        return 'video';
      default:
        return 'media';
    }
  }

  @override
  Widget build(BuildContext context) {
    var prefs = PrefService.of(context, listen: false);
    var size = prefs.get(optionMediaSize);
    if (size == 'disabled') {
      size = 'medium';
    }

    Widget media;

    var item = widget.media;

    if (_showMedia) {
      media =
          _TweetMediaThing(item: item, username: widget.username, size: size, pullToClose: false, inPageView: false);
    } else {
      media = GestureDetector(
        child: Container(
          color: Colors.black26,
          child: Center(
            child: Text(
              L10n.of(context).tap_to_show_getMediaType_item_type(getMediaType(item.type)),
            ),
          ),
        ),
        onTap: () => setState(() {
          _showMedia = true;
        }),
      );
    }

    // If there's only one item in this media collection, don't show the page counter
    if (widget.total == 1) {
      return media;
    }

    return Stack(
      children: [
        Center(child: media),
        Positioned(
          right: 0,
          child: Container(
            alignment: Alignment.topRight,
            color: Colors.black38,
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            child: Text('${widget.index} / ${widget.total}'),
          ),
        )
      ],
    );
  }
}

class TweetMedia extends StatefulWidget {
  final bool? sensitive;
  final List<Media> media;
  final String username;

  const TweetMedia({Key? key, required this.sensitive, required this.media, required this.username}) : super(key: key);

  @override
  State<TweetMedia> createState() => _TweetMediaState();
}

class _TweetMediaState extends State<TweetMedia> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    var largestAspectRatio =
        widget.media.map((e) => ((e.sizes!.large!.w) ?? 1) / ((e.sizes!.large!.h) ?? 1)).reduce(math.max);

    return Consumer<TweetContextState>(builder: (context, model, child) {
      if (model.hideSensitive && (widget.sensitive ?? false)) {
        return Card(
          child: Center(
              child: EmojiErrorWidget(
            emoji: '🍆🙈🍆',
            message: L10n.current.possibly_sensitive,
            errorMessage: L10n.current.possibly_sensitive_tweet,
            retryText: L10n.current.yes_please,
            onRetry: () async => model.setHideSensitive(false),
          )),
        );
      }

      return Container(
        margin: const EdgeInsets.only(top: 8, left: 16, right: 16),
        child: AspectRatio(
          aspectRatio: largestAspectRatio,
          child: PageView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: widget.media.length,
            itemBuilder: (context, index) {
              var item = widget.media[index];

              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TweetMediaView(initialIndex: index, media: widget.media, username: widget.username))),
                child: _TweetMediaItem(
                    media: item, index: index + 1, total: widget.media.length, username: widget.username),
              );
            },
          ),
        ),
      );
    });
  }
}

class TweetMediaView extends StatefulWidget {
  final int initialIndex;
  final List<Media> media;
  final String username;

  const TweetMediaView({Key? key, required this.initialIndex, required this.media, required this.username})
      : super(key: key);

  @override
  State<TweetMediaView> createState() => _TweetMediaViewState();
}

class _TweetMediaViewState extends State<TweetMediaView> {
  late Media _media;

  @override
  void initState() {
    super.initState();

    _media = widget.media[widget.initialIndex];
  }

  @override
  Widget build(BuildContext context) {
    var prefs = PrefService.of(context, listen: false);
    var size = prefs.get(optionMediaSize);
    if (size == 'disabled') {
      size = 'medium';
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          AsyncButtonBuilder(
            child: const Icon(Symbols.download_rounded),
            builder: (context, child, callback, buttonState) {
              return IconButton(onPressed: callback, icon: child);
            },
            onPressed: () async {
              var url = path.basename(_media.mediaUrlHttps!);
              var fileName = '${widget.username}-$url';
              var uri = Uri.parse('${_media.mediaUrlHttps}:orig');

              await downloadUriToPickedFile(
                context,
                uri,
                fileName,
                onStart: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(L10n.of(context).downloading_media),
                  ));
                },
                onSuccess: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(L10n.of(context).successfully_saved_the_media),
                  ));
                },
              );
            },
          ),
          AsyncButtonBuilder(
            showSuccess: false,
            builder: (context, child, callback, buttonState) {
              return IconButton(onPressed: callback, icon: child);
            },
            onPressed: () async {
              var uri = Uri.parse('${_media.mediaUrlHttps}:orig');

              Uint8List? fileBytes = await downloadFile(context, uri);

              // We assume that downloaded data is in image/jpeg format
              if (fileBytes != null) {
                await shareJpegData(fileBytes);
              }
            },
            child: const Icon(Symbols.share),
          ),
        ],
      ),
      body: ExtendedImageGesturePageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.media.length,
        itemBuilder: (BuildContext context, int index) {
          var item = widget.media[index];

          return _TweetMediaThing(
              item: item, username: widget.username, size: size, pullToClose: true, inPageView: true);
        },
        controller: ExtendedPageController(
          initialPage: widget.initialIndex,
        ),
        onPageChanged: (index) => setState(() {
          _media = widget.media[index];
        }),
      ),
    );
  }
}

class _TweetMediaThing extends StatelessWidget {
  final Media item;
  final String username;
  final String size;
  final bool pullToClose;
  final bool inPageView;

  const _TweetMediaThing(
      {Key? key,
      required this.item,
      required this.username,
      required this.size,
      required this.pullToClose,
      required this.inPageView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget media;
    if (item.type == 'animated_gif') {
      media = TweetVideo(metadata: TweetVideoMetadata.fromMedia(context, item), loop: true, username: username);
    } else if (item.type == 'video') {
      media = TweetVideo(metadata: TweetVideoMetadata.fromMedia(context, item), loop: false, username: username);
    } else if (item.type == 'photo') {
      media = TweetPhoto(
          size: size, uri: item.mediaUrlHttps!, fit: BoxFit.contain, pullToClose: pullToClose, inPageView: inPageView);
    } else {
      media = Text(L10n.of(context).unknown);
    }

    return media;
  }
}

class TweetPhotoView extends StatefulWidget {
  final String url;
  final String username;

  const TweetPhotoView({Key? key, required this.url, required this.username}) : super(key: key);

  @override
  State<TweetPhotoView> createState() => _TweetPhotoViewState();
}

class _TweetPhotoViewState extends State<TweetPhotoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          AsyncButtonBuilder(
            child: const Icon(Symbols.download_rounded),
            builder: (context, child, callback, buttonState) {
              return IconButton(onPressed: callback, icon: child);
            },
            onPressed: () async {
              var url = path.basename(widget.url);
              var fileName = '${widget.username}-$url';
              var uri = Uri.parse(widget.url);

              await downloadUriToPickedFile(
                context,
                uri,
                fileName,
                onStart: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(L10n.of(context).downloading_media),
                  ));
                },
                onSuccess: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(L10n.of(context).successfully_saved_the_media),
                  ));
                },
              );
            },
          ),
          AsyncButtonBuilder(
            showSuccess: false,
            builder: (context, child, callback, buttonState) {
              return IconButton(onPressed: callback, icon: child);
            },
            onPressed: () async {
              var uri = Uri.parse(widget.url);

              Uint8List? fileBytes = await downloadFile(context, uri);

              // We assume that downloaded data is in image/jpeg format
              if (fileBytes != null) {
                await shareJpegData(fileBytes);
              }
            },
            child: const Icon(Symbols.share),
          ),
        ],
      ),
      body: TweetPhoto(uri: widget.url, fit: BoxFit.contain, pullToClose: true, inPageView: true),
    );
  }
}
