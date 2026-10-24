// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a hu locale. All the
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
  String get localeName => 'hu';

  static String m0(name) =>
      "Biztos benne, hogy letörli a ${name} feliratkozási csoportot?";

  static String m1(fileName) => "Adatok exportálva ${fileName} néven";

  static String m2(fullPath) => "Adatok exportálva a ${fullPath} mappába";

  static String m3(timeagoFormat) => "Befejeződött ${timeagoFormat} ideje";

  static String m4(timeagoFormat) => "Befejeződik ${timeagoFormat} időben";

  static String m5(snapshotData) =>
      "${snapshotData} felhasználó sikeresen importálva";

  static String m6(name) => "${name}";

  static String m7(snapshotData) => "Eddig ${snapshotData} került importálásra";

  static String m8(date) => "Csatlakozva ${date}";

  static String m9(nbrGuestAccounts) =>
      "Jelenleg ${nbrGuestAccounts} vendég fiók van";

  static String m10(num, numFormatted) =>
      "{számú, többes, nulla{No votes} egy{One vote} kettő{Two votes} néhány{${numFormatted} votes} sok{${numFormatted} vote} más{${numFormatted} votes}}";

  static String m11(errorMessage) =>
      "Ellenőrizze internet kapcsolatát.\n\n${errorMessage}";

  static String m12(nbrRegularAccounts) => "Sima fiók (${nbrRegularAccounts}):";

  static String m13(releaseVersion) =>
      "Nyomjon rá a ${releaseVersion} letöltéséhez";

  static String m14(getMediaType) =>
      "Nyomjon rá, hogy látszódjon a ${getMediaType}";

  static String m15(filePath) =>
      "A fájl nem létezik. Győződjön meg róla, hogy a ${filePath} helyen található";

  static String m16(thisTweetUserName, timeAgo) =>
      "${thisTweetUserName} újratweetelte ${timeAgo} idővel ezelőtt";

  static String m17(num, numFormatted) =>
      "{számú, többes, nulla{no tweets} egy{one tweet} kettő{two tweets} néhány{${numFormatted} tweets} sok{${numFormatted} tweet} más{${numFormatted} tweets}}";

  static String m18(widgetPlaceName) =>
      "Nem tölthetőek be a trendek a ${widgetPlaceName}-hez";

  static String m19(responseStatusCode) =>
      "Média nem menthető. A Twitter/X ${responseStatusCode} kódú hibát adott.";

  static String m20(releaseVersion) =>
      "Frissítsen a ${releaseVersion} verzióra az F-Droid kliensben";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("Névjegy"),
    "account": MessageLookupByLibrary.simpleMessage("Fiók"),
    "account_suspended": MessageLookupByLibrary.simpleMessage(
      "Fiók felfüggesztve",
    ),
    "activate_non_confirmation_bias_mode_description":
        MessageLookupByLibrary.simpleMessage(
          "Tweet szerző elrejtése. Megerősítési torzítás elkerülése az ellemondást nem tűrő vitáknál.",
        ),
    "activate_non_confirmation_bias_mode_label":
        MessageLookupByLibrary.simpleMessage(
          "A nem megerősített torzítás mód aktiválása",
        ),
    "add_account": MessageLookupByLibrary.simpleMessage("Fiók hozzáadása"),
    "add_account_title": MessageLookupByLibrary.simpleMessage(
      "Fiók hozzáadása",
    ),
    "add_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Feliratkozás hozzáadása",
    ),
    "add_to_feed": MessageLookupByLibrary.simpleMessage(
      "Hozzáadás hírfolyamhoz",
    ),
    "add_to_group": MessageLookupByLibrary.simpleMessage(
      "Hozzáadás csoporthoz",
    ),
    "all": MessageLookupByLibrary.simpleMessage("Mind"),
    "all_the_great_software_used_by_fritter":
        MessageLookupByLibrary.simpleMessage(
          "Az összes csodás szoftver a Squawker szolgálatában",
        ),
    "allow_background_play_description": MessageLookupByLibrary.simpleMessage(
      "Háttérben lejátszás engedélyezése",
    ),
    "allow_background_play_label": MessageLookupByLibrary.simpleMessage(
      "Lejátszás a háttérben",
    ),
    "allow_background_play_other_apps_description":
        MessageLookupByLibrary.simpleMessage(
          "Más appok háttérben való lejátszásának engedélyezése",
        ),
    "allow_background_play_other_apps_label":
        MessageLookupByLibrary.simpleMessage("Más appok a háttérben"),
    "an_update_for_fritter_is_available": MessageLookupByLibrary.simpleMessage(
      "Frissítés elérhető a Squawker-hez! 🚀",
    ),
    "app_info": MessageLookupByLibrary.simpleMessage("App Infó"),
    "are_you_sure": MessageLookupByLibrary.simpleMessage("Biztos benne?"),
    "are_you_sure_you_want_to_delete_the_subscription_group_name_of_group": m0,
    "back": MessageLookupByLibrary.simpleMessage("Vissza"),
    "bad_guest_token": MessageLookupByLibrary.simpleMessage(
      "A Twitter/X érvénytelenítette a belépő tokent. Próbálja meg újraindítani a Squawker-t!",
    ),
    "beta": MessageLookupByLibrary.simpleMessage("BÉTA"),
    "blue_theme_based_on_the_twitter_color_scheme":
        MessageLookupByLibrary.simpleMessage(
          "Kék séma a kék Twitter/X séma alapján szabadon",
        ),
    "cancel": MessageLookupByLibrary.simpleMessage("Mégse"),
    "catastrophic_failure": MessageLookupByLibrary.simpleMessage(
      "Katasztrofális hiba",
    ),
    "choose": MessageLookupByLibrary.simpleMessage("Választás"),
    "choose_pages": MessageLookupByLibrary.simpleMessage("Válasszon oldalakat"),
    "close": MessageLookupByLibrary.simpleMessage("Bezár"),
    "confirm_close_fritter": MessageLookupByLibrary.simpleMessage(
      "Biztos benne, hogy be akarja zárni a Squawker-t?",
    ),
    "contribute": MessageLookupByLibrary.simpleMessage("Hozzájárulás"),
    "copied_address_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "Cím másolva a vágólapra",
    ),
    "copied_version_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "Verzió a vágólapra másolva",
    ),
    "could_not_contact_twitter": MessageLookupByLibrary.simpleMessage(
      "Nem elérhető a Twitter/X",
    ),
    "could_not_find_any_tweets_by_this_user":
        MessageLookupByLibrary.simpleMessage(
          "Nem találhatóak tweet-ek ennél a felhasználónál!",
        ),
    "could_not_find_any_tweets_from_the_last_7_days":
        MessageLookupByLibrary.simpleMessage(
          "Nem található egy tweet sem az elmúlt 7 napból!",
        ),
    "country": MessageLookupByLibrary.simpleMessage("Ország"),
    "dark": MessageLookupByLibrary.simpleMessage("Sötét"),
    "data": MessageLookupByLibrary.simpleMessage("Adat"),
    "data_exported_to_fileName": m1,
    "data_exported_to_fullPath": m2,
    "data_imported_successfully": MessageLookupByLibrary.simpleMessage(
      "Adatok sikeresen importálásra kerültek",
    ),
    "date_created": MessageLookupByLibrary.simpleMessage("Létrehozási Dátum"),
    "date_subscribed": MessageLookupByLibrary.simpleMessage(
      "Feliratkozási Dátum",
    ),
    "default_subscription_tab": MessageLookupByLibrary.simpleMessage(
      "Alap feliratkozási fül",
    ),
    "default_tab": MessageLookupByLibrary.simpleMessage("Alap fül"),
    "delete": MessageLookupByLibrary.simpleMessage("Törlés"),
    "disable_screenshots": MessageLookupByLibrary.simpleMessage(
      "Képernyőkép tiltása",
    ),
    "disable_screenshots_hint": MessageLookupByLibrary.simpleMessage(
      "Képernyőkép készítésének tiltása. Ez nem minden eszköznél működhet.",
    ),
    "disabled": MessageLookupByLibrary.simpleMessage("Kikapcsolva"),
    "donate": MessageLookupByLibrary.simpleMessage("Támogatás"),
    "download": MessageLookupByLibrary.simpleMessage("Letöltés"),
    "download_handling": MessageLookupByLibrary.simpleMessage(
      "Kezelés letöltése",
    ),
    "download_handling_description": MessageLookupByLibrary.simpleMessage(
      "Ahogyan a letöltésnek működnie kéne",
    ),
    "download_handling_type_ask": MessageLookupByLibrary.simpleMessage(
      "Mindig rákérdez",
    ),
    "download_handling_type_directory": MessageLookupByLibrary.simpleMessage(
      "Mentés könyvtárba",
    ),
    "download_media_no_url": MessageLookupByLibrary.simpleMessage(
      "Nem tölthető le. A média csak közvetítésként elérhető, amit még a Squawker nem tud letölteni.",
    ),
    "download_path": MessageLookupByLibrary.simpleMessage("Letöltési útvonal"),
    "download_video_best_quality_description":
        MessageLookupByLibrary.simpleMessage(
          "Videók letöltése a legjobb elérhető minőségben",
        ),
    "download_video_best_quality_label": MessageLookupByLibrary.simpleMessage(
      "Videók letöltése a legjobb minőségben",
    ),
    "downloading_media": MessageLookupByLibrary.simpleMessage(
      "Média letöltése…",
    ),
    "edit_account_title": MessageLookupByLibrary.simpleMessage(
      "Fiók módosítása",
    ),
    "email_label": MessageLookupByLibrary.simpleMessage("Email:"),
    "enable_": MessageLookupByLibrary.simpleMessage("Bekapcsolás ?"),
    "ended_timeago_format_endsAt_allowFromNow_true": m3,
    "ends_timeago_format_endsAt_allowFromNow_true": m4,
    "enhanced_feeds_description": MessageLookupByLibrary.simpleMessage(
      "Javított kérések a hírfolyamokhoz (csak kevesebb ráta korlátozással)",
    ),
    "enhanced_feeds_label": MessageLookupByLibrary.simpleMessage(
      "Javított hírfolyamok",
    ),
    "enhanced_profile_description": MessageLookupByLibrary.simpleMessage(
      "Javított kérések a profilhoz",
    ),
    "enhanced_profile_label": MessageLookupByLibrary.simpleMessage(
      "Javított profil",
    ),
    "enhanced_searches_description": MessageLookupByLibrary.simpleMessage(
      "Javított kérések a keresésekhez (csak kevesebb ráta korlátozással)",
    ),
    "enhanced_searches_label": MessageLookupByLibrary.simpleMessage(
      "Javított keresések",
    ),
    "enter_comma_separated_twitter_usernames":
        MessageLookupByLibrary.simpleMessage(
          "Adja meg a vesszővel elválasztott Twitter/X felhasználóneveket",
        ),
    "enter_your_twitter_username": MessageLookupByLibrary.simpleMessage(
      "Adja meg Twitter/X felhasználónevét",
    ),
    "error_from_twitter": MessageLookupByLibrary.simpleMessage(
      "Twitter/X hiba",
    ),
    "exclusions_feed_description": MessageLookupByLibrary.simpleMessage(
      "A hírfolyamról kizárt felhasználónevek listája",
    ),
    "exclusions_feed_label": MessageLookupByLibrary.simpleMessage(
      "Kivételek a hírfolyamban",
    ),
    "export": MessageLookupByLibrary.simpleMessage("Exportálás"),
    "export_guest_accounts": MessageLookupByLibrary.simpleMessage(
      "Exportálni akarja a vendég fiókokat?",
    ),
    "export_settings": MessageLookupByLibrary.simpleMessage(
      "Beállítások exportálása?",
    ),
    "export_subscription_group_members": MessageLookupByLibrary.simpleMessage(
      "Exportálni akarja a feliratkozási csoport tagjait?",
    ),
    "export_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "Exportálni akarja a feliratkozási csoportokat?",
    ),
    "export_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Feliratkozások exportálása?",
    ),
    "export_tweets": MessageLookupByLibrary.simpleMessage(
      "Exportálni kívánja a tweet-eket?",
    ),
    "export_twitter_tokens": MessageLookupByLibrary.simpleMessage(
      "Twitter/X tokenek exportálása?",
    ),
    "export_your_data": MessageLookupByLibrary.simpleMessage(
      "Adatai exportálása",
    ),
    "feed": MessageLookupByLibrary.simpleMessage("Hírfolyam"),
    "filters": MessageLookupByLibrary.simpleMessage("Szűrők"),
    "finish": MessageLookupByLibrary.simpleMessage("Befejezés"),
    "finished_with_snapshotData_users": m5,
    "followers": MessageLookupByLibrary.simpleMessage("Követők"),
    "following": MessageLookupByLibrary.simpleMessage("Bekövetve"),
    "forbidden": MessageLookupByLibrary.simpleMessage(
      "A Twitter/X szerint ennek elérése tiltott",
    ),
    "fritter": MessageLookupByLibrary.simpleMessage("Squawker"),
    "fritter_blue": MessageLookupByLibrary.simpleMessage("Squawker kék"),
    "functionality_unsupported": MessageLookupByLibrary.simpleMessage(
      "Ez a funkciót többé nem támogatja a Twitter/X!",
    ),
    "general": MessageLookupByLibrary.simpleMessage("Általános"),
    "generic_username": MessageLookupByLibrary.simpleMessage("Felhasználó"),
    "group_name": m6,
    "groups": MessageLookupByLibrary.simpleMessage("Csoportok"),
    "help_make_fritter_even_better": MessageLookupByLibrary.simpleMessage(
      "Tedd még jobbá a Squawker-t",
    ),
    "help_support_fritters_future": MessageLookupByLibrary.simpleMessage(
      "Támogassa a Squawker jövőjét",
    ),
    "hide_sensitive_tweets": MessageLookupByLibrary.simpleMessage(
      "Érzékeny tweet-ek elrejtése",
    ),
    "home": MessageLookupByLibrary.simpleMessage("Kezdőlap"),
    "if_you_have_any_feedback_on_this_feature_please_leave_it_on":
        MessageLookupByLibrary.simpleMessage(
          "Ha van bármilyen visszajelzése ezzel a funkcióval kapcsolatban, ne fojtsa magába",
        ),
    "import": MessageLookupByLibrary.simpleMessage("Importálás"),
    "import_data_from_another_device": MessageLookupByLibrary.simpleMessage(
      "Adat importálása egy másik eszközről",
    ),
    "import_from_twitter": MessageLookupByLibrary.simpleMessage(
      "Importálás Twitter/X-ről",
    ),
    "import_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Feliratkozások Importálása",
    ),
    "imported_snapshot_data_users_so_far": m7,
    "include_replies": MessageLookupByLibrary.simpleMessage(
      "Válaszok mutatása",
    ),
    "include_retweets": MessageLookupByLibrary.simpleMessage(
      "Retweet-ek mutatása",
    ),
    "joined": m8,
    "keep_feed_offset_description": MessageLookupByLibrary.simpleMessage(
      "Az idővonal eltolása megmarad a hírfolyamok számára app újraindítás után is",
    ),
    "keep_feed_offset_label": MessageLookupByLibrary.simpleMessage(
      "Legyenek eltolva a hírfolyamok",
    ),
    "language": MessageLookupByLibrary.simpleMessage("Nyelv"),
    "language_subtitle": MessageLookupByLibrary.simpleMessage(
      "Újraindítás szükséges",
    ),
    "large": MessageLookupByLibrary.simpleMessage("Nagy"),
    "leaner_feeds_description": MessageLookupByLibrary.simpleMessage(
      "Tweet-en belüli linkek előnézete nem látszik a hírfolyamban",
    ),
    "leaner_feeds_label": MessageLookupByLibrary.simpleMessage(
      "Vékony hírfolyamok",
    ),
    "legacy_android_import": MessageLookupByLibrary.simpleMessage(
      "Régi típusú Android import",
    ),
    "let_the_developers_know_if_something_is_broken":
        MessageLookupByLibrary.simpleMessage(
          "Tudassa a fejlesztőkkel ha valami hiba jelentkezik",
        ),
    "licenses": MessageLookupByLibrary.simpleMessage("Licenszek"),
    "light": MessageLookupByLibrary.simpleMessage("Világos"),
    "live": MessageLookupByLibrary.simpleMessage("ÉLŐ"),
    "logging": MessageLookupByLibrary.simpleMessage("Naplózás"),
    "mandatory_label": MessageLookupByLibrary.simpleMessage(
      "Kitöltendő rubrikák:",
    ),
    "material_3": MessageLookupByLibrary.simpleMessage("Material 3?"),
    "media": MessageLookupByLibrary.simpleMessage("Média"),
    "media_size": MessageLookupByLibrary.simpleMessage("Média méret"),
    "medium": MessageLookupByLibrary.simpleMessage("Közepes"),
    "missing_page": MessageLookupByLibrary.simpleMessage("Hiányzó oldal"),
    "mute_video_description": MessageLookupByLibrary.simpleMessage(
      "Némítva induljanak e el a videók alapból",
    ),
    "mute_videos": MessageLookupByLibrary.simpleMessage("Videók némítása"),
    "name": MessageLookupByLibrary.simpleMessage("Név"),
    "name_label": MessageLookupByLibrary.simpleMessage("Név:"),
    "nbr_guest_accounts": m9,
    "newTrans": MessageLookupByLibrary.simpleMessage("Új"),
    "next": MessageLookupByLibrary.simpleMessage("Következő"),
    "no": MessageLookupByLibrary.simpleMessage("Nem"),
    "no_data_was_returned_which_should_never_happen_please_report_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "Az adat nem került visszaigazolásra, ami nem történhetne meg. Kérjük jelentse a bug-ot ha megteheti!",
        ),
    "no_results": MessageLookupByLibrary.simpleMessage("Nincs eredmény"),
    "no_results_for": MessageLookupByLibrary.simpleMessage(
      "Nincs találat a következőre:",
    ),
    "no_subscriptions_try_searching_or_importing_some":
        MessageLookupByLibrary.simpleMessage(
          "Nincs feliratkozás. Próbáljon keresni vagy importálni néhányat!",
        ),
    "not_set": MessageLookupByLibrary.simpleMessage("Nincs beállítva"),
    "note_due_to_a_twitter_limitation_not_all_tweets_may_be_included":
        MessageLookupByLibrary.simpleMessage(
          "Megjegyzés: A Twitter/X limitációk miatt nem minden tweet jelenik meg",
        ),
    "numberFormat_format_total_votes": m10,
    "ok": MessageLookupByLibrary.simpleMessage("Rendben"),
    "only_public_subscriptions_can_be_imported":
        MessageLookupByLibrary.simpleMessage(
          "A feliratkozásokat csak publikus profilokból lehet importálni",
        ),
    "oops_something_went_wrong": MessageLookupByLibrary.simpleMessage(
      "Hoppá! Valami hiba történt 🥲",
    ),
    "open_app_settings": MessageLookupByLibrary.simpleMessage(
      "App beállítások megnyitása",
    ),
    "open_in_browser": MessageLookupByLibrary.simpleMessage(
      "Megnyitás böngszőben",
    ),
    "option_confirm_close_description": MessageLookupByLibrary.simpleMessage(
      "App bezárás megerősítése",
    ),
    "option_confirm_close_label": MessageLookupByLibrary.simpleMessage(
      "Bezárás megerősítése",
    ),
    "optional_label": MessageLookupByLibrary.simpleMessage(
      "Kitölthető rubrikák:",
    ),
    "page_not_found": MessageLookupByLibrary.simpleMessage(
      "A Twitter/X szerint nem létezik az oldal, de ez nem feltétlenül igaz",
    ),
    "password_label": MessageLookupByLibrary.simpleMessage("Jelszó:"),
    "permission_not_granted": MessageLookupByLibrary.simpleMessage(
      "Nem engedélyezett jogosultság. Próbálj újra az engedélyezést követően!",
    ),
    "phone_label": MessageLookupByLibrary.simpleMessage("Telefon:"),
    "pick_a_color": MessageLookupByLibrary.simpleMessage(
      "Válasszon egy színt!",
    ),
    "pick_an_icon": MessageLookupByLibrary.simpleMessage(
      "Válasszon egy ikont!",
    ),
    "pinned_tweet": MessageLookupByLibrary.simpleMessage("Kitűzött tweet"),
    "playback_speed": MessageLookupByLibrary.simpleMessage(
      "Visszajátszási sebesség",
    ),
    "please_check_your_internet_connection_error_message": m11,
    "please_enter_a_name": MessageLookupByLibrary.simpleMessage(
      "Kérem adjon meg egy nevet",
    ),
    "please_make_sure_the_data_you_wish_to_import_is_located_there_then_press_the_import_button_below":
        MessageLookupByLibrary.simpleMessage(
          "Győződjön meg róla, hogy a kívánt fájl rendelkezésre áll, majd nyomjon rá az importálásra.",
        ),
    "please_note_that_the_method_fritter_uses_to_import_subscriptions_is_heavily_rate_limited_by_twitter_so_this_may_fail_if_you_have_a_lot_of_followed_accounts":
        MessageLookupByLibrary.simpleMessage(
          "Kérem vegye figyelembe, hogy a Squawker által használt módszer erősen behatárolt számszakilag a feliratkozások importálásakor, így hibára futhat ha sok követett fiókkal rendelkezik.",
        ),
    "possibly_sensitive": MessageLookupByLibrary.simpleMessage(
      "Potenciálisan érzékeny",
    ),
    "possibly_sensitive_profile": MessageLookupByLibrary.simpleMessage(
      "Ez a profil tartalmazhat potenciálisan érzékeny képeket, nyelvezetet, vagy más tartalmat. Ennek ellenére mégis meg akarja tekinteni?",
    ),
    "possibly_sensitive_tweet": MessageLookupByLibrary.simpleMessage(
      "Ez a tweet potenciálisan érzékeny tartalommal bírhat. Biztosan meg akarja nézni?",
    ),
    "prefix": MessageLookupByLibrary.simpleMessage("előtag"),
    "private_profile": MessageLookupByLibrary.simpleMessage("Privát profil"),
    "proxy_description": MessageLookupByLibrary.simpleMessage(
      "Proxy minden kérés esetén",
    ),
    "proxy_error": MessageLookupByLibrary.simpleMessage("Proxy Hiba"),
    "proxy_label": MessageLookupByLibrary.simpleMessage("Proxy"),
    "regular_accounts": m12,
    "released_under_the_mit_license": MessageLookupByLibrary.simpleMessage(
      "Megjelenés az MIT Licensz alatt",
    ),
    "remove_from_feed": MessageLookupByLibrary.simpleMessage(
      "Eltávolítás a hírfolyamból",
    ),
    "replying_to": MessageLookupByLibrary.simpleMessage(
      "Válasz a következőnek",
    ),
    "report": MessageLookupByLibrary.simpleMessage("Jelentés"),
    "report_a_bug": MessageLookupByLibrary.simpleMessage("Bug jelentése"),
    "reporting_an_error": MessageLookupByLibrary.simpleMessage(
      "Hiba bejelentése",
    ),
    "reset_home_pages": MessageLookupByLibrary.simpleMessage(
      "Oldalak visszaállítása alapra",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Újra"),
    "save": MessageLookupByLibrary.simpleMessage("Mentés"),
    "save_bandwidth_using_smaller_images": MessageLookupByLibrary.simpleMessage(
      "Sávszél megtakarítás kisebb képekkel",
    ),
    "saved": MessageLookupByLibrary.simpleMessage("Mentett"),
    "saved_tweet_too_large": MessageLookupByLibrary.simpleMessage(
      "Ez a mentett tweet nem jeleníthető meg, mert túl nagy a megjelenítéshez. Kérem jelentse a fejlesztőknek.",
    ),
    "search": MessageLookupByLibrary.simpleMessage("Keresés"),
    "search_term": MessageLookupByLibrary.simpleMessage("Kifejezés keresése"),
    "select": MessageLookupByLibrary.simpleMessage("Kiválasztás"),
    "selecting_individual_accounts_to_import_and_assigning_groups_are_both_planned_for_the_future_already":
        MessageLookupByLibrary.simpleMessage(
          "Mind a fiókok egyenkénti kijelölése, mind a külön csoportkohoz való hozzárendelés egy tervben levő funkció a jövőre nézve!",
        ),
    "send": MessageLookupByLibrary.simpleMessage("Küldés"),
    "settings": MessageLookupByLibrary.simpleMessage("Beállítások"),
    "share_base_url": MessageLookupByLibrary.simpleMessage(
      "Egyéni megosztási URL",
    ),
    "share_base_url_description": MessageLookupByLibrary.simpleMessage(
      "Egyéni alapú URL használata megosztásnál",
    ),
    "share_tweet_as_image": MessageLookupByLibrary.simpleMessage(
      "Tweet megosztása képként",
    ),
    "share_tweet_content": MessageLookupByLibrary.simpleMessage(
      "Tweet tartalom megosztása",
    ),
    "share_tweet_content_and_link": MessageLookupByLibrary.simpleMessage(
      "Tweet tartalom és link megosztása",
    ),
    "share_tweet_link": MessageLookupByLibrary.simpleMessage(
      "Tweet link megosztása",
    ),
    "should_check_for_updates_description":
        MessageLookupByLibrary.simpleMessage(
          "Frissítések keresése a Squawker indulásakor",
        ),
    "should_check_for_updates_label": MessageLookupByLibrary.simpleMessage(
      "Frissítések keresése",
    ),
    "small": MessageLookupByLibrary.simpleMessage("Kicsi"),
    "something_broke_in_fritter": MessageLookupByLibrary.simpleMessage(
      "Valami hiba lépett fel a Squawker-ben.",
    ),
    "something_just_went_wrong_in_fritter_and_an_error_report_has_been_generated":
        MessageLookupByLibrary.simpleMessage(
          "Valami félresiklott a Squawker-ben, és generálódott egy hiba riport. Lehetősége van a riportot elküldeni a fejlesztőknek, hogy megkezdődjön a hibajavítás.",
        ),
    "sorry_the_replied_tweet_could_not_be_found":
        MessageLookupByLibrary.simpleMessage(
          "Sajnáljuk, a válasz tweet nem található!",
        ),
    "subscribe": MessageLookupByLibrary.simpleMessage("Feliratkozás"),
    "subscriptions": MessageLookupByLibrary.simpleMessage("Feliratkozások"),
    "subtitles": MessageLookupByLibrary.simpleMessage("Feliratok"),
    "successfully_saved_the_media": MessageLookupByLibrary.simpleMessage(
      "Média lementve!",
    ),
    "system": MessageLookupByLibrary.simpleMessage("Rendszer"),
    "tap_to_download_release_version": m13,
    "tap_to_show_getMediaType_item_type": m14,
    "thanks_for_helping_fritter": MessageLookupByLibrary.simpleMessage(
      "Köszönjük, hogy segít a Squawker-nek! 💖",
    ),
    "the_file_does_not_exist_please_ensure_it_is_located_at_file_path": m15,
    "the_github_issue": MessageLookupByLibrary.simpleMessage(
      "GitHub-os probléma (#143)",
    ),
    "the_tweet_did_not_contain_any_text_this_is_unexpected":
        MessageLookupByLibrary.simpleMessage(
          "A tweet nem tartalmazott szöveget. Váratlan hiba",
        ),
    "theme": MessageLookupByLibrary.simpleMessage("Téma"),
    "theme_mode": MessageLookupByLibrary.simpleMessage("Téma Mód"),
    "there_were_no_trends_returned_this_is_unexpected_please_report_as_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "Nem kérhetőek le a trendek. Ez egy nem várt hiba. Kérjük jelentse a hibát ha lehetséges!",
        ),
    "this_group_contains_no_subscriptions":
        MessageLookupByLibrary.simpleMessage(
          "Ez a csoport nem tartalmaz feliratkozásokat!",
        ),
    "this_took_too_long_to_load_please_check_your_network_connection":
        MessageLookupByLibrary.simpleMessage(
          "A betöltés túl sok időt vett igénybe. Ellenőrizze internet kapcsolatát!",
        ),
    "this_tweet_is_unavailable": MessageLookupByLibrary.simpleMessage(
      "A tweet nem elérhető. Feltételezhetően törlésre került.",
    ),
    "this_tweet_user_name_retweeted": m16,
    "this_user_does_not_follow_anyone": MessageLookupByLibrary.simpleMessage(
      "Ez a felhasználó nem követ senkit!",
    ),
    "this_user_does_not_have_anyone_following_them":
        MessageLookupByLibrary.simpleMessage(
          "Ezt a felhasználót nem követi senki!",
        ),
    "thread": MessageLookupByLibrary.simpleMessage("Fonal"),
    "thumbnail": MessageLookupByLibrary.simpleMessage("Miniatűr"),
    "thumbnail_not_available": MessageLookupByLibrary.simpleMessage(
      "Előkép nem elérhető",
    ),
    "timed_out": MessageLookupByLibrary.simpleMessage("Időtúllépés"),
    "to_import_specific_subscriptions_enter_your_comma_separated_usernames_below":
        MessageLookupByLibrary.simpleMessage(
          "Egy specifikus feliratkozás importáláshoz adja meg a vesszővel elválasztott felhasználóneveket alul.",
        ),
    "to_import_subscriptions_from_an_existing_twitter_account_enter_your_username_below":
        MessageLookupByLibrary.simpleMessage(
          "Már létező Twitter/X fiókból való feliratkozások importálásához adja meg a felhasználónevét.",
        ),
    "toggle_all": MessageLookupByLibrary.simpleMessage("Mind ki/be jelölése"),
    "trending": MessageLookupByLibrary.simpleMessage("Felkapott"),
    "trends": MessageLookupByLibrary.simpleMessage("Trendek"),
    "true_black": MessageLookupByLibrary.simpleMessage("Teljesen Fekete?"),
    "tweet_font_size_description": MessageLookupByLibrary.simpleMessage(
      "Tweet-ek betű mérete",
    ),
    "tweet_font_size_label": MessageLookupByLibrary.simpleMessage("Betű méret"),
    "tweets": MessageLookupByLibrary.simpleMessage("Teweet-ek"),
    "tweets_and_replies": MessageLookupByLibrary.simpleMessage(
      "Tweet-ek & válaszok",
    ),
    "tweets_number": m17,
    "twitter_account_types_both": MessageLookupByLibrary.simpleMessage(
      "Vendég és sima",
    ),
    "twitter_account_types_description": MessageLookupByLibrary.simpleMessage(
      "Fiók típus használata",
    ),
    "twitter_account_types_label": MessageLookupByLibrary.simpleMessage(
      "Fiók típus",
    ),
    "twitter_account_types_only_regular": MessageLookupByLibrary.simpleMessage(
      "Csak sima",
    ),
    "twitter_account_types_priority_to_regular":
        MessageLookupByLibrary.simpleMessage("Sima előnyben részesítése"),
    "two_home_pages_required": MessageLookupByLibrary.simpleMessage(
      "Kell legyen legalább kettő kezdőlapja.",
    ),
    "unable_to_find_the_available_trend_locations":
        MessageLookupByLibrary.simpleMessage(
          "Nem találhatóak a rendelkezésre álló trend helyek.",
        ),
    "unable_to_find_your_saved_tweets": MessageLookupByLibrary.simpleMessage(
      "Nem találhatóak mentett tweet-ek.",
    ),
    "unable_to_import": MessageLookupByLibrary.simpleMessage(
      "Sikertelen importálás",
    ),
    "unable_to_load_home_pages": MessageLookupByLibrary.simpleMessage(
      "Nem tölthetőek be a kezdőlapjai",
    ),
    "unable_to_load_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "Nem sikerült betölteni a feliratkozási csoportokat",
    ),
    "unable_to_load_the_group": MessageLookupByLibrary.simpleMessage(
      "A csoport nem tölthető be",
    ),
    "unable_to_load_the_group_settings": MessageLookupByLibrary.simpleMessage(
      "A csoport beállítások nem tölthetőek be",
    ),
    "unable_to_load_the_list_of_follows": MessageLookupByLibrary.simpleMessage(
      "Nem tölthető be a követők listája",
    ),
    "unable_to_load_the_next_page_of_follows":
        MessageLookupByLibrary.simpleMessage(
          "Nem tölthető be a követők következő oldala",
        ),
    "unable_to_load_the_next_page_of_replies":
        MessageLookupByLibrary.simpleMessage(
          "Nem tölthető be a következő oldalnyi válasz",
        ),
    "unable_to_load_the_next_page_of_tweets":
        MessageLookupByLibrary.simpleMessage(
          "Nem sikerült a következő oldalnyi tweet betöltése",
        ),
    "unable_to_load_the_profile": MessageLookupByLibrary.simpleMessage(
      "Profil nem tölthető be",
    ),
    "unable_to_load_the_search_results": MessageLookupByLibrary.simpleMessage(
      "Keresési eredmények nem tölthetőek be.",
    ),
    "unable_to_load_the_trends_for_widget_place_name": m18,
    "unable_to_load_the_tweet": MessageLookupByLibrary.simpleMessage(
      "Nem sikerült betölteni a tweet-et",
    ),
    "unable_to_load_the_tweets": MessageLookupByLibrary.simpleMessage(
      "Tweet-ek nem tölthetőek be",
    ),
    "unable_to_load_the_tweets_for_the_feed":
        MessageLookupByLibrary.simpleMessage(
          "Nem sikerült betölteni a tweet-eket a hírfolyamon",
        ),
    "unable_to_refresh_the_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Nem frissíthetőek a feliratkozások",
    ),
    "unable_to_run_the_database_migrations":
        MessageLookupByLibrary.simpleMessage(
          "Nem futtatható az adatbázis migráció",
        ),
    "unable_to_save_the_media_twitter_returned_a_status_of_response_statusCode":
        m19,
    "unable_to_stream_the_trend_location_preference":
        MessageLookupByLibrary.simpleMessage(
          "Nem közvetíthető a trend hely preferencia",
        ),
    "unknown": MessageLookupByLibrary.simpleMessage("Ismeretlen"),
    "unsave": MessageLookupByLibrary.simpleMessage("Nincs mentés"),
    "unsubscribe": MessageLookupByLibrary.simpleMessage("Leiratkozás"),
    "unsupported_url": MessageLookupByLibrary.simpleMessage(
      "Nem támogatott URL",
    ),
    "update_to_release_version_through_your_fdroid_client": m20,
    "updates": MessageLookupByLibrary.simpleMessage("Frissítések"),
    "use_true_black_for_the_dark_mode_theme":
        MessageLookupByLibrary.simpleMessage(
          "Használjon teljesen feketét a sötét módban",
        ),
    "user_not_found": MessageLookupByLibrary.simpleMessage(
      "Felhasználó nem található",
    ),
    "username": MessageLookupByLibrary.simpleMessage("Felhasználónév"),
    "username_exclude": MessageLookupByLibrary.simpleMessage(
      "Kizárt felhasználónév",
    ),
    "username_label": MessageLookupByLibrary.simpleMessage("Felhasználónév:"),
    "usernames": MessageLookupByLibrary.simpleMessage("Felhasználónevek"),
    "version": MessageLookupByLibrary.simpleMessage("Verzió"),
    "warning_regular_account_unauthenticated_access_description":
        MessageLookupByLibrary.simpleMessage(
          "A Twitter/X kikapcsolta a vendég fiókok létrehozását. Be tudja állítani sima fiókját(jait) a Beállítások > Fiók részben. Fiók nélkül csak korlátozottan érhetőek el a tweet-ek és profilok. Könnyen létre tud hozni egy névtelen sima fiókot az alábbiak alapján:",
        ),
    "warning_regular_account_unauthenticated_access_title":
        MessageLookupByLibrary.simpleMessage(
          "Sima fiókok és nem hiteles hozzáférés",
        ),
    "when_a_new_app_update_is_available": MessageLookupByLibrary.simpleMessage(
      "Amikor egy új app frissítés elérhető",
    ),
    "whether_errors_should_be_reported_to_":
        MessageLookupByLibrary.simpleMessage(
          "Kell e a hibát bejelenteni az illetékes számára ",
        ),
    "whether_to_hide_tweets_marked_as_sensitive":
        MessageLookupByLibrary.simpleMessage(
          "Elrejtésre kerüljenek e az érzékeny tweet-ek",
        ),
    "which_tab_is_shown_when_the_app_opens":
        MessageLookupByLibrary.simpleMessage(
          "Melyik fül nyílik meg az app megnyitásakor",
        ),
    "which_tab_is_shown_when_the_subscription_opens":
        MessageLookupByLibrary.simpleMessage(
          "Melyik lapot mutatja a feliratkozások megnyitásakor",
        ),
    "would_you_like_to_enable_automatic_error_reporting":
        MessageLookupByLibrary.simpleMessage(
          "Be akarja kapcsolni az automata hiba jelentés küldést?",
        ),
    "x_api": MessageLookupByLibrary.simpleMessage("X API"),
    "yes": MessageLookupByLibrary.simpleMessage("Igen"),
    "yes_please": MessageLookupByLibrary.simpleMessage("Igen, kérem"),
    "you_have_not_saved_any_tweets_yet": MessageLookupByLibrary.simpleMessage(
      "Nem mentett el eddig tweet-eket!",
    ),
    "you_must_have_at_least_2_home_screen_pages":
        MessageLookupByLibrary.simpleMessage(
          "Legalább kettő kezdőlappal kell rendelkeznie",
        ),
    "your_profile_must_be_public_otherwise_the_import_will_not_work":
        MessageLookupByLibrary.simpleMessage(
          "A profiljának publikusnak kell lenni, máskülönben nem működik az importálás",
        ),
    "your_report_will_be_sent_to_fritter__project":
        MessageLookupByLibrary.simpleMessage(
          "A riport küldésre került a Squawker  projektje felé. Az adatvédelmi politikát itt találja:",
        ),
  };
}
