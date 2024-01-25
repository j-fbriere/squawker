// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
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
  String get localeName => 'de';

  static String m0(name) =>
      "Bist du dir sicher, dass du die Gruppe ${name} löschen willst?";

  static String m1(fileName) => "Daten wurden exportiert nach ${fileName}";

  static String m2(fullPath) => "Daten wurden exportiert nach ${fullPath}";

  static String m3(timeagoFormat) => "Beendet vor ${timeagoFormat}";

  static String m4(timeagoFormat) => "Endet ${timeagoFormat}";

  static String m5(snapshotData) =>
      "Beendet mit insgesamt ${snapshotData} Nutzern";

  static String m6(name) => "Gruppe: ${name}";

  static String m7(snapshotData) =>
      "${snapshotData} bisher importierte Benutzer";

  static String m8(date) => "Seit ${date} bei Twitter/X";

  static String m9(num, numFormatted) =>
      "${Intl.plural(num, zero: 'keine Stimmen', one: 'eine Stimme', two: 'zwei Stimmen', few: '${numFormatted} Stimmen', many: '${numFormatted} Stimmen', other: '${numFormatted} Stimmen')}";

  static String m10(errorMessage) =>
      "Bitte überprüfe deine Internetverbindung.\n\n${errorMessage}";

  static String m11(releaseVersion) =>
      "Antippen, um Version ${releaseVersion} herunterzuladen";

  static String m12(getMediaType) => "Antippen, um ${getMediaType} anzuzeigen";

  static String m13(filePath) =>
      "Diese Datei existiert nicht. Bitte stelle sicher, dass sie sich unter ${filePath} befindet";

  static String m14(thisTweetUserName, timeAgo) =>
      "Retweet von ${thisTweetUserName} ${timeAgo}";

  static String m15(num, numFormatted) =>
      "${Intl.plural(num, zero: 'keine tweets', one: 'ein tweet', two: 'zwei tweets', few: '${numFormatted} tweets', many: '${numFormatted} tweets', other: '${numFormatted} tweets')}";

  static String m16(widgetPlaceName) =>
      "Trends für ${widgetPlaceName} konnten nicht geladen werden";

  static String m17(responseStatusCode) =>
      "Medien konnten nicht gespeichert werden. Twitter/X gab folgenden Statuscode zurück: ${responseStatusCode}";

  static String m18(releaseVersion) =>
      "Update auf Version ${releaseVersion} über F-Droid";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("Über"),
        "account_suspended":
            MessageLookupByLibrary.simpleMessage("Nutzerkonto gesperrt"),
        "activate_non_confirmation_bias_mode_description":
            MessageLookupByLibrary.simpleMessage(
                "Tweetautor verbergen. Vermeide Bestätigungsfehler aufgrund von Autoritätsargumenten."),
        "activate_non_confirmation_bias_mode_label":
            MessageLookupByLibrary.simpleMessage(
                "Non-Confirmation-Bias-Modus aktivieren"),
        "add_subscriptions":
            MessageLookupByLibrary.simpleMessage("Abonnements hinzufügen"),
        "add_to_feed":
            MessageLookupByLibrary.simpleMessage("Zum Feed hinzufügen"),
        "add_to_group":
            MessageLookupByLibrary.simpleMessage("Zu Gruppe hinzufügen"),
        "all": MessageLookupByLibrary.simpleMessage("Alle"),
        "all_the_great_software_used_by_fritter":
            MessageLookupByLibrary.simpleMessage(
                "All die fantastische Software, die Squawker verwendet"),
        "an_update_for_fritter_is_available":
            MessageLookupByLibrary.simpleMessage(
                "Ein Update für Squawker ist verfügbar! 🚀"),
        "are_you_sure":
            MessageLookupByLibrary.simpleMessage("Bist du dir sicher?"),
        "are_you_sure_you_want_to_delete_the_subscription_group_name_of_group":
            m0,
        "back": MessageLookupByLibrary.simpleMessage("Zurück"),
        "bad_guest_token": MessageLookupByLibrary.simpleMessage(
            "Der Zugangs-Token ist nicht mehr gültig. Versuche Squawker erneut zu öffnen!"),
        "blue_theme_based_on_the_twitter_color_scheme":
            MessageLookupByLibrary.simpleMessage(
                "Blaues Design basierend auf dem Twitter/X-Farbschema"),
        "cancel": MessageLookupByLibrary.simpleMessage("Abbrechen"),
        "catastrophic_failure":
            MessageLookupByLibrary.simpleMessage("Totalausfall"),
        "choose": MessageLookupByLibrary.simpleMessage("Wählen"),
        "choose_pages": MessageLookupByLibrary.simpleMessage("Wähle Seiten"),
        "close": MessageLookupByLibrary.simpleMessage("Schließen"),
        "confirm_close_fritter": MessageLookupByLibrary.simpleMessage(
            "Willst du Squawker wirklich schließen?"),
        "contribute": MessageLookupByLibrary.simpleMessage("Beteilige dich"),
        "copied_address_to_clipboard": MessageLookupByLibrary.simpleMessage(
            "Link in Zwischenablage kopiert"),
        "copied_version_to_clipboard": MessageLookupByLibrary.simpleMessage(
            "Version in Zwischenablage kopiert"),
        "could_not_contact_twitter": MessageLookupByLibrary.simpleMessage(
            "Es konnte keine Verbindung zu Twitter/X aufgebaut werden"),
        "could_not_find_any_tweets_by_this_user":
            MessageLookupByLibrary.simpleMessage(
                "Keine Tweets von diesem Nutzer gefunden!"),
        "could_not_find_any_tweets_from_the_last_7_days":
            MessageLookupByLibrary.simpleMessage(
                "Keine Tweets aus den letzten 7 Tagen gefunden!"),
        "country": MessageLookupByLibrary.simpleMessage("Land"),
        "dark": MessageLookupByLibrary.simpleMessage("Dunkel"),
        "data": MessageLookupByLibrary.simpleMessage("Daten"),
        "data_exported_to_fileName": m1,
        "data_exported_to_fullPath": m2,
        "data_imported_successfully": MessageLookupByLibrary.simpleMessage(
            "Daten erfolgreich importiert"),
        "date_created":
            MessageLookupByLibrary.simpleMessage("Erstellungsdatum"),
        "date_subscribed": MessageLookupByLibrary.simpleMessage("Abo-Datum"),
        "default_tab": MessageLookupByLibrary.simpleMessage("Standard-Tab"),
        "delete": MessageLookupByLibrary.simpleMessage("Löschen"),
        "disable_screenshots":
            MessageLookupByLibrary.simpleMessage("Screenshots deaktivieren"),
        "disable_screenshots_hint": MessageLookupByLibrary.simpleMessage(
            "Versucht zu verhindern, dass Screenshots von Squawker gemacht werden können. Dies ist keine Garantie und funktioniert möglicherweise nicht auf allen Geräten."),
        "disabled": MessageLookupByLibrary.simpleMessage("Deaktiviert"),
        "donate": MessageLookupByLibrary.simpleMessage("Spenden"),
        "download": MessageLookupByLibrary.simpleMessage("Herunterladen"),
        "download_handling":
            MessageLookupByLibrary.simpleMessage("Downloadverhalten"),
        "download_handling_description": MessageLookupByLibrary.simpleMessage(
            "So soll das Herunterladen funktionieren"),
        "download_handling_type_ask":
            MessageLookupByLibrary.simpleMessage("Immer fragen"),
        "download_handling_type_directory":
            MessageLookupByLibrary.simpleMessage("Speichern in Ordner"),
        "download_media_no_url": MessageLookupByLibrary.simpleMessage(
            "Download nicht möglich. Diese Datei ist möglicherweise nur als Stream verfügbar, welche Squawker noch nicht herunterladen kann."),
        "download_path": MessageLookupByLibrary.simpleMessage("Download-Pfad"),
        "download_video_best_quality_description":
            MessageLookupByLibrary.simpleMessage(
                "Videos in der besten verfügbaren Qualität herunterladen"),
        "download_video_best_quality_label":
            MessageLookupByLibrary.simpleMessage(
                "Videos in der besten Qualität herunterladen"),
        "downloading_media": MessageLookupByLibrary.simpleMessage(
            "Medien werden heruntergeladen..."),
        "enable_": MessageLookupByLibrary.simpleMessage(" aktivieren?"),
        "ended_timeago_format_endsAt_allowFromNow_true": m3,
        "ends_timeago_format_endsAt_allowFromNow_true": m4,
        "enter_your_twitter_username": MessageLookupByLibrary.simpleMessage(
            "Gebe deinen Twitter/X-Nutzernamen ein"),
        "export": MessageLookupByLibrary.simpleMessage("Exportieren"),
        "export_guest_accounts":
            MessageLookupByLibrary.simpleMessage("Gastkonten exportieren?"),
        "export_settings":
            MessageLookupByLibrary.simpleMessage("Einstellungen exportieren?"),
        "export_subscription_group_members":
            MessageLookupByLibrary.simpleMessage(
                "Abo-Gruppen mit beinhalteten Accounts exportieren?"),
        "export_subscription_groups":
            MessageLookupByLibrary.simpleMessage("Abo-Gruppen exportieren?"),
        "export_subscriptions":
            MessageLookupByLibrary.simpleMessage("Abonnements exportieren?"),
        "export_tweets":
            MessageLookupByLibrary.simpleMessage("Tweets exportieren?"),
        "export_your_data":
            MessageLookupByLibrary.simpleMessage("Daten exportieren"),
        "feed": MessageLookupByLibrary.simpleMessage("Feed"),
        "filters": MessageLookupByLibrary.simpleMessage("Filter"),
        "finish": MessageLookupByLibrary.simpleMessage("Fertig"),
        "finished_with_snapshotData_users": m5,
        "followers": MessageLookupByLibrary.simpleMessage("Follower"),
        "following": MessageLookupByLibrary.simpleMessage("Folgt"),
        "forbidden": MessageLookupByLibrary.simpleMessage(
            "Zugang zu diesem Inhalt laut Twitter/X nicht gestattet"),
        "fritter": MessageLookupByLibrary.simpleMessage("Squawker"),
        "fritter_blue": MessageLookupByLibrary.simpleMessage("Squawker Blue"),
        "functionality_unsupported": MessageLookupByLibrary.simpleMessage(
            "Diese Funktion wird von Twitter/X nicht mehr unterstützt!"),
        "general": MessageLookupByLibrary.simpleMessage("Allgemein"),
        "generic_username": MessageLookupByLibrary.simpleMessage("Benutzer"),
        "group_name": m6,
        "groups": MessageLookupByLibrary.simpleMessage("Gruppen"),
        "help_make_fritter_even_better": MessageLookupByLibrary.simpleMessage(
            "Hilf dabei, Squawker noch besser zu machen"),
        "help_support_fritters_future": MessageLookupByLibrary.simpleMessage(
            "Unterstütze Squawkers Zukunft"),
        "hide_sensitive_tweets":
            MessageLookupByLibrary.simpleMessage("Anstößige Tweets ausblenden"),
        "home": MessageLookupByLibrary.simpleMessage("Start"),
        "if_you_have_any_feedback_on_this_feature_please_leave_it_on":
            MessageLookupByLibrary.simpleMessage(
                "Wenn du Feedback zu dieser Funktion hast, hinterlasse es bitte unter"),
        "import": MessageLookupByLibrary.simpleMessage("Importieren"),
        "import_data_from_another_device": MessageLookupByLibrary.simpleMessage(
            "Daten von einem anderen Gerät importieren"),
        "import_from_twitter":
            MessageLookupByLibrary.simpleMessage("Von Twitter/X importieren"),
        "import_subscriptions":
            MessageLookupByLibrary.simpleMessage("Abonnements importieren"),
        "imported_snapshot_data_users_so_far": m7,
        "include_replies":
            MessageLookupByLibrary.simpleMessage("Antworten anzeigen"),
        "include_retweets":
            MessageLookupByLibrary.simpleMessage("Retweets anzeigen"),
        "joined": m8,
        "language": MessageLookupByLibrary.simpleMessage("Sprache"),
        "language_subtitle":
            MessageLookupByLibrary.simpleMessage("Neustart erforderlich"),
        "large": MessageLookupByLibrary.simpleMessage("Groß"),
        "leaner_feeds_label":
            MessageLookupByLibrary.simpleMessage("Schlanke feeds"),
        "legacy_android_import": MessageLookupByLibrary.simpleMessage(
            "Von Legacy-Android-Geräten importieren"),
        "let_the_developers_know_if_something_is_broken":
            MessageLookupByLibrary.simpleMessage(
                "Teile den Entwicklern mit, falls etwas nicht funktioniert"),
        "licenses": MessageLookupByLibrary.simpleMessage("Lizenzen"),
        "light": MessageLookupByLibrary.simpleMessage("Hell"),
        "live": MessageLookupByLibrary.simpleMessage("LIVE"),
        "logging": MessageLookupByLibrary.simpleMessage("Protokollierung"),
        "media": MessageLookupByLibrary.simpleMessage("Medien"),
        "media_size": MessageLookupByLibrary.simpleMessage("Mediengröße"),
        "medium": MessageLookupByLibrary.simpleMessage("Mittel"),
        "missing_page": MessageLookupByLibrary.simpleMessage("Fehlende Seite"),
        "mute_video_description": MessageLookupByLibrary.simpleMessage(
            "Ob Videos standardmäßig stumm sein sollen"),
        "mute_videos":
            MessageLookupByLibrary.simpleMessage("Videos stumm schalten"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "newTrans": MessageLookupByLibrary.simpleMessage("Neu"),
        "next": MessageLookupByLibrary.simpleMessage("Weiter"),
        "no": MessageLookupByLibrary.simpleMessage("Nein"),
        "no_data_was_returned_which_should_never_happen_please_report_a_bug_if_possible":
            MessageLookupByLibrary.simpleMessage(
                "Keine Daten empfangen - das sollte nie passieren. Bitte, falls möglich, Fehler melden!"),
        "no_results": MessageLookupByLibrary.simpleMessage("Keine Ergebnisse"),
        "no_results_for":
            MessageLookupByLibrary.simpleMessage("Keine Ergebnisse für:"),
        "no_subscriptions_try_searching_or_importing_some":
            MessageLookupByLibrary.simpleMessage(
                "Keine Abonnements. Suche oder importiere welche!"),
        "not_set": MessageLookupByLibrary.simpleMessage("Nicht festgelegt"),
        "note_due_to_a_twitter_limitation_not_all_tweets_may_be_included":
            MessageLookupByLibrary.simpleMessage(
                "Hinweis: Aufgrund einer Beschränkung seitens Twitter/X werden möglicherweise nicht alle Tweets angezeigt"),
        "numberFormat_format_total_votes": m9,
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "only_public_subscriptions_can_be_imported":
            MessageLookupByLibrary.simpleMessage(
                "Abonnements können nur von öffentlichen Profilen geladen werden"),
        "oops_something_went_wrong": MessageLookupByLibrary.simpleMessage(
            "Oh nein! Ein Fehler ist aufgetreten 🥲"),
        "open_app_settings":
            MessageLookupByLibrary.simpleMessage("App-Einstellungen öffnen"),
        "open_in_browser":
            MessageLookupByLibrary.simpleMessage("Im Browser öffnen"),
        "option_confirm_close_description":
            MessageLookupByLibrary.simpleMessage(
                "Das Beenden der Anwendung bestätigen"),
        "option_confirm_close_label":
            MessageLookupByLibrary.simpleMessage("Beenden bestätigen"),
        "page_not_found": MessageLookupByLibrary.simpleMessage(
            "Twitter/X behauptet diese Seite existiere nicht"),
        "permission_not_granted": MessageLookupByLibrary.simpleMessage(
            "Berechtigung nicht erteilt. Versuche es nach der Erteilung erneut!"),
        "pick_a_color":
            MessageLookupByLibrary.simpleMessage("Wähle eine Farbe!"),
        "pick_an_icon":
            MessageLookupByLibrary.simpleMessage("Wähle ein Symbol!"),
        "pinned_tweet":
            MessageLookupByLibrary.simpleMessage("Angehefteter Tweet"),
        "playback_speed":
            MessageLookupByLibrary.simpleMessage("Wiedergabegeschwindigkeit"),
        "please_check_your_internet_connection_error_message": m10,
        "please_enter_a_name":
            MessageLookupByLibrary.simpleMessage("Bitte einen Namen eingeben"),
        "please_make_sure_the_data_you_wish_to_import_is_located_there_then_press_the_import_button_below":
            MessageLookupByLibrary.simpleMessage(
                "Vergewisser dich, dass sich die zu importierenden Daten dort befinden und klicke dann auf die Importieren-Schaltfläche unten."),
        "please_note_that_the_method_fritter_uses_to_import_subscriptions_is_heavily_rate_limited_by_twitter_so_this_may_fail_if_you_have_a_lot_of_followed_accounts":
            MessageLookupByLibrary.simpleMessage(
                "Bitte beachte, dass Squawker zum Importieren der Abonnements eine von Twitter/X stark durchsatzratenbegrenzte Methode verwendet. Der Import schlägt möglicherweise fehl, wenn du vielen Accounts folgst."),
        "possibly_sensitive":
            MessageLookupByLibrary.simpleMessage("Potentiell anstößig"),
        "possibly_sensitive_profile": MessageLookupByLibrary.simpleMessage(
            "Auf diesem Profil befinden sich potentiell anstößige Bilder, Sprache oder anderes Material. Willst du es wirklich sehen?"),
        "possibly_sensitive_tweet": MessageLookupByLibrary.simpleMessage(
            "Dieser Tweet könnte anstößiges Material enthalten. Möchtest du den Tweet sehen?"),
        "prefix": MessageLookupByLibrary.simpleMessage("Präfix"),
        "private_profile":
            MessageLookupByLibrary.simpleMessage("Privates Profil"),
        "released_under_the_mit_license": MessageLookupByLibrary.simpleMessage(
            "Unter der MIT-Lizenz herausgegeben"),
        "remove_from_feed":
            MessageLookupByLibrary.simpleMessage("Vom Feed entfernen"),
        "replying_to": MessageLookupByLibrary.simpleMessage("Antwort auf"),
        "report": MessageLookupByLibrary.simpleMessage("Bericht"),
        "report_a_bug": MessageLookupByLibrary.simpleMessage("Fehler melden"),
        "reporting_an_error":
            MessageLookupByLibrary.simpleMessage("Fehler melden"),
        "reset_home_pages":
            MessageLookupByLibrary.simpleMessage("Startseite zurücksetzen"),
        "retry": MessageLookupByLibrary.simpleMessage("Erneut versuchen"),
        "save": MessageLookupByLibrary.simpleMessage("Speichern"),
        "save_bandwidth_using_smaller_images":
            MessageLookupByLibrary.simpleMessage(
                "Datennutzung mittels kleinerer Auflösung sparen"),
        "saved": MessageLookupByLibrary.simpleMessage("Archiv"),
        "saved_tweet_too_large": MessageLookupByLibrary.simpleMessage(
            "Der gespeicherte Tweet konnte nicht geladen werden, da er zu groß ist. Bitte melde das Problem den Entwicklern."),
        "search": MessageLookupByLibrary.simpleMessage("Suche"),
        "search_term": MessageLookupByLibrary.simpleMessage("Suchbegriff"),
        "select": MessageLookupByLibrary.simpleMessage("Auswählen"),
        "selecting_individual_accounts_to_import_and_assigning_groups_are_both_planned_for_the_future_already":
            MessageLookupByLibrary.simpleMessage(
                "Die Auswahl einzelner Accounts zum Importieren und die Zuweisung zu Gruppen sind bereits in Planung!"),
        "send": MessageLookupByLibrary.simpleMessage("Senden"),
        "settings": MessageLookupByLibrary.simpleMessage("Einstellungen"),
        "share_base_url":
            MessageLookupByLibrary.simpleMessage("Eigene Teilen-URL"),
        "share_base_url_description": MessageLookupByLibrary.simpleMessage(
            "Nutze beim Teilen eine andere Basisadresse"),
        "share_tweet_content":
            MessageLookupByLibrary.simpleMessage("Tweet-Inhalt teilen"),
        "share_tweet_content_and_link": MessageLookupByLibrary.simpleMessage(
            "Tweet-Inhalt und Link teilen"),
        "share_tweet_link":
            MessageLookupByLibrary.simpleMessage("Tweet-Link teilen"),
        "should_check_for_updates_description":
            MessageLookupByLibrary.simpleMessage(
                "Beim Start von Squawker nach Aktualisierungen suchen"),
        "should_check_for_updates_label": MessageLookupByLibrary.simpleMessage(
            "Nach Aktualisierungen suchen"),
        "small": MessageLookupByLibrary.simpleMessage("Klein"),
        "something_broke_in_fritter": MessageLookupByLibrary.simpleMessage(
            "Etwas in Squawker ist kaputt."),
        "something_just_went_wrong_in_fritter_and_an_error_report_has_been_generated":
            MessageLookupByLibrary.simpleMessage(
                "Etwas ist schief gelaufen und ein Fehlerbericht wurde erstellt. Der Bericht kann an die Squawker-Entwickler gesendet werden, um bei der Problembehebung zu helfen."),
        "sorry_the_replied_tweet_could_not_be_found":
            MessageLookupByLibrary.simpleMessage(
                "Entschuldigung! Der beantwortete Tweet konnte nicht gefunden werden!"),
        "subscribe": MessageLookupByLibrary.simpleMessage("Abonnieren"),
        "subscriptions": MessageLookupByLibrary.simpleMessage("Abos"),
        "subtitles": MessageLookupByLibrary.simpleMessage("Untertitel"),
        "successfully_saved_the_media":
            MessageLookupByLibrary.simpleMessage("Datei gespeichert!"),
        "system": MessageLookupByLibrary.simpleMessage("System"),
        "tap_to_download_release_version": m11,
        "tap_to_show_getMediaType_item_type": m12,
        "thanks_for_helping_fritter": MessageLookupByLibrary.simpleMessage(
            "Danke, dass du Squawker unterstützt! 💖"),
        "the_file_does_not_exist_please_ensure_it_is_located_at_file_path": m13,
        "the_github_issue":
            MessageLookupByLibrary.simpleMessage("dem GitHub-Issue (#143)"),
        "the_tweet_did_not_contain_any_text_this_is_unexpected":
            MessageLookupByLibrary.simpleMessage(
                "Der Tweet enthält keinen Text. Das kommt unerwartet"),
        "theme": MessageLookupByLibrary.simpleMessage("Design"),
        "theme_mode": MessageLookupByLibrary.simpleMessage("Design-Modus"),
        "there_were_no_trends_returned_this_is_unexpected_please_report_as_a_bug_if_possible":
            MessageLookupByLibrary.simpleMessage(
                "Keine Trends gefunden. Das kommt unerwartet! Bitte, falls möglich, Fehler melden."),
        "this_group_contains_no_subscriptions":
            MessageLookupByLibrary.simpleMessage(
                "Diese Gruppe enthält keine Abonnements!"),
        "this_took_too_long_to_load_please_check_your_network_connection":
            MessageLookupByLibrary.simpleMessage(
                "Das Laden hat zu lange gedauert. Überprüfe deine Internetverbindung!"),
        "this_tweet_is_unavailable": MessageLookupByLibrary.simpleMessage(
            "Dieser Tweet ist nicht verfügbar. Er wurde wahrscheinlich gelöscht."),
        "this_tweet_user_name_retweeted": m14,
        "this_user_does_not_follow_anyone":
            MessageLookupByLibrary.simpleMessage(
                "Dieser Nutzer folgt niemandem!"),
        "this_user_does_not_have_anyone_following_them":
            MessageLookupByLibrary.simpleMessage(
                "Dieser Nutzer hat keine Follower!"),
        "thread": MessageLookupByLibrary.simpleMessage("Diskussionsfaden"),
        "thumbnail": MessageLookupByLibrary.simpleMessage("Vorschaubild"),
        "thumbnail_not_available": MessageLookupByLibrary.simpleMessage(
            "Vorschaubild nicht verfügbar"),
        "timed_out": MessageLookupByLibrary.simpleMessage("Zeit abgelaufen"),
        "to_import_subscriptions_from_an_existing_twitter_account_enter_your_username_below":
            MessageLookupByLibrary.simpleMessage(
                "Gebe unten deinen Nutzernamen an, um Abonnements von einem bestehenden Twitter/X-Konto zu importieren."),
        "toggle_all": MessageLookupByLibrary.simpleMessage("Alle auswählen"),
        "trending": MessageLookupByLibrary.simpleMessage("Trends"),
        "trends": MessageLookupByLibrary.simpleMessage("Trends"),
        "true_black": MessageLookupByLibrary.simpleMessage("Reines Schwarz?"),
        "tweet_font_size_description":
            MessageLookupByLibrary.simpleMessage("Schriftgröße der Tweets"),
        "tweet_font_size_label":
            MessageLookupByLibrary.simpleMessage("Schriftgröße"),
        "tweets": MessageLookupByLibrary.simpleMessage("Tweets"),
        "tweets_and_replies":
            MessageLookupByLibrary.simpleMessage("Tweets & Antworten"),
        "tweets_number": m15,
        "two_home_pages_required": MessageLookupByLibrary.simpleMessage(
            "Du musst mindestens 2 Tabs auf der Startseite haben."),
        "unable_to_find_the_available_trend_locations":
            MessageLookupByLibrary.simpleMessage(
                "Die verfügbaren Trend-Regionen konnten nicht gefunden werden."),
        "unable_to_find_your_saved_tweets":
            MessageLookupByLibrary.simpleMessage(
                "Gespeicherte Tweets können nicht gefunden werden."),
        "unable_to_import":
            MessageLookupByLibrary.simpleMessage("Import nicht möglich"),
        "unable_to_load_home_pages": MessageLookupByLibrary.simpleMessage(
            "Laden der Startseite nicht möglich"),
        "unable_to_load_subscription_groups":
            MessageLookupByLibrary.simpleMessage(
                "Abo-Gruppen können nicht geladen werden"),
        "unable_to_load_the_group": MessageLookupByLibrary.simpleMessage(
            "Die Abo-Gruppe konnte nicht geladen werden"),
        "unable_to_load_the_group_settings": MessageLookupByLibrary.simpleMessage(
            "Die Einstellungen für die Abo-Gruppe konnten nicht geladen werden"),
        "unable_to_load_the_list_of_follows":
            MessageLookupByLibrary.simpleMessage(
                "Die Liste der Follower kann nicht geladen werden"),
        "unable_to_load_the_next_page_of_follows":
            MessageLookupByLibrary.simpleMessage(
                "Die weiteren Follower können nicht geladen werden"),
        "unable_to_load_the_next_page_of_replies":
            MessageLookupByLibrary.simpleMessage(
                "Nächste Antworten können nicht geladen werden"),
        "unable_to_load_the_next_page_of_tweets":
            MessageLookupByLibrary.simpleMessage(
                "Die nächsten Tweets können nicht geladen werden"),
        "unable_to_load_the_profile": MessageLookupByLibrary.simpleMessage(
            "Das Profil kann nicht geladen werden"),
        "unable_to_load_the_search_results":
            MessageLookupByLibrary.simpleMessage(
                "Die Suchergebnisse können nicht geladen werden."),
        "unable_to_load_the_trends_for_widget_place_name": m16,
        "unable_to_load_the_tweet": MessageLookupByLibrary.simpleMessage(
            "Der Tweet kann nicht geladen werden"),
        "unable_to_load_the_tweets": MessageLookupByLibrary.simpleMessage(
            "Die Tweets können nicht geladen werden"),
        "unable_to_load_the_tweets_for_the_feed":
            MessageLookupByLibrary.simpleMessage(
                "Die Tweets für die Timeline können nicht geladen werden"),
        "unable_to_refresh_the_subscriptions":
            MessageLookupByLibrary.simpleMessage(
                "Abonnements konnten nicht aktualisiert werden"),
        "unable_to_run_the_database_migrations":
            MessageLookupByLibrary.simpleMessage(
                "Die Datenbankmigrationen können nicht ausgeführt werden"),
        "unable_to_save_the_media_twitter_returned_a_status_of_response_statusCode":
            m17,
        "unable_to_stream_the_trend_location_preference":
            MessageLookupByLibrary.simpleMessage(
                "Die Trendortpräferenz kann nicht gestreamt werden"),
        "unknown": MessageLookupByLibrary.simpleMessage("Unbekannt"),
        "unsave": MessageLookupByLibrary.simpleMessage("Nicht mehr speichern"),
        "unsubscribe": MessageLookupByLibrary.simpleMessage("Deabonnieren"),
        "unsupported_url":
            MessageLookupByLibrary.simpleMessage("Nicht unterstützte URL"),
        "update_to_release_version_through_your_fdroid_client": m18,
        "updates": MessageLookupByLibrary.simpleMessage("Updates"),
        "use_true_black_for_the_dark_mode_theme":
            MessageLookupByLibrary.simpleMessage(
                "Reines Schwarz für dunkles Design verwenden"),
        "user_not_found":
            MessageLookupByLibrary.simpleMessage("Nutzer wurde nicht gefunden"),
        "username": MessageLookupByLibrary.simpleMessage("@Nutzername"),
        "version": MessageLookupByLibrary.simpleMessage("Version"),
        "when_a_new_app_update_is_available":
            MessageLookupByLibrary.simpleMessage(
                "Sobald ein neues Update der App verfügbar ist"),
        "whether_errors_should_be_reported_to_":
            MessageLookupByLibrary.simpleMessage(
                "Ob Fehlermeldungen an  gesendet werden sollen"),
        "whether_to_hide_tweets_marked_as_sensitive":
            MessageLookupByLibrary.simpleMessage(
                "Ob Tweets, die als anstößig gekennzeichnet sind, ausgeblendet werden sollen"),
        "which_tab_is_shown_when_the_app_opens":
            MessageLookupByLibrary.simpleMessage(
                "Welcher Tab beim Öffnen der App angezeigt wird"),
        "would_you_like_to_enable_automatic_error_reporting":
            MessageLookupByLibrary.simpleMessage(
                "Möchtest du die automatische Fehlermeldungen aktivieren?"),
        "yes": MessageLookupByLibrary.simpleMessage("Ja"),
        "yes_please": MessageLookupByLibrary.simpleMessage("Ja bitte"),
        "you_have_not_saved_any_tweets_yet":
            MessageLookupByLibrary.simpleMessage(
                "Du hast noch keine Tweets gespeichert!"),
        "you_must_have_at_least_2_home_screen_pages":
            MessageLookupByLibrary.simpleMessage(
                "Du musst mindestens 2 Tabs auf der Startseite haben"),
        "your_profile_must_be_public_otherwise_the_import_will_not_work":
            MessageLookupByLibrary.simpleMessage(
                "Ein öffentliches Profil ist erforderlich, sonst funktioniert der Import nicht"),
        "your_report_will_be_sent_to_fritter__project":
            MessageLookupByLibrary.simpleMessage(
                "Deine Meldung wird an Squawkers -Projektseite gesendet. Einzelheiten zum Datenschutz findest du unter:")
      };
}
