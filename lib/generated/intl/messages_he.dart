// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a he locale. All the
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
  String get localeName => 'he';

  static String m0(name) =>
      "האם אתה בטוח שברצונך למחוק את קבוצת המנויים ${name}?";

  static String m1(fileName) => "נתונים נשמרו בשם ${fileName}";

  static String m2(fullPath) => "נתונים נשמרו ב ${fullPath}";

  static String m3(timeagoFormat) => "הסתיים ${timeagoFormat}";

  static String m4(timeagoFormat) => "מסתיים ${timeagoFormat}";

  static String m5(snapshotData) => "הסתיים עם משתמשי ${snapshotData}";

  static String m6(name) => "${name}";

  static String m7(snapshotData) => "משתמשי ${snapshotData} יובאו עד כה";

  static String m8(date) => "הצטרף ב-${date}";

  static String m9(nbrGuestAccounts) =>
      "ישנם ${nbrGuestAccounts} חשבונות אורחים";

  static String m10(num, numFormatted) =>
      "${Intl.plural(num, zero: 'אין הצבעות', one: 'הצבעה אחת', two: 'שתי הצבעות', few: '${numFormatted} הצבעות', many: '${numFormatted} הצבעות', other: '${numFormatted} הצבעות')}";

  static String m11(errorMessage) =>
      "אנא בדוק את חיבור האינטרנט שלך.\n\n${errorMessage}";

  static String m12(nbrRegularAccounts) =>
      "חשבונות רגילים (${nbrRegularAccounts}):";

  static String m13(releaseVersion) => "הקש כדי להוריד את ${releaseVersion}";

  static String m14(getMediaType) => "הקש כדי להציג את ${getMediaType}";

  static String m15(filePath) => "הקובץ לא קיים. ודא שהוא ממוקם ב-${filePath}";

  static String m16(thisTweetUserName, timeAgo) =>
      "${thisTweetUserName} צייץ מחדש ${timeAgo}";

  static String m17(num, numFormatted) =>
      "${Intl.plural(num, zero: 'אין ציוצים', one: 'ציוץ', two: 'שתי ציוצים', few: '${numFormatted} ציוצים', many: '${numFormatted} ציוצים', other: '${numFormatted} tweets')}";

  static String m18(widgetPlaceName) =>
      "לא ניתן לטעון את הפוסטים פופולארי עבור ${widgetPlaceName}";

  static String m19(responseStatusCode) =>
      "לא ניתן לשמור את המדיה. Twitter/X החזיר סטטוס של ${responseStatusCode}";

  static String m20(releaseVersion) =>
      "עדכן ל-${releaseVersion} דרך לקוח ה-F-Droid שלך";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("אודות"),
    "account": MessageLookupByLibrary.simpleMessage("חשבון"),
    "account_suspended": MessageLookupByLibrary.simpleMessage("החשבון הושעה"),
    "activate_non_confirmation_bias_mode_description":
        MessageLookupByLibrary.simpleMessage(
          "הסתר מחברי ציוץ. הימנע מהטיית אישור המבוססת על טיעונים סמכותיים.",
        ),
    "activate_non_confirmation_bias_mode_label":
        MessageLookupByLibrary.simpleMessage("הפעל מצב הטיה ללא אישור"),
    "add_account": MessageLookupByLibrary.simpleMessage("הוסף חשבון"),
    "add_account_title": MessageLookupByLibrary.simpleMessage("הוסף חשבון"),
    "add_subscriptions": MessageLookupByLibrary.simpleMessage("הוסף מנויים"),
    "add_to_feed": MessageLookupByLibrary.simpleMessage("הוסף לעדכון"),
    "add_to_group": MessageLookupByLibrary.simpleMessage("הוסף לקבוצה"),
    "all": MessageLookupByLibrary.simpleMessage("כל"),
    "all_the_great_software_used_by_fritter":
        MessageLookupByLibrary.simpleMessage(
          "כל התוכנות הנהדרות שבהן משתמש Squawker",
        ),
    "allow_background_play_description": MessageLookupByLibrary.simpleMessage(
      "אפשר להפעיל ברקע",
    ),
    "allow_background_play_label": MessageLookupByLibrary.simpleMessage(
      "הפעל ברקע",
    ),
    "allow_background_play_other_apps_description":
        MessageLookupByLibrary.simpleMessage(
          "אפשר לאפליקציות אחרות לפעול ברקע",
        ),
    "allow_background_play_other_apps_label":
        MessageLookupByLibrary.simpleMessage("אפליקציות אחרות ברקע"),
    "an_update_for_fritter_is_available": MessageLookupByLibrary.simpleMessage(
      "עדכון Squawker זמין! 🚀",
    ),
    "api_key": MessageLookupByLibrary.simpleMessage("מפתח API"),
    "app_info": MessageLookupByLibrary.simpleMessage("מידע על האפליקציה"),
    "are_you_sure": MessageLookupByLibrary.simpleMessage("אתה בטוח?"),
    "are_you_sure_you_want_to_delete_the_subscription_group_name_of_group": m0,
    "back": MessageLookupByLibrary.simpleMessage("חזרה"),
    "bad_guest_token": MessageLookupByLibrary.simpleMessage(
      "Twitter/X ביטל את מפתח הגישה שלנו. אנא נסה לפתוח מחדש את Squawker!",
    ),
    "beta": MessageLookupByLibrary.simpleMessage("בטא"),
    "blue_theme_based_on_the_twitter_color_scheme":
        MessageLookupByLibrary.simpleMessage(
          "עיצוב אפליקציה כחול המבוססת על ערכת הצבעים של Twitter/X",
        ),
    "cancel": MessageLookupByLibrary.simpleMessage("בטל"),
    "catastrophic_failure": MessageLookupByLibrary.simpleMessage(
      "כישלון קטסטרופלי",
    ),
    "choose": MessageLookupByLibrary.simpleMessage("לבחור"),
    "choose_pages": MessageLookupByLibrary.simpleMessage("בחר דפים"),
    "close": MessageLookupByLibrary.simpleMessage("סגור"),
    "community_notes_title": MessageLookupByLibrary.simpleMessage(
      "תוכן שקוראים הוסיפו",
    ),
    "confirm_close_fritter": MessageLookupByLibrary.simpleMessage(
      "האם אתה בטוח שברצונך לסגור את Squawker?",
    ),
    "contribute": MessageLookupByLibrary.simpleMessage("לתרום"),
    "copied_address_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "הכתובת הועתקה ללוח",
    ),
    "copied_version_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "הגרסה הועתקה ללוח",
    ),
    "could_not_contact_twitter": MessageLookupByLibrary.simpleMessage(
      "לא ניתן ליצור קשר עם Twitter/X",
    ),
    "could_not_find_any_tweets_by_this_user":
        MessageLookupByLibrary.simpleMessage(
          "לא ניתן היה למצוא ציוצים של משתמש זה!",
        ),
    "could_not_find_any_tweets_from_the_last_7_days":
        MessageLookupByLibrary.simpleMessage(
          "לא ניתן היה למצוא ציוצים מ-7 הימים האחרונים!",
        ),
    "country": MessageLookupByLibrary.simpleMessage("מדינה"),
    "dark": MessageLookupByLibrary.simpleMessage("כהה"),
    "data": MessageLookupByLibrary.simpleMessage("נתונים"),
    "data_exported_to_fileName": m1,
    "data_exported_to_fullPath": m2,
    "data_imported_successfully": MessageLookupByLibrary.simpleMessage(
      "הנתונים יובאו בהצלחה",
    ),
    "date_created": MessageLookupByLibrary.simpleMessage("תאריך יצירה"),
    "date_subscribed": MessageLookupByLibrary.simpleMessage("תאריך הרשמה"),
    "default_subscription_tab": MessageLookupByLibrary.simpleMessage(
      "כרטיסיית ברירת המחדל של מנוי",
    ),
    "default_tab": MessageLookupByLibrary.simpleMessage("כרטיסיית ברירת מחדל"),
    "delete": MessageLookupByLibrary.simpleMessage("מחק"),
    "disable_screenshots": MessageLookupByLibrary.simpleMessage(
      "השבת צילומי מסך",
    ),
    "disable_screenshots_hint": MessageLookupByLibrary.simpleMessage(
      "מנע צילום מסך. ייתכן שזה לא יעבוד בכל המכשירים.",
    ),
    "disabled": MessageLookupByLibrary.simpleMessage("השבת"),
    "doesnt_work_without_account": MessageLookupByLibrary.simpleMessage(
      "Squawker לא עובד ללא חשבון משתמש",
    ),
    "donate": MessageLookupByLibrary.simpleMessage("תרום"),
    "download": MessageLookupByLibrary.simpleMessage("הורדה"),
    "download_handling": MessageLookupByLibrary.simpleMessage("טיפול בהורדות"),
    "download_handling_description": MessageLookupByLibrary.simpleMessage(
      "איך הורדה צריכה לעבוד",
    ),
    "download_handling_type_ask": MessageLookupByLibrary.simpleMessage(
      "שאל תמיד",
    ),
    "download_handling_type_directory": MessageLookupByLibrary.simpleMessage(
      "שמור בתיקייה",
    ),
    "download_media_no_url": MessageLookupByLibrary.simpleMessage(
      "לא ניתן להוריד. מדיה זו עשויה להיות זמינה רק כזרם, ש-Squawker עדיין לא יכול להוריד.",
    ),
    "download_path": MessageLookupByLibrary.simpleMessage("נתיב הורדה"),
    "download_video_best_quality_description":
        MessageLookupByLibrary.simpleMessage(
          "הורד סרטונים באיכות הטובה והזמינה ביותר",
        ),
    "download_video_best_quality_label": MessageLookupByLibrary.simpleMessage(
      "הורד סרטונים באיכות הטובה ביותר",
    ),
    "downloading_media": MessageLookupByLibrary.simpleMessage("מוריד מדיה…"),
    "edit_account_title": MessageLookupByLibrary.simpleMessage("שנה חשבון"),
    "email_label": MessageLookupByLibrary.simpleMessage("אימייל:"),
    "enable_": MessageLookupByLibrary.simpleMessage("לאפשר?"),
    "ended_timeago_format_endsAt_allowFromNow_true": m3,
    "ends_timeago_format_endsAt_allowFromNow_true": m4,
    "enhanced_feeds_description": MessageLookupByLibrary.simpleMessage(
      "בקשות משופרות לעידכונים (אך עם מגבלות תעריף נמוכות יותר)",
    ),
    "enhanced_feeds_label": MessageLookupByLibrary.simpleMessage(
      "עידכונים משופרים",
    ),
    "enhanced_profile_description": MessageLookupByLibrary.simpleMessage(
      "בקשות משופרות לפרופיל",
    ),
    "enhanced_profile_label": MessageLookupByLibrary.simpleMessage(
      "פרופיל משופר",
    ),
    "enhanced_searches_description": MessageLookupByLibrary.simpleMessage(
      "בקשות משופרות לחיפושים (אך עם מגבלות תעריף נמוכות יותר)",
    ),
    "enhanced_searches_label": MessageLookupByLibrary.simpleMessage(
      "חיפושים משופרים",
    ),
    "enter_comma_separated_twitter_usernames":
        MessageLookupByLibrary.simpleMessage(
          "הזן את שמות המשתמש שלך בטוויטר/X מופרדים בפסיק",
        ),
    "enter_your_twitter_username": MessageLookupByLibrary.simpleMessage(
      "הזן את שם המשתמש שלך בטוויטר/X",
    ),
    "error_from_twitter": MessageLookupByLibrary.simpleMessage(
      "שגיאה מ-Twitter/X",
    ),
    "exclusions_feed_description": MessageLookupByLibrary.simpleMessage(
      "רשימה של שמות משתמש להחרגה מהפיד",
    ),
    "exclusions_feed_label": MessageLookupByLibrary.simpleMessage(
      "אי הכללות בפיד",
    ),
    "export": MessageLookupByLibrary.simpleMessage("ייצוא"),
    "export_guest_accounts": MessageLookupByLibrary.simpleMessage(
      "לייצא חשבונות אורחים?",
    ),
    "export_settings": MessageLookupByLibrary.simpleMessage("לייצא הגדרות?"),
    "export_subscription_group_members": MessageLookupByLibrary.simpleMessage(
      "לייצא רשימת המנויים בקבוצה?",
    ),
    "export_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "לייצא קבוצות מנויים?",
    ),
    "export_subscriptions": MessageLookupByLibrary.simpleMessage(
      "לייצא מנויים?",
    ),
    "export_tweets": MessageLookupByLibrary.simpleMessage("לייצא ציוצים?"),
    "export_twitter_tokens": MessageLookupByLibrary.simpleMessage(
      "לייצא אסימוני Twitter/X?",
    ),
    "export_your_data": MessageLookupByLibrary.simpleMessage(
      "ייצא את הנתונים שלך",
    ),
    "feed": MessageLookupByLibrary.simpleMessage("פיד"),
    "filters": MessageLookupByLibrary.simpleMessage("פילטרים"),
    "finish": MessageLookupByLibrary.simpleMessage("סיים"),
    "finished_with_snapshotData_users": m5,
    "followers": MessageLookupByLibrary.simpleMessage("עוקבים"),
    "following": MessageLookupByLibrary.simpleMessage("במעקב"),
    "forbidden": MessageLookupByLibrary.simpleMessage("הגישה חסומה"),
    "fritter": MessageLookupByLibrary.simpleMessage("Squawker"),
    "fritter_blue": MessageLookupByLibrary.simpleMessage("כחול Squawker"),
    "functionality_unsupported": MessageLookupByLibrary.simpleMessage(
      "פונקציונליות זו אינה נתמכת עוד על ידי Twitter/X!",
    ),
    "general": MessageLookupByLibrary.simpleMessage("כללי"),
    "generic_username": MessageLookupByLibrary.simpleMessage("משתמש"),
    "group_name": m6,
    "groups": MessageLookupByLibrary.simpleMessage("קבוצות"),
    "help_make_fritter_even_better": MessageLookupByLibrary.simpleMessage(
      "עזור להפוך את Squawker לאפילו יותר טוב",
    ),
    "help_support_fritters_future": MessageLookupByLibrary.simpleMessage(
      "עזור לתמוך בעתידו של Squawker",
    ),
    "hide_sensitive_tweets": MessageLookupByLibrary.simpleMessage(
      "הסתר ציוצים רגישים",
    ),
    "home": MessageLookupByLibrary.simpleMessage("בית"),
    "if_you_have_any_feedback_on_this_feature_please_leave_it_on":
        MessageLookupByLibrary.simpleMessage(
          "אם יש לך משוב על תכונה זו, אנא יידעו אותנו",
        ),
    "import": MessageLookupByLibrary.simpleMessage("ייבא"),
    "import_data_from_another_device": MessageLookupByLibrary.simpleMessage(
      "ייבא נתונים ממכשירים אחרים",
    ),
    "import_from_twitter": MessageLookupByLibrary.simpleMessage(
      "ייבוא מטוויטר/X",
    ),
    "import_subscriptions": MessageLookupByLibrary.simpleMessage("ייבא מנויים"),
    "imported_snapshot_data_users_so_far": m7,
    "include_replies": MessageLookupByLibrary.simpleMessage("כלול תגובות"),
    "include_retweets": MessageLookupByLibrary.simpleMessage(
      "כלול ציוצים מחדש",
    ),
    "joined": m8,
    "keep_feed_offset_description": MessageLookupByLibrary.simpleMessage(
      "היסט ציר הזמן נשמר עבור עדכונים כאשר האפליקציה מופעלת מחדש",
    ),
    "keep_feed_offset_label": MessageLookupByLibrary.simpleMessage(
      "שמור על היסט הזנות",
    ),
    "language": MessageLookupByLibrary.simpleMessage("שפה"),
    "language_subtitle": MessageLookupByLibrary.simpleMessage(
      "דורש הפעלה מחדש",
    ),
    "large": MessageLookupByLibrary.simpleMessage("גדול"),
    "leaner_feeds_description": MessageLookupByLibrary.simpleMessage(
      "קישורי תצוגה מקדימה אינם מוצגים בטוויטים מפידים",
    ),
    "leaner_feeds_label": MessageLookupByLibrary.simpleMessage("פיד קצרים"),
    "legacy_android_import": MessageLookupByLibrary.simpleMessage(
      "ייבוא אנדרואיד מדור קודם",
    ),
    "let_the_developers_know_if_something_is_broken":
        MessageLookupByLibrary.simpleMessage("יידע את המפתחים אם משהו לא עובד"),
    "libre_translate_host": MessageLookupByLibrary.simpleMessage(
      "מארח LibreTranslate",
    ),
    "licenses": MessageLookupByLibrary.simpleMessage("רשיון"),
    "light": MessageLookupByLibrary.simpleMessage("בהיר"),
    "live": MessageLookupByLibrary.simpleMessage("שידור חי"),
    "logging": MessageLookupByLibrary.simpleMessage("רישום"),
    "login": MessageLookupByLibrary.simpleMessage("התחבר"),
    "mandatory_label": MessageLookupByLibrary.simpleMessage("שדות חובה:"),
    "material_3": MessageLookupByLibrary.simpleMessage("חומר 3?"),
    "media": MessageLookupByLibrary.simpleMessage("מדיה"),
    "media_size": MessageLookupByLibrary.simpleMessage("גודל מדיה"),
    "medium": MessageLookupByLibrary.simpleMessage("בינוני"),
    "missing_page": MessageLookupByLibrary.simpleMessage("דף חסר"),
    "mute_video_description": MessageLookupByLibrary.simpleMessage(
      "האם ברצונך להשתיק סרטונים כברירת מחדל",
    ),
    "mute_videos": MessageLookupByLibrary.simpleMessage("השתקת סרטונים"),
    "name": MessageLookupByLibrary.simpleMessage("שם"),
    "name_label": MessageLookupByLibrary.simpleMessage("שם:"),
    "nbr_guest_accounts": m9,
    "newTrans": MessageLookupByLibrary.simpleMessage("חדש"),
    "next": MessageLookupByLibrary.simpleMessage("הבא"),
    "no": MessageLookupByLibrary.simpleMessage("לא"),
    "no_data_was_returned_which_should_never_happen_please_report_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "לא הוחזרו נתונים, מה שלא הגיוני שיקרה. אנא דווח על באג, אם אפשר!",
        ),
    "no_results": MessageLookupByLibrary.simpleMessage("אין תוצאות"),
    "no_results_for": MessageLookupByLibrary.simpleMessage("אין תוצאות עבור:"),
    "no_subscriptions_try_searching_or_importing_some":
        MessageLookupByLibrary.simpleMessage(
          "אין מנויים. נסה לחפש או לייבא כמה!",
        ),
    "not_logged_in": MessageLookupByLibrary.simpleMessage("לא מחובר לחשבון"),
    "not_set": MessageLookupByLibrary.simpleMessage("לא הוגדר"),
    "note_due_to_a_twitter_limitation_not_all_tweets_may_be_included":
        MessageLookupByLibrary.simpleMessage(
          "הערה: עקב מגבלה של Twitter/X, ייתכן שלא כל הציוצים ייכללו",
        ),
    "numberFormat_format_total_votes": m10,
    "ok": MessageLookupByLibrary.simpleMessage("בסדר"),
    "only_public_subscriptions_can_be_imported":
        MessageLookupByLibrary.simpleMessage(
          "ניתן לייבא מנויים רק מפרופילים ציבוריים",
        ),
    "oops_something_went_wrong": MessageLookupByLibrary.simpleMessage(
      "אופס! משהו השתבש 🥲",
    ),
    "open_app_settings": MessageLookupByLibrary.simpleMessage(
      "פתח הגדרות אפליקציה",
    ),
    "open_in_browser": MessageLookupByLibrary.simpleMessage("פתח בדפדפן"),
    "option_confirm_close_description": MessageLookupByLibrary.simpleMessage(
      "אשר בעת סגירת האפליקציה",
    ),
    "option_confirm_close_label": MessageLookupByLibrary.simpleMessage(
      "אשר סגירה",
    ),
    "option_navigation_animations_description":
        MessageLookupByLibrary.simpleMessage("אפשר אנימציות ניווט"),
    "option_navigation_animations_label": MessageLookupByLibrary.simpleMessage(
      "אנימציות ניווט",
    ),
    "option_show_navigation_labels_description":
        MessageLookupByLibrary.simpleMessage(
          "הצג את התוויות מסמלי סרגל הניווט",
        ),
    "option_show_navigation_labels_label": MessageLookupByLibrary.simpleMessage(
      "תוויות סרגל ניווט",
    ),
    "optional_label": MessageLookupByLibrary.simpleMessage("שדות אופציונליים:"),
    "page_not_found": MessageLookupByLibrary.simpleMessage(
      "Twitter/X השיב שהדף לא קיים, אבל לא בטוח שזה נכון",
    ),
    "password_label": MessageLookupByLibrary.simpleMessage("סיסמה:"),
    "permission_not_granted": MessageLookupByLibrary.simpleMessage(
      "הרשאה לא אושרה. נא לאשר הרשאה ולנסות שוב!",
    ),
    "phone_label": MessageLookupByLibrary.simpleMessage("טלפון:"),
    "pick_a_color": MessageLookupByLibrary.simpleMessage("בחר צבע!"),
    "pick_an_icon": MessageLookupByLibrary.simpleMessage("בחר סמל!"),
    "pinned_tweet": MessageLookupByLibrary.simpleMessage("ציוץ מוצמד"),
    "playback_speed": MessageLookupByLibrary.simpleMessage("מהירות השמעה"),
    "please_check_your_internet_connection_error_message": m11,
    "please_enter_a_name": MessageLookupByLibrary.simpleMessage("נא הקלד שם"),
    "please_make_sure_the_data_you_wish_to_import_is_located_there_then_press_the_import_button_below":
        MessageLookupByLibrary.simpleMessage(
          "אנא ודא שהנתונים שברצונך לייבא נמצאים שם, ולאחר מכן לחץ על כפתור הייבוא למטה.",
        ),
    "please_note_that_the_method_fritter_uses_to_import_subscriptions_is_heavily_rate_limited_by_twitter_so_this_may_fail_if_you_have_a_lot_of_followed_accounts":
        MessageLookupByLibrary.simpleMessage(
          "שים לב שהשיטה שבה משתמשת Squawker לייבא מנויים מוגבלת מאוד על ידי Twitter/X, כך שההתחברות עלולה להיכשל אם יש לך הרבה חשבונות שעוקבים אחריך.",
        ),
    "possibly_sensitive": MessageLookupByLibrary.simpleMessage(
      "פוטנציאלי רגיש",
    ),
    "possibly_sensitive_profile": MessageLookupByLibrary.simpleMessage(
      "פרופיל זה עשוי לכלול תמונות, שפה או תוכן אחר שעלול להיות רגיש. האם אתה עדיין רוצה לצפות בו?",
    ),
    "possibly_sensitive_tweet": MessageLookupByLibrary.simpleMessage(
      "הציוץ הזה מכיל תוכן שעלול להיות רגיש. האם תרצה לצפות בו?",
    ),
    "prefix": MessageLookupByLibrary.simpleMessage("קידומת"),
    "private_profile": MessageLookupByLibrary.simpleMessage("פרופיל פרטי"),
    "proxy_description": MessageLookupByLibrary.simpleMessage(
      "פרוקסי לכל הבקשות",
    ),
    "proxy_error": MessageLookupByLibrary.simpleMessage("שגיאת פרוקסי"),
    "proxy_label": MessageLookupByLibrary.simpleMessage("פרוקסי"),
    "regular_accounts": m12,
    "released_under_the_mit_license": MessageLookupByLibrary.simpleMessage(
      "שוחרר תחת רישיון MIT",
    ),
    "remove_from_feed": MessageLookupByLibrary.simpleMessage("הסר מהעדכון"),
    "replying_to": MessageLookupByLibrary.simpleMessage("מגיב ל"),
    "report": MessageLookupByLibrary.simpleMessage("דווח"),
    "report_a_bug": MessageLookupByLibrary.simpleMessage("דווח על באג"),
    "reporting_an_error": MessageLookupByLibrary.simpleMessage(
      "דיווח על שגיאה",
    ),
    "reset_home_pages": MessageLookupByLibrary.simpleMessage(
      "איפוס דפים לברירת המחדל",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("נסה שוב"),
    "save": MessageLookupByLibrary.simpleMessage("שמור"),
    "save_bandwidth_using_smaller_images": MessageLookupByLibrary.simpleMessage(
      "חסוך ברוחב פס עם תמונות קטנות יותר",
    ),
    "saved": MessageLookupByLibrary.simpleMessage("נשמר"),
    "saved_tweet_too_large": MessageLookupByLibrary.simpleMessage(
      "לא ניתן היה להציג את הציוץ הזה, מכיוון שהוא גדול מדי לטעינה. נא לדווח על כך למפתחים.",
    ),
    "search": MessageLookupByLibrary.simpleMessage("חיפוש"),
    "search_term": MessageLookupByLibrary.simpleMessage("מונח חיפוש"),
    "select": MessageLookupByLibrary.simpleMessage("בחר"),
    "selecting_individual_accounts_to_import_and_assigning_groups_are_both_planned_for_the_future_already":
        MessageLookupByLibrary.simpleMessage(
          "בחירת חשבונות בודדים לייבוא והקצאת קבוצות שניהם בתכנון כבר!",
        ),
    "send": MessageLookupByLibrary.simpleMessage("שלח"),
    "settings": MessageLookupByLibrary.simpleMessage("הגדרות"),
    "share_base_url": MessageLookupByLibrary.simpleMessage(
      "כתובת אתר לשיתוף מותאם אישית",
    ),
    "share_base_url_description": MessageLookupByLibrary.simpleMessage(
      "השתמש בכתובת אתר בסיס מותאמת אישית בעת שיתוף",
    ),
    "share_tweet_as_image": MessageLookupByLibrary.simpleMessage(
      "שתף ציוץ כתמונה",
    ),
    "share_tweet_content": MessageLookupByLibrary.simpleMessage(
      "שתף תוכן ציוץ",
    ),
    "share_tweet_content_and_link": MessageLookupByLibrary.simpleMessage(
      "שתף תוכן ציוץ וקישור",
    ),
    "share_tweet_link": MessageLookupByLibrary.simpleMessage("שתף קישור לציוץ"),
    "should_check_for_updates_description":
        MessageLookupByLibrary.simpleMessage(
          "בדוק אם קיימים עדכונים כאשר Squawker מתחיל",
        ),
    "should_check_for_updates_label": MessageLookupByLibrary.simpleMessage(
      "בדוק עידכונים",
    ),
    "small": MessageLookupByLibrary.simpleMessage("קטן"),
    "something_broke_in_fritter": MessageLookupByLibrary.simpleMessage(
      "משהו השתבש ב- Squawker.",
    ),
    "something_just_went_wrong_in_fritter_and_an_error_report_has_been_generated":
        MessageLookupByLibrary.simpleMessage(
          "משהו פשוט השתבש ב-Squawker, ונוצר דוח שגיאה. ניתן לשלוח את הדוח למפתחי Squawker כדי לעזור בתיקון הבעיה.",
        ),
    "sorry_the_replied_tweet_could_not_be_found":
        MessageLookupByLibrary.simpleMessage(
          "מצטערים, לא ניתן מצאנו את הציוץ שהגיב!",
        ),
    "subscribe": MessageLookupByLibrary.simpleMessage("הרשמה"),
    "subscriptions": MessageLookupByLibrary.simpleMessage("מנויים"),
    "subtitles": MessageLookupByLibrary.simpleMessage("כתוביות"),
    "successfully_saved_the_media": MessageLookupByLibrary.simpleMessage(
      "מדיה נשמרה!",
    ),
    "system": MessageLookupByLibrary.simpleMessage("מערכת"),
    "tap_to_download_release_version": m13,
    "tap_to_show_getMediaType_item_type": m14,
    "thanks_for_helping_fritter": MessageLookupByLibrary.simpleMessage(
      "תודה שעזרת לSquawker! 💖",
    ),
    "the_file_does_not_exist_please_ensure_it_is_located_at_file_path": m15,
    "the_github_issue": MessageLookupByLibrary.simpleMessage(
      "בעיית GitHub (#143)",
    ),
    "the_tweet_did_not_contain_any_text_this_is_unexpected":
        MessageLookupByLibrary.simpleMessage(
          "הציוץ לא הכיל שום טקסט. זה לא צפוי",
        ),
    "theme": MessageLookupByLibrary.simpleMessage("עיצוב האפליקציה"),
    "theme_mode": MessageLookupByLibrary.simpleMessage("מצב עיצוב האפליקציה"),
    "there_were_no_trends_returned_this_is_unexpected_please_report_as_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "לא נמצאו פופולארי ם. זה לא צפוי! אנא דווח כבאג, אם אפשר.",
        ),
    "this_group_contains_no_subscriptions":
        MessageLookupByLibrary.simpleMessage("קבוצה זו אינה מכילה מנויים!"),
    "this_took_too_long_to_load_please_check_your_network_connection":
        MessageLookupByLibrary.simpleMessage(
          "לקח יותר מדי זמן לטעון. אנא בדוק את חיבור הרשת שלך!",
        ),
    "this_tweet_is_unavailable": MessageLookupByLibrary.simpleMessage(
      "הציוץ הזה אינו זמין. הוא כנראה נמחק.",
    ),
    "this_tweet_user_name_retweeted": m16,
    "this_user_does_not_follow_anyone": MessageLookupByLibrary.simpleMessage(
      "המשתמש לא עוקב אחרי אף אחד!",
    ),
    "this_user_does_not_have_anyone_following_them":
        MessageLookupByLibrary.simpleMessage("אף אחד לא עוקב אחרי המשתמש הזה!"),
    "thread": MessageLookupByLibrary.simpleMessage("שרשור"),
    "thumbnail": MessageLookupByLibrary.simpleMessage("תמונה ממוזערת"),
    "thumbnail_not_available": MessageLookupByLibrary.simpleMessage(
      "תמונה ממוזערת לא זמינה",
    ),
    "timed_out": MessageLookupByLibrary.simpleMessage("תם הזמן הקצוב"),
    "to_import_specific_subscriptions_enter_your_comma_separated_usernames_below":
        MessageLookupByLibrary.simpleMessage(
          "כדי לייבא מינויים ספציפיים, הזן את שמות המשתמש מופרדים בפסיק למטה.",
        ),
    "to_import_subscriptions_from_an_existing_twitter_account_enter_your_username_below":
        MessageLookupByLibrary.simpleMessage(
          "כדי לייבא מנויים מחשבון טוויטר/X קיים, הזן את שם המשתמש שלך למטה.",
        ),
    "toggle_all": MessageLookupByLibrary.simpleMessage("החלף הכל"),
    "translator_label": MessageLookupByLibrary.simpleMessage("מתרגם"),
    "translators_description": MessageLookupByLibrary.simpleMessage(
      "השתמש במופעים מותאמים אישית של LibreTranslate",
    ),
    "translators_label": MessageLookupByLibrary.simpleMessage("מתרגמים"),
    "trending": MessageLookupByLibrary.simpleMessage("פופולארי"),
    "trends": MessageLookupByLibrary.simpleMessage("פופולארים"),
    "true_black": MessageLookupByLibrary.simpleMessage("שחור אמיתי?"),
    "tweet_font_size_description": MessageLookupByLibrary.simpleMessage(
      "גודל גופן של הציוצים",
    ),
    "tweet_font_size_label": MessageLookupByLibrary.simpleMessage("גודל טקסט"),
    "tweets": MessageLookupByLibrary.simpleMessage("ציוצים"),
    "tweets_and_replies": MessageLookupByLibrary.simpleMessage(
      "ציוצים ותגובות",
    ),
    "tweets_number": m17,
    "twitter_account_types_both": MessageLookupByLibrary.simpleMessage(
      "אורח וקבוע",
    ),
    "twitter_account_types_description": MessageLookupByLibrary.simpleMessage(
      "סוג חשבון לשימוש",
    ),
    "twitter_account_types_label": MessageLookupByLibrary.simpleMessage(
      "סוג חשבון",
    ),
    "twitter_account_types_only_regular": MessageLookupByLibrary.simpleMessage(
      "רק רגיל",
    ),
    "twitter_account_types_priority_to_regular":
        MessageLookupByLibrary.simpleMessage("תעדוף קבוע"),
    "two_home_pages_required": MessageLookupByLibrary.simpleMessage(
      "אתה צריך לפחות 2 דפי מסך הבית.",
    ),
    "unable_to_find_the_available_trend_locations":
        MessageLookupByLibrary.simpleMessage(
          "לא ניתן למצוא את מיקומי הפופולרי הזמינים.",
        ),
    "unable_to_find_your_saved_tweets": MessageLookupByLibrary.simpleMessage(
      "לא ניתן למצוא את הציוצים השמורים שלך.",
    ),
    "unable_to_import": MessageLookupByLibrary.simpleMessage("לא הצלחנו לייבא"),
    "unable_to_load_home_pages": MessageLookupByLibrary.simpleMessage(
      "לא ניתן לטעון את דפי הבית שלך",
    ),
    "unable_to_load_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "לא ניתן לטעון קבוצות מנויים",
    ),
    "unable_to_load_the_group": MessageLookupByLibrary.simpleMessage(
      "לא ניתן לטעון את הקבוצה",
    ),
    "unable_to_load_the_group_settings": MessageLookupByLibrary.simpleMessage(
      "לא ניתן לטעון את הגדרות הקבוצה",
    ),
    "unable_to_load_the_list_of_follows": MessageLookupByLibrary.simpleMessage(
      "לא ניתן לטעון את רשימת העוקבים",
    ),
    "unable_to_load_the_next_page_of_follows":
        MessageLookupByLibrary.simpleMessage(
          "לא ניתן לטעון את העמוד הבא של העוקבים",
        ),
    "unable_to_load_the_next_page_of_replies":
        MessageLookupByLibrary.simpleMessage(
          "לא ניתן לטעון את עמוד התשובות הבא",
        ),
    "unable_to_load_the_next_page_of_tweets":
        MessageLookupByLibrary.simpleMessage(
          "לא ניתן לטעון את העמוד הבא של הציוצים",
        ),
    "unable_to_load_the_profile": MessageLookupByLibrary.simpleMessage(
      "לא הצלחנו לטעון את הפרופיל",
    ),
    "unable_to_load_the_search_results": MessageLookupByLibrary.simpleMessage(
      "לא ניתן לטעון את תוצאות החיפוש.",
    ),
    "unable_to_load_the_trends_for_widget_place_name": m18,
    "unable_to_load_the_tweet": MessageLookupByLibrary.simpleMessage(
      "לא ניתן לטעון את הציוץ",
    ),
    "unable_to_load_the_tweets": MessageLookupByLibrary.simpleMessage(
      "לא ניתן לטעון את הציוצים",
    ),
    "unable_to_load_the_tweets_for_the_feed":
        MessageLookupByLibrary.simpleMessage(
          "לא ניתן לטעון את הציוצים עבור הפיד",
        ),
    "unable_to_refresh_the_subscriptions": MessageLookupByLibrary.simpleMessage(
      "לא ניתן לרענן את המנויים",
    ),
    "unable_to_run_the_database_migrations":
        MessageLookupByLibrary.simpleMessage(
          "לא ניתן להפעיל את מיזוג מסד הנתונים",
        ),
    "unable_to_save_the_media_twitter_returned_a_status_of_response_statusCode":
        m19,
    "unable_to_stream_the_trend_location_preference":
        MessageLookupByLibrary.simpleMessage(
          "לא ניתן להזרים את העדפת מיקום הפופולארים",
        ),
    "unknown": MessageLookupByLibrary.simpleMessage("לא ידוע"),
    "unsave": MessageLookupByLibrary.simpleMessage("לא נשמר"),
    "unsubscribe": MessageLookupByLibrary.simpleMessage("בטל רישום"),
    "unsupported_url": MessageLookupByLibrary.simpleMessage("קישור לא נתמך"),
    "update_to_release_version_through_your_fdroid_client": m20,
    "updates": MessageLookupByLibrary.simpleMessage("עידכונים"),
    "use_true_black_for_the_dark_mode_theme":
        MessageLookupByLibrary.simpleMessage(
          "השתמש בשחור אמיתי עבור עיצוב אפליקציה במצב כהה",
        ),
    "user_not_found": MessageLookupByLibrary.simpleMessage("המשתמש לא נמצא"),
    "username": MessageLookupByLibrary.simpleMessage("שם משתמש"),
    "username_exclude": MessageLookupByLibrary.simpleMessage(
      "שם משתמש לא לכלול",
    ),
    "username_label": MessageLookupByLibrary.simpleMessage("שם משתמש:"),
    "usernames": MessageLookupByLibrary.simpleMessage("שמות משתמשים"),
    "version": MessageLookupByLibrary.simpleMessage("גירסה"),
    "warning_regular_account_unauthenticated_access_description":
        MessageLookupByLibrary.simpleMessage(
          "Twitter/X השביתה את היכולת ליצור חשבונות אורחים. כעת עליך להגדיר חשבונות רגילים בהגדרות / חשבון. ללא חשבון יש גישה חלקית מוגבלת לציוצים ולפרופילים בלבד. קל ליצור חשבון רגיל אנונימי כפי שמוסבר כאן:",
        ),
    "warning_regular_account_unauthenticated_access_title":
        MessageLookupByLibrary.simpleMessage("חשבונות רגילים וגישה לא מאומתת"),
    "when_a_new_app_update_is_available": MessageLookupByLibrary.simpleMessage(
      "כאשר עדכון אפליקציה חדש זמין",
    ),
    "whether_errors_should_be_reported_to_":
        MessageLookupByLibrary.simpleMessage("האם לדווח שגיאות "),
    "whether_to_hide_tweets_marked_as_sensitive":
        MessageLookupByLibrary.simpleMessage(
          "האם להסתיר ציוצים המסומנים כרגישים",
        ),
    "which_tab_is_shown_when_the_app_opens":
        MessageLookupByLibrary.simpleMessage(
          "איזו כרטיסייה תוצג כאשר האפליקציה נפתחת",
        ),
    "which_tab_is_shown_when_the_subscription_opens":
        MessageLookupByLibrary.simpleMessage(
          "איזו כרטיסייה מוצגת כאשר המנוי נפתח",
        ),
    "would_you_like_to_enable_automatic_error_reporting":
        MessageLookupByLibrary.simpleMessage(
          "האם תרצה להפעיל דיווח שגיאות אוטומטי?",
        ),
    "x_api": MessageLookupByLibrary.simpleMessage("X API"),
    "x_client_transaction_id_provider": MessageLookupByLibrary.simpleMessage(
      "x-client-transaction-id provider",
    ),
    "x_client_transaction_id_provider_description":
        MessageLookupByLibrary.simpleMessage(
          "הגדר את ספק x-client-transaction-id provider. הוא חייב להיות שם דומיין בלבד, ללא https. הפניה: https://github.com/Teskann/x-client-transaction-id-generator",
        ),
    "yes": MessageLookupByLibrary.simpleMessage("כן"),
    "yes_please": MessageLookupByLibrary.simpleMessage("כן, בבקשה"),
    "you_have_not_saved_any_tweets_yet": MessageLookupByLibrary.simpleMessage(
      "עדיין לא שמרת אף ציוץ!",
    ),
    "you_must_have_at_least_2_home_screen_pages":
        MessageLookupByLibrary.simpleMessage(
          "חייב להיות לך לפחות שני דפי מסך הבית",
        ),
    "your_profile_must_be_public_otherwise_the_import_will_not_work":
        MessageLookupByLibrary.simpleMessage(
          "הפרופיל שלך חייב להיות ציבורי, אחרת הייבוא לא יעבוד",
        ),
    "your_report_will_be_sent_to_fritter__project":
        MessageLookupByLibrary.simpleMessage(
          "הדוח שלך יישלח לפרויקט של Squawker, ומידע פרטיות ניתן למצוא ב:",
        ),
  };
}
