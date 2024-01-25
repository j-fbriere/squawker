// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class L10n {
  L10n();

  static L10n? _current;

  static L10n get current {
    assert(_current != null,
        'No instance of L10n was loaded. Try to initialize the L10n delegate before accessing L10n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<L10n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = L10n();
      L10n._current = instance;

      return instance;
    });
  }

  static L10n of(BuildContext context) {
    final instance = L10n.maybeOf(context);
    assert(instance != null,
        'No instance of L10n present in the widget tree. Did you add L10n.delegate in localizationsDelegates?');
    return instance!;
  }

  static L10n? maybeOf(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  /// `This group contains no subscriptions!`
  String get this_group_contains_no_subscriptions {
    return Intl.message(
      'This group contains no subscriptions!',
      name: 'this_group_contains_no_subscriptions',
      desc: '',
      args: [],
    );
  }

  /// `Couldn't find any tweets by this user!`
  String get could_not_find_any_tweets_by_this_user {
    return Intl.message(
      'Couldn\'t find any tweets by this user!',
      name: 'could_not_find_any_tweets_by_this_user',
      desc: '',
      args: [],
    );
  }

  /// `Unable to load the next page of replies`
  String get unable_to_load_the_next_page_of_replies {
    return Intl.message(
      'Unable to load the next page of replies',
      name: 'unable_to_load_the_next_page_of_replies',
      desc: '',
      args: [],
    );
  }

  /// `Unable to load the tweet`
  String get unable_to_load_the_tweet {
    return Intl.message(
      'Unable to load the tweet',
      name: 'unable_to_load_the_tweet',
      desc: '',
      args: [],
    );
  }

  /// `Unable to load subscription groups`
  String get unable_to_load_subscription_groups {
    return Intl.message(
      'Unable to load subscription groups',
      name: 'unable_to_load_subscription_groups',
      desc: '',
      args: [],
    );
  }

  /// `Add to group`
  String get add_to_group {
    return Intl.message(
      'Add to group',
      name: 'add_to_group',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get select {
    return Intl.message(
      'Select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Unsubscribe`
  String get unsubscribe {
    return Intl.message(
      'Unsubscribe',
      name: 'unsubscribe',
      desc: '',
      args: [],
    );
  }

  /// `Subscribe`
  String get subscribe {
    return Intl.message(
      'Subscribe',
      name: 'subscribe',
      desc: '',
      args: [],
    );
  }

  /// `Reporting an error`
  String get reporting_an_error {
    return Intl.message(
      'Reporting an error',
      name: 'reporting_an_error',
      desc: '',
      args: [],
    );
  }

  /// `Something just went wrong in Squawker, and an error report has been generated. The report can be sent to the Squawker developers to help fix the problem.`
  String
      get something_just_went_wrong_in_fritter_and_an_error_report_has_been_generated {
    return Intl.message(
      'Something just went wrong in Squawker, and an error report has been generated. The report can be sent to the Squawker developers to help fix the problem.',
      name:
          'something_just_went_wrong_in_fritter_and_an_error_report_has_been_generated',
      desc: '',
      args: [],
    );
  }

  /// `Would you like to enable automatic error reporting?`
  String get would_you_like_to_enable_automatic_error_reporting {
    return Intl.message(
      'Would you like to enable automatic error reporting?',
      name: 'would_you_like_to_enable_automatic_error_reporting',
      desc: '',
      args: [],
    );
  }

  /// `Your report will be sent to Squawker's  project, and privacy details can be found at:`
  String get your_report_will_be_sent_to_fritter__project {
    return Intl.message(
      'Your report will be sent to Squawker\'s  project, and privacy details can be found at:',
      name: 'your_report_will_be_sent_to_fritter__project',
      desc: '',
      args: [],
    );
  }

  /// `Unable to load the next page of tweets`
  String get unable_to_load_the_next_page_of_tweets {
    return Intl.message(
      'Unable to load the next page of tweets',
      name: 'unable_to_load_the_next_page_of_tweets',
      desc: '',
      args: [],
    );
  }

  /// `Unable to load the tweets for the feed`
  String get unable_to_load_the_tweets_for_the_feed {
    return Intl.message(
      'Unable to load the tweets for the feed',
      name: 'unable_to_load_the_tweets_for_the_feed',
      desc: '',
      args: [],
    );
  }

  /// `Couldn't find any tweets from the last 7 days!`
  String get could_not_find_any_tweets_from_the_last_7_days {
    return Intl.message(
      'Couldn\'t find any tweets from the last 7 days!',
      name: 'could_not_find_any_tweets_from_the_last_7_days',
      desc: '',
      args: [],
    );
  }

  /// `Unable to load the group`
  String get unable_to_load_the_group {
    return Intl.message(
      'Unable to load the group',
      name: 'unable_to_load_the_group',
      desc: '',
      args: [],
    );
  }

  /// `Unable to load the group settings`
  String get unable_to_load_the_group_settings {
    return Intl.message(
      'Unable to load the group settings',
      name: 'unable_to_load_the_group_settings',
      desc: '',
      args: [],
    );
  }

  /// `Filters`
  String get filters {
    return Intl.message(
      'Filters',
      name: 'filters',
      desc: '',
      args: [],
    );
  }

  /// `Note: Due to a Twitter/X limitation, not all tweets may be included`
  String get note_due_to_a_twitter_limitation_not_all_tweets_may_be_included {
    return Intl.message(
      'Note: Due to a Twitter/X limitation, not all tweets may be included',
      name: 'note_due_to_a_twitter_limitation_not_all_tweets_may_be_included',
      desc: '',
      args: [],
    );
  }

  /// `Include replies`
  String get include_replies {
    return Intl.message(
      'Include replies',
      name: 'include_replies',
      desc: '',
      args: [],
    );
  }

  /// `Include retweets`
  String get include_retweets {
    return Intl.message(
      'Include retweets',
      name: 'include_retweets',
      desc: '',
      args: [],
    );
  }

  /// `Unable to find your saved tweets.`
  String get unable_to_find_your_saved_tweets {
    return Intl.message(
      'Unable to find your saved tweets.',
      name: 'unable_to_find_your_saved_tweets',
      desc: '',
      args: [],
    );
  }

  /// `You haven't saved any tweets yet!`
  String get you_have_not_saved_any_tweets_yet {
    return Intl.message(
      'You haven\'t saved any tweets yet!',
      name: 'you_have_not_saved_any_tweets_yet',
      desc: '',
      args: [],
    );
  }

  /// `Unable to load the search results.`
  String get unable_to_load_the_search_results {
    return Intl.message(
      'Unable to load the search results.',
      name: 'unable_to_load_the_search_results',
      desc: '',
      args: [],
    );
  }

  /// `No results`
  String get no_results {
    return Intl.message(
      'No results',
      name: 'no_results',
      desc: '',
      args: [],
    );
  }

  /// `Feed`
  String get feed {
    return Intl.message(
      'Feed',
      name: 'feed',
      desc: '',
      args: [],
    );
  }

  /// `Subscriptions`
  String get subscriptions {
    return Intl.message(
      'Subscriptions',
      name: 'subscriptions',
      desc: '',
      args: [],
    );
  }

  /// `Trending`
  String get trending {
    return Intl.message(
      'Trending',
      name: 'trending',
      desc: '',
      args: [],
    );
  }

  /// `Saved`
  String get saved {
    return Intl.message(
      'Saved',
      name: 'saved',
      desc: '',
      args: [],
    );
  }

  /// `Unable to load the list of follows`
  String get unable_to_load_the_list_of_follows {
    return Intl.message(
      'Unable to load the list of follows',
      name: 'unable_to_load_the_list_of_follows',
      desc: '',
      args: [],
    );
  }

  /// `Unable to load the next page of follows`
  String get unable_to_load_the_next_page_of_follows {
    return Intl.message(
      'Unable to load the next page of follows',
      name: 'unable_to_load_the_next_page_of_follows',
      desc: '',
      args: [],
    );
  }

  /// `This user does not follow anyone!`
  String get this_user_does_not_follow_anyone {
    return Intl.message(
      'This user does not follow anyone!',
      name: 'this_user_does_not_follow_anyone',
      desc: '',
      args: [],
    );
  }

  /// `This user does not have anyone following them!`
  String get this_user_does_not_have_anyone_following_them {
    return Intl.message(
      'This user does not have anyone following them!',
      name: 'this_user_does_not_have_anyone_following_them',
      desc: '',
      args: [],
    );
  }

  /// `Unable to load the tweets`
  String get unable_to_load_the_tweets {
    return Intl.message(
      'Unable to load the tweets',
      name: 'unable_to_load_the_tweets',
      desc: '',
      args: [],
    );
  }

  /// `Unable to load the profile`
  String get unable_to_load_the_profile {
    return Intl.message(
      'Unable to load the profile',
      name: 'unable_to_load_the_profile',
      desc: '',
      args: [],
    );
  }

  /// `Tweets`
  String get tweets {
    return Intl.message(
      'Tweets',
      name: 'tweets',
      desc: '',
      args: [],
    );
  }

  /// `Tweets & Replies`
  String get tweets_and_replies {
    return Intl.message(
      'Tweets & Replies',
      name: 'tweets_and_replies',
      desc: '',
      args: [],
    );
  }

  /// `Media`
  String get media {
    return Intl.message(
      'Media',
      name: 'media',
      desc: '',
      args: [],
    );
  }

  /// `Following`
  String get following {
    return Intl.message(
      'Following',
      name: 'following',
      desc: '',
      args: [],
    );
  }

  /// `Followers`
  String get followers {
    return Intl.message(
      'Followers',
      name: 'followers',
      desc: '',
      args: [],
    );
  }

  /// `Joined {date}`
  String joined(Object date) {
    return Intl.message(
      'Joined $date',
      name: 'joined',
      desc: '',
      args: [date],
    );
  }

  /// `Export`
  String get export {
    return Intl.message(
      'Export',
      name: 'export',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Data exported to {fullPath}`
  String data_exported_to_fullPath(Object fullPath) {
    return Intl.message(
      'Data exported to $fullPath',
      name: 'data_exported_to_fullPath',
      desc: '',
      args: [fullPath],
    );
  }

  /// `Data exported to {fileName}`
  String data_exported_to_fileName(Object fileName) {
    return Intl.message(
      'Data exported to $fileName',
      name: 'data_exported_to_fileName',
      desc: '',
      args: [fileName],
    );
  }

  /// `Export settings?`
  String get export_settings {
    return Intl.message(
      'Export settings?',
      name: 'export_settings',
      desc: '',
      args: [],
    );
  }

  /// `Export subscriptions?`
  String get export_subscriptions {
    return Intl.message(
      'Export subscriptions?',
      name: 'export_subscriptions',
      desc: '',
      args: [],
    );
  }

  /// `Export subscription groups?`
  String get export_subscription_groups {
    return Intl.message(
      'Export subscription groups?',
      name: 'export_subscription_groups',
      desc: '',
      args: [],
    );
  }

  /// `Export subscription group members?`
  String get export_subscription_group_members {
    return Intl.message(
      'Export subscription group members?',
      name: 'export_subscription_group_members',
      desc: '',
      args: [],
    );
  }

  /// `Export guest accounts?`
  String get export_guest_accounts {
    return Intl.message(
      'Export guest accounts?',
      name: 'export_guest_accounts',
      desc: '',
      args: [],
    );
  }

  /// `Export tweets?`
  String get export_tweets {
    return Intl.message(
      'Export tweets?',
      name: 'export_tweets',
      desc: '',
      args: [],
    );
  }

  /// `Data imported successfully`
  String get data_imported_successfully {
    return Intl.message(
      'Data imported successfully',
      name: 'data_imported_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Thanks for helping Squawker! 💖`
  String get thanks_for_helping_fritter {
    return Intl.message(
      'Thanks for helping Squawker! 💖',
      name: 'thanks_for_helping_fritter',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get general {
    return Intl.message(
      'General',
      name: 'general',
      desc: '',
      args: [],
    );
  }

  /// `Default tab`
  String get default_tab {
    return Intl.message(
      'Default tab',
      name: 'default_tab',
      desc: '',
      args: [],
    );
  }

  /// `App Info`
  String get app_info {
    return Intl.message(
      'App Info',
      name: 'app_info',
      desc: '',
      args: [],
    );
  }

  /// `Which tab is shown when the app opens`
  String get which_tab_is_shown_when_the_app_opens {
    return Intl.message(
      'Which tab is shown when the app opens',
      name: 'which_tab_is_shown_when_the_app_opens',
      desc: '',
      args: [],
    );
  }

  /// `Media size`
  String get media_size {
    return Intl.message(
      'Media size',
      name: 'media_size',
      desc: '',
      args: [],
    );
  }

  /// `Save bandwidth with smaller images`
  String get save_bandwidth_using_smaller_images {
    return Intl.message(
      'Save bandwidth with smaller images',
      name: 'save_bandwidth_using_smaller_images',
      desc: '',
      args: [],
    );
  }

  /// `Disabled`
  String get disabled {
    return Intl.message(
      'Disabled',
      name: 'disabled',
      desc: '',
      args: [],
    );
  }

  /// `Thumbnail`
  String get thumbnail {
    return Intl.message(
      'Thumbnail',
      name: 'thumbnail',
      desc: '',
      args: [],
    );
  }

  /// `Small`
  String get small {
    return Intl.message(
      'Small',
      name: 'small',
      desc: '',
      args: [],
    );
  }

  /// `Medium`
  String get medium {
    return Intl.message(
      'Medium',
      name: 'medium',
      desc: '',
      args: [],
    );
  }

  /// `Large`
  String get large {
    return Intl.message(
      'Large',
      name: 'large',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Theme Mode`
  String get theme_mode {
    return Intl.message(
      'Theme Mode',
      name: 'theme_mode',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get system {
    return Intl.message(
      'System',
      name: 'system',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `True Black?`
  String get true_black {
    return Intl.message(
      'True Black?',
      name: 'true_black',
      desc: '',
      args: [],
    );
  }

  /// `Use true black for the dark mode theme`
  String get use_true_black_for_the_dark_mode_theme {
    return Intl.message(
      'Use true black for the dark mode theme',
      name: 'use_true_black_for_the_dark_mode_theme',
      desc: '',
      args: [],
    );
  }

  /// `Material 3?`
  String get material_3 {
    return Intl.message(
      'Material 3?',
      name: 'material_3',
      desc: '',
      args: [],
    );
  }

  /// `BETA`
  String get beta {
    return Intl.message(
      'BETA',
      name: 'beta',
      desc: '',
      args: [],
    );
  }

  /// `Data`
  String get data {
    return Intl.message(
      'Data',
      name: 'data',
      desc: '',
      args: [],
    );
  }

  /// `Import`
  String get import {
    return Intl.message(
      'Import',
      name: 'import',
      desc: '',
      args: [],
    );
  }

  /// `Import data from another device`
  String get import_data_from_another_device {
    return Intl.message(
      'Import data from another device',
      name: 'import_data_from_another_device',
      desc: '',
      args: [],
    );
  }

  /// `Legacy Android Import`
  String get legacy_android_import {
    return Intl.message(
      'Legacy Android Import',
      name: 'legacy_android_import',
      desc: '',
      args: [],
    );
  }

  /// `The file does not exist. Please ensure it is located at {filePath}`
  String the_file_does_not_exist_please_ensure_it_is_located_at_file_path(
      Object filePath) {
    return Intl.message(
      'The file does not exist. Please ensure it is located at $filePath',
      name: 'the_file_does_not_exist_please_ensure_it_is_located_at_file_path',
      desc: '',
      args: [filePath],
    );
  }

  /// `prefix`
  String get prefix {
    return Intl.message(
      'prefix',
      name: 'prefix',
      desc: '',
      args: [],
    );
  }

  /// `Please make sure the data you wish to import is located there, then press the import button below.`
  String
      get please_make_sure_the_data_you_wish_to_import_is_located_there_then_press_the_import_button_below {
    return Intl.message(
      'Please make sure the data you wish to import is located there, then press the import button below.',
      name:
          'please_make_sure_the_data_you_wish_to_import_is_located_there_then_press_the_import_button_below',
      desc: '',
      args: [],
    );
  }

  /// `Export your data`
  String get export_your_data {
    return Intl.message(
      'Export your data',
      name: 'export_your_data',
      desc: '',
      args: [],
    );
  }

  /// `Logging`
  String get logging {
    return Intl.message(
      'Logging',
      name: 'logging',
      desc: '',
      args: [],
    );
  }

  /// `Enable ?`
  String get enable_ {
    return Intl.message(
      'Enable ?',
      name: 'enable_',
      desc: '',
      args: [],
    );
  }

  /// `Activate non-confirmation bias mode`
  String get activate_non_confirmation_bias_mode_label {
    return Intl.message(
      'Activate non-confirmation bias mode',
      name: 'activate_non_confirmation_bias_mode_label',
      desc: '',
      args: [],
    );
  }

  /// `Hide tweet authors. Avoid confirmation bias based on authoritative arguments.`
  String get activate_non_confirmation_bias_mode_description {
    return Intl.message(
      'Hide tweet authors. Avoid confirmation bias based on authoritative arguments.',
      name: 'activate_non_confirmation_bias_mode_description',
      desc: '',
      args: [],
    );
  }

  /// `Whether errors should be reported to `
  String get whether_errors_should_be_reported_to_ {
    return Intl.message(
      'Whether errors should be reported to ',
      name: 'whether_errors_should_be_reported_to_',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Copied version to clipboard`
  String get copied_version_to_clipboard {
    return Intl.message(
      'Copied version to clipboard',
      name: 'copied_version_to_clipboard',
      desc: '',
      args: [],
    );
  }

  /// `Contribute`
  String get contribute {
    return Intl.message(
      'Contribute',
      name: 'contribute',
      desc: '',
      args: [],
    );
  }

  /// `Help make Squawker even better`
  String get help_make_fritter_even_better {
    return Intl.message(
      'Help make Squawker even better',
      name: 'help_make_fritter_even_better',
      desc: '',
      args: [],
    );
  }

  /// `Report a bug`
  String get report_a_bug {
    return Intl.message(
      'Report a bug',
      name: 'report_a_bug',
      desc: '',
      args: [],
    );
  }

  /// `Let the developers know if something's broken`
  String get let_the_developers_know_if_something_is_broken {
    return Intl.message(
      'Let the developers know if something\'s broken',
      name: 'let_the_developers_know_if_something_is_broken',
      desc: '',
      args: [],
    );
  }

  /// `Donate`
  String get donate {
    return Intl.message(
      'Donate',
      name: 'donate',
      desc: '',
      args: [],
    );
  }

  /// `Help support Squawker's future`
  String get help_support_fritters_future {
    return Intl.message(
      'Help support Squawker\'s future',
      name: 'help_support_fritters_future',
      desc: '',
      args: [],
    );
  }

  /// `Copied address to clipboard`
  String get copied_address_to_clipboard {
    return Intl.message(
      'Copied address to clipboard',
      name: 'copied_address_to_clipboard',
      desc: '',
      args: [],
    );
  }

  /// `Licenses`
  String get licenses {
    return Intl.message(
      'Licenses',
      name: 'licenses',
      desc: '',
      args: [],
    );
  }

  /// `All the great software used by Squawker`
  String get all_the_great_software_used_by_fritter {
    return Intl.message(
      'All the great software used by Squawker',
      name: 'all_the_great_software_used_by_fritter',
      desc: '',
      args: [],
    );
  }

  /// `Squawker`
  String get fritter {
    return Intl.message(
      'Squawker',
      name: 'fritter',
      desc: '',
      args: [],
    );
  }

  /// `Released under the MIT License`
  String get released_under_the_mit_license {
    return Intl.message(
      'Released under the MIT License',
      name: 'released_under_the_mit_license',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get newTrans {
    return Intl.message(
      'New',
      name: 'newTrans',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Yes, please`
  String get yes_please {
    return Intl.message(
      'Yes, please',
      name: 'yes_please',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?`
  String get are_you_sure {
    return Intl.message(
      'Are you sure?',
      name: 'are_you_sure',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete the subscription group {name}?`
  String are_you_sure_you_want_to_delete_the_subscription_group_name_of_group(
      Object name) {
    return Intl.message(
      'Are you sure you want to delete the subscription group $name?',
      name:
          'are_you_sure_you_want_to_delete_the_subscription_group_name_of_group',
      desc: '',
      args: [name],
    );
  }

  /// `Toggle All`
  String get toggle_all {
    return Intl.message(
      'Toggle All',
      name: 'toggle_all',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a name`
  String get please_enter_a_name {
    return Intl.message(
      'Please enter a name',
      name: 'please_enter_a_name',
      desc: '',
      args: [],
    );
  }

  /// `Pick a color!`
  String get pick_a_color {
    return Intl.message(
      'Pick a color!',
      name: 'pick_a_color',
      desc: '',
      args: [],
    );
  }

  /// `Pick an icon!`
  String get pick_an_icon {
    return Intl.message(
      'Pick an icon!',
      name: 'pick_an_icon',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `No results for:`
  String get no_results_for {
    return Intl.message(
      'No results for:',
      name: 'no_results_for',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Import subscriptions`
  String get import_subscriptions {
    return Intl.message(
      'Import subscriptions',
      name: 'import_subscriptions',
      desc: '',
      args: [],
    );
  }

  /// `To import subscriptions from an existing Twitter/X account, enter your username below.`
  String
      get to_import_subscriptions_from_an_existing_twitter_account_enter_your_username_below {
    return Intl.message(
      'To import subscriptions from an existing Twitter/X account, enter your username below.',
      name:
          'to_import_subscriptions_from_an_existing_twitter_account_enter_your_username_below',
      desc: '',
      args: [],
    );
  }

  /// `Please note that the method Squawker uses to import subscriptions is heavily rate-limited by Twitter/X, so this may fail if you have a lot of followed accounts.`
  String
      get please_note_that_the_method_fritter_uses_to_import_subscriptions_is_heavily_rate_limited_by_twitter_so_this_may_fail_if_you_have_a_lot_of_followed_accounts {
    return Intl.message(
      'Please note that the method Squawker uses to import subscriptions is heavily rate-limited by Twitter/X, so this may fail if you have a lot of followed accounts.',
      name:
          'please_note_that_the_method_fritter_uses_to_import_subscriptions_is_heavily_rate_limited_by_twitter_so_this_may_fail_if_you_have_a_lot_of_followed_accounts',
      desc: '',
      args: [],
    );
  }

  /// `If you have any feedback on this feature, please leave it on`
  String get if_you_have_any_feedback_on_this_feature_please_leave_it_on {
    return Intl.message(
      'If you have any feedback on this feature, please leave it on',
      name: 'if_you_have_any_feedback_on_this_feature_please_leave_it_on',
      desc: '',
      args: [],
    );
  }

  /// `the GitHub issue (#143)`
  String get the_github_issue {
    return Intl.message(
      'the GitHub issue (#143)',
      name: 'the_github_issue',
      desc: '',
      args: [],
    );
  }

  /// `Selecting individual accounts to import, and assigning groups are both planned for the future already!`
  String
      get selecting_individual_accounts_to_import_and_assigning_groups_are_both_planned_for_the_future_already {
    return Intl.message(
      'Selecting individual accounts to import, and assigning groups are both planned for the future already!',
      name:
          'selecting_individual_accounts_to_import_and_assigning_groups_are_both_planned_for_the_future_already',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Twitter/X username`
  String get enter_your_twitter_username {
    return Intl.message(
      'Enter your Twitter/X username',
      name: 'enter_your_twitter_username',
      desc: '',
      args: [],
    );
  }

  /// `Your profile must be public, otherwise the import will not work`
  String get your_profile_must_be_public_otherwise_the_import_will_not_work {
    return Intl.message(
      'Your profile must be public, otherwise the import will not work',
      name: 'your_profile_must_be_public_otherwise_the_import_will_not_work',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Unable to import`
  String get unable_to_import {
    return Intl.message(
      'Unable to import',
      name: 'unable_to_import',
      desc: '',
      args: [],
    );
  }

  /// `{snapshotData} users imported so far`
  String imported_snapshot_data_users_so_far(Object snapshotData) {
    return Intl.message(
      '$snapshotData users imported so far',
      name: 'imported_snapshot_data_users_so_far',
      desc: '',
      args: [snapshotData],
    );
  }

  /// `Finished with {snapshotData} users`
  String finished_with_snapshotData_users(Object snapshotData) {
    return Intl.message(
      'Finished with $snapshotData users',
      name: 'finished_with_snapshotData_users',
      desc: '',
      args: [snapshotData],
    );
  }

  /// `No subscriptions. Try searching or importing some!`
  String get no_subscriptions_try_searching_or_importing_some {
    return Intl.message(
      'No subscriptions. Try searching or importing some!',
      name: 'no_subscriptions_try_searching_or_importing_some',
      desc: '',
      args: [],
    );
  }

  /// `Import from Twitter/X`
  String get import_from_twitter {
    return Intl.message(
      'Import from Twitter/X',
      name: 'import_from_twitter',
      desc: '',
      args: [],
    );
  }

  /// `Unable to refresh the subscriptions`
  String get unable_to_refresh_the_subscriptions {
    return Intl.message(
      'Unable to refresh the subscriptions',
      name: 'unable_to_refresh_the_subscriptions',
      desc: '',
      args: [],
    );
  }

  /// `Groups`
  String get groups {
    return Intl.message(
      'Groups',
      name: 'groups',
      desc: '',
      args: [],
    );
  }

  /// `Date Created`
  String get date_created {
    return Intl.message(
      'Date Created',
      name: 'date_created',
      desc: '',
      args: [],
    );
  }

  /// `Date Subscribed`
  String get date_subscribed {
    return Intl.message(
      'Date Subscribed',
      name: 'date_subscribed',
      desc: '',
      args: [],
    );
  }

  /// `Unable to load the trends for {widgetPlaceName}`
  String unable_to_load_the_trends_for_widget_place_name(
      Object widgetPlaceName) {
    return Intl.message(
      'Unable to load the trends for $widgetPlaceName',
      name: 'unable_to_load_the_trends_for_widget_place_name',
      desc: '',
      args: [widgetPlaceName],
    );
  }

  /// `There were no trends returned. This is unexpected! Please report as a bug, if possible.`
  String
      get there_were_no_trends_returned_this_is_unexpected_please_report_as_a_bug_if_possible {
    return Intl.message(
      'There were no trends returned. This is unexpected! Please report as a bug, if possible.',
      name:
          'there_were_no_trends_returned_this_is_unexpected_please_report_as_a_bug_if_possible',
      desc: '',
      args: [],
    );
  }

  /// `Unable to find the available trend locations.`
  String get unable_to_find_the_available_trend_locations {
    return Intl.message(
      'Unable to find the available trend locations.',
      name: 'unable_to_find_the_available_trend_locations',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Unable to stream the trend location preference`
  String get unable_to_stream_the_trend_location_preference {
    return Intl.message(
      'Unable to stream the trend location preference',
      name: 'unable_to_stream_the_trend_location_preference',
      desc: '',
      args: [],
    );
  }

  /// `Trends`
  String get trends {
    return Intl.message(
      'Trends',
      name: 'trends',
      desc: '',
      args: [],
    );
  }

  /// `{num, plural, zero{no tweets} one{one tweet} two{two tweets} few{{numFormatted} tweets} many{{numFormatted} tweet} other{{numFormatted} tweets}}`
  String tweets_number(num num, Object numFormatted) {
    return Intl.plural(
      num,
      zero: 'no tweets',
      one: 'one tweet',
      two: 'two tweets',
      few: '$numFormatted tweets',
      many: '$numFormatted tweet',
      other: '$numFormatted tweets',
      name: 'tweets_number',
      desc: '',
      args: [num, numFormatted],
    );
  }

  /// `Ended {timeagoFormat}`
  String ended_timeago_format_endsAt_allowFromNow_true(Object timeagoFormat) {
    return Intl.message(
      'Ended $timeagoFormat',
      name: 'ended_timeago_format_endsAt_allowFromNow_true',
      desc: '',
      args: [timeagoFormat],
    );
  }

  /// `Ends {timeagoFormat}`
  String ends_timeago_format_endsAt_allowFromNow_true(Object timeagoFormat) {
    return Intl.message(
      'Ends $timeagoFormat',
      name: 'ends_timeago_format_endsAt_allowFromNow_true',
      desc: '',
      args: [timeagoFormat],
    );
  }

  /// `{num, plural, zero{No votes} one{One vote} two{Two votes} few{{numFormatted} votes} many{{numFormatted} vote} other{{numFormatted} votes}}`
  String numberFormat_format_total_votes(num num, Object numFormatted) {
    return Intl.plural(
      num,
      zero: 'No votes',
      one: 'One vote',
      two: 'Two votes',
      few: '$numFormatted votes',
      many: '$numFormatted vote',
      other: '$numFormatted votes',
      name: 'numberFormat_format_total_votes',
      desc: '',
      args: [num, numFormatted],
    );
  }

  /// `Tap to show {getMediaType}`
  String tap_to_show_getMediaType_item_type(Object getMediaType) {
    return Intl.message(
      'Tap to show $getMediaType',
      name: 'tap_to_show_getMediaType_item_type',
      desc: '',
      args: [getMediaType],
    );
  }

  /// `Unable to save the media. Twitter/X returned a status of {responseStatusCode}`
  String
      unable_to_save_the_media_twitter_returned_a_status_of_response_statusCode(
          Object responseStatusCode) {
    return Intl.message(
      'Unable to save the media. Twitter/X returned a status of $responseStatusCode',
      name:
          'unable_to_save_the_media_twitter_returned_a_status_of_response_statusCode',
      desc: '',
      args: [responseStatusCode],
    );
  }

  /// `Downloading media...`
  String get downloading_media {
    return Intl.message(
      'Downloading media...',
      name: 'downloading_media',
      desc: '',
      args: [],
    );
  }

  /// `Unable to download. This media may only be available as a stream, which Squawker cannot yet download.`
  String get download_media_no_url {
    return Intl.message(
      'Unable to download. This media may only be available as a stream, which Squawker cannot yet download.',
      name: 'download_media_no_url',
      desc: '',
      args: [],
    );
  }

  /// `Saved the media!`
  String get successfully_saved_the_media {
    return Intl.message(
      'Saved the media!',
      name: 'successfully_saved_the_media',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get unknown {
    return Intl.message(
      'Unknown',
      name: 'unknown',
      desc: '',
      args: [],
    );
  }

  /// `Playback speed`
  String get playback_speed {
    return Intl.message(
      'Playback speed',
      name: 'playback_speed',
      desc: '',
      args: [],
    );
  }

  /// `Subtitles`
  String get subtitles {
    return Intl.message(
      'Subtitles',
      name: 'subtitles',
      desc: '',
      args: [],
    );
  }

  /// `LIVE`
  String get live {
    return Intl.message(
      'LIVE',
      name: 'live',
      desc: '',
      args: [],
    );
  }

  /// `Download`
  String get download {
    return Intl.message(
      'Download',
      name: 'download',
      desc: '',
      args: [],
    );
  }

  /// `{thisTweetUserName} retweeted {timeAgo}`
  String this_tweet_user_name_retweeted(
      Object thisTweetUserName, Object timeAgo) {
    return Intl.message(
      '$thisTweetUserName retweeted $timeAgo',
      name: 'this_tweet_user_name_retweeted',
      desc: '',
      args: [thisTweetUserName, timeAgo],
    );
  }

  /// `Sorry, the replied tweet could not be found!`
  String get sorry_the_replied_tweet_could_not_be_found {
    return Intl.message(
      'Sorry, the replied tweet could not be found!',
      name: 'sorry_the_replied_tweet_could_not_be_found',
      desc: '',
      args: [],
    );
  }

  /// `Replying to`
  String get replying_to {
    return Intl.message(
      'Replying to',
      name: 'replying_to',
      desc: '',
      args: [],
    );
  }

  /// `The tweet did not contain any text. This is unexpected`
  String get the_tweet_did_not_contain_any_text_this_is_unexpected {
    return Intl.message(
      'The tweet did not contain any text. This is unexpected',
      name: 'the_tweet_did_not_contain_any_text_this_is_unexpected',
      desc: '',
      args: [],
    );
  }

  /// `This tweet is unavailable. It was probably deleted.`
  String get this_tweet_is_unavailable {
    return Intl.message(
      'This tweet is unavailable. It was probably deleted.',
      name: 'this_tweet_is_unavailable',
      desc: '',
      args: [],
    );
  }

  /// `Pinned tweet`
  String get pinned_tweet {
    return Intl.message(
      'Pinned tweet',
      name: 'pinned_tweet',
      desc: '',
      args: [],
    );
  }

  /// `Thread`
  String get thread {
    return Intl.message(
      'Thread',
      name: 'thread',
      desc: '',
      args: [],
    );
  }

  /// `Unsave`
  String get unsave {
    return Intl.message(
      'Unsave',
      name: 'unsave',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Share tweet content`
  String get share_tweet_content {
    return Intl.message(
      'Share tweet content',
      name: 'share_tweet_content',
      desc: '',
      args: [],
    );
  }

  /// `Share tweet link`
  String get share_tweet_link {
    return Intl.message(
      'Share tweet link',
      name: 'share_tweet_link',
      desc: '',
      args: [],
    );
  }

  /// `Share tweet content and link`
  String get share_tweet_content_and_link {
    return Intl.message(
      'Share tweet content and link',
      name: 'share_tweet_content_and_link',
      desc: '',
      args: [],
    );
  }

  /// `Private profile`
  String get private_profile {
    return Intl.message(
      'Private profile',
      name: 'private_profile',
      desc: '',
      args: [],
    );
  }

  /// `Twitter/X says the page does not exist, but that may not be true`
  String get page_not_found {
    return Intl.message(
      'Twitter/X says the page does not exist, but that may not be true',
      name: 'page_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Twitter/X says access to this is forbidden`
  String get forbidden {
    return Intl.message(
      'Twitter/X says access to this is forbidden',
      name: 'forbidden',
      desc: '',
      args: [],
    );
  }

  /// `Twitter/X has invalidated our access token. Please try re-opening Squawker!`
  String get bad_guest_token {
    return Intl.message(
      'Twitter/X has invalidated our access token. Please try re-opening Squawker!',
      name: 'bad_guest_token',
      desc: '',
      args: [],
    );
  }

  /// `User not found`
  String get user_not_found {
    return Intl.message(
      'User not found',
      name: 'user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Account suspended`
  String get account_suspended {
    return Intl.message(
      'Account suspended',
      name: 'account_suspended',
      desc: '',
      args: [],
    );
  }

  /// `Catastrophic failure`
  String get catastrophic_failure {
    return Intl.message(
      'Catastrophic failure',
      name: 'catastrophic_failure',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Finish`
  String get finish {
    return Intl.message(
      'Finish',
      name: 'finish',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Could not contact Twitter/X`
  String get could_not_contact_twitter {
    return Intl.message(
      'Could not contact Twitter/X',
      name: 'could_not_contact_twitter',
      desc: '',
      args: [],
    );
  }

  /// `Please check your Internet connection.\n\n{errorMessage}`
  String please_check_your_internet_connection_error_message(
      Object errorMessage) {
    return Intl.message(
      'Please check your Internet connection.\n\n$errorMessage',
      name: 'please_check_your_internet_connection_error_message',
      desc: '',
      args: [errorMessage],
    );
  }

  /// `Timed out`
  String get timed_out {
    return Intl.message(
      'Timed out',
      name: 'timed_out',
      desc: '',
      args: [],
    );
  }

  /// `This took too long to load. Please check your network connection!`
  String get this_took_too_long_to_load_please_check_your_network_connection {
    return Intl.message(
      'This took too long to load. Please check your network connection!',
      name: 'this_took_too_long_to_load_please_check_your_network_connection',
      desc: '',
      args: [],
    );
  }

  /// `Oops! Something went wrong 🥲`
  String get oops_something_went_wrong {
    return Intl.message(
      'Oops! Something went wrong 🥲',
      name: 'oops_something_went_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Report`
  String get report {
    return Intl.message(
      'Report',
      name: 'report',
      desc: '',
      args: [],
    );
  }

  /// `No data was returned, which should never happen. Please report a bug, if possible!`
  String
      get no_data_was_returned_which_should_never_happen_please_report_a_bug_if_possible {
    return Intl.message(
      'No data was returned, which should never happen. Please report a bug, if possible!',
      name:
          'no_data_was_returned_which_should_never_happen_please_report_a_bug_if_possible',
      desc: '',
      args: [],
    );
  }

  /// `Updates`
  String get updates {
    return Intl.message(
      'Updates',
      name: 'updates',
      desc: '',
      args: [],
    );
  }

  /// `When a new app update is available`
  String get when_a_new_app_update_is_available {
    return Intl.message(
      'When a new app update is available',
      name: 'when_a_new_app_update_is_available',
      desc: '',
      args: [],
    );
  }

  /// `An update for Squawker is available! 🚀`
  String get an_update_for_fritter_is_available {
    return Intl.message(
      'An update for Squawker is available! 🚀',
      name: 'an_update_for_fritter_is_available',
      desc: '',
      args: [],
    );
  }

  /// `Tap to download {releaseVersion}`
  String tap_to_download_release_version(Object releaseVersion) {
    return Intl.message(
      'Tap to download $releaseVersion',
      name: 'tap_to_download_release_version',
      desc: '',
      args: [releaseVersion],
    );
  }

  /// `Update to {releaseVersion} through your F-Droid client`
  String update_to_release_version_through_your_fdroid_client(
      Object releaseVersion) {
    return Intl.message(
      'Update to $releaseVersion through your F-Droid client',
      name: 'update_to_release_version_through_your_fdroid_client',
      desc: '',
      args: [releaseVersion],
    );
  }

  /// `Squawker blue`
  String get fritter_blue {
    return Intl.message(
      'Squawker blue',
      name: 'fritter_blue',
      desc: '',
      args: [],
    );
  }

  /// `Blue theme based on the Twitter/X color scheme`
  String get blue_theme_based_on_the_twitter_color_scheme {
    return Intl.message(
      'Blue theme based on the Twitter/X color scheme',
      name: 'blue_theme_based_on_the_twitter_color_scheme',
      desc: '',
      args: [],
    );
  }

  /// `Something broke in Squawker.`
  String get something_broke_in_fritter {
    return Intl.message(
      'Something broke in Squawker.',
      name: 'something_broke_in_fritter',
      desc: '',
      args: [],
    );
  }

  /// `Unable to run the database migrations`
  String get unable_to_run_the_database_migrations {
    return Intl.message(
      'Unable to run the database migrations',
      name: 'unable_to_run_the_database_migrations',
      desc: '',
      args: [],
    );
  }

  /// `Check for updates`
  String get should_check_for_updates_label {
    return Intl.message(
      'Check for updates',
      name: 'should_check_for_updates_label',
      desc: '',
      args: [],
    );
  }

  /// `Check for updates when Squawker starts`
  String get should_check_for_updates_description {
    return Intl.message(
      'Check for updates when Squawker starts',
      name: 'should_check_for_updates_description',
      desc: '',
      args: [],
    );
  }

  /// `Download handling`
  String get download_handling {
    return Intl.message(
      'Download handling',
      name: 'download_handling',
      desc: '',
      args: [],
    );
  }

  /// `How downloading should work`
  String get download_handling_description {
    return Intl.message(
      'How downloading should work',
      name: 'download_handling_description',
      desc: '',
      args: [],
    );
  }

  /// `Always ask`
  String get download_handling_type_ask {
    return Intl.message(
      'Always ask',
      name: 'download_handling_type_ask',
      desc: '',
      args: [],
    );
  }

  /// `Save to directory`
  String get download_handling_type_directory {
    return Intl.message(
      'Save to directory',
      name: 'download_handling_type_directory',
      desc: '',
      args: [],
    );
  }

  /// `Download path`
  String get download_path {
    return Intl.message(
      'Download path',
      name: 'download_path',
      desc: '',
      args: [],
    );
  }

  /// `Permission not granted. Please try again after granting!`
  String get permission_not_granted {
    return Intl.message(
      'Permission not granted. Please try again after granting!',
      name: 'permission_not_granted',
      desc: '',
      args: [],
    );
  }

  /// `Open app settings`
  String get open_app_settings {
    return Intl.message(
      'Open app settings',
      name: 'open_app_settings',
      desc: '',
      args: [],
    );
  }

  /// `Open in browser`
  String get open_in_browser {
    return Intl.message(
      'Open in browser',
      name: 'open_in_browser',
      desc: '',
      args: [],
    );
  }

  /// `Choose`
  String get choose {
    return Intl.message(
      'Choose',
      name: 'choose',
      desc: '',
      args: [],
    );
  }

  /// `Not set`
  String get not_set {
    return Intl.message(
      'Not set',
      name: 'not_set',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Requires a restart`
  String get language_subtitle {
    return Intl.message(
      'Requires a restart',
      name: 'language_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Hide sensitive tweets`
  String get hide_sensitive_tweets {
    return Intl.message(
      'Hide sensitive tweets',
      name: 'hide_sensitive_tweets',
      desc: '',
      args: [],
    );
  }

  /// `Whether to hide tweets marked as sensitive`
  String get whether_to_hide_tweets_marked_as_sensitive {
    return Intl.message(
      'Whether to hide tweets marked as sensitive',
      name: 'whether_to_hide_tweets_marked_as_sensitive',
      desc: '',
      args: [],
    );
  }

  /// `Disable screenshots`
  String get disable_screenshots {
    return Intl.message(
      'Disable screenshots',
      name: 'disable_screenshots',
      desc: '',
      args: [],
    );
  }

  /// `Prevent screenshots from being taken. This may not work on all devices.`
  String get disable_screenshots_hint {
    return Intl.message(
      'Prevent screenshots from being taken. This may not work on all devices.',
      name: 'disable_screenshots_hint',
      desc: '',
      args: [],
    );
  }

  /// `Potentially sensitive`
  String get possibly_sensitive {
    return Intl.message(
      'Potentially sensitive',
      name: 'possibly_sensitive',
      desc: '',
      args: [],
    );
  }

  /// `This tweet contains potentially sensitive content. Would you like to view it?`
  String get possibly_sensitive_tweet {
    return Intl.message(
      'This tweet contains potentially sensitive content. Would you like to view it?',
      name: 'possibly_sensitive_tweet',
      desc: '',
      args: [],
    );
  }

  /// `This profile may include potentially sensitive images, language, or other content. Do you still want to view it?`
  String get possibly_sensitive_profile {
    return Intl.message(
      'This profile may include potentially sensitive images, language, or other content. Do you still want to view it?',
      name: 'possibly_sensitive_profile',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Unable to load your home pages`
  String get unable_to_load_home_pages {
    return Intl.message(
      'Unable to load your home pages',
      name: 'unable_to_load_home_pages',
      desc: '',
      args: [],
    );
  }

  /// `Reset pages to default`
  String get reset_home_pages {
    return Intl.message(
      'Reset pages to default',
      name: 'reset_home_pages',
      desc: '',
      args: [],
    );
  }

  /// `You must have at least two home screen pages`
  String get you_must_have_at_least_2_home_screen_pages {
    return Intl.message(
      'You must have at least two home screen pages',
      name: 'you_must_have_at_least_2_home_screen_pages',
      desc: '',
      args: [],
    );
  }

  /// `{name}`
  String group_name(Object name) {
    return Intl.message(
      '$name',
      name: 'group_name',
      desc: '',
      args: [name],
    );
  }

  /// `Are you sure you want to close Squawker?`
  String get confirm_close_fritter {
    return Intl.message(
      'Are you sure you want to close Squawker?',
      name: 'confirm_close_fritter',
      desc: '',
      args: [],
    );
  }

  /// `Search term`
  String get search_term {
    return Intl.message(
      'Search term',
      name: 'search_term',
      desc: '',
      args: [],
    );
  }

  /// `Subscriptions can only be imported from public profiles`
  String get only_public_subscriptions_can_be_imported {
    return Intl.message(
      'Subscriptions can only be imported from public profiles',
      name: 'only_public_subscriptions_can_be_imported',
      desc: '',
      args: [],
    );
  }

  /// `Unsupported URL`
  String get unsupported_url {
    return Intl.message(
      'Unsupported URL',
      name: 'unsupported_url',
      desc: '',
      args: [],
    );
  }

  /// `This saved tweet could not be displayed, as it's too big to load. Please report it to the developers.`
  String get saved_tweet_too_large {
    return Intl.message(
      'This saved tweet could not be displayed, as it\'s too big to load. Please report it to the developers.',
      name: 'saved_tweet_too_large',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get generic_username {
    return Intl.message(
      'User',
      name: 'generic_username',
      desc: '',
      args: [],
    );
  }

  /// `Missing page`
  String get missing_page {
    return Intl.message(
      'Missing page',
      name: 'missing_page',
      desc: '',
      args: [],
    );
  }

  /// `You need to have at least 2 home screen pages.`
  String get two_home_pages_required {
    return Intl.message(
      'You need to have at least 2 home screen pages.',
      name: 'two_home_pages_required',
      desc: '',
      args: [],
    );
  }

  /// `Choose pages`
  String get choose_pages {
    return Intl.message(
      'Choose pages',
      name: 'choose_pages',
      desc: '',
      args: [],
    );
  }

  /// `Mute videos`
  String get mute_videos {
    return Intl.message(
      'Mute videos',
      name: 'mute_videos',
      desc: '',
      args: [],
    );
  }

  /// `Whether videos should be muted by default`
  String get mute_video_description {
    return Intl.message(
      'Whether videos should be muted by default',
      name: 'mute_video_description',
      desc: '',
      args: [],
    );
  }

  /// `Custom share URL`
  String get share_base_url {
    return Intl.message(
      'Custom share URL',
      name: 'share_base_url',
      desc: '',
      args: [],
    );
  }

  /// `Use a custom base URL when sharing`
  String get share_base_url_description {
    return Intl.message(
      'Use a custom base URL when sharing',
      name: 'share_base_url_description',
      desc: '',
      args: [],
    );
  }

  /// `This functionality is no longer supported by Twitter/X!`
  String get functionality_unsupported {
    return Intl.message(
      'This functionality is no longer supported by Twitter/X!',
      name: 'functionality_unsupported',
      desc: '',
      args: [],
    );
  }

  /// `Add subscriptions`
  String get add_subscriptions {
    return Intl.message(
      'Add subscriptions',
      name: 'add_subscriptions',
      desc: '',
      args: [],
    );
  }

  /// `Keep feeds offset`
  String get keep_feed_offset_label {
    return Intl.message(
      'Keep feeds offset',
      name: 'keep_feed_offset_label',
      desc: '',
      args: [],
    );
  }

  /// `The timeline offset is kept for feeds when the app restarts`
  String get keep_feed_offset_description {
    return Intl.message(
      'The timeline offset is kept for feeds when the app restarts',
      name: 'keep_feed_offset_description',
      desc: '',
      args: [],
    );
  }

  /// `Leaner feeds`
  String get leaner_feeds_label {
    return Intl.message(
      'Leaner feeds',
      name: 'leaner_feeds_label',
      desc: '',
      args: [],
    );
  }

  /// `Preview links are not shown in tweets from feeds`
  String get leaner_feeds_description {
    return Intl.message(
      'Preview links are not shown in tweets from feeds',
      name: 'leaner_feeds_description',
      desc: '',
      args: [],
    );
  }

  /// `Font size`
  String get tweet_font_size_label {
    return Intl.message(
      'Font size',
      name: 'tweet_font_size_label',
      desc: '',
      args: [],
    );
  }

  /// `Font size of the tweets`
  String get tweet_font_size_description {
    return Intl.message(
      'Font size of the tweets',
      name: 'tweet_font_size_description',
      desc: '',
      args: [],
    );
  }

  /// `Thumbnail not available`
  String get thumbnail_not_available {
    return Intl.message(
      'Thumbnail not available',
      name: 'thumbnail_not_available',
      desc: '',
      args: [],
    );
  }

  /// `Download videos with best quality`
  String get download_video_best_quality_label {
    return Intl.message(
      'Download videos with best quality',
      name: 'download_video_best_quality_label',
      desc: '',
      args: [],
    );
  }

  /// `Download videos in best available quality`
  String get download_video_best_quality_description {
    return Intl.message(
      'Download videos in best available quality',
      name: 'download_video_best_quality_description',
      desc: '',
      args: [],
    );
  }

  /// `Confirm close`
  String get option_confirm_close_label {
    return Intl.message(
      'Confirm close',
      name: 'option_confirm_close_label',
      desc: '',
      args: [],
    );
  }

  /// `Confirm when closing the app`
  String get option_confirm_close_description {
    return Intl.message(
      'Confirm when closing the app',
      name: 'option_confirm_close_description',
      desc: '',
      args: [],
    );
  }

  /// `Remove from feed`
  String get remove_from_feed {
    return Intl.message(
      'Remove from feed',
      name: 'remove_from_feed',
      desc: '',
      args: [],
    );
  }

  /// `Add to feed`
  String get add_to_feed {
    return Intl.message(
      'Add to feed',
      name: 'add_to_feed',
      desc: '',
      args: [],
    );
  }

  /// `Default subscription tab`
  String get default_subscription_tab {
    return Intl.message(
      'Default subscription tab',
      name: 'default_subscription_tab',
      desc: '',
      args: [],
    );
  }

  /// `Which tab is shown when the subscription opens`
  String get which_tab_is_shown_when_the_subscription_opens {
    return Intl.message(
      'Which tab is shown when the subscription opens',
      name: 'which_tab_is_shown_when_the_subscription_opens',
      desc: '',
      args: [],
    );
  }

  /// `X API`
  String get x_api {
    return Intl.message(
      'X API',
      name: 'x_api',
      desc: '',
      args: [],
    );
  }

  /// `Enhanced feeds`
  String get enhanced_feeds_label {
    return Intl.message(
      'Enhanced feeds',
      name: 'enhanced_feeds_label',
      desc: '',
      args: [],
    );
  }

  /// `Enhanced requests for feeds (but with lower rate limits)`
  String get enhanced_feeds_description {
    return Intl.message(
      'Enhanced requests for feeds (but with lower rate limits)',
      name: 'enhanced_feeds_description',
      desc: '',
      args: [],
    );
  }

  /// `Enhanced searches`
  String get enhanced_searches_label {
    return Intl.message(
      'Enhanced searches',
      name: 'enhanced_searches_label',
      desc: '',
      args: [],
    );
  }

  /// `Enhanced requests for searches (but with lower rate limits)`
  String get enhanced_searches_description {
    return Intl.message(
      'Enhanced requests for searches (but with lower rate limits)',
      name: 'enhanced_searches_description',
      desc: '',
      args: [],
    );
  }

  /// `Enhanced profile`
  String get enhanced_profile_label {
    return Intl.message(
      'Enhanced profile',
      name: 'enhanced_profile_label',
      desc: '',
      args: [],
    );
  }

  /// `Enhanced requests for profile`
  String get enhanced_profile_description {
    return Intl.message(
      'Enhanced requests for profile',
      name: 'enhanced_profile_description',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<L10n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'be'),
      Locale.fromSubtags(languageCode: 'be', scriptCode: 'Latn'),
      Locale.fromSubtags(languageCode: 'ca'),
      Locale.fromSubtags(languageCode: 'cs'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'eo'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'et'),
      Locale.fromSubtags(languageCode: 'eu'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'hi'),
      Locale.fromSubtags(languageCode: 'ia'),
      Locale.fromSubtags(languageCode: 'id'),
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'ko'),
      Locale.fromSubtags(languageCode: 'ml'),
      Locale.fromSubtags(languageCode: 'nb', countryCode: 'NO'),
      Locale.fromSubtags(languageCode: 'nl'),
      Locale.fromSubtags(languageCode: 'or'),
      Locale.fromSubtags(languageCode: 'pl'),
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
      Locale.fromSubtags(languageCode: 'ro'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'tr'),
      Locale.fromSubtags(languageCode: 'uk'),
      Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<L10n> load(Locale locale) => L10n.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
