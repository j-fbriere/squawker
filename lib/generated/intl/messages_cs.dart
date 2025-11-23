// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a cs locale. All the
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
  String get localeName => 'cs';

  static String m0(name) => "Opravdu chcete odstranit skupinu ${name}?";

  static String m1(fileName) => "Data exportována do ${fileName}";

  static String m2(fullPath) => "Data exportována do ${fullPath}";

  static String m3(timeagoFormat) => "Ukončeno ${timeagoFormat}";

  static String m4(timeagoFormat) => "Končí za ${timeagoFormat}";

  static String m5(snapshotData) => "Dokončeno s ${snapshotData} uživateli";

  static String m6(name) => "Skupina: ${name}";

  static String m7(snapshotData) =>
      "Zatím importováno ${snapshotData} uživatelů";

  static String m8(date) => "Připojen/a ${date}";

  static String m10(num, numFormatted) =>
      "${Intl.plural(num, zero: 'Žádné hlasy', one: 'Jeden hlas', two: 'Dva hlasy', few: '${numFormatted} hlasy', many: '${numFormatted} hlasů', other: '${numFormatted} hlasů')}";

  static String m11(errorMessage) =>
      "Zkontrolujte prosím vaše připojení k internetu.\n\n${errorMessage}";

  static String m13(releaseVersion) => "Ťukněte pro stažení ${releaseVersion}";

  static String m14(getMediaType) => "Ťukněte pro zobrazení ${getMediaType}";

  static String m15(filePath) =>
      "Soubor neexistuje. Ujistěte se, že se nachází v ${filePath}";

  static String m16(thisTweetUserName, timeAgo) =>
      "${thisTweetUserName} retweetnul ${timeAgo}";

  static String m17(num, numFormatted) =>
      "${Intl.plural(num, zero: 'žádné tweety', one: 'jeden tweet', two: 'dva tweety', few: '${numFormatted} tweety', many: '${numFormatted} tweetů', other: '${numFormatted} tweetů')}";

  static String m18(widgetPlaceName) =>
      "Nepodařilo se načíst trendy pro ${widgetPlaceName}";

  static String m19(responseStatusCode) =>
      "Nepodařilo se uložit média. Twitter/X vrátil stav ${responseStatusCode}";

  static String m20(releaseVersion) =>
      "Aktualizovat na ${releaseVersion} pomocí F-Droidu";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("O aplikaci"),
    "account_suspended": MessageLookupByLibrary.simpleMessage(
      "Účet pozastaven",
    ),
    "activate_non_confirmation_bias_mode_description":
        MessageLookupByLibrary.simpleMessage(
          "Skrýt autory tweetů. Vyhněte se konfirmačnímu zkreslení na základě autoritativních argumentů.",
        ),
    "activate_non_confirmation_bias_mode_label":
        MessageLookupByLibrary.simpleMessage(
          "Aktivovat režim zkreslení bez potvrzení",
        ),
    "add_subscriptions": MessageLookupByLibrary.simpleMessage("Přidat odběry"),
    "add_to_group": MessageLookupByLibrary.simpleMessage("Přidat do skupiny"),
    "all": MessageLookupByLibrary.simpleMessage("Vše"),
    "all_the_great_software_used_by_fritter":
        MessageLookupByLibrary.simpleMessage(
          "Všechen úžasný software používaný Squawkerem",
        ),
    "an_update_for_fritter_is_available": MessageLookupByLibrary.simpleMessage(
      "Je dostupná aktualizace Squawkeru! 🚀",
    ),
    "are_you_sure": MessageLookupByLibrary.simpleMessage("Opravdu?"),
    "are_you_sure_you_want_to_delete_the_subscription_group_name_of_group": m0,
    "back": MessageLookupByLibrary.simpleMessage("Zpět"),
    "bad_guest_token": MessageLookupByLibrary.simpleMessage(
      "Twitter/X zneplatnil náš přístupový token. Zkuste prosím znovu otevřít Squawker!",
    ),
    "blue_theme_based_on_the_twitter_color_scheme":
        MessageLookupByLibrary.simpleMessage(
          "Modré téma založené na barevném schématu Twitter/Xu",
        ),
    "cancel": MessageLookupByLibrary.simpleMessage("Zrušit"),
    "catastrophic_failure": MessageLookupByLibrary.simpleMessage(
      "Katastrofické selhání",
    ),
    "choose": MessageLookupByLibrary.simpleMessage("Vybrat"),
    "choose_pages": MessageLookupByLibrary.simpleMessage("Vybrat stránky"),
    "close": MessageLookupByLibrary.simpleMessage("Zavřít"),
    "confirm_close_fritter": MessageLookupByLibrary.simpleMessage(
      "Opravdu chcete zavřít Squawker?",
    ),
    "contribute": MessageLookupByLibrary.simpleMessage("Pomoct s vývojem"),
    "copied_address_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "Adresa zkopírována do schránky",
    ),
    "copied_version_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "Verze zkopírována do schránky",
    ),
    "could_not_contact_twitter": MessageLookupByLibrary.simpleMessage(
      "Nepodařilo se kontaktovat Twitter/X",
    ),
    "could_not_find_any_tweets_by_this_user":
        MessageLookupByLibrary.simpleMessage(
          "Nepodařilo se nalézt žádné tweety tohoto uživatele!",
        ),
    "could_not_find_any_tweets_from_the_last_7_days":
        MessageLookupByLibrary.simpleMessage(
          "Nepodařilo se nalézt žádné tweety z posledních 7 dnů!",
        ),
    "country": MessageLookupByLibrary.simpleMessage("Země"),
    "dark": MessageLookupByLibrary.simpleMessage("Tmavé"),
    "data": MessageLookupByLibrary.simpleMessage("Data"),
    "data_exported_to_fileName": m1,
    "data_exported_to_fullPath": m2,
    "data_imported_successfully": MessageLookupByLibrary.simpleMessage(
      "Data úspěšně importována",
    ),
    "date_created": MessageLookupByLibrary.simpleMessage("Datum vytvoření"),
    "date_subscribed": MessageLookupByLibrary.simpleMessage("Datum odběru"),
    "default_tab": MessageLookupByLibrary.simpleMessage("Výchozí karta"),
    "delete": MessageLookupByLibrary.simpleMessage("Odstranit"),
    "disable_screenshots": MessageLookupByLibrary.simpleMessage(
      "Zakázat snímky obrazovky",
    ),
    "disable_screenshots_hint": MessageLookupByLibrary.simpleMessage(
      "Zabránit pořizování snímků obrazovky. Nemusí fungovat na všech zařízeních.",
    ),
    "disabled": MessageLookupByLibrary.simpleMessage("Zakázáno"),
    "donate": MessageLookupByLibrary.simpleMessage("Přispět"),
    "download": MessageLookupByLibrary.simpleMessage("Stáhnout"),
    "download_handling": MessageLookupByLibrary.simpleMessage(
      "Způsob stahování",
    ),
    "download_handling_description": MessageLookupByLibrary.simpleMessage(
      "Způsob, jakým by mělo fungovat stahování",
    ),
    "download_handling_type_ask": MessageLookupByLibrary.simpleMessage(
      "Vždy se zeptat",
    ),
    "download_handling_type_directory": MessageLookupByLibrary.simpleMessage(
      "Uložit do adresáře",
    ),
    "download_media_no_url": MessageLookupByLibrary.simpleMessage(
      "Nepodařilo se stáhnout média. Možná jsou dostupná jen jako stream, který Squawker zatím nedokáže stáhnout.",
    ),
    "download_path": MessageLookupByLibrary.simpleMessage("Cesta pro stažené"),
    "downloading_media": MessageLookupByLibrary.simpleMessage(
      "Stahování médií...",
    ),
    "enable_": MessageLookupByLibrary.simpleMessage("Povolit ?"),
    "ended_timeago_format_endsAt_allowFromNow_true": m3,
    "ends_timeago_format_endsAt_allowFromNow_true": m4,
    "enter_your_twitter_username": MessageLookupByLibrary.simpleMessage(
      "Zadejte vaše uživatelské jméno na Twitter/Xu",
    ),
    "export": MessageLookupByLibrary.simpleMessage("Exportovat"),
    "export_settings": MessageLookupByLibrary.simpleMessage(
      "Exportovat nastavení?",
    ),
    "export_subscription_group_members": MessageLookupByLibrary.simpleMessage(
      "Exportovat členy skupin odběrů?",
    ),
    "export_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "Exportovat skupiny odběrů?",
    ),
    "export_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Exportovat odběry?",
    ),
    "export_tweets": MessageLookupByLibrary.simpleMessage("Exportovat tweety?"),
    "export_your_data": MessageLookupByLibrary.simpleMessage(
      "Exportovat vaše data",
    ),
    "feed": MessageLookupByLibrary.simpleMessage("Zdroj"),
    "filters": MessageLookupByLibrary.simpleMessage("Filtry"),
    "finish": MessageLookupByLibrary.simpleMessage("Dokončit"),
    "finished_with_snapshotData_users": m5,
    "followers": MessageLookupByLibrary.simpleMessage("Sledující"),
    "following": MessageLookupByLibrary.simpleMessage("Sledování"),
    "forbidden": MessageLookupByLibrary.simpleMessage(
      "Twitter/X říká, že přístup k tomuto je zamítnut",
    ),
    "fritter": MessageLookupByLibrary.simpleMessage("Squawker"),
    "fritter_blue": MessageLookupByLibrary.simpleMessage("Squawkerová modrá"),
    "functionality_unsupported": MessageLookupByLibrary.simpleMessage(
      "Tato funkce již není podporována Twitter/Xem!",
    ),
    "general": MessageLookupByLibrary.simpleMessage("Obecné"),
    "group_name": m6,
    "groups": MessageLookupByLibrary.simpleMessage("Skupiny"),
    "help_make_fritter_even_better": MessageLookupByLibrary.simpleMessage(
      "Pomozte vylepšit Squawker",
    ),
    "help_support_fritters_future": MessageLookupByLibrary.simpleMessage(
      "Podpořte vývoj Squawkeru",
    ),
    "hide_sensitive_tweets": MessageLookupByLibrary.simpleMessage(
      "Skrýt citlivé tweety",
    ),
    "home": MessageLookupByLibrary.simpleMessage("Domů"),
    "if_you_have_any_feedback_on_this_feature_please_leave_it_on":
        MessageLookupByLibrary.simpleMessage(
          "Pokud máte ohledně této funkce jakoukoli zpětnou vazbu, zanechte ji prosím",
        ),
    "import": MessageLookupByLibrary.simpleMessage("Importovat"),
    "import_data_from_another_device": MessageLookupByLibrary.simpleMessage(
      "Importovat data z jiného zařízení",
    ),
    "import_from_twitter": MessageLookupByLibrary.simpleMessage(
      "Importovat z Twitter/Xu",
    ),
    "import_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Importovat odběry",
    ),
    "imported_snapshot_data_users_so_far": m7,
    "include_replies": MessageLookupByLibrary.simpleMessage(
      "Zahrnout odpovědi",
    ),
    "include_retweets": MessageLookupByLibrary.simpleMessage(
      "Zahrnout retweety",
    ),
    "joined": m8,
    "language": MessageLookupByLibrary.simpleMessage("Jazyk"),
    "language_subtitle": MessageLookupByLibrary.simpleMessage(
      "Vyžaduje restart",
    ),
    "large": MessageLookupByLibrary.simpleMessage("Velký"),
    "legacy_android_import": MessageLookupByLibrary.simpleMessage(
      "Import ze starších Androidů",
    ),
    "let_the_developers_know_if_something_is_broken":
        MessageLookupByLibrary.simpleMessage(
          "Dejte vývojářům vědět, že je něco rozbité",
        ),
    "licenses": MessageLookupByLibrary.simpleMessage("Licence"),
    "light": MessageLookupByLibrary.simpleMessage("Světlé"),
    "live": MessageLookupByLibrary.simpleMessage("ŽIVĚ"),
    "logging": MessageLookupByLibrary.simpleMessage("Protokolování"),
    "media": MessageLookupByLibrary.simpleMessage("Média"),
    "media_size": MessageLookupByLibrary.simpleMessage("Velikost médií"),
    "medium": MessageLookupByLibrary.simpleMessage("Střední"),
    "missing_page": MessageLookupByLibrary.simpleMessage("Chybějící stránka"),
    "mute_video_description": MessageLookupByLibrary.simpleMessage(
      "Zda mají být videa ve výchozím nastavení ztlumena",
    ),
    "mute_videos": MessageLookupByLibrary.simpleMessage("Ztlumit videa"),
    "name": MessageLookupByLibrary.simpleMessage("Název"),
    "newTrans": MessageLookupByLibrary.simpleMessage("Nová"),
    "next": MessageLookupByLibrary.simpleMessage("Další"),
    "no": MessageLookupByLibrary.simpleMessage("Ne"),
    "no_data_was_returned_which_should_never_happen_please_report_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "Nebyla vrácena žádná data, což by se nikdy nemělo stát. Pokud je to možné, nahlaste to prosím jako chybu!",
        ),
    "no_results": MessageLookupByLibrary.simpleMessage("Žádné výsledky"),
    "no_results_for": MessageLookupByLibrary.simpleMessage(
      "Žádné výsledky pro:",
    ),
    "no_subscriptions_try_searching_or_importing_some":
        MessageLookupByLibrary.simpleMessage(
          "Žádné odběry. Zkuste nějaké vyhledat nebo importovat!",
        ),
    "not_set": MessageLookupByLibrary.simpleMessage("Nenastaveno"),
    "note_due_to_a_twitter_limitation_not_all_tweets_may_be_included":
        MessageLookupByLibrary.simpleMessage(
          "Poznámka: kvuli imitaci Twitter/Xu nemusí byt zahrnuty všechny tweety",
        ),
    "numberFormat_format_total_votes": m10,
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "only_public_subscriptions_can_be_imported":
        MessageLookupByLibrary.simpleMessage(
          "Odběry lze importovat pouze z veřejných profilů",
        ),
    "oops_something_went_wrong": MessageLookupByLibrary.simpleMessage(
      "Jejda! Něco se pokazilo 🥲",
    ),
    "open_app_settings": MessageLookupByLibrary.simpleMessage(
      "Otevřít nastavení aplikace",
    ),
    "page_not_found": MessageLookupByLibrary.simpleMessage(
      "Twitter/X říká, že stránka neexistuje, nemusí to ale být pravda",
    ),
    "permission_not_granted": MessageLookupByLibrary.simpleMessage(
      "Oprávnění nebylo uděleno. Zkuste to prosím znovu po jeho udělení!",
    ),
    "pick_a_color": MessageLookupByLibrary.simpleMessage("Vyberte si barvu!"),
    "pick_an_icon": MessageLookupByLibrary.simpleMessage("Vyberte si ikonu!"),
    "pinned_tweet": MessageLookupByLibrary.simpleMessage("Připnutý tweet"),
    "playback_speed": MessageLookupByLibrary.simpleMessage(
      "Rychlost přehrávání",
    ),
    "please_check_your_internet_connection_error_message": m11,
    "please_enter_a_name": MessageLookupByLibrary.simpleMessage(
      "Zadejte prosím název",
    ),
    "please_make_sure_the_data_you_wish_to_import_is_located_there_then_press_the_import_button_below":
        MessageLookupByLibrary.simpleMessage(
          "Ujistěte se, že data, která chcete importovat, se zde nachází a poté stiskněte tlačítko níže.",
        ),
    "please_note_that_the_method_fritter_uses_to_import_subscriptions_is_heavily_rate_limited_by_twitter_so_this_may_fail_if_you_have_a_lot_of_followed_accounts":
        MessageLookupByLibrary.simpleMessage(
          "Vezměte prosím na vědomí, že způsob, který používá Squawker pro import odběrů je silně limitován Twitter/Xem, takže při velkém množství sledovaných účtů může tato akce selhat.",
        ),
    "possibly_sensitive": MessageLookupByLibrary.simpleMessage(
      "Potenciálně citlivé",
    ),
    "possibly_sensitive_profile": MessageLookupByLibrary.simpleMessage(
      "Tento profil může obsahovat potenciálně citlivé obrázky, jazyk nebo jiný obsah. Chcete jej přesto zobrazit?",
    ),
    "possibly_sensitive_tweet": MessageLookupByLibrary.simpleMessage(
      "Tento tweet obsahuje potenciálně citlivý obsah. Chcete jej zobrazit?",
    ),
    "prefix": MessageLookupByLibrary.simpleMessage("předpona"),
    "private_profile": MessageLookupByLibrary.simpleMessage("Soukromý profil"),
    "released_under_the_mit_license": MessageLookupByLibrary.simpleMessage(
      "Vydáno pod licencí MIT",
    ),
    "replying_to": MessageLookupByLibrary.simpleMessage("Odpověď uživateli"),
    "report": MessageLookupByLibrary.simpleMessage("Nahlásit"),
    "report_a_bug": MessageLookupByLibrary.simpleMessage("Nahlásit chybu"),
    "reporting_an_error": MessageLookupByLibrary.simpleMessage(
      "Nahlašování chyby",
    ),
    "reset_home_pages": MessageLookupByLibrary.simpleMessage(
      "Obnovit výchozí nastavení stránek",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Zkusit znovu"),
    "save": MessageLookupByLibrary.simpleMessage("Uložit"),
    "save_bandwidth_using_smaller_images": MessageLookupByLibrary.simpleMessage(
      "Ušetřete data s menšími obrázky",
    ),
    "saved": MessageLookupByLibrary.simpleMessage("Uloženo"),
    "saved_tweet_too_large": MessageLookupByLibrary.simpleMessage(
      "Tento uložený tweet nebylo možné zobrazit, protože je příliš velký na to, aby se načetl. Nahlaste to prosím vývojářům.",
    ),
    "search": MessageLookupByLibrary.simpleMessage("Hledat"),
    "search_term": MessageLookupByLibrary.simpleMessage("Hledaný výraz"),
    "select": MessageLookupByLibrary.simpleMessage("Vybrat"),
    "selecting_individual_accounts_to_import_and_assigning_groups_are_both_planned_for_the_future_already":
        MessageLookupByLibrary.simpleMessage(
          "Vybírání individuálních účtů pro import a přidělování skupin jsou již v plánu!",
        ),
    "send": MessageLookupByLibrary.simpleMessage("Odeslat"),
    "share_base_url": MessageLookupByLibrary.simpleMessage(
      "Vlastní adresa URL sdílení",
    ),
    "share_base_url_description": MessageLookupByLibrary.simpleMessage(
      "Použít vlastní základní adresu URL při sdílení",
    ),
    "share_tweet_content": MessageLookupByLibrary.simpleMessage(
      "Sdílet obsah tweetu",
    ),
    "share_tweet_content_and_link": MessageLookupByLibrary.simpleMessage(
      "Sdílet obsah tweetu a odkaz",
    ),
    "share_tweet_link": MessageLookupByLibrary.simpleMessage(
      "Sdílet odkaz na tweet",
    ),
    "should_check_for_updates_description":
        MessageLookupByLibrary.simpleMessage(
          "Zkontrolovat aktualizace při spuštění Squawkeru",
        ),
    "should_check_for_updates_label": MessageLookupByLibrary.simpleMessage(
      "Zkontrolovat aktualizace",
    ),
    "small": MessageLookupByLibrary.simpleMessage("Malý"),
    "something_broke_in_fritter": MessageLookupByLibrary.simpleMessage(
      "Něco se pokazilo ve Squawkeru.",
    ),
    "something_just_went_wrong_in_fritter_and_an_error_report_has_been_generated":
        MessageLookupByLibrary.simpleMessage(
          "Ve Squawkeru se něco pokazilo a byl vygenerován záznam o chybě. Záznam může být odeslán vývojářům Squawkeru pro vyřešení problému.",
        ),
    "sorry_the_replied_tweet_could_not_be_found":
        MessageLookupByLibrary.simpleMessage(
          "Omlouváme se, ale odpovídaný tweety nebyl nalezen!",
        ),
    "subscribe": MessageLookupByLibrary.simpleMessage("Odebírat"),
    "subscriptions": MessageLookupByLibrary.simpleMessage("Odběry"),
    "subtitles": MessageLookupByLibrary.simpleMessage("Titulky"),
    "successfully_saved_the_media": MessageLookupByLibrary.simpleMessage(
      "Média uložena!",
    ),
    "system": MessageLookupByLibrary.simpleMessage("Systémové"),
    "tap_to_download_release_version": m13,
    "tap_to_show_getMediaType_item_type": m14,
    "thanks_for_helping_fritter": MessageLookupByLibrary.simpleMessage(
      "Děkujeme za pomoc Squawkeru! 💖",
    ),
    "the_file_does_not_exist_please_ensure_it_is_located_at_file_path": m15,
    "the_github_issue": MessageLookupByLibrary.simpleMessage(
      "problém na GitHubu (#143)",
    ),
    "the_tweet_did_not_contain_any_text_this_is_unexpected":
        MessageLookupByLibrary.simpleMessage(
          "Tweety neobsahoval žádný text. Toto je neočekávané",
        ),
    "theme": MessageLookupByLibrary.simpleMessage("Téma"),
    "theme_mode": MessageLookupByLibrary.simpleMessage("Režim motivu"),
    "there_were_no_trends_returned_this_is_unexpected_please_report_as_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "Nebyly vráceny žádné trendy. Toto je neočekávané! Pokud je to možné, nahlaste to prosím jako chybu.",
        ),
    "this_group_contains_no_subscriptions":
        MessageLookupByLibrary.simpleMessage(
          "Tato skupina neobsahuje žádné odběry!",
        ),
    "this_took_too_long_to_load_please_check_your_network_connection":
        MessageLookupByLibrary.simpleMessage(
          "Tento obsah se načítal příliš dlouho. Zkontrolujte prosím vaše připojení k internetu!",
        ),
    "this_tweet_is_unavailable": MessageLookupByLibrary.simpleMessage(
      "Tento tweet je nedostupný. Nejspíš byl odstraněn.",
    ),
    "this_tweet_user_name_retweeted": m16,
    "this_user_does_not_follow_anyone": MessageLookupByLibrary.simpleMessage(
      "Tento uživatel nikoho nesleduje!",
    ),
    "this_user_does_not_have_anyone_following_them":
        MessageLookupByLibrary.simpleMessage(
          "Tohoto uživatele nikdo nesleduje!",
        ),
    "thread": MessageLookupByLibrary.simpleMessage("Vlákno"),
    "thumbnail": MessageLookupByLibrary.simpleMessage("Náhled"),
    "timed_out": MessageLookupByLibrary.simpleMessage("Vypršel čas"),
    "to_import_subscriptions_from_an_existing_twitter_account_enter_your_username_below":
        MessageLookupByLibrary.simpleMessage(
          "Pro import odběrů z existujícího Twitter/X účtu zadejte níže vaše uživatelské jméno.",
        ),
    "toggle_all": MessageLookupByLibrary.simpleMessage("Přepnout vše"),
    "trending": MessageLookupByLibrary.simpleMessage("Trendy"),
    "trends": MessageLookupByLibrary.simpleMessage("Trendy"),
    "true_black": MessageLookupByLibrary.simpleMessage("Pravá černá?"),
    "tweets": MessageLookupByLibrary.simpleMessage("Tweety"),
    "tweets_and_replies": MessageLookupByLibrary.simpleMessage(
      "Tweety a odpovědi",
    ),
    "tweets_number": m17,
    "two_home_pages_required": MessageLookupByLibrary.simpleMessage(
      "Musíte mít alespoň 2 stránky domovské obrazovky.",
    ),
    "unable_to_find_the_available_trend_locations":
        MessageLookupByLibrary.simpleMessage(
          "Nepodařilo se nalézt umístění trendů.",
        ),
    "unable_to_find_your_saved_tweets": MessageLookupByLibrary.simpleMessage(
      "Nepodařilo se nalézt vaše uložené tweety.",
    ),
    "unable_to_import": MessageLookupByLibrary.simpleMessage(
      "Import se nezdařil",
    ),
    "unable_to_load_home_pages": MessageLookupByLibrary.simpleMessage(
      "Nepodařilo se načíst vaše domovské stránky",
    ),
    "unable_to_load_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "Nepodařilo se načíst skupiny odběrů",
    ),
    "unable_to_load_the_group": MessageLookupByLibrary.simpleMessage(
      "Nepodařilo se načíst skupinu",
    ),
    "unable_to_load_the_group_settings": MessageLookupByLibrary.simpleMessage(
      "Nepodařilo se načíst nastavení skupiny",
    ),
    "unable_to_load_the_list_of_follows": MessageLookupByLibrary.simpleMessage(
      "Nepodařilo se načíst seznam sledování",
    ),
    "unable_to_load_the_next_page_of_follows":
        MessageLookupByLibrary.simpleMessage(
          "Nepodařilo se načíst další stránku sledování",
        ),
    "unable_to_load_the_next_page_of_replies":
        MessageLookupByLibrary.simpleMessage(
          "Nepodařilo se načíst další stránku odpovědí",
        ),
    "unable_to_load_the_next_page_of_tweets":
        MessageLookupByLibrary.simpleMessage(
          "Nepodařilo se načíst další stránku tweetů",
        ),
    "unable_to_load_the_profile": MessageLookupByLibrary.simpleMessage(
      "Nepodařilo se načíst profil",
    ),
    "unable_to_load_the_search_results": MessageLookupByLibrary.simpleMessage(
      "Nepodařilo se načíst výsledky hledání.",
    ),
    "unable_to_load_the_trends_for_widget_place_name": m18,
    "unable_to_load_the_tweet": MessageLookupByLibrary.simpleMessage(
      "Nepodařilo se načíst tweet",
    ),
    "unable_to_load_the_tweets": MessageLookupByLibrary.simpleMessage(
      "Nepodařilo se načíst tweety",
    ),
    "unable_to_load_the_tweets_for_the_feed":
        MessageLookupByLibrary.simpleMessage(
          "Nepodařilo se načíst tweety pro váš zdroj",
        ),
    "unable_to_refresh_the_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Nepodařilo se znovu načíst odběry",
    ),
    "unable_to_run_the_database_migrations":
        MessageLookupByLibrary.simpleMessage(
          "Nepodařilo se spustit migrace databáze",
        ),
    "unable_to_save_the_media_twitter_returned_a_status_of_response_statusCode":
        m19,
    "unable_to_stream_the_trend_location_preference":
        MessageLookupByLibrary.simpleMessage(
          "Nepodařilo se stremovat předvolbu umístění trendů",
        ),
    "unknown": MessageLookupByLibrary.simpleMessage("Neznámé"),
    "unsave": MessageLookupByLibrary.simpleMessage("Zrušit uložení"),
    "unsubscribe": MessageLookupByLibrary.simpleMessage("Zrušit odběr"),
    "unsupported_url": MessageLookupByLibrary.simpleMessage(
      "Nepodporovaná adresa URL",
    ),
    "update_to_release_version_through_your_fdroid_client": m20,
    "updates": MessageLookupByLibrary.simpleMessage("Aktualizace"),
    "use_true_black_for_the_dark_mode_theme":
        MessageLookupByLibrary.simpleMessage(
          "Použít pravou černou pro tmavé téma",
        ),
    "user_not_found": MessageLookupByLibrary.simpleMessage(
      "Uživatel nenalezen",
    ),
    "username": MessageLookupByLibrary.simpleMessage("Uživatelské jméno"),
    "version": MessageLookupByLibrary.simpleMessage("Verze"),
    "when_a_new_app_update_is_available": MessageLookupByLibrary.simpleMessage(
      "Když je dostupná aktualizace aplikace",
    ),
    "whether_errors_should_be_reported_to_":
        MessageLookupByLibrary.simpleMessage(
          "Nastavit, zda mají být chyby nahlašovány do ",
        ),
    "whether_to_hide_tweets_marked_as_sensitive":
        MessageLookupByLibrary.simpleMessage(
          "Zda skrývat tweety označené jako citlivé",
        ),
    "which_tab_is_shown_when_the_app_opens":
        MessageLookupByLibrary.simpleMessage(
          "Karta, která bude zobrazena při otevření aplikace",
        ),
    "would_you_like_to_enable_automatic_error_reporting":
        MessageLookupByLibrary.simpleMessage(
          "Chcete povolit automatické nahlašování?",
        ),
    "yes": MessageLookupByLibrary.simpleMessage("Ano"),
    "yes_please": MessageLookupByLibrary.simpleMessage("Ano, prosím"),
    "you_have_not_saved_any_tweets_yet": MessageLookupByLibrary.simpleMessage(
      "Zatím jste si neuložili žádné tweety!",
    ),
    "you_must_have_at_least_2_home_screen_pages":
        MessageLookupByLibrary.simpleMessage(
          "Musíte mít alespoň 2 stránky domovské obrazovky",
        ),
    "your_profile_must_be_public_otherwise_the_import_will_not_work":
        MessageLookupByLibrary.simpleMessage(
          "Váš profil musí být veřejný, jinak nebude import fungovat",
        ),
    "your_report_will_be_sent_to_fritter__project":
        MessageLookupByLibrary.simpleMessage(
          "Vaše nahlášení bylo odesláno do  projektu Squawkeru. Podrobnosti o soukromí lze nalézt na:",
        ),
  };
}
