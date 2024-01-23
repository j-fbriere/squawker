import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:squawker/client_account.dart';
import 'package:squawker/database/entities.dart';
import 'package:squawker/generated/l10n.dart';
import 'package:squawker/group/group_model.dart';
import 'package:squawker/saved/saved_tweet_model.dart';
import 'package:squawker/settings/_data.dart';
import 'package:squawker/subscriptions/users_model.dart';
import 'package:intl/intl.dart';
import 'package:pref/pref.dart';
import 'package:provider/provider.dart';

class SettingsExportScreen extends StatefulWidget {
  const SettingsExportScreen({Key? key}) : super(key: key);

  @override
  State<SettingsExportScreen> createState() => _SettingsExportScreenState();
}

class _SettingsExportScreenState extends State<SettingsExportScreen> {
  bool _exportSettings = true;
  bool _exportSubscriptions = true;
  bool _exportSubscriptionGroups = true;
  bool _exportSubscriptionGroupMembers = true;
  bool _exportGuestAccounts = true;
  bool _exportTweets = false;

  void toggleExportSettings() {
    setState(() {
      _exportSettings = !_exportSettings;
    });
  }

  void toggleExportSubscriptions() {
    setState(() {
      _exportSubscriptions = !_exportSubscriptions;
    });

    toggleExportSubscriptionGroupMembersIfRequired();
  }

  void toggleExportSubscriptionGroups() {
    setState(() {
      _exportSubscriptionGroups = !_exportSubscriptionGroups;
    });

    toggleExportSubscriptionGroupMembersIfRequired();
  }

  void toggleExportSubscriptionGroupMembersIfRequired() {
    if (_exportSubscriptionGroupMembers && (!_exportSubscriptions || !_exportSubscriptionGroups)) {
      setState(() {
        _exportSubscriptionGroupMembers = false;
      });
    }
  }

  void toggleExportSubscriptionGroupMembers() {
    setState(() {
      _exportSubscriptionGroupMembers = !_exportSubscriptionGroupMembers;
    });
  }

  void toggleExportGuestAccounts() {
    setState(() {
      _exportGuestAccounts = !_exportGuestAccounts;
    });
  }

  void toggleExportTweets() {
    setState(() {
      _exportTweets = !_exportTweets;
    });
  }

  bool noExportOptionSelected() {
    return !(_exportSettings ||
        _exportSubscriptions ||
        _exportSubscriptionGroups ||
        _exportSubscriptionGroupMembers ||
        _exportGuestAccounts ||
        _exportTweets);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).export),
      ),
      floatingActionButton: noExportOptionSelected()
          ? null
          : FloatingActionButton(
              child: const Icon(Icons.save),
              onPressed: () async {
                var groupModel = context.read<GroupsModel>();
                await groupModel.reloadGroups();

                var subscriptionsModel = context.read<SubscriptionsModel>();
                await subscriptionsModel.reloadSubscriptions();

                var guestAccountsModel = context.read<GuestAccountsModel>();
                await guestAccountsModel.reloadGuestAccounts();

                var savedTweetModel = context.read<SavedTweetModel>();
                await savedTweetModel.listSavedTweets();

                var prefs = PrefService.of(context);

                // TODO: Check exporting
                var settings = _exportSettings ? prefs.toMap() : null;

                var subscriptions = _exportSubscriptions ? subscriptionsModel.state : null;

                var subscriptionGroups = _exportSubscriptionGroups ? groupModel.state : null;

                var subscriptionGroupMembers =
                    _exportSubscriptionGroupMembers ? await groupModel.listGroupMembers() : null;

                var guestAccounts = _exportGuestAccounts ? guestAccountsModel.state : null;

                var tweets = _exportTweets ? savedTweetModel.state : null;

                var data = SettingsData(
                    settings: settings,
                    searchSubscriptions: subscriptions?.whereType<SearchSubscription>().toList(),
                    userSubscriptions: subscriptions?.whereType<UserSubscription>().toList(),
                    subscriptionGroups: subscriptionGroups,
                    subscriptionGroupMembers: subscriptionGroupMembers,
                    guestAccounts: guestAccounts,
                    tweets: tweets);

                var exportData = jsonEncode(data.toJson());

                var dateFormat = DateFormat('yyyy-MM-dd');
                var fileName = 'squawker-${dateFormat.format(DateTime.now())}.json';

                // This platform can support the directory picker, so display it
                var path = await FlutterFileDialog.saveFile(
                    params:
                        SaveFileDialogParams(fileName: fileName, data: Uint8List.fromList(utf8.encode(exportData))));
                if (path != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        L10n.of(context).data_exported_to_fileName(fileName),
                      ),
                    ),
                  );
                }
              },
            ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: SingleChildScrollView(
                  child: Column(
            children: [
              CheckboxListTile(
                  value: _exportSettings,
                  title: Text(L10n.of(context).export_settings),
                  onChanged: (v) => toggleExportSettings()),
              CheckboxListTile(
                  value: _exportSubscriptions,
                  title: Text(L10n.of(context).export_subscriptions),
                  onChanged: (v) => toggleExportSubscriptions()),
              CheckboxListTile(
                  value: _exportSubscriptionGroups,
                  title: Text(L10n.of(context).export_subscription_groups),
                  onChanged: (v) => toggleExportSubscriptionGroups()),
              CheckboxListTile(
                  value: _exportSubscriptionGroupMembers,
                  title: Text(L10n.of(context).export_subscription_group_members),
                  onChanged: _exportSubscriptions && _exportSubscriptionGroups
                      ? (v) => toggleExportSubscriptionGroupMembers()
                      : null),
              CheckboxListTile(
                  value: _exportGuestAccounts,
                  title: Text(L10n.of(context).export_guest_accounts),
                  onChanged: (v) => toggleExportGuestAccounts()),
              CheckboxListTile(
                  value: _exportTweets,
                  title: Text(L10n.of(context).export_tweets),
                  onChanged: (v) => toggleExportTweets()),
            ],
          ))),
        ],
      ),
    );
  }
}
