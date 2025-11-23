import 'package:flutter/material.dart';
import 'package:squawker/group/group_model.dart';
import 'package:squawker/user.dart';
import 'package:squawker/utils/crypto_util.dart';
import 'package:squawker/utils/misc.dart';
import 'package:intl/intl.dart';

final DateFormat sqliteDateFormat = DateFormat('yyyy-MM-dd hh:mm:ss');

mixin ToMappable {
  Map<String, dynamic> toMap();
}

class SavedTweet with ToMappable {
  final String id;
  final String? user;
  final String? content;

  SavedTweet({required this.id, required this.user, required this.content});

  factory SavedTweet.fromMap(Map<String, Object?> map) {
    return SavedTweet(id: map['id'] as String, user: map['user_id'] as String?, content: map['content'] as String?);
  }

  @override
  Map<String, dynamic> toMap() {
    return {'id': id, 'content': content, 'user_id': user};
  }
}

abstract class Subscription with ToMappable {
  final String id;
  final String screenName;
  final String name;
  final String? profileImageUrlHttps;
  final bool verified;
  final bool inFeed;
  final DateTime createdAt;

  Subscription(
      {required this.id,
      required this.screenName,
      required this.name,
      required this.profileImageUrlHttps,
      required this.verified,
      required this.inFeed,
      required this.createdAt});
}

class SearchSubscription extends Subscription {
  SearchSubscription({required super.id, required super.createdAt})
      : super(name: id, screenName: id, verified: false, inFeed: true, profileImageUrlHttps: null);

  factory SearchSubscription.fromMap(Map<String, Object?> map) {
    return SearchSubscription(id: map['id'] as String, createdAt: DateTime.parse(map['created_at'] as String));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is SearchSubscription && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  Map<String, dynamic> toMap() {
    // TODO: Created at date format
    return {'id': id, 'created_at': sqliteDateFormat.format(createdAt)};
  }
}

class UserSubscription extends Subscription {
  UserSubscription(
      {required super.id,
      required super.screenName,
      required super.name,
      required super.profileImageUrlHttps,
      required super.verified,
      required super.inFeed,
      required super.createdAt});

  factory UserSubscription.fromMap(Map<String, Object?> map) {
    var verified = map['verified'] is int;
    var inFeed = map['in_feed'] is int;
    var createdAt = map['created_at'] == null ? DateTime.now() : DateTime.parse(map['created_at'] as String);

    return UserSubscription(
        id: map['id'] as String,
        screenName: map['screen_name'] as String,
        name: map['name'] as String,
        profileImageUrlHttps: map['profile_image_url_https'] as String?,
        verified: verified ? map['verified'] == 1 : false,
        inFeed: inFeed ?  map['in_feed'] == 1 : true,
        createdAt: createdAt);
  }

  factory UserSubscription.fromUser(UserWithExtra user) {
    return UserSubscription(
        id: user.idStr!,
        screenName: user.screenName!,
        name: user.name!,
        profileImageUrlHttps: user.profileImageUrlHttps,
        verified: user.verified!,
        inFeed: true,
        createdAt: user.createdAt!);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is UserSubscription && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'screen_name': screenName,
      'name': name,
      'profile_image_url_https': profileImageUrlHttps,
      'verified': verified ? 1 : 0,
      'in_feed': inFeed ? 1 : 0,
      'created_at': sqliteDateFormat.format(createdAt)
    };
  }

  UserWithExtra toUser() {
    return UserWithExtra.fromJson({
      'id_str': id,
      'screen_name': screenName,
      'name': name,
      'profile_image_url_https': profileImageUrlHttps,
      'verified': verified
    });
  }
}

class SubscriptionGroup with ToMappable {
  final String id;
  final String name;
  final String icon;
  final Color? color;
  final int numberOfMembers;
  final DateTime createdAt;

  IconData get iconData => deserializeIconData(icon);

  SubscriptionGroup(
      {required this.id,
      required this.name,
      required this.icon,
      required this.color,
      required this.numberOfMembers,
      required this.createdAt});

  factory SubscriptionGroup.fromMap(Map<String, Object?> json) {
    // This is here to handle imports of data from before v2.15.0
    var icon = json['icon'] as String?;
    if (icon == null || icon == 'rss' || icon == '') {
      icon = defaultGroupIcon;
    }

    return SubscriptionGroup(
        id: json['id'] as String,
        name: json['name'] as String,
        icon: icon,
        color: json['color'] == null ? null : Color(json['color'] as int),
        numberOfMembers: json['number_of_members'] == null ? 0 : json['number_of_members'] as int,
        createdAt: DateTime.parse(json['created_at'] as String));
  }

  @override
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'icon': icon, 'color': color?.value, 'created_at': createdAt.toIso8601String()};
  }
}

class SubscriptionGroupGet {
  final String id;
  final String name;
  final String icon;
  final List<Subscription> subscriptions;
  bool includeReplies;
  bool includeRetweets;

  SubscriptionGroupGet(
      {required this.id,
      required this.name,
      required this.icon,
      required this.subscriptions,
      required this.includeReplies,
      required this.includeRetweets});
}

class SubscriptionGroupEdit {
  final String? id;
  String name;
  String icon;
  Color? color;
  Set<String> members;

  SubscriptionGroupEdit(
      {required this.id, required this.name, required this.icon, required this.color, required this.members});
}

class SubscriptionGroupMember with ToMappable {
  final String group;
  final String profile;

  SubscriptionGroupMember({required this.group, required this.profile});

  factory SubscriptionGroupMember.fromMap(Map<String, Object?> json) {
    return SubscriptionGroupMember(group: json['group_id'] as String, profile: json['profile_id'] as String);
  }

  @override
  Map<String, dynamic> toMap() {
    return {'group_id': group, 'profile_id': profile};
  }
}

class TwitterTokenEntity with ToMappable {

  final bool guest;
  final String idStr;
  final String screenName;
  final String oauthToken;
  final String oauthTokenSecret;
  final DateTime createdAt;
  TwitterProfileEntity? profile;

  TwitterTokenEntity({required this.guest, required this.idStr, required this.screenName, required this.oauthToken, required this.oauthTokenSecret, required this.createdAt, this.profile});

  static TwitterTokenEntity fromMap(Map<String, dynamic> json) {
    return _fromMap(json, json['profile'] == null ? null : TwitterProfileEntity.fromMap(json['profile'] as Map<String, dynamic>));
  }

  static Future<TwitterTokenEntity> fromMapSecured(Map<String, dynamic> json) async {
    return _fromMap(json, json['profile'] == null ? null : await TwitterProfileEntity.fromMapSecured(json['profile'] as Map<String, dynamic>, '$oauthConsumerSecret&${json['oauth_token']}.${json['oauth_token_secret']}'));
  }

  static TwitterTokenEntity _fromMap(Map<String, dynamic> json, TwitterProfileEntity? pProfile) {
    return TwitterTokenEntity(
      guest: json['guest'] == null ? true : (json['guest'] == 1),
      idStr: json['id_str'] == null ? getRandomString(19) : json['id_str'] as String,
      screenName: json['screen_name'] == null ? getRandomString(15) : json['screen_name'] as String,
      oauthToken: json['oauth_token'] == null ? '' : json['oauth_token'] as String,
      oauthTokenSecret: json['oauth_token_secret'] == null ? '' : json['oauth_token_secret'] as String,
      createdAt: json['created_at'] == null || json['created_at'] == '' ? DateTime.now() : DateTime.parse(json['created_at'] as String),
      profile: pProfile
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return _toMap(profile?.toMap());
  }

  Future<Map<String, dynamic>> toMapSecured() async {
    return _toMap(await profile?.toMapSecured('$oauthConsumerSecret&$oauthToken.$oauthTokenSecret'));
  }

  Map<String, dynamic> _toMap(Map<String, dynamic>? pProfile) {
    return {
      'guest': guest ? 1 : 0,
      'id_str': idStr,
      'screen_name': screenName,
      'oauth_token': oauthToken,
      'oauth_token_secret': oauthTokenSecret,
      'created_at': createdAt.toIso8601String(),
      'profile': pProfile
    };
  }

}

class TwitterTokenEntityWrapperDb with ToMappable {
  final TwitterTokenEntity tte;

  TwitterTokenEntityWrapperDb(this.tte);

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> m = tte.toMap();
    m.remove('profile');
    return m;
  }
}

class TwitterProfileEntity with ToMappable {

  final String username;
  String password;
  DateTime createdAt;
  String? name;
  String? email;
  String? phone;

  TwitterProfileEntity({required this.username, required this.password, required this.createdAt, this.name, this.email, this.phone});

  static TwitterProfileEntity fromMap(Map<String, dynamic> json) {
    return _fromMap(json, json['password'] == null ? '' : json['password'] as String);
  }

  static Future<TwitterProfileEntity> fromMapSecured(Map<String, dynamic> json, String key) async {
    return _fromMap(json, json['password'] == null ? '' : await aesGcm256Decrypt(key, json['password'] as String));
  }

  static TwitterProfileEntity _fromMap(Map<String, dynamic> json, String pPassword) {
    return TwitterProfileEntity(
      username: json['username'] == null ? '' : json['username'] as String,
      password: pPassword,
      createdAt: json['created_at'] == null || json['created_at'] == '' ? DateTime.now() : DateTime.parse(json['created_at'] as String),
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone']  as String?
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return _toMap(password);
  }

  Future<Map<String, dynamic>> toMapSecured(String key) async {
    return _toMap(await aesGcm256Encrypt(key, password));
  }

  Map<String, dynamic> _toMap(String pPassword) {
    return {
      'username': username,
      'password': pPassword,
      'created_at': createdAt.toIso8601String(),
      'name': name,
      'email': email,
      'phone': phone
    };
  }
}

class Account {
  final String id;
  final String authHeader;

  Account({required this.id, required this.authHeader});

  factory Account.fromMap(Map<String, Object?> map) {
    return Account(
      id: map['id'] as String,
      authHeader: map['auth_header'] as String,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Account && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  Map<String, dynamic> toMap() {
    return {'id': id, 'auth_header': authHeader};
  }
}
