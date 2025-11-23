import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:squawker/constants.dart';
import 'package:squawker/database/entities.dart';
import 'package:squawker/database/repository.dart';
import 'package:logging/logging.dart';
import 'package:pref/pref.dart';
import 'package:uuid/uuid.dart';

var defaultGroupIcon = '{"pack":"custom","key":"rss_feed_rounded"}';

IconData deserializeIconData(String iconData) {
  try {
    var icon = deserializeIcon(jsonDecode(iconData));
    if (icon != null) {
      return icon.data;
    }
  } catch (e, stackTrace) {
    log('Unable to deserialize icon', error: e, stackTrace: stackTrace);
  }

  // Use this as a default;
  return Symbols.rss_feed_rounded;
}

class GroupModel extends Store<SubscriptionGroupGet> {
  final String id;

  GroupModel(this.id)
      : super(SubscriptionGroupGet(
            id: '',
            name: '',
            icon: defaultGroupIcon,
            subscriptions: [],
            includeRetweets: false,
            includeReplies: false));

  Future<void> loadGroup() async {
    await execute(() async {
      var database = await Repository.readOnly();

      var group = (await database.query(tableSubscriptionGroup, where: 'id = ?', whereArgs: [id])).first;

      if (id == '-1') {
        var subscriptions =
            (await database.query(tableSubscription)).map((e) => UserSubscription.fromMap(e)).toList(growable: false);

        return SubscriptionGroupGet(
            id: '-1',
            name: 'All',
            icon: group['icon'] as String,
            subscriptions: subscriptions,
            includeReplies: group['include_replies'] == 1,
            includeRetweets: group['include_retweets'] == 1);
      }

      var searchSubscriptions = (await database.rawQuery(
              'SELECT s.* FROM $tableSearchSubscription s LEFT JOIN $tableSubscriptionGroupMember sgm ON sgm.profile_id = s.id WHERE sgm.group_id = ?',
              [id]))
          .map((e) => SearchSubscription.fromMap(e))
          .toList(growable: false);

      var userSubscriptions = (await database.rawQuery(
              'SELECT s.* FROM $tableSubscription s LEFT JOIN $tableSubscriptionGroupMember sgm ON sgm.profile_id = s.id WHERE sgm.group_id = ?',
              [id]))
          .map((e) => UserSubscription.fromMap(e))
          .toList(growable: false);

      // TODO: Factory
      return SubscriptionGroupGet(
          id: group['id'] as String,
          name: group['name'] as String,
          icon: group['icon'] as String,
          subscriptions: [...userSubscriptions, ...searchSubscriptions],
          includeReplies: group['include_replies'] == 1,
          includeRetweets: group['include_retweets'] == 1);
    });
  }

  Future<void> toggleSubscriptionGroupIncludeReplies(bool value) async {
    await execute(() async {
      (await Repository.writable())
          .rawUpdate('UPDATE $tableSubscriptionGroup SET include_replies = ? WHERE id = ?', [value, state.id]);
      state.includeReplies = value;
      return state;
    });
  }

  Future<void> toggleSubscriptionGroupIncludeRetweets(bool value) async {
    await execute(() async {
      (await Repository.writable())
          .rawUpdate('UPDATE $tableSubscriptionGroup SET include_retweets = ? WHERE id = ?', [value, state.id]);
      state.includeRetweets = value;
      return state;
    });
  }
}

class GroupsModel extends Store<List<SubscriptionGroup>> {
  static final log = Logger('GroupModel');

  final BasePrefService prefs;

  GroupsModel(this.prefs) : super([]);

  bool get orderGroupsAscending => prefs.get(optionSubscriptionGroupsOrderByAscending);
  String get orderGroupsBy => prefs.get(optionSubscriptionGroupsOrderByField);

  Future<void> deleteGroup(String id) async {
    log.info('Deleting the group $id');

    await execute(() async {
      var database = await Repository.writable();

      await database.delete(tableSubscriptionGroupMember, where: 'group_id = ?', whereArgs: [id]);
      await database.delete(tableSubscriptionGroup, where: 'id = ?', whereArgs: [id]);

      return state.where((e) => e.id != id).toList();
    });
  }

  Future reloadGroups() async {
    log.info('Listing subscriptions groups');

    await execute(() async {
      var database = await Repository.readOnly();

      var orderByDirection = orderGroupsAscending ? 'COLLATE NOCASE ASC' : 'COLLATE NOCASE DESC';

      var query =
          "SELECT g.id, g.name, g.icon, g.color, g.created_at, COUNT(gm.profile_id) AS number_of_members FROM $tableSubscriptionGroup g LEFT JOIN $tableSubscriptionGroupMember gm ON gm.group_id = g.id WHERE g.id != '-1' GROUP BY g.id ORDER BY $orderGroupsBy $orderByDirection";

      return (await database.rawQuery(query)).map((e) => SubscriptionGroup.fromMap(e)).toList(growable: false);
    });
  }

  Future<List<SubscriptionGroupMember>> listGroupMembers() async {
    var database = await Repository.readOnly();

    return (await database.query(tableSubscriptionGroupMember))
        .map((e) => SubscriptionGroupMember(group: e['group_id'] as String, profile: e['profile_id'] as String))
        .toList(growable: false);
  }

  Future<List<String>> listGroupsForUser(String user) async {
    var database = await Repository.readOnly();

    return (await database.query(tableSubscriptionGroupMember,
            columns: ['group_id'], where: 'profile_id = ?', whereArgs: [user]))
        .map((e) => e['group_id'] as String)
        .toList(growable: false);
  }

  Future saveUserGroupMembership(String user, List<String> memberships) async {
    var database = await Repository.writable();

    var batch = database.batch();

    // First, clear all the memberships for the user
    batch.delete(tableSubscriptionGroupMember, where: 'profile_id = ?', whereArgs: [user]);

    // Then add all the new memberships
    for (var group in memberships) {
      batch.insert(tableSubscriptionGroupMember, {'group_id': group, 'profile_id': user});
    }

    await batch.commit();
    await reloadGroups();
  }

  Future<SubscriptionGroupEdit> loadGroupEdit(String? id, {Set<String>? preMembers}) async {
    var database = await Repository.readOnly();

    if (id == null) {
      return SubscriptionGroupEdit(
        id: null,
        name: '',
        icon: defaultGroupIcon,
        color: null,
        members: preMembers ?? <String>{},
      );
    }

    var group = await database.query(tableSubscriptionGroup, where: 'id = ?', whereArgs: [id]);
    if (group.isEmpty) {
      return SubscriptionGroupEdit(
        id: null,
        name: '',
        icon: defaultGroupIcon,
        color: null,
        members: <String>{},
      );
    }

    var members = (await database.query(tableSubscriptionGroupMember, where: 'group_id = ?', whereArgs: [id]))
        .map((e) => e['profile_id'] as String)
        .toSet();

    return SubscriptionGroupEdit(
      id: group.first['id'] as String,
      name: group.first['name'] as String,
      icon: group.first['icon'] as String,
      color: group.first['color'] == null ? null : Color(group.first['color'] as int),
      members: members,
    );
  }

  Future saveGroup(String? id, String name, String icon, Color? color, Set<String> subscriptions) async {
    await execute(() async {
      var database = await Repository.writable();

      // First insert or update the subscription group details
      if (id == null) {
        id = const Uuid().v4();

        await database.insert(tableSubscriptionGroup, {'id': id, 'name': name, 'color': color?.value, 'icon': icon});
      } else {
        await database.update(
            tableSubscriptionGroup,
            {
              'name': name,
              'color': color?.value,
              'icon': icon,
            },
            where: 'id = ?',
            whereArgs: [id]);
      }

      // Then clear out any existing subscriptions for the group and add our new set
      await database.delete(tableSubscriptionGroupMember, where: 'group_id = ?', whereArgs: [id]);

      var batch = database.batch();
      for (var subscription in subscriptions) {
        batch.insert(tableSubscriptionGroupMember, {'group_id': id, 'profile_id': subscription});
      }

      await batch.commit(noResult: true);
      await reloadGroups();

      // TODO: Replace the group in the state instead
      return state;
    });
  }

  void changeOrderSubscriptionGroupsBy(String? value) async {
    await prefs.set(optionSubscriptionGroupsOrderByField, value ?? 'name');
    await reloadGroups();
  }

  void toggleOrderSubscriptionGroupsAscending() async {
    await prefs.set(optionSubscriptionGroupsOrderByAscending, !orderGroupsAscending);
    await reloadGroups();
  }
}
