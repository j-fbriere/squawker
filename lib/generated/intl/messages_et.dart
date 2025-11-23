// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a et locale. All the
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
  String get localeName => 'et';

  static String m0(name) =>
      "Kas sa oled kindel, et soovid kustutada tellimuste grupi ${name}?";

  static String m1(fileName) => "Andmed on eksporditud faili ${fileName}";

  static String m2(fullPath) => "Andmed on eksporditud kausta ${fullPath}";

  static String m3(timeagoFormat) => "Lõppes ${timeagoFormat}";

  static String m4(timeagoFormat) => "Lõppeb ${timeagoFormat}";

  static String m5(snapshotData) =>
      "${snapshotData} kasutaja importimine on valmis";

  static String m6(name) => "Grupp: ${name}";

  static String m7(snapshotData) =>
      "Seni on imporditud ${snapshotData} kasutajat";

  static String m8(date) => "Liitunud ${date}";

  static String m9(nbrGuestAccounts) =>
      "Kasutusel on ${nbrGuestAccounts} külaliskonto(t)";

  static String m10(num, numFormatted) =>
      "${Intl.plural(num, zero: 'pole hääletatud', one: 'üks hääl', two: 'kaks häält', few: '${numFormatted} häält', many: '${numFormatted} häält', other: '${numFormatted} häält')}";

  static String m11(errorMessage) =>
      "Palun kontrolli oma võrguühendust.\n\n${errorMessage}";

  static String m12(nbrRegularAccounts) =>
      "Tavakontod (${nbrRegularAccounts}):";

  static String m13(releaseVersion) =>
      "Versiooni ${releaseVersion} allalaadimiseks klõpsi";

  static String m14(getMediaType) => "${getMediaType} kuvamiseks klõpsi";

  static String m15(filePath) =>
      "Faili ei leidu. Palun kontrolli, et ta asuks siin ${filePath}";

  static String m16(thisTweetUserName, timeAgo) =>
      "${thisTweetUserName} kirjutas ${timeAgo} eest kordussäutsu";

  static String m17(num, numFormatted) =>
      "${Intl.plural(num, zero: 'säutse pole', one: 'üks säuts', two: 'kaks säutsu', few: '${numFormatted} säutsu', many: '${numFormatted} säutsu', other: '${numFormatted} säutsu')}";

  static String m18(widgetPlaceName) =>
      "Ei õnnestu laadida hetkel populaarsemaid viiteid ja otsinguid riigile või piirkonnale: ${widgetPlaceName}";

  static String m19(responseStatusCode) =>
      "Meedia salvestamine ei õnnestu. Twitter/X\'i vastus päringule: ${responseStatusCode}";

  static String m20(releaseVersion) =>
      "Uuenduseks versioonini ${releaseVersion} kasuta oma F-Droidi klienti";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("Rakenduse teave"),
    "account": MessageLookupByLibrary.simpleMessage("Kasutajakonto"),
    "account_suspended": MessageLookupByLibrary.simpleMessage(
      "Kasutajakonto on ajutiselt peatatud",
    ),
    "activate_non_confirmation_bias_mode_description":
        MessageLookupByLibrary.simpleMessage(
          "Antud valik peidab säutsude autorid. Sellega väldid sotsiaalmeediale omaseid kinnituskalduvusega (confirmation bias) arvestavaid algoritme.",
        ),
    "activate_non_confirmation_bias_mode_label":
        MessageLookupByLibrary.simpleMessage(
          "Kasuta kinnituskalduvust eiravat režiimi",
        ),
    "add_account": MessageLookupByLibrary.simpleMessage("Lisa konto"),
    "add_account_title": MessageLookupByLibrary.simpleMessage(
      "Lisa kasutajakonto",
    ),
    "add_subscriptions": MessageLookupByLibrary.simpleMessage("Lisa tellimusi"),
    "add_to_feed": MessageLookupByLibrary.simpleMessage("Lisa säutsuvoogu"),
    "add_to_group": MessageLookupByLibrary.simpleMessage("Lisa gruppi"),
    "all": MessageLookupByLibrary.simpleMessage("Kõik"),
    "all_the_great_software_used_by_fritter":
        MessageLookupByLibrary.simpleMessage(
          "Kõik suurepärane tarkvara, mida Squawker kasutab",
        ),
    "allow_background_play_description": MessageLookupByLibrary.simpleMessage(
      "Luba meediat esitada taustal",
    ),
    "allow_background_play_label": MessageLookupByLibrary.simpleMessage(
      "Meedia esitamine taustal",
    ),
    "allow_background_play_other_apps_description":
        MessageLookupByLibrary.simpleMessage(
          "Luba muudel rakendustel esitada meediat taustal",
        ),
    "allow_background_play_other_apps_label":
        MessageLookupByLibrary.simpleMessage("Muud rakendused taustal"),
    "an_update_for_fritter_is_available": MessageLookupByLibrary.simpleMessage(
      "Squawker\'i tarkvarauuendus on saadaval! 🚀",
    ),
    "api_key": MessageLookupByLibrary.simpleMessage("API võti"),
    "app_info": MessageLookupByLibrary.simpleMessage(
      "Rakenduse üksikasjalik teave",
    ),
    "are_you_sure": MessageLookupByLibrary.simpleMessage("Kas sa oled kindel?"),
    "are_you_sure_you_want_to_delete_the_subscription_group_name_of_group": m0,
    "back": MessageLookupByLibrary.simpleMessage("Tagasi"),
    "bad_guest_token": MessageLookupByLibrary.simpleMessage(
      "Twitter/X on meie juurdepääsutunnuse kehtetuks tunnistanud. Palun proovi uuesti avada Squawker!",
    ),
    "beta": MessageLookupByLibrary.simpleMessage("BEETA"),
    "blue_theme_based_on_the_twitter_color_scheme":
        MessageLookupByLibrary.simpleMessage(
          "Sinine värviteema, mille aluseks on Twitter/Xi kujundus",
        ),
    "cancel": MessageLookupByLibrary.simpleMessage("Katkesta"),
    "catastrophic_failure": MessageLookupByLibrary.simpleMessage(
      "Kõik läks ikka väga viltu",
    ),
    "choose": MessageLookupByLibrary.simpleMessage("Vali"),
    "choose_pages": MessageLookupByLibrary.simpleMessage("Vali lehed"),
    "close": MessageLookupByLibrary.simpleMessage("Sulge"),
    "community_notes_title": MessageLookupByLibrary.simpleMessage(
      "Järgneva sisu on lisanud lugejad",
    ),
    "confirm_close_fritter": MessageLookupByLibrary.simpleMessage(
      "Kas sa oled kindel, et soovid panna Squawker\'i kinni?",
    ),
    "contribute": MessageLookupByLibrary.simpleMessage("Osale arenduses"),
    "copied_address_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "Kopeerisin aadressi lõikelauale",
    ),
    "copied_version_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "Kopeerisin versiooni lõikelauale",
    ),
    "could_not_contact_twitter": MessageLookupByLibrary.simpleMessage(
      "Puudub ühendus Twitter/X\'iga",
    ),
    "could_not_find_any_tweets_by_this_user":
        MessageLookupByLibrary.simpleMessage(
          "Ühtegi selle kasutaja säutsu ei leidunud!",
        ),
    "could_not_find_any_tweets_from_the_last_7_days":
        MessageLookupByLibrary.simpleMessage(
          "Viimase 7 päeva andmetest ei leidu ühtegi säutsu!",
        ),
    "country": MessageLookupByLibrary.simpleMessage("Riik"),
    "dark": MessageLookupByLibrary.simpleMessage("Tume teema"),
    "data": MessageLookupByLibrary.simpleMessage("Andmed"),
    "data_exported_to_fileName": m1,
    "data_exported_to_fullPath": m2,
    "data_imported_successfully": MessageLookupByLibrary.simpleMessage(
      "Andmete importimine õnnestus",
    ),
    "date_created": MessageLookupByLibrary.simpleMessage("Loomiskuupäev"),
    "date_subscribed": MessageLookupByLibrary.simpleMessage(
      "Tellimuse lisamise aeg",
    ),
    "default_subscription_tab": MessageLookupByLibrary.simpleMessage(
      "Tellimuste vaikimisi kaart",
    ),
    "default_tab": MessageLookupByLibrary.simpleMessage("Vaikimisi vaade"),
    "delete": MessageLookupByLibrary.simpleMessage("Kustuta"),
    "disable_screenshots": MessageLookupByLibrary.simpleMessage(
      "Lülita ekraanitõmmised välja",
    ),
    "disable_screenshots_hint": MessageLookupByLibrary.simpleMessage(
      "Ära luba teha ekraanitõmmiseid. See ei pruugi kõikides seadmetes toimida.",
    ),
    "disabled": MessageLookupByLibrary.simpleMessage("Pole kasutusel"),
    "donate": MessageLookupByLibrary.simpleMessage("Toeta rahaliselt"),
    "download": MessageLookupByLibrary.simpleMessage("Laadi alla"),
    "download_handling": MessageLookupByLibrary.simpleMessage(
      "Allalaadimiste seadistused",
    ),
    "download_handling_description": MessageLookupByLibrary.simpleMessage(
      "Kuidas allalaadimine peaks toimima",
    ),
    "download_handling_type_ask": MessageLookupByLibrary.simpleMessage(
      "Alati küsi",
    ),
    "download_handling_type_directory": MessageLookupByLibrary.simpleMessage(
      "Salvesta kausta",
    ),
    "download_media_no_url": MessageLookupByLibrary.simpleMessage(
      "Allalaadimine ei õnnestu. See meedia võib olla saadaval vaid voogedastusena ning Squawker veel ei oska teda alla laadida.",
    ),
    "download_path": MessageLookupByLibrary.simpleMessage(
      "Allalaadimiste kaust",
    ),
    "download_video_best_quality_description":
        MessageLookupByLibrary.simpleMessage(
          "Laadi videod alla parima võimaliku kvaliteediga",
        ),
    "download_video_best_quality_label": MessageLookupByLibrary.simpleMessage(
      "Allalaaditavate videote kvaliteet",
    ),
    "downloading_media": MessageLookupByLibrary.simpleMessage(
      "Laadin alla meediat...",
    ),
    "edit_account_title": MessageLookupByLibrary.simpleMessage(
      "Muuda kasutajakontot",
    ),
    "email_label": MessageLookupByLibrary.simpleMessage("E-posti aadress:"),
    "enable_": MessageLookupByLibrary.simpleMessage("Kas lubad kasutada \'t?"),
    "ended_timeago_format_endsAt_allowFromNow_true": m3,
    "ends_timeago_format_endsAt_allowFromNow_true": m4,
    "enhanced_feeds_description": MessageLookupByLibrary.simpleMessage(
      "Kasuta säutsuvoogude laadimisel tõhusamaid päringuid (aga neil on väike ajaühikus lubatud päringute arv)",
    ),
    "enhanced_feeds_label": MessageLookupByLibrary.simpleMessage(
      "Tõhusamad säutsuvood",
    ),
    "enhanced_profile_description": MessageLookupByLibrary.simpleMessage(
      "Pruugi kasutajaprofiilide laadimisel tõhusamaid päringuid",
    ),
    "enhanced_profile_label": MessageLookupByLibrary.simpleMessage(
      "Tõhusamad kasutajaprofiilid",
    ),
    "enhanced_searches_description": MessageLookupByLibrary.simpleMessage(
      "Kasuta otsingute tegemisel tõhusamaid päringuid (aga neil on väike ajaühikus lubatud päringute arv)",
    ),
    "enhanced_searches_label": MessageLookupByLibrary.simpleMessage(
      "Tõhusamad otsingud",
    ),
    "enter_comma_separated_twitter_usernames":
        MessageLookupByLibrary.simpleMessage(
          "Sisesta komadega eraldatud Twitter/X kasutajanimed",
        ),
    "enter_your_twitter_username": MessageLookupByLibrary.simpleMessage(
      "Sisesta oma Twitter/Xi kasutajanimi",
    ),
    "error_from_twitter": MessageLookupByLibrary.simpleMessage(
      "Twitter/X\'i viga",
    ),
    "exclusions_feed_description": MessageLookupByLibrary.simpleMessage(
      "Kasutajanimede loend, mida soovid säutsuvoost välistada",
    ),
    "exclusions_feed_label": MessageLookupByLibrary.simpleMessage(
      "Välistused säutsuvoost",
    ),
    "export": MessageLookupByLibrary.simpleMessage("Eksport"),
    "export_guest_accounts": MessageLookupByLibrary.simpleMessage(
      "Kas ekspordime külaliskontod?",
    ),
    "export_settings": MessageLookupByLibrary.simpleMessage(
      "Kas ekspordime seadistused?",
    ),
    "export_subscription_group_members": MessageLookupByLibrary.simpleMessage(
      "Kas ekspordime tellimuste gruppide liikmed?",
    ),
    "export_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "Kas ekspordime tellimuste grupid?",
    ),
    "export_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Kas ekspordime tellimused?",
    ),
    "export_tweets": MessageLookupByLibrary.simpleMessage(
      "Kas ekspordime säutsud?",
    ),
    "export_twitter_tokens": MessageLookupByLibrary.simpleMessage(
      "Kas ekspordime Twitter/X tunnusload?",
    ),
    "export_your_data": MessageLookupByLibrary.simpleMessage(
      "Ekspordi oma andmed",
    ),
    "feed": MessageLookupByLibrary.simpleMessage("Säutsuvoog"),
    "filters": MessageLookupByLibrary.simpleMessage("Filtrid"),
    "finish": MessageLookupByLibrary.simpleMessage("Lõpeta"),
    "finished_with_snapshotData_users": m5,
    "followers": MessageLookupByLibrary.simpleMessage("Jälgijat"),
    "following": MessageLookupByLibrary.simpleMessage("Jälgitavat"),
    "forbidden": MessageLookupByLibrary.simpleMessage(
      "Twitter/X ütleb, et juurdepääs sellele sisule on keelatud",
    ),
    "fritter": MessageLookupByLibrary.simpleMessage("Squawker"),
    "fritter_blue": MessageLookupByLibrary.simpleMessage("Squawker\'i sinine"),
    "functionality_unsupported": MessageLookupByLibrary.simpleMessage(
      "Twitter/X enam ei võimalda sellise funktsionaalsuse kasutamist!",
    ),
    "general": MessageLookupByLibrary.simpleMessage("Üldised seadistused"),
    "generic_username": MessageLookupByLibrary.simpleMessage("Kasutaja"),
    "group_name": m6,
    "groups": MessageLookupByLibrary.simpleMessage("Grupid"),
    "help_make_fritter_even_better": MessageLookupByLibrary.simpleMessage(
      "Aita muuta Squawker\'it veelgi paremaks",
    ),
    "help_support_fritters_future": MessageLookupByLibrary.simpleMessage(
      "Toeta Squawker\'i arendust rahaliselt",
    ),
    "hide_sensitive_tweets": MessageLookupByLibrary.simpleMessage(
      "Peida võimalikud ebasobiliku sisuga säutsud",
    ),
    "home": MessageLookupByLibrary.simpleMessage("Koduleht"),
    "if_you_have_any_feedback_on_this_feature_please_leave_it_on":
        MessageLookupByLibrary.simpleMessage(
          "Kui sul on selle funktsioonaalsuse kohta tagasisidet, palun kirjuta sellest aadressil",
        ),
    "import": MessageLookupByLibrary.simpleMessage("Import"),
    "import_data_from_another_device": MessageLookupByLibrary.simpleMessage(
      "Impordi andmed muust seadmest",
    ),
    "import_from_twitter": MessageLookupByLibrary.simpleMessage(
      "Impordi Twitter/Xist",
    ),
    "import_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Tellimuste import",
    ),
    "imported_snapshot_data_users_so_far": m7,
    "include_replies": MessageLookupByLibrary.simpleMessage(
      "Sealhulgas vastused",
    ),
    "include_retweets": MessageLookupByLibrary.simpleMessage(
      "Sealhulgas kordussäutsud",
    ),
    "joined": m8,
    "keep_feed_offset_description": MessageLookupByLibrary.simpleMessage(
      "Asukoht säutsuvoo ajajoonel jääb rakenduse uuesti käivitamise jaoks meelde",
    ),
    "keep_feed_offset_label": MessageLookupByLibrary.simpleMessage(
      "Jäta meelde asukoht säutsuvoos",
    ),
    "language": MessageLookupByLibrary.simpleMessage("Keel"),
    "language_subtitle": MessageLookupByLibrary.simpleMessage(
      "Eeldab rakenduse uuesti käivitamist",
    ),
    "large": MessageLookupByLibrary.simpleMessage("Suured pildid"),
    "leaner_feeds_description": MessageLookupByLibrary.simpleMessage(
      "Säutsudes ei kuvata linkide eelvaateid",
    ),
    "leaner_feeds_label": MessageLookupByLibrary.simpleMessage(
      "Kompaktsed säutsuvood",
    ),
    "legacy_android_import": MessageLookupByLibrary.simpleMessage(
      "Import vanemate Androidi versioonide jaoks",
    ),
    "let_the_developers_know_if_something_is_broken":
        MessageLookupByLibrary.simpleMessage(
          "Anna arendajatele teada, kui midagi ei toimi",
        ),
    "libre_translate_host": MessageLookupByLibrary.simpleMessage(
      "LibreTranslate\'i server",
    ),
    "licenses": MessageLookupByLibrary.simpleMessage("Litsentsid"),
    "light": MessageLookupByLibrary.simpleMessage("Hele teema"),
    "live": MessageLookupByLibrary.simpleMessage("Otsesaade"),
    "logging": MessageLookupByLibrary.simpleMessage("Logimine"),
    "mandatory_label": MessageLookupByLibrary.simpleMessage(
      "Kohustuslikud väljad:",
    ),
    "material_3": MessageLookupByLibrary.simpleMessage(
      "Kasuta Material 3 teemat?",
    ),
    "media": MessageLookupByLibrary.simpleMessage("Meedia"),
    "media_size": MessageLookupByLibrary.simpleMessage("Multimeedia suurus"),
    "medium": MessageLookupByLibrary.simpleMessage("Keskmised pildid"),
    "missing_page": MessageLookupByLibrary.simpleMessage("Puuduv lehekülg"),
    "mute_video_description": MessageLookupByLibrary.simpleMessage(
      "Kas videoteheli peaks esitamisel olema vaikimisi summutatud",
    ),
    "mute_videos": MessageLookupByLibrary.simpleMessage("Summuta videote heli"),
    "name": MessageLookupByLibrary.simpleMessage("Nimi"),
    "name_label": MessageLookupByLibrary.simpleMessage("Nimi:"),
    "nbr_guest_accounts": m9,
    "newTrans": MessageLookupByLibrary.simpleMessage("Uus"),
    "next": MessageLookupByLibrary.simpleMessage("Järgmine"),
    "no": MessageLookupByLibrary.simpleMessage("Ei"),
    "no_data_was_returned_which_should_never_happen_please_report_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "Vastuses ei leidunud andmeid ning midagi sellist ei tohiks juhtuda. Kui saad, siis palun anna meile sellest veast teada!",
        ),
    "no_results": MessageLookupByLibrary.simpleMessage("Tulemusi pole"),
    "no_results_for": MessageLookupByLibrary.simpleMessage(
      "Otsingutulemused puuduvad:",
    ),
    "no_subscriptions_try_searching_or_importing_some":
        MessageLookupByLibrary.simpleMessage(
          "Tellimusi ei leidu. Kas lisa mõni otsingust või impordi!",
        ),
    "not_set": MessageLookupByLibrary.simpleMessage("Seadistamata"),
    "note_due_to_a_twitter_limitation_not_all_tweets_may_be_included":
        MessageLookupByLibrary.simpleMessage(
          "Märkus: Twitter/Xi määratud piirangute tõttu ei pruugi kõik säutsud olla kaasatud",
        ),
    "numberFormat_format_total_votes": m10,
    "ok": MessageLookupByLibrary.simpleMessage("Sobib"),
    "only_public_subscriptions_can_be_imported":
        MessageLookupByLibrary.simpleMessage(
          "Tellimusi saad importida ainult avalikest profiilidest",
        ),
    "oops_something_went_wrong": MessageLookupByLibrary.simpleMessage(
      "Hopsti! Midagi läks nüüd viltu 🥲",
    ),
    "open_app_settings": MessageLookupByLibrary.simpleMessage(
      "Ava rakenduse seadistused",
    ),
    "open_in_browser": MessageLookupByLibrary.simpleMessage(
      "Ava veebibrauseris",
    ),
    "option_confirm_close_description": MessageLookupByLibrary.simpleMessage(
      "Rakenduse sulgemisel küsi kinnitust",
    ),
    "option_confirm_close_label": MessageLookupByLibrary.simpleMessage(
      "Rakenduse sulgemise kinnitus",
    ),
    "option_navigation_animations_description":
        MessageLookupByLibrary.simpleMessage(
          "Näita tegevuste riba kasutamisel animatsioone",
        ),
    "option_navigation_animations_label": MessageLookupByLibrary.simpleMessage(
      "Animatsioonid tegevuste riba kasutamisel",
    ),
    "option_show_navigation_labels_description":
        MessageLookupByLibrary.simpleMessage(
          "Näita tegevuste riba ikoonidel silte",
        ),
    "option_show_navigation_labels_label": MessageLookupByLibrary.simpleMessage(
      "Tegevuste riba sildid",
    ),
    "optional_label": MessageLookupByLibrary.simpleMessage(
      "Täiendavad väljad:",
    ),
    "page_not_found": MessageLookupByLibrary.simpleMessage(
      "Twitter/X ütleb, et lehte pole olemas, kuid see ei pruugi tõsi olla",
    ),
    "password_label": MessageLookupByLibrary.simpleMessage("Salasõna:"),
    "permission_not_granted": MessageLookupByLibrary.simpleMessage(
      "Õigusi pole. Palun proovi pärast loa andmist uuesti!",
    ),
    "phone_label": MessageLookupByLibrary.simpleMessage("Telefon:"),
    "pick_a_color": MessageLookupByLibrary.simpleMessage("Palun vali värv!"),
    "pick_an_icon": MessageLookupByLibrary.simpleMessage("Vali ikoon!"),
    "pinned_tweet": MessageLookupByLibrary.simpleMessage("Klammerdatud säuts"),
    "playback_speed": MessageLookupByLibrary.simpleMessage(
      "Taasesituse kiirus",
    ),
    "please_check_your_internet_connection_error_message": m11,
    "please_enter_a_name": MessageLookupByLibrary.simpleMessage(
      "Palun sisesta nimi",
    ),
    "please_make_sure_the_data_you_wish_to_import_is_located_there_then_press_the_import_button_below":
        MessageLookupByLibrary.simpleMessage(
          "Palun veendu, et andmed, mida soovid importida, asuvad seal, seejärel vajuta allpool olevat importimisnuppu.",
        ),
    "please_note_that_the_method_fritter_uses_to_import_subscriptions_is_heavily_rate_limited_by_twitter_so_this_may_fail_if_you_have_a_lot_of_followed_accounts":
        MessageLookupByLibrary.simpleMessage(
          "Palun arvesta, et Squawker kasutab tellimuste impordiks päringut, mille kasutamise sagedust Twitter/X piirab. Seega kui sul on palju jälgitavaid kontosid, siis import ei pruugi õnnestuda.",
        ),
    "possibly_sensitive": MessageLookupByLibrary.simpleMessage(
      "Võimalik ebasobilik sisu",
    ),
    "possibly_sensitive_profile": MessageLookupByLibrary.simpleMessage(
      "Selles profiilis võib leiduda ebasobilikke pilte, sõnakasutust või muud sisu. Ka sa siiski soovid seda vaadata?",
    ),
    "possibly_sensitive_tweet": MessageLookupByLibrary.simpleMessage(
      "Selles säutsus võib leiduda ebasobilikku sisu. Kas sa soovid seda näha?",
    ),
    "prefix": MessageLookupByLibrary.simpleMessage("eesliide"),
    "private_profile": MessageLookupByLibrary.simpleMessage(
      "Privaatne profiil",
    ),
    "proxy_description": MessageLookupByLibrary.simpleMessage(
      "Kasuta puhverserverit kõikide päringute jaoks",
    ),
    "proxy_error": MessageLookupByLibrary.simpleMessage("Puhverserveri viga"),
    "proxy_label": MessageLookupByLibrary.simpleMessage("Puhverserver"),
    "regular_accounts": m12,
    "released_under_the_mit_license": MessageLookupByLibrary.simpleMessage(
      "Avaldatud MIT litsentsi alusel",
    ),
    "remove_from_feed": MessageLookupByLibrary.simpleMessage(
      "Eemalda säutsuvoost",
    ),
    "replying_to": MessageLookupByLibrary.simpleMessage("Vastusena"),
    "report": MessageLookupByLibrary.simpleMessage("Teata veast"),
    "report_a_bug": MessageLookupByLibrary.simpleMessage("Teata vigadest"),
    "reporting_an_error": MessageLookupByLibrary.simpleMessage(
      "Veast teatamine",
    ),
    "reset_home_pages": MessageLookupByLibrary.simpleMessage(
      "Lähtesta lehed vaikimisi väärtusteks",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Proovi uuesti"),
    "save": MessageLookupByLibrary.simpleMessage("Salvesta"),
    "save_bandwidth_using_smaller_images": MessageLookupByLibrary.simpleMessage(
      "Kasutades väiksemaid pildifaile säästad ribalaiust",
    ),
    "saved": MessageLookupByLibrary.simpleMessage("Salvestatud"),
    "saved_tweet_too_large": MessageLookupByLibrary.simpleMessage(
      "Seda salvestatud säutsu ei saa kuvada, kuna see on laadimiseks liiga suur. Palun teata sellest veast arendajatele.",
    ),
    "search": MessageLookupByLibrary.simpleMessage("Otsi"),
    "search_term": MessageLookupByLibrary.simpleMessage("Otsingusõna"),
    "select": MessageLookupByLibrary.simpleMessage("Vali"),
    "selecting_individual_accounts_to_import_and_assigning_groups_are_both_planned_for_the_future_already":
        MessageLookupByLibrary.simpleMessage(
          "Nii üksikute kontode valimine importimiseks, kui gruppide määramine on kavandatud järgmiste arendustena!",
        ),
    "send": MessageLookupByLibrary.simpleMessage("Saada"),
    "settings": MessageLookupByLibrary.simpleMessage("Seadistused"),
    "share_base_url": MessageLookupByLibrary.simpleMessage(
      "Kohandatud URL lingi jagamiseks",
    ),
    "share_base_url_description": MessageLookupByLibrary.simpleMessage(
      "Kasuta lingi jagamiseks kohandatud URL\'i",
    ),
    "share_tweet_as_image": MessageLookupByLibrary.simpleMessage(
      "Jaga säutsu pildina",
    ),
    "share_tweet_content": MessageLookupByLibrary.simpleMessage(
      "Jaga säutsu sisu",
    ),
    "share_tweet_content_and_link": MessageLookupByLibrary.simpleMessage(
      "Jaga säutsu sisu ja linki",
    ),
    "share_tweet_link": MessageLookupByLibrary.simpleMessage(
      "Jaga säutsu linki",
    ),
    "should_check_for_updates_description":
        MessageLookupByLibrary.simpleMessage(
          "Squawker\'i käivitumisel kontrolli uuenduste olemasolu",
        ),
    "should_check_for_updates_label": MessageLookupByLibrary.simpleMessage(
      "Kontrolli uuendusi",
    ),
    "small": MessageLookupByLibrary.simpleMessage("Väikesed pildid"),
    "something_broke_in_fritter": MessageLookupByLibrary.simpleMessage(
      "Midagi läks nüüd Squawker\'is katki.",
    ),
    "something_just_went_wrong_in_fritter_and_an_error_report_has_been_generated":
        MessageLookupByLibrary.simpleMessage(
          "Midagi läks Squawkeris viltu ja selle alusel on olemas ka veakirjeldus. Probleemi uurimiseks ja lahendamiseks võid sa selle saata Squawkeri arendajatele.",
        ),
    "sorry_the_replied_tweet_could_not_be_found":
        MessageLookupByLibrary.simpleMessage(
          "Vabandust, aga vastatud säutsu enam ei leidu!",
        ),
    "subscribe": MessageLookupByLibrary.simpleMessage("Telli"),
    "subscriptions": MessageLookupByLibrary.simpleMessage("Tellimused"),
    "subtitles": MessageLookupByLibrary.simpleMessage("Subtiitrid"),
    "successfully_saved_the_media": MessageLookupByLibrary.simpleMessage(
      "Salvestasin meedia!",
    ),
    "system": MessageLookupByLibrary.simpleMessage("Süsteemi pakutu"),
    "tap_to_download_release_version": m13,
    "tap_to_show_getMediaType_item_type": m14,
    "thanks_for_helping_fritter": MessageLookupByLibrary.simpleMessage(
      "Täname, et aitad Squawker\'it! 💖",
    ),
    "the_file_does_not_exist_please_ensure_it_is_located_at_file_path": m15,
    "the_github_issue": MessageLookupByLibrary.simpleMessage(
      "veakirjeldus GitHub\'is (#143)",
    ),
    "the_tweet_did_not_contain_any_text_this_is_unexpected":
        MessageLookupByLibrary.simpleMessage(
          "Säutsus puudus sisu. See on nüüd küll ootamatu",
        ),
    "theme": MessageLookupByLibrary.simpleMessage("Kujundus"),
    "theme_mode": MessageLookupByLibrary.simpleMessage("Kujundusrežiim"),
    "there_were_no_trends_returned_this_is_unexpected_please_report_as_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "Päringu vastuses polnud andmeid hetkel populaarsemate viidete ja otsingute kohta. Seda ei oleks nüüd küll pidanud juhtuma! Kui võimalik siis palun saada meile veateade.",
        ),
    "this_group_contains_no_subscriptions":
        MessageLookupByLibrary.simpleMessage("Selles grupis pole tellimusi!"),
    "this_took_too_long_to_load_please_check_your_network_connection":
        MessageLookupByLibrary.simpleMessage(
          "Andmete laadimine kestab liiga kaua. Palun vaata, kas sinu internetiühendus toimib!",
        ),
    "this_tweet_is_unavailable": MessageLookupByLibrary.simpleMessage(
      "See säuts pole leitav. Ilmselt on ta juba kustutatud.",
    ),
    "this_tweet_user_name_retweeted": m16,
    "this_user_does_not_follow_anyone": MessageLookupByLibrary.simpleMessage(
      "See kasutaja ei jälgi mitte kedagi!",
    ),
    "this_user_does_not_have_anyone_following_them":
        MessageLookupByLibrary.simpleMessage(
          "Mitte keegi ei jälgi seda kasutajat!",
        ),
    "thread": MessageLookupByLibrary.simpleMessage("Jutulõng"),
    "thumbnail": MessageLookupByLibrary.simpleMessage("Pisipildid"),
    "thumbnail_not_available": MessageLookupByLibrary.simpleMessage(
      "Pisipilt pole saadaval",
    ),
    "timed_out": MessageLookupByLibrary.simpleMessage("Päring aegus"),
    "to_import_specific_subscriptions_enter_your_comma_separated_usernames_below":
        MessageLookupByLibrary.simpleMessage(
          "Vaid valitud tellimuste importimiseks lisa siia komadega eraldatud kasutajanimede loend.",
        ),
    "to_import_subscriptions_from_an_existing_twitter_account_enter_your_username_below":
        MessageLookupByLibrary.simpleMessage(
          "Olemasoleva Twitter/Xi konto tellimuste impordiks palun sisesta alljärgnevalt oma kasutajanimi.",
        ),
    "toggle_all": MessageLookupByLibrary.simpleMessage(
      "Lülita kõik sisse/välja",
    ),
    "translator_label": MessageLookupByLibrary.simpleMessage("Tõlkeliides"),
    "translators_description": MessageLookupByLibrary.simpleMessage(
      "Kasuta sinu valitud LibreTranslate\'i liideseid",
    ),
    "translators_label": MessageLookupByLibrary.simpleMessage("Tõlkeliidesed"),
    "trending": MessageLookupByLibrary.simpleMessage("Hetkel populaarne"),
    "trends": MessageLookupByLibrary.simpleMessage("Hetkel populaarne"),
    "true_black": MessageLookupByLibrary.simpleMessage("Missugune must teema?"),
    "tweet_font_size_description": MessageLookupByLibrary.simpleMessage(
      "Säutsudes kasutatav fondisuurus",
    ),
    "tweet_font_size_label": MessageLookupByLibrary.simpleMessage(
      "Kirjasuurus",
    ),
    "tweets": MessageLookupByLibrary.simpleMessage("Säutsud"),
    "tweets_and_replies": MessageLookupByLibrary.simpleMessage(
      "Säutsud ja vastused",
    ),
    "tweets_number": m17,
    "twitter_account_types_both": MessageLookupByLibrary.simpleMessage(
      "Külalis- ja tavakonto",
    ),
    "twitter_account_types_description": MessageLookupByLibrary.simpleMessage(
      "Kasutatav konto tüüp",
    ),
    "twitter_account_types_label": MessageLookupByLibrary.simpleMessage(
      "Konto tüüp",
    ),
    "twitter_account_types_only_regular": MessageLookupByLibrary.simpleMessage(
      "Ainult tavakonto",
    ),
    "twitter_account_types_priority_to_regular":
        MessageLookupByLibrary.simpleMessage("Eelista tavakontot"),
    "two_home_pages_required": MessageLookupByLibrary.simpleMessage(
      "Sul peab olema vähemalt 2 avalehte.",
    ),
    "unable_to_find_the_available_trend_locations":
        MessageLookupByLibrary.simpleMessage(
          "Ei õnnestu laadida riike ja piirkondi, mille kohta kuvada hetkel populaarsemaid viiteid ja otsinguid.",
        ),
    "unable_to_find_your_saved_tweets": MessageLookupByLibrary.simpleMessage(
      "Sinu salvestatud säutsude leidmine ei õnnestu.",
    ),
    "unable_to_import": MessageLookupByLibrary.simpleMessage(
      "Ei ole võimalik importida",
    ),
    "unable_to_load_home_pages": MessageLookupByLibrary.simpleMessage(
      "Sinu kodulehtede laadimine ei õnnestunud",
    ),
    "unable_to_load_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "Tellimuste gruppide laadimine ei õnnestu",
    ),
    "unable_to_load_the_group": MessageLookupByLibrary.simpleMessage(
      "Grupi laadimine ei õnnestu",
    ),
    "unable_to_load_the_group_settings": MessageLookupByLibrary.simpleMessage(
      "Grupi seadete laadimine ei õnnestu",
    ),
    "unable_to_load_the_list_of_follows": MessageLookupByLibrary.simpleMessage(
      "Jälgijate loendi laadimine ei õnnestu",
    ),
    "unable_to_load_the_next_page_of_follows":
        MessageLookupByLibrary.simpleMessage(
          "Jälgijate loendi järgmise lehe laadimine ei õnnestu",
        ),
    "unable_to_load_the_next_page_of_replies":
        MessageLookupByLibrary.simpleMessage(
          "Vastuste järgmise lehe laadimine ei õnnestu",
        ),
    "unable_to_load_the_next_page_of_tweets":
        MessageLookupByLibrary.simpleMessage(
          "Säutsude järgmise lehe laadimine ei õnnestu",
        ),
    "unable_to_load_the_profile": MessageLookupByLibrary.simpleMessage(
      "Profiili laadimine ei õnnestu",
    ),
    "unable_to_load_the_search_results": MessageLookupByLibrary.simpleMessage(
      "Otsingutulemuste laadimine ei õnnestu.",
    ),
    "unable_to_load_the_trends_for_widget_place_name": m18,
    "unable_to_load_the_tweet": MessageLookupByLibrary.simpleMessage(
      "Säutsu laadimine ei õnnestu",
    ),
    "unable_to_load_the_tweets": MessageLookupByLibrary.simpleMessage(
      "Säutsude laadimine ei õnnestu",
    ),
    "unable_to_load_the_tweets_for_the_feed":
        MessageLookupByLibrary.simpleMessage(
          "Selle andmevoo säutsude laadimine ei õnnestu",
        ),
    "unable_to_refresh_the_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Tellimuste sisu ei saa hetkel laadida",
    ),
    "unable_to_run_the_database_migrations":
        MessageLookupByLibrary.simpleMessage(
          "Squawkeri andmebaaside versiooniuuendus ei õnnestu",
        ),
    "unable_to_save_the_media_twitter_returned_a_status_of_response_statusCode":
        m19,
    "unable_to_stream_the_trend_location_preference":
        MessageLookupByLibrary.simpleMessage(
          "Ei õnnestu edastada hetkel populaarsemaid viidete ja otsingute piirkondade eelistusi",
        ),
    "unknown": MessageLookupByLibrary.simpleMessage("Teadmata"),
    "unsave": MessageLookupByLibrary.simpleMessage("Eemalda salvestus"),
    "unsubscribe": MessageLookupByLibrary.simpleMessage("Loobu tellimusest"),
    "unsupported_url": MessageLookupByLibrary.simpleMessage(
      "URL ei ole toetatud",
    ),
    "update_to_release_version_through_your_fdroid_client": m20,
    "updates": MessageLookupByLibrary.simpleMessage("Uuendused"),
    "use_true_black_for_the_dark_mode_theme":
        MessageLookupByLibrary.simpleMessage(
          "Tumeda teemana kasuta korrektset musta teemat",
        ),
    "user_not_found": MessageLookupByLibrary.simpleMessage(
      "Kasutajat ei leidu",
    ),
    "username": MessageLookupByLibrary.simpleMessage("Kasutajanimi"),
    "username_exclude": MessageLookupByLibrary.simpleMessage(
      "Välistatav kasutajanimi",
    ),
    "username_label": MessageLookupByLibrary.simpleMessage("Kasutajanimi:"),
    "usernames": MessageLookupByLibrary.simpleMessage("Kasutajanimed"),
    "version": MessageLookupByLibrary.simpleMessage("Versioon"),
    "warning_regular_account_unauthenticated_access_description":
        MessageLookupByLibrary.simpleMessage(
          "Twitter/X on lõpetanud külaliskontode kasutamise võimaluse. Palun kirjelda tavakonto Seadistused-Kasutajakonto alt. Ilma tavakontota on sul vaid piiratud ja osaline ligipääs vaid säutsudele ja kasutajaprofiilidele. Anonüümse tavakonto loomine on lihtne ning vastav juhend on siin:",
        ),
    "warning_regular_account_unauthenticated_access_title":
        MessageLookupByLibrary.simpleMessage(
          "Tavakontod ja autentimata ligipääs",
        ),
    "when_a_new_app_update_is_available": MessageLookupByLibrary.simpleMessage(
      "Kui uuendus on saadaval",
    ),
    "whether_errors_should_be_reported_to_":
        MessageLookupByLibrary.simpleMessage("Teata vigadest veebirakenduses "),
    "whether_to_hide_tweets_marked_as_sensitive":
        MessageLookupByLibrary.simpleMessage(
          "Kas soovid peita säutse, kus võib olla ebasobilikku sisu",
        ),
    "which_tab_is_shown_when_the_app_opens":
        MessageLookupByLibrary.simpleMessage(
          "Missugune vaade on kuvatud rakenduse käivitamisel",
        ),
    "which_tab_is_shown_when_the_subscription_opens":
        MessageLookupByLibrary.simpleMessage(
          "Missugune kaart kuvatakse tellimuste vaate avamisel",
        ),
    "would_you_like_to_enable_automatic_error_reporting":
        MessageLookupByLibrary.simpleMessage(
          "Kas sa luba vigadest automaatselt teatada?",
        ),
    "x_api": MessageLookupByLibrary.simpleMessage("X API"),
    "yes": MessageLookupByLibrary.simpleMessage("Jah"),
    "yes_please": MessageLookupByLibrary.simpleMessage("Jah, palun"),
    "you_have_not_saved_any_tweets_yet": MessageLookupByLibrary.simpleMessage(
      "Sa pole veel ühtegi säutsu salvestanud!",
    ),
    "you_must_have_at_least_2_home_screen_pages":
        MessageLookupByLibrary.simpleMessage(
          "Sul peaks olema vähemalt kaks kodulehte",
        ),
    "your_profile_must_be_public_otherwise_the_import_will_not_work":
        MessageLookupByLibrary.simpleMessage(
          "Sinu profiil peab olema avalik, muidu import ei toimi",
        ),
    "your_report_will_be_sent_to_fritter__project":
        MessageLookupByLibrary.simpleMessage(
          "Veakirjeldus saadetakse Squawker\'i kontole  veahaldusrakenduses.  privaatusteabe leiad siit:",
        ),
  };
}
