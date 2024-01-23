import 'dart:convert';

import 'package:dart_twitter_api/twitter_api.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import 'package:squawker/client.dart';
import 'package:squawker/constants.dart';
import 'package:squawker/generated/l10n.dart';
import 'package:squawker/tweet/_media.dart';
import 'package:squawker/tweet/_video.dart';
import 'package:squawker/utils/urls.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:pref/pref.dart';
import 'package:timeago/timeago.dart' as timeago;

class TweetCard extends StatelessWidget {
  static final log = Logger('TweetCard');

  final TweetWithCard tweet;
  final Map<String, dynamic>? card;

  const TweetCard({Key? key, required this.tweet, required this.card}) : super(key: key);

  _createBaseCard(Widget child) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        width: double.infinity,
        child: Card(
          clipBehavior: Clip.antiAlias,
          color: Colors.blue,
          child: child,
        ));
  }

  _createCard(String? url, Widget child) {
    return GestureDetector(
      child: _createBaseCard(child),
      onTap: () => url == null ? null : openUri(url),
    );
  }

  _createImage(String size, Map<String, dynamic>? image, BoxFit fit, {double? aspectRatio}) {
    if (image == null) {
      return Container();
    }

    Widget child;

    if (size == 'disabled') {
      child = Container();
    } else {
      child = ExtendedImage.network(
        image['url'],
        cache: true,
        fit: fit,
      );
    }

    return AspectRatio(
      aspectRatio: aspectRatio ?? image['width'] / image['height'],
      child: child,
    );
  }

  _createListTile(BuildContext context, String title, String? description, String? uri) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 4),
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
          if (description != null)
            Container(
              margin: const EdgeInsets.only(top: 4),
              child: Text(
                description,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white, fontSize: 12),
              ),
            ),
          if (uri != null)
            Container(
              margin: EdgeInsets.only(top: description == null ? 4 : 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.link_rounded, size: 12, color: Colors.white),
                  const SizedBox(width: 4),
                  Text(uri,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.white,
                          )),
                ],
              ),
            )
        ],
      ),
    );
  }

  _createVoteBar(BuildContext context, Map<String, dynamic> card, double total, int choiceIndex) {
    var choiceCount = double.parse(card['binding_values']['choice${choiceIndex}_count']['string_value']);
    var choicePercent = total == 0 ? 0 : (100 / total) * choiceCount;

    var theme = Theme.of(context);
    var textColor = theme.brightness == Brightness.light ? Colors.black : Colors.white;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Stack(alignment: Alignment.center, children: [
        SizedBox(
          height: 24,
          child: LinearProgressIndicator(
              value: choicePercent / 100,
              color:
                  theme.brightness == Brightness.light ? Colors.blue.withOpacity(0.3) : Colors.blue.withOpacity(0.7)),
        ),
        Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: '${choicePercent.toStringAsFixed(1)}% ',
                    style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
                TextSpan(
                    text: card['binding_values']['choice${choiceIndex}_label']['string_value'],
                    style: TextStyle(
                      color: textColor,
                    ))
              ]),
            )),
      ]),
    );
  }

  _createWebsiteCard(
      BuildContext context, Map<String, dynamic> unifiedCard, String uri, String imageSize, Widget media) {
    return _createCard(
        uri,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            media,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: _createListTile(context, unifiedCard['component_objects']['details_1']['data']['title']['content'],
                  unifiedCard['component_objects']['details_1']['data']['subtitle']['content'], null),
            ),
          ],
        ));
  }

  _createUnifiedCard(BuildContext context, Map<String, dynamic> card, String imageKey, String imageSize) {
    var unifiedCard = jsonDecode(card['binding_values']['unified_card']['string_value']) as Map<String, dynamic>;

    switch (unifiedCard['type']) {
      case 'image_website':
        var media = unifiedCard['media_entities'][unifiedCard['component_objects']['media_1']['data']['id']];
        var uri = unifiedCard['destination_objects']['browser_1']['data']['url_data']['url'];

        var child = _createImage(
            imageSize,
            {
              'url': media['media_url_https'],
              'width': media['original_info']['width'],
              'height': media['original_info']['height'],
            },
            BoxFit.contain);
        return _createWebsiteCard(context, unifiedCard, uri, imageSize, child);
      case 'video_website':
        // https://twitter.com/yenisafak/status/1560244349451096064
        var media = unifiedCard['media_entities'][unifiedCard['component_objects']['media_1']['data']['id']];
        var uri = unifiedCard['destination_objects']['browser_with_docked_media_1']['data']['url_data']['url'];

        var child = TweetMedia(media: [Media.fromJson(media)], username: tweet.user!.screenName!, sensitive: false);
        return _createWebsiteCard(context, unifiedCard, uri, imageSize, child);
      default:
        return Container();
    }
  }

  _createVoteCard(BuildContext context, Map<String, dynamic> card, int numberOfChoices) {
    var numberFormat = NumberFormat.decimalPattern();

    var total = List.generate(
            numberOfChoices, (index) => double.parse(card['binding_values']['choice${++index}_count']['string_value']))
        .reduce((value, element) => value + element);

    String endsAtText;

    var endsAt = DateTime.parse(card['binding_values']['end_datetime_utc']['string_value']);
    if (endsAt.isBefore(DateTime.now())) {
      endsAtText = L10n.of(context).ended_timeago_format_endsAt_allowFromNow_true(
        timeago.format(endsAt, allowFromNow: true, locale: Intl.shortLocale(Intl.getCurrentLocale())),
      );
    } else {
      endsAtText = L10n.of(context).ends_timeago_format_endsAt_allowFromNow_true(
        timeago.format(endsAt, allowFromNow: true, locale: Intl.shortLocale(Intl.getCurrentLocale())),
      );
    }

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            ...List.generate(numberOfChoices, (index) => _createVoteBar(context, card, total, ++index)),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(top: 8),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: L10n.of(context).numberFormat_format_total_votes(
                      total,
                      numberFormat.format(total),
                    ),
                  ),
                  const TextSpan(text: ' • '),
                  TextSpan(text: endsAtText)
                ]),
              ),
            )
          ],
        ));
  }

  String? _findCardUrl(Map<String, dynamic> card) {
    var link = card['url'];
    var urls = tweet.entities?.urls ?? [];

    // Match up the card's URL with the link in the tweet entities, otherwise just use the card's URL
    var url = urls.firstWhere((element) => element.url == link, orElse: () => Url.fromJson({'expanded_url': link}));

    return url.expandedUrl;
  }

  @override
  Widget build(BuildContext context) {
    var card = this.card;
    if (card == null) {
      return Container();
    }

    var imageKey = '';
    var imageSize = PrefService.of(context, listen: false).get(optionMediaSize);
    if (imageSize == 'thumb') {
      imageKey = '_small';
    } else if (imageSize == 'medium') {
      imageKey = '_large';
    } else if (imageSize == 'large') {
      imageKey = '_x_large';
    }

    switch (card['name']) {
      case 'summary':
        var image = card['binding_values']['thumbnail_image$imageKey']?['image_value'];

        return _createCard(
            _findCardUrl(card),
            Row(
              children: [
                Expanded(flex: 1, child: _createImage(imageSize, image, BoxFit.contain)),
                Expanded(
                    flex: 4,
                    child: _createListTile(
                        context,
                        card['binding_values']['title']['string_value'],
                        card['binding_values']?['description']?['string_value'],
                        card['binding_values']?['vanity_url']?['string_value']))
              ],
            ));
      case 'summary_large_image':
        var image = card['binding_values']['thumbnail_image$imageKey']?['image_value'];

        return _createCard(
            _findCardUrl(card),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _createImage(imageSize, image, BoxFit.contain),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: _createListTile(
                      context,
                      card['binding_values']['title']['string_value'],
                      card['binding_values']?['description']?['string_value'],
                      card['binding_values']?['vanity_url']?['string_value']),
                ),
              ],
            ));
      case 'player':
        var image = card['binding_values']['player_image$imageKey']?['image_value'];

        return _createCard(
            _findCardUrl(card),
            Row(
              children: [
                Expanded(flex: 1, child: _createImage(imageSize, image, BoxFit.cover, aspectRatio: 1)),
                Expanded(
                    flex: 4,
                    child: _createListTile(
                        context,
                        card['binding_values']['title']['string_value'],
                        card['binding_values']?['description']?['string_value'],
                        card['binding_values']?['vanity_url']?['string_value']))
              ],
            ));
      case 'poll2choice_text_only':
        return _createVoteCard(context, card, 2);
      case 'poll3choice_text_only':
        return _createVoteCard(context, card, 3);
      case 'poll4choice_text_only':
        return _createVoteCard(context, card, 4);
      case 'promo_website':
        // https://twitter.com/CMEGroup/status/1573288572647612416
        var url = card['binding_values']['website_url']['string_value'];
        var image = card['binding_values']['promo_image$imageKey']?['image_value'];
        var title = card['binding_values']['title']['string_value'];
        var vanityUrl = card['binding_values']['vanity_url']['string_value'];

        return _createCard(
            url,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _createImage(imageSize, image, BoxFit.contain),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: _createListTile(context, title, null, vanityUrl),
                ),
              ],
            ));
      case 'unified_card':
        try {
          return _createUnifiedCard(context, card, imageKey, imageSize);
        } catch (e) {
          log.severe('Unable to render the unified card');
          return Container();
        }
      case '745291183405076480:live_event':
        // https://twitter.com/Erdoanz11/status/1573765738032152577
        var url = card['binding_values']['card_url']['string_value'];
        var image = card['binding_values']['event_thumbnail$imageKey']?['image_value'];

        var author = card['binding_values']['author']['user_value']['id_str'];
        var user = card['users'][author]['screen_name'];

        // TODO: This opens the URL externally. Create a screen for it in Squawker
        return _createCard(
            url,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _createImage(imageSize, image, BoxFit.contain),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: _createListTile(context, card['binding_values']['event_title']['string_value'],
                      card['binding_values']['event_subtitle']?['string_value'], '@$user'),
                ),
              ],
            ));
      case '745291183405076480:broadcast':
        // https://twitter.com/KwasiKwarteng/status/1573229010779516929
        var uri = card['binding_values']['card_url']['string_value'];
        var image = card['binding_values']['broadcast_thumbnail$imageKey']?['image_value']['url'];
        var key = card['binding_values']['broadcast_media_key']?['string_value'];
        if (key == null) {
          return Container();
        }

        var width = double.parse(card['binding_values']['broadcast_width']['string_value']);
        var height = double.parse(card['binding_values']['broadcast_height']['string_value']);

        var aspectRatio = width / height;

        var child = TweetVideo(
            username: 'username',
            loop: false,
            metadata: TweetVideoMetadata(null, aspectRatio, image, () async {
              var broadcast = await Twitter.getBroadcastDetails(key);

              return TweetVideoUrls(broadcast['source']['noRedirectPlaybackUrl'], null);
            }));

        var username = card['binding_values']['broadcaster_username']?['string_value'];
        var title = card['binding_values']['broadcast_title']?['string_value'];

        username = username != null ? '@$username' : '';
        title ??= '';

        // TODO: Figure out what states we can receive
        //var state = card['binding_values']['broadcast_state']?['string_value'];

        // TODO: This opens the URL externally. Create a screen for it in Squawker
        return _createCard(
            uri,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                child,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: _createListTile(context, title, username, null),
                ),
              ],
            ));
      default:
        return Container();
    }
  }
}

class UnknownCardType implements Exception {
  final String? tweet;
  final String type;

  UnknownCardType(this.tweet, this.type);

  @override
  String toString() {
    return 'UnknownCardType{tweet: $tweet, type: $type}';
  }
}

class UnknownUnifiedCardType implements Exception {
  final String? tweet;
  final String type;

  UnknownUnifiedCardType(this.tweet, this.type);

  @override
  String toString() {
    return 'UnknownUnifiedCardType{tweet: $tweet, type: $type}';
  }
}
