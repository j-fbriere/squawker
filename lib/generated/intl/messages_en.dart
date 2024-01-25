// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(name) =>
      "Are you sure you want to delete the subscription group ${name}?";

  static String m1(fileName) => "Data exported to ${fileName}";

  static String m2(fullPath) => "Data exported to ${fullPath}";

  static String m3(timeagoFormat) => "Ended ${timeagoFormat}";

  static String m4(timeagoFormat) => "Ends ${timeagoFormat}";

  static String m5(snapshotData) => "Finished with ${snapshotData} users";

  static String m6(name) => "${name}";

  static String m7(snapshotData) => "${snapshotData} users imported so far";

  static String m8(date) => "Joined ${date}";

  static String m9(num, numFormatted) =>
      "${Intl.plural(num, zero: 'No votes', one: 'One vote', two: 'Two votes', few: '${numFormatted} votes', many: '${numFormatted} vote', other: '${numFormatted} votes')}";

  static String m10(errorMessage) =>
      "Please check your Internet connection.\n\n${errorMessage}";

  static String m11(releaseVersion) => "Tap to download ${releaseVersion}";

  static String m12(getMediaType) => "Tap to show ${getMediaType}";

  static String m13(filePath) =>
      "The file does not exist. Please ensure it is located at ${filePath}";

  static String m14(thisTweetUserName, timeAgo) =>
      "${thisTweetUserName} retweeted ${timeAgo}";

  static String m15(num, numFormatted) =>
      "${Intl.plural(num, zero: 'no tweets', one: 'one tweet', two: 'two tweets', few: '${numFormatted} tweets', many: '${numFormatted} tweet', other: '${numFormatted} tweets')}";

  static String m16(widgetPlaceName) =>
      "Unable to load the trends for ${widgetPlaceName}";

  static String m17(responseStatusCode) =>
      "Unable to save the media. Twitter/X returned a status of ${responseStatusCode}";

  static String m18(releaseVersion) =>
      "Update to ${releaseVersion} through your F-Droid client";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("About"),
        "account_suspended":
            MessageLookupByLibrary.simpleMessage("Account suspended"),
        "activate_non_confirmation_bias_mode_description":
            MessageLookupByLibrary.simpleMessage(
                "Hide tweet authors. Avoid confirmation bias based on authoritative arguments."),
        "activate_non_confirmation_bias_mode_label":
            MessageLookupByLibrary.simpleMessage(
                "Activate non-confirmation bias mode"),
        "add_subscriptions":
            MessageLookupByLibrary.simpleMessage("Add subscriptions"),
        "add_to_feed": MessageLookupByLibrary.simpleMessage("Add to feed"),
        "add_to_group": MessageLookupByLibrary.simpleMessage("Add to group"),
        "all": MessageLookupByLibrary.simpleMessage("All"),
        "all_the_great_software_used_by_fritter":
            MessageLookupByLibrary.simpleMessage(
                "All the great software used by Squawker"),
        "an_update_for_fritter_is_available":
            MessageLookupByLibrary.simpleMessage(
                "An update for Squawker is available! 🚀"),
        "app_info": MessageLookupByLibrary.simpleMessage("App Info"),
        "are_you_sure": MessageLookupByLibrary.simpleMessage("Are you sure?"),
        "are_you_sure_you_want_to_delete_the_subscription_group_name_of_group":
            m0,
        "back": MessageLookupByLibrary.simpleMessage("Back"),
        "bad_guest_token": MessageLookupByLibrary.simpleMessage(
            "Twitter/X has invalidated our access token. Please try re-opening Squawker!"),
        "beta": MessageLookupByLibrary.simpleMessage("BETA"),
        "blue_theme_based_on_the_twitter_color_scheme":
            MessageLookupByLibrary.simpleMessage(
                "Blue theme based on the Twitter/X color scheme"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "catastrophic_failure":
            MessageLookupByLibrary.simpleMessage("Catastrophic failure"),
        "choose": MessageLookupByLibrary.simpleMessage("Choose"),
        "choose_pages": MessageLookupByLibrary.simpleMessage("Choose pages"),
        "close": MessageLookupByLibrary.simpleMessage("Close"),
        "confirm_close_fritter": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to close Squawker?"),
        "contribute": MessageLookupByLibrary.simpleMessage("Contribute"),
        "copied_address_to_clipboard":
            MessageLookupByLibrary.simpleMessage("Copied address to clipboard"),
        "copied_version_to_clipboard":
            MessageLookupByLibrary.simpleMessage("Copied version to clipboard"),
        "could_not_contact_twitter":
            MessageLookupByLibrary.simpleMessage("Could not contact Twitter/X"),
        "could_not_find_any_tweets_by_this_user":
            MessageLookupByLibrary.simpleMessage(
                "Couldn\'t find any tweets by this user!"),
        "could_not_find_any_tweets_from_the_last_7_days":
            MessageLookupByLibrary.simpleMessage(
                "Couldn\'t find any tweets from the last 7 days!"),
        "country": MessageLookupByLibrary.simpleMessage("Country"),
        "dark": MessageLookupByLibrary.simpleMessage("Dark"),
        "data": MessageLookupByLibrary.simpleMessage("Data"),
        "data_exported_to_fileName": m1,
        "data_exported_to_fullPath": m2,
        "data_imported_successfully":
            MessageLookupByLibrary.simpleMessage("Data imported successfully"),
        "date_created": MessageLookupByLibrary.simpleMessage("Date Created"),
        "date_subscribed":
            MessageLookupByLibrary.simpleMessage("Date Subscribed"),
        "default_subscription_tab":
            MessageLookupByLibrary.simpleMessage("Default subscription tab"),
        "default_tab": MessageLookupByLibrary.simpleMessage("Default tab"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "disable_screenshots":
            MessageLookupByLibrary.simpleMessage("Disable screenshots"),
        "disable_screenshots_hint": MessageLookupByLibrary.simpleMessage(
            "Prevent screenshots from being taken. This may not work on all devices."),
        "disabled": MessageLookupByLibrary.simpleMessage("Disabled"),
        "donate": MessageLookupByLibrary.simpleMessage("Donate"),
        "download": MessageLookupByLibrary.simpleMessage("Download"),
        "download_handling":
            MessageLookupByLibrary.simpleMessage("Download handling"),
        "download_handling_description":
            MessageLookupByLibrary.simpleMessage("How downloading should work"),
        "download_handling_type_ask":
            MessageLookupByLibrary.simpleMessage("Always ask"),
        "download_handling_type_directory":
            MessageLookupByLibrary.simpleMessage("Save to directory"),
        "download_media_no_url": MessageLookupByLibrary.simpleMessage(
            "Unable to download. This media may only be available as a stream, which Squawker cannot yet download."),
        "download_path": MessageLookupByLibrary.simpleMessage("Download path"),
        "download_video_best_quality_description":
            MessageLookupByLibrary.simpleMessage(
                "Download videos in best available quality"),
        "download_video_best_quality_label":
            MessageLookupByLibrary.simpleMessage(
                "Download videos with best quality"),
        "downloading_media":
            MessageLookupByLibrary.simpleMessage("Downloading media..."),
        "enable_": MessageLookupByLibrary.simpleMessage("Enable ?"),
        "ended_timeago_format_endsAt_allowFromNow_true": m3,
        "ends_timeago_format_endsAt_allowFromNow_true": m4,
        "enhanced_feeds_description": MessageLookupByLibrary.simpleMessage(
            "Enhanced requests for feeds (but with lower rate limits)"),
        "enhanced_feeds_label":
            MessageLookupByLibrary.simpleMessage("Enhanced feeds"),
        "enhanced_profile_description": MessageLookupByLibrary.simpleMessage(
            "Enhanced requests for profile"),
        "enhanced_profile_label":
            MessageLookupByLibrary.simpleMessage("Enhanced profile"),
        "enhanced_searches_description": MessageLookupByLibrary.simpleMessage(
            "Enhanced requests for searches (but with lower rate limits)"),
        "enhanced_searches_label":
            MessageLookupByLibrary.simpleMessage("Enhanced searches"),
        "enter_your_twitter_username": MessageLookupByLibrary.simpleMessage(
            "Enter your Twitter/X username"),
        "export": MessageLookupByLibrary.simpleMessage("Export"),
        "export_guest_accounts":
            MessageLookupByLibrary.simpleMessage("Export guest accounts?"),
        "export_settings":
            MessageLookupByLibrary.simpleMessage("Export settings?"),
        "export_subscription_group_members":
            MessageLookupByLibrary.simpleMessage(
                "Export subscription group members?"),
        "export_subscription_groups":
            MessageLookupByLibrary.simpleMessage("Export subscription groups?"),
        "export_subscriptions":
            MessageLookupByLibrary.simpleMessage("Export subscriptions?"),
        "export_tweets": MessageLookupByLibrary.simpleMessage("Export tweets?"),
        "export_your_data":
            MessageLookupByLibrary.simpleMessage("Export your data"),
        "feed": MessageLookupByLibrary.simpleMessage("Feed"),
        "filters": MessageLookupByLibrary.simpleMessage("Filters"),
        "finish": MessageLookupByLibrary.simpleMessage("Finish"),
        "finished_with_snapshotData_users": m5,
        "followers": MessageLookupByLibrary.simpleMessage("Followers"),
        "following": MessageLookupByLibrary.simpleMessage("Following"),
        "forbidden": MessageLookupByLibrary.simpleMessage(
            "Twitter/X says access to this is forbidden"),
        "fritter": MessageLookupByLibrary.simpleMessage("Squawker"),
        "fritter_blue": MessageLookupByLibrary.simpleMessage("Squawker blue"),
        "functionality_unsupported": MessageLookupByLibrary.simpleMessage(
            "This functionality is no longer supported by Twitter/X!"),
        "general": MessageLookupByLibrary.simpleMessage("General"),
        "generic_username": MessageLookupByLibrary.simpleMessage("User"),
        "group_name": m6,
        "groups": MessageLookupByLibrary.simpleMessage("Groups"),
        "help_make_fritter_even_better": MessageLookupByLibrary.simpleMessage(
            "Help make Squawker even better"),
        "help_support_fritters_future": MessageLookupByLibrary.simpleMessage(
            "Help support Squawker\'s future"),
        "hide_sensitive_tweets":
            MessageLookupByLibrary.simpleMessage("Hide sensitive tweets"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "if_you_have_any_feedback_on_this_feature_please_leave_it_on":
            MessageLookupByLibrary.simpleMessage(
                "If you have any feedback on this feature, please leave it on"),
        "import": MessageLookupByLibrary.simpleMessage("Import"),
        "import_data_from_another_device": MessageLookupByLibrary.simpleMessage(
            "Import data from another device"),
        "import_from_twitter":
            MessageLookupByLibrary.simpleMessage("Import from Twitter/X"),
        "import_subscriptions":
            MessageLookupByLibrary.simpleMessage("Import subscriptions"),
        "imported_snapshot_data_users_so_far": m7,
        "include_replies":
            MessageLookupByLibrary.simpleMessage("Include replies"),
        "include_retweets":
            MessageLookupByLibrary.simpleMessage("Include retweets"),
        "joined": m8,
        "keep_feed_offset_description": MessageLookupByLibrary.simpleMessage(
            "The timeline offset is kept for feeds when the app restarts"),
        "keep_feed_offset_label":
            MessageLookupByLibrary.simpleMessage("Keep feeds offset"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "language_subtitle":
            MessageLookupByLibrary.simpleMessage("Requires a restart"),
        "large": MessageLookupByLibrary.simpleMessage("Large"),
        "leaner_feeds_description": MessageLookupByLibrary.simpleMessage(
            "Preview links are not shown in tweets from feeds"),
        "leaner_feeds_label":
            MessageLookupByLibrary.simpleMessage("Leaner feeds"),
        "legacy_android_import":
            MessageLookupByLibrary.simpleMessage("Legacy Android Import"),
        "let_the_developers_know_if_something_is_broken":
            MessageLookupByLibrary.simpleMessage(
                "Let the developers know if something\'s broken"),
        "licenses": MessageLookupByLibrary.simpleMessage("Licenses"),
        "light": MessageLookupByLibrary.simpleMessage("Light"),
        "live": MessageLookupByLibrary.simpleMessage("LIVE"),
        "logging": MessageLookupByLibrary.simpleMessage("Logging"),
        "material_3": MessageLookupByLibrary.simpleMessage("Material 3?"),
        "media": MessageLookupByLibrary.simpleMessage("Media"),
        "media_size": MessageLookupByLibrary.simpleMessage("Media size"),
        "medium": MessageLookupByLibrary.simpleMessage("Medium"),
        "missing_page": MessageLookupByLibrary.simpleMessage("Missing page"),
        "mute_video_description": MessageLookupByLibrary.simpleMessage(
            "Whether videos should be muted by default"),
        "mute_videos": MessageLookupByLibrary.simpleMessage("Mute videos"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "newTrans": MessageLookupByLibrary.simpleMessage("New"),
        "next": MessageLookupByLibrary.simpleMessage("Next"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "no_data_was_returned_which_should_never_happen_please_report_a_bug_if_possible":
            MessageLookupByLibrary.simpleMessage(
                "No data was returned, which should never happen. Please report a bug, if possible!"),
        "no_results": MessageLookupByLibrary.simpleMessage("No results"),
        "no_results_for":
            MessageLookupByLibrary.simpleMessage("No results for:"),
        "no_subscriptions_try_searching_or_importing_some":
            MessageLookupByLibrary.simpleMessage(
                "No subscriptions. Try searching or importing some!"),
        "not_set": MessageLookupByLibrary.simpleMessage("Not set"),
        "note_due_to_a_twitter_limitation_not_all_tweets_may_be_included":
            MessageLookupByLibrary.simpleMessage(
                "Note: Due to a Twitter/X limitation, not all tweets may be included"),
        "numberFormat_format_total_votes": m9,
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "only_public_subscriptions_can_be_imported":
            MessageLookupByLibrary.simpleMessage(
                "Subscriptions can only be imported from public profiles"),
        "oops_something_went_wrong": MessageLookupByLibrary.simpleMessage(
            "Oops! Something went wrong 🥲"),
        "open_app_settings":
            MessageLookupByLibrary.simpleMessage("Open app settings"),
        "open_in_browser":
            MessageLookupByLibrary.simpleMessage("Open in browser"),
        "option_confirm_close_description":
            MessageLookupByLibrary.simpleMessage(
                "Confirm when closing the app"),
        "option_confirm_close_label":
            MessageLookupByLibrary.simpleMessage("Confirm close"),
        "page_not_found": MessageLookupByLibrary.simpleMessage(
            "Twitter/X says the page does not exist, but that may not be true"),
        "permission_not_granted": MessageLookupByLibrary.simpleMessage(
            "Permission not granted. Please try again after granting!"),
        "pick_a_color": MessageLookupByLibrary.simpleMessage("Pick a color!"),
        "pick_an_icon": MessageLookupByLibrary.simpleMessage("Pick an icon!"),
        "pinned_tweet": MessageLookupByLibrary.simpleMessage("Pinned tweet"),
        "playback_speed":
            MessageLookupByLibrary.simpleMessage("Playback speed"),
        "please_check_your_internet_connection_error_message": m10,
        "please_enter_a_name":
            MessageLookupByLibrary.simpleMessage("Please enter a name"),
        "please_make_sure_the_data_you_wish_to_import_is_located_there_then_press_the_import_button_below":
            MessageLookupByLibrary.simpleMessage(
                "Please make sure the data you wish to import is located there, then press the import button below."),
        "please_note_that_the_method_fritter_uses_to_import_subscriptions_is_heavily_rate_limited_by_twitter_so_this_may_fail_if_you_have_a_lot_of_followed_accounts":
            MessageLookupByLibrary.simpleMessage(
                "Please note that the method Squawker uses to import subscriptions is heavily rate-limited by Twitter/X, so this may fail if you have a lot of followed accounts."),
        "possibly_sensitive":
            MessageLookupByLibrary.simpleMessage("Potentially sensitive"),
        "possibly_sensitive_profile": MessageLookupByLibrary.simpleMessage(
            "This profile may include potentially sensitive images, language, or other content. Do you still want to view it?"),
        "possibly_sensitive_tweet": MessageLookupByLibrary.simpleMessage(
            "This tweet contains potentially sensitive content. Would you like to view it?"),
        "prefix": MessageLookupByLibrary.simpleMessage("prefix"),
        "private_profile":
            MessageLookupByLibrary.simpleMessage("Private profile"),
        "released_under_the_mit_license": MessageLookupByLibrary.simpleMessage(
            "Released under the MIT License"),
        "remove_from_feed":
            MessageLookupByLibrary.simpleMessage("Remove from feed"),
        "replying_to": MessageLookupByLibrary.simpleMessage("Replying to"),
        "report": MessageLookupByLibrary.simpleMessage("Report"),
        "report_a_bug": MessageLookupByLibrary.simpleMessage("Report a bug"),
        "reporting_an_error":
            MessageLookupByLibrary.simpleMessage("Reporting an error"),
        "reset_home_pages":
            MessageLookupByLibrary.simpleMessage("Reset pages to default"),
        "retry": MessageLookupByLibrary.simpleMessage("Retry"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "save_bandwidth_using_smaller_images":
            MessageLookupByLibrary.simpleMessage(
                "Save bandwidth with smaller images"),
        "saved": MessageLookupByLibrary.simpleMessage("Saved"),
        "saved_tweet_too_large": MessageLookupByLibrary.simpleMessage(
            "This saved tweet could not be displayed, as it\'s too big to load. Please report it to the developers."),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "search_term": MessageLookupByLibrary.simpleMessage("Search term"),
        "select": MessageLookupByLibrary.simpleMessage("Select"),
        "selecting_individual_accounts_to_import_and_assigning_groups_are_both_planned_for_the_future_already":
            MessageLookupByLibrary.simpleMessage(
                "Selecting individual accounts to import, and assigning groups are both planned for the future already!"),
        "send": MessageLookupByLibrary.simpleMessage("Send"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "share_base_url":
            MessageLookupByLibrary.simpleMessage("Custom share URL"),
        "share_base_url_description": MessageLookupByLibrary.simpleMessage(
            "Use a custom base URL when sharing"),
        "share_tweet_content":
            MessageLookupByLibrary.simpleMessage("Share tweet content"),
        "share_tweet_content_and_link": MessageLookupByLibrary.simpleMessage(
            "Share tweet content and link"),
        "share_tweet_link":
            MessageLookupByLibrary.simpleMessage("Share tweet link"),
        "should_check_for_updates_description":
            MessageLookupByLibrary.simpleMessage(
                "Check for updates when Squawker starts"),
        "should_check_for_updates_label":
            MessageLookupByLibrary.simpleMessage("Check for updates"),
        "small": MessageLookupByLibrary.simpleMessage("Small"),
        "something_broke_in_fritter": MessageLookupByLibrary.simpleMessage(
            "Something broke in Squawker."),
        "something_just_went_wrong_in_fritter_and_an_error_report_has_been_generated":
            MessageLookupByLibrary.simpleMessage(
                "Something just went wrong in Squawker, and an error report has been generated. The report can be sent to the Squawker developers to help fix the problem."),
        "sorry_the_replied_tweet_could_not_be_found":
            MessageLookupByLibrary.simpleMessage(
                "Sorry, the replied tweet could not be found!"),
        "subscribe": MessageLookupByLibrary.simpleMessage("Subscribe"),
        "subscriptions": MessageLookupByLibrary.simpleMessage("Subscriptions"),
        "subtitles": MessageLookupByLibrary.simpleMessage("Subtitles"),
        "successfully_saved_the_media":
            MessageLookupByLibrary.simpleMessage("Saved the media!"),
        "system": MessageLookupByLibrary.simpleMessage("System"),
        "tap_to_download_release_version": m11,
        "tap_to_show_getMediaType_item_type": m12,
        "thanks_for_helping_fritter": MessageLookupByLibrary.simpleMessage(
            "Thanks for helping Squawker! 💖"),
        "the_file_does_not_exist_please_ensure_it_is_located_at_file_path": m13,
        "the_github_issue":
            MessageLookupByLibrary.simpleMessage("the GitHub issue (#143)"),
        "the_tweet_did_not_contain_any_text_this_is_unexpected":
            MessageLookupByLibrary.simpleMessage(
                "The tweet did not contain any text. This is unexpected"),
        "theme": MessageLookupByLibrary.simpleMessage("Theme"),
        "theme_mode": MessageLookupByLibrary.simpleMessage("Theme Mode"),
        "there_were_no_trends_returned_this_is_unexpected_please_report_as_a_bug_if_possible":
            MessageLookupByLibrary.simpleMessage(
                "There were no trends returned. This is unexpected! Please report as a bug, if possible."),
        "this_group_contains_no_subscriptions":
            MessageLookupByLibrary.simpleMessage(
                "This group contains no subscriptions!"),
        "this_took_too_long_to_load_please_check_your_network_connection":
            MessageLookupByLibrary.simpleMessage(
                "This took too long to load. Please check your network connection!"),
        "this_tweet_is_unavailable": MessageLookupByLibrary.simpleMessage(
            "This tweet is unavailable. It was probably deleted."),
        "this_tweet_user_name_retweeted": m14,
        "this_user_does_not_follow_anyone":
            MessageLookupByLibrary.simpleMessage(
                "This user does not follow anyone!"),
        "this_user_does_not_have_anyone_following_them":
            MessageLookupByLibrary.simpleMessage(
                "This user does not have anyone following them!"),
        "thread": MessageLookupByLibrary.simpleMessage("Thread"),
        "thumbnail": MessageLookupByLibrary.simpleMessage("Thumbnail"),
        "thumbnail_not_available":
            MessageLookupByLibrary.simpleMessage("Thumbnail not available"),
        "timed_out": MessageLookupByLibrary.simpleMessage("Timed out"),
        "to_import_subscriptions_from_an_existing_twitter_account_enter_your_username_below":
            MessageLookupByLibrary.simpleMessage(
                "To import subscriptions from an existing Twitter/X account, enter your username below."),
        "toggle_all": MessageLookupByLibrary.simpleMessage("Toggle All"),
        "trending": MessageLookupByLibrary.simpleMessage("Trending"),
        "trends": MessageLookupByLibrary.simpleMessage("Trends"),
        "true_black": MessageLookupByLibrary.simpleMessage("True Black?"),
        "tweet_font_size_description":
            MessageLookupByLibrary.simpleMessage("Font size of the tweets"),
        "tweet_font_size_label":
            MessageLookupByLibrary.simpleMessage("Font size"),
        "tweets": MessageLookupByLibrary.simpleMessage("Tweets"),
        "tweets_and_replies":
            MessageLookupByLibrary.simpleMessage("Tweets & Replies"),
        "tweets_number": m15,
        "two_home_pages_required": MessageLookupByLibrary.simpleMessage(
            "You need to have at least 2 home screen pages."),
        "unable_to_find_the_available_trend_locations":
            MessageLookupByLibrary.simpleMessage(
                "Unable to find the available trend locations."),
        "unable_to_find_your_saved_tweets":
            MessageLookupByLibrary.simpleMessage(
                "Unable to find your saved tweets."),
        "unable_to_import":
            MessageLookupByLibrary.simpleMessage("Unable to import"),
        "unable_to_load_home_pages": MessageLookupByLibrary.simpleMessage(
            "Unable to load your home pages"),
        "unable_to_load_subscription_groups":
            MessageLookupByLibrary.simpleMessage(
                "Unable to load subscription groups"),
        "unable_to_load_the_group":
            MessageLookupByLibrary.simpleMessage("Unable to load the group"),
        "unable_to_load_the_group_settings":
            MessageLookupByLibrary.simpleMessage(
                "Unable to load the group settings"),
        "unable_to_load_the_list_of_follows":
            MessageLookupByLibrary.simpleMessage(
                "Unable to load the list of follows"),
        "unable_to_load_the_next_page_of_follows":
            MessageLookupByLibrary.simpleMessage(
                "Unable to load the next page of follows"),
        "unable_to_load_the_next_page_of_replies":
            MessageLookupByLibrary.simpleMessage(
                "Unable to load the next page of replies"),
        "unable_to_load_the_next_page_of_tweets":
            MessageLookupByLibrary.simpleMessage(
                "Unable to load the next page of tweets"),
        "unable_to_load_the_profile":
            MessageLookupByLibrary.simpleMessage("Unable to load the profile"),
        "unable_to_load_the_search_results":
            MessageLookupByLibrary.simpleMessage(
                "Unable to load the search results."),
        "unable_to_load_the_trends_for_widget_place_name": m16,
        "unable_to_load_the_tweet":
            MessageLookupByLibrary.simpleMessage("Unable to load the tweet"),
        "unable_to_load_the_tweets":
            MessageLookupByLibrary.simpleMessage("Unable to load the tweets"),
        "unable_to_load_the_tweets_for_the_feed":
            MessageLookupByLibrary.simpleMessage(
                "Unable to load the tweets for the feed"),
        "unable_to_refresh_the_subscriptions":
            MessageLookupByLibrary.simpleMessage(
                "Unable to refresh the subscriptions"),
        "unable_to_run_the_database_migrations":
            MessageLookupByLibrary.simpleMessage(
                "Unable to run the database migrations"),
        "unable_to_save_the_media_twitter_returned_a_status_of_response_statusCode":
            m17,
        "unable_to_stream_the_trend_location_preference":
            MessageLookupByLibrary.simpleMessage(
                "Unable to stream the trend location preference"),
        "unknown": MessageLookupByLibrary.simpleMessage("Unknown"),
        "unsave": MessageLookupByLibrary.simpleMessage("Unsave"),
        "unsubscribe": MessageLookupByLibrary.simpleMessage("Unsubscribe"),
        "unsupported_url":
            MessageLookupByLibrary.simpleMessage("Unsupported URL"),
        "update_to_release_version_through_your_fdroid_client": m18,
        "updates": MessageLookupByLibrary.simpleMessage("Updates"),
        "use_true_black_for_the_dark_mode_theme":
            MessageLookupByLibrary.simpleMessage(
                "Use true black for the dark mode theme"),
        "user_not_found":
            MessageLookupByLibrary.simpleMessage("User not found"),
        "username": MessageLookupByLibrary.simpleMessage("Username"),
        "version": MessageLookupByLibrary.simpleMessage("Version"),
        "when_a_new_app_update_is_available":
            MessageLookupByLibrary.simpleMessage(
                "When a new app update is available"),
        "whether_errors_should_be_reported_to_":
            MessageLookupByLibrary.simpleMessage(
                "Whether errors should be reported to "),
        "whether_to_hide_tweets_marked_as_sensitive":
            MessageLookupByLibrary.simpleMessage(
                "Whether to hide tweets marked as sensitive"),
        "which_tab_is_shown_when_the_app_opens":
            MessageLookupByLibrary.simpleMessage(
                "Which tab is shown when the app opens"),
        "which_tab_is_shown_when_the_subscription_opens":
            MessageLookupByLibrary.simpleMessage(
                "Which tab is shown when the subscription opens"),
        "would_you_like_to_enable_automatic_error_reporting":
            MessageLookupByLibrary.simpleMessage(
                "Would you like to enable automatic error reporting?"),
        "x_api": MessageLookupByLibrary.simpleMessage("X API"),
        "yes": MessageLookupByLibrary.simpleMessage("Yes"),
        "yes_please": MessageLookupByLibrary.simpleMessage("Yes, please"),
        "you_have_not_saved_any_tweets_yet":
            MessageLookupByLibrary.simpleMessage(
                "You haven\'t saved any tweets yet!"),
        "you_must_have_at_least_2_home_screen_pages":
            MessageLookupByLibrary.simpleMessage(
                "You must have at least two home screen pages"),
        "your_profile_must_be_public_otherwise_the_import_will_not_work":
            MessageLookupByLibrary.simpleMessage(
                "Your profile must be public, otherwise the import will not work"),
        "your_report_will_be_sent_to_fritter__project":
            MessageLookupByLibrary.simpleMessage(
                "Your report will be sent to Squawker\'s  project, and privacy details can be found at:")
      };
}
