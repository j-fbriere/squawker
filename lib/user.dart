import 'package:dart_twitter_api/src/utils/date_utils.dart';
import 'package:dart_twitter_api/twitter_api.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:pref/pref.dart';
import 'package:squawker/constants.dart';
import 'package:squawker/database/entities.dart';
import 'package:squawker/generated/l10n.dart';
import 'package:squawker/group/group_model.dart';
import 'package:squawker/profile/profile.dart';
import 'package:squawker/subscriptions/users_model.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

Widget _createUserAvatar(String? uri, double size) {
  if (uri == null) {
    return SizedBox(width: size, height: size);
  } else {
    return ExtendedImage.network(
      // TODO: This can error if the profile image has changed... use SWR-like
      uri.replaceAll('normal', '200x200'),
      width: size,
      height: size,
      loadStateChanged: (state) {
        switch (state.extendedImageLoadState) {
          case LoadState.failed:
            return const Icon(Icons.error_rounded);
          default:
            return state.completedWidget;
        }
      },
    );
  }
}

Widget _expandUserAvatar(String? uri, double size) {
  if (uri == null) {
    return SizedBox(width: size, height: size);
  } else {
    return ExtendedImage.network(
      // TODO: This can error if the profile image has changed... use SWR-like
      uri.replaceAll('normal', '400x400'),
      width: size,
      height: size,
      loadStateChanged: (state) {
        switch (state.extendedImageLoadState) {
          case LoadState.failed:
            return const Icon(Icons.error_rounded);
          default:
            return state.completedWidget;
        }
      },
    );
  }
}

class UserAvatar extends StatelessWidget {
  final String? uri;
  final double size;

  const UserAvatar({Key? key, required this.uri, this.size = 48}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late double borderSize = size;
    if (PrefService.of(context).get(optionAvatarSquare)) {
      borderSize = 10;
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderSize),
      child: _createUserAvatar(uri, size),
    );
  }
}

class UserTile extends StatelessWidget {
  final Subscription user;

  const UserTile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: UserAvatar(uri: user.profileImageUrlHttps),
      title: Row(
        children: [
          Flexible(child: Text(user.name, maxLines: 1, overflow: TextOverflow.ellipsis)),
          if (user.verified) const SizedBox(width: 6),
          if (user.verified) const Icon(Icons.verified_rounded, size: 14, color: Colors.blue)
        ],
      ),
      subtitle: Text('@${user.screenName}', maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: SizedBox(
        width: 36,
        child: FollowButton(user: user),
      ),
      onTap: () {
        Navigator.pushNamed(context, routeProfile, arguments: ProfileScreenArguments(user.id, user.screenName));
      },
    );
  }
}

class FollowButtonSelectGroupDialog extends StatefulWidget {
  final Subscription user;
  final bool followed;
  final List<String> groupsForUser;

  const FollowButtonSelectGroupDialog(
      {Key? key, required this.user, required this.followed, required this.groupsForUser})
      : super(key: key);

  @override
  State<FollowButtonSelectGroupDialog> createState() => _FollowButtonSelectGroupDialogState();
}

class _FollowButtonSelectGroupDialogState extends State<FollowButtonSelectGroupDialog> {
  @override
  Widget build(BuildContext context) {
    var groupModel = context.read<GroupsModel>();
    var subscriptionsModel = context.read<SubscriptionsModel>();

    var color = Theme.of(context).brightness == Brightness.dark ? Colors.white70 : Colors.black54;

    return MultiSelectDialog(
      title: Text(L10n.of(context).select),
      searchHint: L10n.of(context).search,
      confirmText: Text(L10n.of(context).ok),
      cancelText: Text(L10n.of(context).cancel),
      searchIcon: Icon(Icons.search_rounded, color: color),
      closeSearchIcon: Icon(Icons.close_rounded, color: color),
      itemsTextStyle: Theme.of(context).textTheme.bodyLarge,
      selectedColor: Theme.of(context).colorScheme.secondary,
      unselectedColor: color,
      selectedItemsTextStyle: Theme.of(context).textTheme.bodyLarge,
      items: groupModel.state.map((e) => MultiSelectItem(e.id, e.name)).toList(),
      initialValue: widget.groupsForUser,
      onConfirm: (List<String> memberships) async {
        // If we're not currently following the user, follow them first
        if (widget.followed == false) {
          await subscriptionsModel.toggleSubscribe(widget.user, widget.followed);
        }

        // Then add them to all the selected groups
        await groupModel.saveUserGroupMembership(widget.user.id, memberships);
      },
    );
  }
}

class FollowButton extends StatelessWidget {
  final Subscription user;
  final Color? color;

  const FollowButton({Key? key, required this.user, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = context.read<SubscriptionsModel>();

    return ScopedBuilder<SubscriptionsModel, List<Subscription>>(
      store: model,
      onState: (_, state) {
        var followed = state.any((element) => element.id == user.id);
        var inFeed = followed ? state.any((element) => element.id == user.id && element.inFeed) : false;

        var icon = followed
            ? (inFeed
                ? Icon(Icons.person_remove_rounded, color: color)
                : const Icon(Icons.person_remove_rounded, color: Colors.red))
            : Icon(Icons.person_add_rounded, color: color);
        var textSub = followed ? L10n.of(context).unsubscribe : L10n.of(context).subscribe;
        var textFeed = followed ? (inFeed ? L10n.of(context).remove_from_feed : L10n.of(context).add_to_feed) : null;

        return PopupMenuButton<String>(
          icon: icon,
          itemBuilder: (context) => [
            PopupMenuItem(value: 'toggle_subscribe', child: Text(textSub)),
            PopupMenuItem(
              value: 'add_to_group',
              child: Text(L10n.of(context).add_to_group),
            ),
            if (textFeed != null) PopupMenuItem(value: 'toggle_feed', child: Text(textFeed)),
          ],
          onSelected: (value) async {
            switch (value) {
              case 'add_to_group':
                var groups = await context.read<GroupsModel>().listGroupsForUser(user.id);
                showDialog(
                    context: context,
                    builder: (_) => FollowButtonSelectGroupDialog(
                          user: user,
                          followed: followed,
                          groupsForUser: groups,
                        ));
                break;
              case 'toggle_subscribe':
                await model.toggleSubscribe(user, followed);
                break;
              case 'toggle_feed':
                await model.toggleFeed(user, inFeed);
                break;
            }
          },
        );
      },
    );
  }
}

class UserWithExtra extends User {
  Map<String, dynamic>? card;
  bool? possiblySensitive;

  UserWithExtra();

  @override
  Map<String, dynamic> toJson() {
    var json = super.toJson();
    json['potentiallySensitive'] = possiblySensitive;

    return json;
  }

  factory UserWithExtra.fromJson(Map<String, dynamic> json) {
    var userWithExtra = UserWithExtra()
      ..idStr = json['id_str'] as String?
      ..name = json['name'] as String?
      ..screenName = json['screen_name'] as String?
      ..location = json['location'] as String?
      ..derived = json['derived'] == null ? null : Derived.fromJson(json['derived'] as Map<String, dynamic>)
      ..url = json['url'] as String?
      ..entities = json['entities'] == null ? null : UserEntities.fromJson(json['entities'] as Map<String, dynamic>)
      ..description = json['description'] as String?
      ..protected = json['protected'] as bool?
      ..verified = json['ext_is_blue_verified'] ?? json['verified'] as bool?
      ..status = json['status'] == null ? null : Tweet.fromJson(json['status'] as Map<String, dynamic>)
      ..followersCount = json['followers_count'] as int?
      ..friendsCount = json['friends_count'] as int?
      ..listedCount = json['listed_count'] as int?
      ..favoritesCount = json['favorites_count'] as int?
      ..statusesCount = json['statuses_count'] as int?
      ..createdAt = convertTwitterDateTime(json['created_at'] as String?)
      ..profileBannerUrl = json['profile_banner_url'] as String?
      ..profileImageUrlHttps = json['profile_image_url_https'] as String?
      ..defaultProfile = json['default_profile'] as bool?
      ..defaultProfileImage = json['default_profile_image'] as bool?
      ..withheldInCountries = (json['withheld_in_countries'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..withheldScope = json['withheld_scope'] as String?;

    userWithExtra.possiblySensitive = json['possibly_sensitive'] as bool?;

    return userWithExtra;
  }
}
