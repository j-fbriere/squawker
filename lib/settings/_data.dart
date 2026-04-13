import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:squawker/client/client_account.dart';
import 'package:squawker/constants.dart';
import 'package:squawker/database/entities.dart';
import 'package:squawker/database/repository.dart';
import 'package:squawker/generated/l10n.dart';
import 'package:squawker/group/group_model.dart';
import 'package:squawker/import_data_model.dart';
import 'package:squawker/subscriptions/users_model.dart';
import 'package:squawker/utils/data_service.dart';
import 'package:logging/logging.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pref/pref.dart';
import 'package:provider/provider.dart';
import 'package:squawker/utils/iterables.dart';

class SettingsData {
  final Map<String, dynamic>? settings;
  final List<SearchSubscription>? searchSubscriptions;
  final List<UserSubscription>? userSubscriptions;
  final List<SubscriptionGroup>? subscriptionGroups;
  final List<SubscriptionGroupMember>? subscriptionGroupMembers;
  final List<TwitterTokenEntity>? twitterTokens;
  final List<SavedTweet>? tweets;

  SettingsData(
      {required this.settings,
      required this.searchSubscriptions,
      required this.userSubscriptions,
      required this.subscriptionGroups,
      required this.subscriptionGroupMembers,
      required this.twitterTokens,
      required this.tweets});

  static Future<SettingsData> fromJson(Map<String, dynamic> json) async {
    List<TwitterTokenEntity>? twtTokens;
    // guestAccounts from previous versions
    if (json['guestAccounts'] != null) {
      // make sure to filter out the badly manipulated files
      twtTokens = List.from(json['guestAccounts']).map((e) => TwitterTokenEntity.fromMap(e)).where((e) => e.guest && e.profile == null && e.oauthToken.isNotEmpty && e.oauthTokenSecret.isNotEmpty).toList();
    }
    if (json['twitterTokens'] != null) {
      // make sure to filter out the badly manipulated files
      twtTokens ??= (await Future.wait(List.from(json['twitterTokens']).map((e) async => TwitterTokenEntity.fromMapSecured(e))))
        .where((e) => e.oauthToken.isNotEmpty && e.oauthTokenSecret.isNotEmpty && ((e.guest && e.profile == null) || (!e.guest && e.profile != null && e.profile!.username.isNotEmpty && e.profile!.password.isNotEmpty))).toList();
    }
    return SettingsData(
      settings: json['settings'],
      searchSubscriptions: json['searchSubscriptions'] != null
        ? List.from(json['searchSubscriptions']).map((e) => SearchSubscription.fromMap(e)).toList()
        : null,
      userSubscriptions: json['subscriptions'] != null
        ? List.from(json['subscriptions']).map((e) => UserSubscription.fromMap(e)).toList()
        : null,
      subscriptionGroups: json['subscriptionGroups'] != null
        ? List.from(json['subscriptionGroups']).map((e) => SubscriptionGroup.fromMap(e)).toList()
        : null,
      subscriptionGroupMembers: json['subscriptionGroupMembers'] != null
        ? List.from(json['subscriptionGroupMembers']).map((e) => SubscriptionGroupMember.fromMap(e)).toList()
        : null,
      twitterTokens: twtTokens,
      tweets: json['tweets'] != null
        ? List.from(json['tweets']).map((e) => SavedTweet.fromMap(e)).toList()
        : null
    );
  }

  Future<Map<String, dynamic>> toJson() async {
    return {
      'settings': settings,
      'searchSubscriptions': searchSubscriptions?.map((e) => e.toMap()).toList(),
      'subscriptions': userSubscriptions?.map((e) => e.toMap()).toList(),
      'subscriptionGroups': subscriptionGroups?.map((e) => e.toMap()).toList(),
      'subscriptionGroupMembers': subscriptionGroupMembers?.map((e) => e.toMap()).toList(),
      'twitterTokens': twitterTokens == null ? null : await Future.wait(twitterTokens!.map((e) async => e.toMapSecured()).toList()),
      'tweets': tweets?.map((e) => e.toMap()).toList()
    };
  }
}

class SettingsDataFragment extends StatelessWidget {
  static final log = Logger('SettingsDataFragment');

  final String legacyExportPath;

  const SettingsDataFragment({Key? key, required this.legacyExportPath}) : super(key: key);

  Future<void> _importFromFile(BuildContext context, File file) async {
    var content = jsonDecode(file.readAsStringSync());

    var importModel = context.read<ImportDataModel>();
    var groupModel = context.read<GroupsModel>();
    var prefs = PrefService.of(context);

    var data = await SettingsData.fromJson(content);

    var settings = data.settings;
    if (settings?.isNotEmpty ?? false) {
      prefs.fromMap(settings!);
    }

    var dataToImport = <String, List<ToMappable>>{};

    var searchSubscriptions = data.searchSubscriptions;
    if (searchSubscriptions?.isNotEmpty ?? false) {
      dataToImport[tableSearchSubscription] = searchSubscriptions!;
    }

    var userSubscriptions = data.userSubscriptions;
    if (userSubscriptions?.isNotEmpty ?? false) {
      dataToImport[tableSubscription] = userSubscriptions!;
    }

    var subscriptionGroups = data.subscriptionGroups;
    if (subscriptionGroups?.isNotEmpty ?? false) {
      dataToImport[tableSubscriptionGroup] = subscriptionGroups!;
    }

    var subscriptionGroupMembers = data.subscriptionGroupMembers;
    if (subscriptionGroupMembers?.isNotEmpty ?? false) {
      dataToImport[tableSubscriptionGroupMember] = subscriptionGroupMembers!;
    }

    var twitterTokens = data.twitterTokens;
    if (twitterTokens?.isNotEmpty ?? false) {
      dataToImport[tableTwitterToken] = twitterTokens!.map((e) => TwitterTokenEntityWrapperDb(e)).toList();
      var twitterProfiles = twitterTokens.where((e) => e.profile != null).map((e) => e.profile!).toList();
      if (twitterProfiles.isNotEmpty) {
        dataToImport[tableTwitterProfile] = twitterProfiles;
      }
    }

    var tweets = data.tweets;
    if (tweets?.isNotEmpty ?? false) {
      dataToImport[tableSavedTweet] = tweets!;
    }

    await importModel.importData(dataToImport);

    if ((twitterTokens?.isNotEmpty ?? false) && twitterTokens!.where((e) => !e.guest).isNotEmpty) {
      // after the import there is a possibility of duplicates of oauth tokens with the same profile
      // only keep the most recent one imported
      var database = await Repository.writable();
      var screenNamesDbData = await database.rawQuery('SELECT t.screen_name as screen_name, COUNT(t.screen_name) as count FROM $tableTwitterToken t INNER JOIN $tableTwitterProfile p ON t.screen_name = p.username GROUP BY t.screen_name HAVING COUNT(t.screen_name) > 1');
      for (int i = 0; i < screenNamesDbData.length; i++) {
        String screenName = screenNamesDbData[i]['screen_name'] as String;
        List<TwitterTokenEntity> tokenLst = twitterTokens.where((e) => e.screenName == screenName).toList();
        var ttLstDbData = await database.query(tableTwitterToken, where: 'screen_name = ?', whereArgs: [screenName], orderBy: 'created_at DESC');
        List<String> oauthTokenLst = ttLstDbData.map((e) => e['oauth_token'] as String).toList();
        // remove from the list the one that will be kept in db
        bool removed = false;
        for (int j = 0; j < oauthTokenLst.length; j++) {
          if (tokenLst.firstWhereOrNull((e) => e.oauthToken == oauthTokenLst[j]) != null) {
            removed = true;
            oauthTokenLst.removeAt(j);
            break;
          }
        }
        if (!removed) {
          oauthTokenLst.removeAt(0);
        }
        await database.delete(tableTwitterToken, where: 'oauth_token IN (${List.filled(oauthTokenLst.length, '?').join(',')})', whereArgs: oauthTokenLst);
      }
    }

    if (twitterTokens?.isNotEmpty ?? false) {
      await TwitterAccount.loadAllTwitterTokensAndRateLimits();
    }
    await groupModel.reloadGroups();
    await context.read<SubscriptionsModel>().reloadSubscriptions();
    // uses api 1.1 which is not working anymore
    //await context.read<SubscriptionsModel>().refreshSubscriptionData();

    DataService().map['toggleKeepFeed'] = true;

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(L10n.of(context).data_imported_successfully),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(L10n.current.data)),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView(children: [
          PrefLabel(
            leading: const Icon(Symbols.file_download_rounded),
            title: Text(L10n.of(context).import),
            subtitle: Text(L10n.of(context).import_data_from_another_device),
            onTap: () async {
              var path = await FlutterFileDialog.pickFile(params: const OpenFileDialogParams());
              if (path != null) {
                await _importFromFile(context, File(path));
              }
            },
          ),
          PrefLabel(
            leading: const Icon(Symbols.save),
            title: Text(L10n.of(context).export),
            subtitle: Text(L10n.of(context).export_your_data),
            onTap: () => Navigator.pushNamed(context, routeSettingsExport),
          ),
        ]),
      ),
    );
  }
}

