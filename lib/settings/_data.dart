import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:squawker/client_account.dart';
import 'package:squawker/constants.dart';
import 'package:squawker/database/entities.dart';
import 'package:squawker/database/repository.dart';
import 'package:squawker/generated/l10n.dart';
import 'package:squawker/group/group_model.dart';
import 'package:squawker/import_data_model.dart';
import 'package:squawker/subscriptions/users_model.dart';
import 'package:squawker/utils/data_service.dart';
import 'package:logging/logging.dart';
import 'package:pref/pref.dart';
import 'package:provider/provider.dart';

class SettingsData {
  final Map<String, dynamic>? settings;
  final List<SearchSubscription>? searchSubscriptions;
  final List<UserSubscription>? userSubscriptions;
  final List<SubscriptionGroup>? subscriptionGroups;
  final List<SubscriptionGroupMember>? subscriptionGroupMembers;
  final List<GuestAccount>? guestAccounts;
  final List<SavedTweet>? tweets;

  SettingsData(
      {required this.settings,
      required this.searchSubscriptions,
      required this.userSubscriptions,
      required this.subscriptionGroups,
      required this.subscriptionGroupMembers,
      required this.guestAccounts,
      required this.tweets});

  factory SettingsData.fromJson(Map<String, dynamic> json) {
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
      guestAccounts: json['guestAccounts'] != null
        ? List.from(json['guestAccounts']).map((e) => GuestAccount.fromMap(e)).where((e) => e.oauthToken != '' && e.oauthTokenSecret != '').toList()
        : null,
      tweets: json['tweets'] != null
        ? List.from(json['tweets']).map((e) => SavedTweet.fromMap(e)).toList()
        : null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'settings': settings,
      'searchSubscriptions': searchSubscriptions?.map((e) => e.toMap()).toList(),
      'subscriptions': userSubscriptions?.map((e) => e.toMap()).toList(),
      'subscriptionGroups': subscriptionGroups?.map((e) => e.toMap()).toList(),
      'subscriptionGroupMembers': subscriptionGroupMembers?.map((e) => e.toMap()).toList(),
      'guestAccounts': guestAccounts?.map((e) => e.toMap()).toList(),
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

    var data = SettingsData.fromJson(content);

    var settings = data.settings;
    if (settings != null) {
      prefs.fromMap(settings);
    }

    var dataToImport = <String, List<ToMappable>>{};

    var searchSubscriptions = data.searchSubscriptions;
    if (searchSubscriptions != null) {
      dataToImport[tableSearchSubscription] = searchSubscriptions;
    }

    var userSubscriptions = data.userSubscriptions;
    if (userSubscriptions != null) {
      dataToImport[tableSubscription] = userSubscriptions;
    }

    var subscriptionGroups = data.subscriptionGroups;
    if (subscriptionGroups != null) {
      dataToImport[tableSubscriptionGroup] = subscriptionGroups;
    }

    var subscriptionGroupMembers = data.subscriptionGroupMembers;
    if (subscriptionGroupMembers != null) {
      dataToImport[tableSubscriptionGroupMember] = subscriptionGroupMembers;
    }

    var guestAccounts = data.guestAccounts;
    if (guestAccounts != null) {
      dataToImport[tableGuestAccount] = guestAccounts;
    }

    var tweets = data.tweets;
    if (tweets != null) {
      dataToImport[tableSavedTweet] = tweets;
    }

    await importModel.importData(dataToImport);
    if (guestAccounts != null) {
      await context.read<GuestAccountsModel>().deleteOldAccounts();
      await TwitterAccount.loadAllGuestAccountsAndRateLimits();
    }
    await groupModel.reloadGroups();
    await context.read<SubscriptionsModel>().reloadSubscriptions();
    await context.read<SubscriptionsModel>().refreshSubscriptionData();

    DataService().map['toggleKeepFeed'] = true;

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
            leading: const Icon(Icons.file_download_rounded),
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
            leading: const Icon(Icons.save),
            title: Text(L10n.of(context).export),
            subtitle: Text(L10n.of(context).export_your_data),
            onTap: () => Navigator.pushNamed(context, routeSettingsExport),
          ),
        ]),
      ),
    );
  }
}
