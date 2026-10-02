// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a eo locale. All the
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
  String get localeName => 'eo';

  static String m0(name) =>
      "Ĉu vi certas, vi volas forigi la grupon de abonoj ${name}?";

  static String m1(count) => "";

  static String m2(count) => "";

  static String m3(fileName) => "Datumoj eksportiĝis al ${fileName}";

  static String m4(fullPath) => "Datumoj eksportiĝis al ${fullPath}";

  static String m5(timeagoFormat) => "Finiĝis ${timeagoFormat}";

  static String m6(timeagoFormat) => "Finiĝos ${timeagoFormat}";

  static String m7(snapshotData) => "Finiĝis kun ${snapshotData} uzantoj";

  static String m8(name) => "Grupo: ${name}";

  static String m9(snapshotData) =>
      "${snapshotData} uzantoj importiĝis ĝis nun";

  static String m10(date) => "Membriĝis je ${date}";

  static String m11(nbrGuestAccounts) => "";

  static String m12(num, numFormatted) =>
      "${Intl.plural(num, zero: 'Ne voĉoj', one: 'Unu voĉo', two: 'Du voĉoj', few: '${numFormatted} voĉoj', many: '${numFormatted} voĉoj', other: '${numFormatted} voĉoj')}";

  static String m13(errorMessage) =>
      "Bonvolu kontroli vian konekton Interretan.\n\n${errorMessage}";

  static String m14(nbrRegularAccounts) => "";

  static String m15(count) => "";

  static String m16(releaseVersion) => "Premu por elŝuti ${releaseVersion}";

  static String m17(getMediaType) => "Premu por vidi ${getMediaType}";

  static String m18(filePath) =>
      "La dosiero ne ekzistas. Bonvolu certigi ĝin loke ĉe ${filePath}";

  static String m19(thisTweetUserName, timeAgo) =>
      "${thisTweetUserName} repepis ${timeAgo}";

  static String m20(num, numFormatted) =>
      "${Intl.plural(num, zero: 'ne pepoj', one: 'unu pepo', two: 'du pepoj', few: '${numFormatted} pepoj', many: '${numFormatted} pepoj', other: '${numFormatted} pepoj')}";

  static String m21(widgetPlaceName) =>
      "Ne eblas ŝarĝi la tendencaĵojn el ${widgetPlaceName}";

  static String m22(responseStatusCode) =>
      "Ne eblas konservi la plurmedion. Twitter/X revenigis staton de ${responseStatusCode}";

  static String m23(releaseVersion) =>
      "Ĝisdatigu al ${releaseVersion} per via kliento de F-Droid";

  static String m24(seconds) => "";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("Pri Squawker"),
    "about_download": MessageLookupByLibrary.simpleMessage(""),
    "about_download_description": MessageLookupByLibrary.simpleMessage(""),
    "account": MessageLookupByLibrary.simpleMessage(""),
    "account_suspended": MessageLookupByLibrary.simpleMessage("Konto haltiĝis"),
    "activate_non_confirmation_bias_mode_description":
        MessageLookupByLibrary.simpleMessage(
          "Kaŝi aŭtorojn de pepoj. Eviti biason de konfirmo bazite de argumentoj aŭtoritataj.",
        ),
    "activate_non_confirmation_bias_mode_label":
        MessageLookupByLibrary.simpleMessage(
          "Ŝalti reĝimon de biaso de nekonfirmo",
        ),
    "add_account": MessageLookupByLibrary.simpleMessage(""),
    "add_account_title": MessageLookupByLibrary.simpleMessage(""),
    "add_subscriptions": MessageLookupByLibrary.simpleMessage(""),
    "add_to_feed": MessageLookupByLibrary.simpleMessage(""),
    "add_to_group": MessageLookupByLibrary.simpleMessage("Aldoni al grupo"),
    "all": MessageLookupByLibrary.simpleMessage("Ĉio"),
    "all_the_great_software_used_by_fritter":
        MessageLookupByLibrary.simpleMessage(
          "Ĉiu el la programaro bonega uzate per Squawker",
        ),
    "allow_background_play_description": MessageLookupByLibrary.simpleMessage(
      "",
    ),
    "allow_background_play_label": MessageLookupByLibrary.simpleMessage(""),
    "allow_background_play_other_apps_description":
        MessageLookupByLibrary.simpleMessage(""),
    "allow_background_play_other_apps_label":
        MessageLookupByLibrary.simpleMessage(""),
    "an_update_for_fritter_is_available": MessageLookupByLibrary.simpleMessage(
      "Ĝisdatigo por Squawker estas disponebla! 🚀",
    ),
    "api_key": MessageLookupByLibrary.simpleMessage(""),
    "api_server": MessageLookupByLibrary.simpleMessage(""),
    "api_server_address": MessageLookupByLibrary.simpleMessage(""),
    "app_info": MessageLookupByLibrary.simpleMessage(""),
    "are_you_sure": MessageLookupByLibrary.simpleMessage("Ĉu vi certas?"),
    "are_you_sure_you_want_to_delete_the_subscription_group_name_of_group": m0,
    "autoplay_videos": MessageLookupByLibrary.simpleMessage(""),
    "autoplay_videos_description": MessageLookupByLibrary.simpleMessage(""),
    "back": MessageLookupByLibrary.simpleMessage("Antaŭen"),
    "bad_guest_token": MessageLookupByLibrary.simpleMessage(
      "Twitter/X malvalidigis la ĵetonon de atingo. Bonvolu provi remalfermi Squawker-on!",
    ),
    "batch_add_to_group": MessageLookupByLibrary.simpleMessage(""),
    "batch_remove_from_feed": MessageLookupByLibrary.simpleMessage(""),
    "batch_remove_from_feed_confirm": m1,
    "batch_unsubscribe": MessageLookupByLibrary.simpleMessage(""),
    "batch_unsubscribe_confirm": m2,
    "beta": MessageLookupByLibrary.simpleMessage(""),
    "blue_theme_based_on_the_twitter_color_scheme":
        MessageLookupByLibrary.simpleMessage(
          "Blua temo bazite de la kolorskemo de Twitter/X",
        ),
    "cancel": MessageLookupByLibrary.simpleMessage("Rezigni"),
    "catastrophic_failure": MessageLookupByLibrary.simpleMessage(
      "Malsukceso katastrofa",
    ),
    "choose": MessageLookupByLibrary.simpleMessage("Elekti"),
    "choose_pages": MessageLookupByLibrary.simpleMessage("Elekti paĝojn"),
    "close": MessageLookupByLibrary.simpleMessage("Fermi"),
    "community_notes_title": MessageLookupByLibrary.simpleMessage(""),
    "confirm": MessageLookupByLibrary.simpleMessage(""),
    "confirm_close_fritter": MessageLookupByLibrary.simpleMessage(
      "Ĉu vi certas, vi volas fermi Squawker-on?",
    ),
    "contribute": MessageLookupByLibrary.simpleMessage("Kontribui"),
    "copied_address_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "Kopiis adreson al la tondujo",
    ),
    "copied_version_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "Kopiis version al la tondujo",
    ),
    "could_not_contact_twitter": MessageLookupByLibrary.simpleMessage(
      "Ne eblas kontakti Twitter/X-on",
    ),
    "could_not_find_any_tweets_by_this_user":
        MessageLookupByLibrary.simpleMessage(
          "Ne eblis trovi iujn ajn pepojn de tiu ĉi uzanto!",
        ),
    "could_not_find_any_tweets_from_the_last_7_days":
        MessageLookupByLibrary.simpleMessage(
          "Ne eblas trovi iujn ajn pepojn de antaŭ 7 tagoj!",
        ),
    "country": MessageLookupByLibrary.simpleMessage("Lando"),
    "dark": MessageLookupByLibrary.simpleMessage("Malhela"),
    "data": MessageLookupByLibrary.simpleMessage("Datumoj"),
    "data_exported_to_fileName": m3,
    "data_exported_to_fullPath": m4,
    "data_imported_successfully": MessageLookupByLibrary.simpleMessage(
      "Datumoj importiĝis sukcese",
    ),
    "date_created": MessageLookupByLibrary.simpleMessage("Dato de kreo"),
    "date_subscribed": MessageLookupByLibrary.simpleMessage("Dato de ekabono"),
    "default_subscription_tab": MessageLookupByLibrary.simpleMessage(""),
    "default_tab": MessageLookupByLibrary.simpleMessage("Langeto komenca"),
    "delete": MessageLookupByLibrary.simpleMessage("Forigi"),
    "deselect_all": MessageLookupByLibrary.simpleMessage(""),
    "disable_screenshots": MessageLookupByLibrary.simpleMessage(
      "Malŝalti ekrankopiojn",
    ),
    "disable_screenshots_hint": MessageLookupByLibrary.simpleMessage(
      "Eviti ekrankopiojn farote. Eble ne funkcii kun ĉiuj aparatoj.",
    ),
    "disabled": MessageLookupByLibrary.simpleMessage("Malŝaltita"),
    "doesnt_work_without_account": MessageLookupByLibrary.simpleMessage(""),
    "donate": MessageLookupByLibrary.simpleMessage("Donaci"),
    "download": MessageLookupByLibrary.simpleMessage("Elŝuti"),
    "download_all_tweets": MessageLookupByLibrary.simpleMessage(""),
    "download_completed": MessageLookupByLibrary.simpleMessage(""),
    "download_failed": MessageLookupByLibrary.simpleMessage(""),
    "download_handling": MessageLookupByLibrary.simpleMessage(
      "Trakto de elŝutoj",
    ),
    "download_handling_description": MessageLookupByLibrary.simpleMessage(
      "Kiel elŝutado funkcius",
    ),
    "download_handling_type_ask": MessageLookupByLibrary.simpleMessage(
      "Ĉiam demandi",
    ),
    "download_handling_type_directory": MessageLookupByLibrary.simpleMessage(
      "Konservi al dosierujo",
    ),
    "download_media_no_url": MessageLookupByLibrary.simpleMessage(
      "Ne eblas elŝuti. Tiu ĉi plurmedio eble nur estas disponebla kiel fluo, kiun Squawker ne ankoraŭ eblas elŝuti.",
    ),
    "download_mode": MessageLookupByLibrary.simpleMessage(""),
    "download_mode_fast": MessageLookupByLibrary.simpleMessage(""),
    "download_mode_full_scan": MessageLookupByLibrary.simpleMessage(""),
    "download_mode_safe": MessageLookupByLibrary.simpleMessage(""),
    "download_path": MessageLookupByLibrary.simpleMessage(
      "Dosiervojo de elŝutado",
    ),
    "download_settings": MessageLookupByLibrary.simpleMessage(""),
    "download_started": MessageLookupByLibrary.simpleMessage(""),
    "download_this_tweet": MessageLookupByLibrary.simpleMessage(""),
    "download_tweet": MessageLookupByLibrary.simpleMessage(""),
    "download_video_best_quality_description":
        MessageLookupByLibrary.simpleMessage(""),
    "download_video_best_quality_label": MessageLookupByLibrary.simpleMessage(
      "",
    ),
    "downloading_media": MessageLookupByLibrary.simpleMessage(
      "Elŝutas plurmedion…",
    ),
    "edit_account_title": MessageLookupByLibrary.simpleMessage(""),
    "email_label": MessageLookupByLibrary.simpleMessage(""),
    "enable_": MessageLookupByLibrary.simpleMessage("Ĉu ŝalti -on?"),
    "ended_timeago_format_endsAt_allowFromNow_true": m5,
    "ends_timeago_format_endsAt_allowFromNow_true": m6,
    "enhanced_feeds_description": MessageLookupByLibrary.simpleMessage(""),
    "enhanced_feeds_label": MessageLookupByLibrary.simpleMessage(""),
    "enhanced_profile_description": MessageLookupByLibrary.simpleMessage(""),
    "enhanced_profile_label": MessageLookupByLibrary.simpleMessage(""),
    "enhanced_searches_description": MessageLookupByLibrary.simpleMessage(""),
    "enhanced_searches_label": MessageLookupByLibrary.simpleMessage(""),
    "enter_comma_separated_twitter_usernames":
        MessageLookupByLibrary.simpleMessage(""),
    "enter_your_twitter_username": MessageLookupByLibrary.simpleMessage(
      "Enigi vian uzantnomon de Twitter/X",
    ),
    "error_from_twitter": MessageLookupByLibrary.simpleMessage(""),
    "exclusions_feed_description": MessageLookupByLibrary.simpleMessage(""),
    "exclusions_feed_label": MessageLookupByLibrary.simpleMessage(""),
    "export": MessageLookupByLibrary.simpleMessage("Eksporti"),
    "export_guest_accounts": MessageLookupByLibrary.simpleMessage(""),
    "export_settings": MessageLookupByLibrary.simpleMessage(
      "Ĉu eksporti la agordojn?",
    ),
    "export_subscription_group_members": MessageLookupByLibrary.simpleMessage(
      "Ĉu eksporti la membrojn de grupo de abonoj?",
    ),
    "export_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "Ĉu eksporti la grupojn de abonoj?",
    ),
    "export_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Ĉu eksporti la abonojn?",
    ),
    "export_tweets": MessageLookupByLibrary.simpleMessage(
      "Ĉu eksporti pepojn?",
    ),
    "export_twitter_tokens": MessageLookupByLibrary.simpleMessage(""),
    "export_your_data": MessageLookupByLibrary.simpleMessage(
      "Eksporti viajn datumojn",
    ),
    "failed_to_load_video": MessageLookupByLibrary.simpleMessage(""),
    "feed": MessageLookupByLibrary.simpleMessage("Fluo"),
    "filters": MessageLookupByLibrary.simpleMessage("Filtriloj"),
    "finish": MessageLookupByLibrary.simpleMessage("Fini"),
    "finished_with_snapshotData_users": m7,
    "followers": MessageLookupByLibrary.simpleMessage("Abonantoj"),
    "following": MessageLookupByLibrary.simpleMessage("Abonoj"),
    "forbidden": MessageLookupByLibrary.simpleMessage(
      "Twitter/X diras, atingo estas malpermesita",
    ),
    "fritter": MessageLookupByLibrary.simpleMessage("Squawker"),
    "fritter_blue": MessageLookupByLibrary.simpleMessage("Squawker blua"),
    "functionality_unsupported": MessageLookupByLibrary.simpleMessage(""),
    "general": MessageLookupByLibrary.simpleMessage("Ĝenerala"),
    "generic_username": MessageLookupByLibrary.simpleMessage(""),
    "group_name": m8,
    "groups": MessageLookupByLibrary.simpleMessage("Grupoj"),
    "help_make_fritter_even_better": MessageLookupByLibrary.simpleMessage(
      "Helpi plibonigi Squawker-on",
    ),
    "help_support_fritters_future": MessageLookupByLibrary.simpleMessage(
      "Helpi subteni estontecon de Squawker",
    ),
    "hide_sensitive_tweets": MessageLookupByLibrary.simpleMessage(
      "Kaŝi sentemajn pepojn",
    ),
    "home": MessageLookupByLibrary.simpleMessage("Hejmo"),
    "if_you_have_any_feedback_on_this_feature_please_leave_it_on":
        MessageLookupByLibrary.simpleMessage(
          "Se vi havus iujn ajn rimarkojn pri tiu ĉi eblo, bonvolu lasi ĝin ŝaltite",
        ),
    "import": MessageLookupByLibrary.simpleMessage("Importi"),
    "import_data_from_another_device": MessageLookupByLibrary.simpleMessage(
      "Importi datumojn el alia aparato",
    ),
    "import_from_twitter": MessageLookupByLibrary.simpleMessage(
      "Importi el Twitter/X",
    ),
    "import_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Importi abonojn",
    ),
    "imported_snapshot_data_users_so_far": m9,
    "include_replies": MessageLookupByLibrary.simpleMessage(
      "Ampleksi respondojn",
    ),
    "include_retweets": MessageLookupByLibrary.simpleMessage(
      "Ampleksi repepojn",
    ),
    "invert_selection": MessageLookupByLibrary.simpleMessage(""),
    "joined": m10,
    "keep_feed_offset_description": MessageLookupByLibrary.simpleMessage(""),
    "keep_feed_offset_label": MessageLookupByLibrary.simpleMessage(""),
    "language": MessageLookupByLibrary.simpleMessage("Lingvo"),
    "language_subtitle": MessageLookupByLibrary.simpleMessage(
      "Bezonas rekomencon",
    ),
    "large": MessageLookupByLibrary.simpleMessage("Granda"),
    "leaner_feeds_description": MessageLookupByLibrary.simpleMessage(""),
    "leaner_feeds_label": MessageLookupByLibrary.simpleMessage(""),
    "legacy_android_import": MessageLookupByLibrary.simpleMessage(
      "Importo de Android malnova",
    ),
    "let_the_developers_know_if_something_is_broken":
        MessageLookupByLibrary.simpleMessage(
          "Konigi al programistojn, se io estas difektita",
        ),
    "libre_translate_host": MessageLookupByLibrary.simpleMessage(""),
    "licenses": MessageLookupByLibrary.simpleMessage("Licencoj"),
    "light": MessageLookupByLibrary.simpleMessage("Hela"),
    "live": MessageLookupByLibrary.simpleMessage("REKTE"),
    "logging": MessageLookupByLibrary.simpleMessage("Protokolado"),
    "login": MessageLookupByLibrary.simpleMessage(""),
    "loop_videos": MessageLookupByLibrary.simpleMessage(""),
    "loop_videos_description": MessageLookupByLibrary.simpleMessage(""),
    "mandatory_label": MessageLookupByLibrary.simpleMessage(""),
    "material_3": MessageLookupByLibrary.simpleMessage(""),
    "media": MessageLookupByLibrary.simpleMessage("Plurmedio"),
    "media_image_quality": MessageLookupByLibrary.simpleMessage(""),
    "media_size": MessageLookupByLibrary.simpleMessage("Grando de plurmedio"),
    "media_video_quality": MessageLookupByLibrary.simpleMessage(""),
    "medium": MessageLookupByLibrary.simpleMessage("Mezgranda"),
    "missing_page": MessageLookupByLibrary.simpleMessage("Paĝo manka"),
    "mute_video_description": MessageLookupByLibrary.simpleMessage(
      "Ĉu videoj mutiĝu defaŭlte",
    ),
    "mute_videos": MessageLookupByLibrary.simpleMessage("Mutigi videojn"),
    "name": MessageLookupByLibrary.simpleMessage("Nomo"),
    "name_label": MessageLookupByLibrary.simpleMessage(""),
    "nbr_guest_accounts": m11,
    "newTrans": MessageLookupByLibrary.simpleMessage("Nova"),
    "next": MessageLookupByLibrary.simpleMessage("Sekven"),
    "no": MessageLookupByLibrary.simpleMessage("Ne"),
    "no_data_was_returned_which_should_never_happen_please_report_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "Ne datumoj revenis, kiu neniam okazu. Bonvolu raporti cimon, se eblus!",
        ),
    "no_results": MessageLookupByLibrary.simpleMessage("Ne rezultoj"),
    "no_results_for": MessageLookupByLibrary.simpleMessage("Ne rezultoj por:"),
    "no_subscriptions_try_searching_or_importing_some":
        MessageLookupByLibrary.simpleMessage(
          "Ne abonoj. Provu serĉi aŭ importi iujn!",
        ),
    "not_logged_in": MessageLookupByLibrary.simpleMessage(""),
    "not_set": MessageLookupByLibrary.simpleMessage("Ne agordita"),
    "note_due_to_a_twitter_limitation_not_all_tweets_may_be_included":
        MessageLookupByLibrary.simpleMessage(
          "Noto: Pro limigo de Twitter/X, ne ĉiuj pepoj eble estas ampleksitaj",
        ),
    "numberFormat_format_total_votes": m12,
    "ok": MessageLookupByLibrary.simpleMessage("Bone"),
    "only_public_subscriptions_can_be_imported":
        MessageLookupByLibrary.simpleMessage(
          "Abonoj nur eblas importiĝi el publikaj profiloj",
        ),
    "oops_something_went_wrong": MessageLookupByLibrary.simpleMessage(
      "Ups! Io misokazis 🥲",
    ),
    "open_app_settings": MessageLookupByLibrary.simpleMessage(
      "Montri agordojn de la apo",
    ),
    "open_in_browser": MessageLookupByLibrary.simpleMessage(""),
    "option_confirm_close_description": MessageLookupByLibrary.simpleMessage(
      "",
    ),
    "option_confirm_close_label": MessageLookupByLibrary.simpleMessage(""),
    "option_navigation_animations_description":
        MessageLookupByLibrary.simpleMessage(""),
    "option_navigation_animations_label": MessageLookupByLibrary.simpleMessage(
      "",
    ),
    "option_show_navigation_labels_description":
        MessageLookupByLibrary.simpleMessage(""),
    "option_show_navigation_labels_label": MessageLookupByLibrary.simpleMessage(
      "",
    ),
    "optional_label": MessageLookupByLibrary.simpleMessage(""),
    "page_not_found": MessageLookupByLibrary.simpleMessage(
      "Twitter/X diras, la paĝo ne ekzistas, sed tio eble ne estas vere",
    ),
    "password_label": MessageLookupByLibrary.simpleMessage(""),
    "permission_not_granted": MessageLookupByLibrary.simpleMessage(
      "Permeso ne doniĝis. Bonvolu provi ree post permesado!",
    ),
    "phone_label": MessageLookupByLibrary.simpleMessage(""),
    "pick_a_color": MessageLookupByLibrary.simpleMessage("Elekti koloron!"),
    "pick_an_icon": MessageLookupByLibrary.simpleMessage("Elekti ikonon!"),
    "pinned_tweet": MessageLookupByLibrary.simpleMessage("Alpinglita pepo"),
    "playback_speed": MessageLookupByLibrary.simpleMessage(
      "Rapido de reproduktado",
    ),
    "please_check_your_internet_connection_error_message": m13,
    "please_enter_a_name": MessageLookupByLibrary.simpleMessage(
      "Bonvolu enigi nomon",
    ),
    "please_make_sure_the_data_you_wish_to_import_is_located_there_then_press_the_import_button_below":
        MessageLookupByLibrary.simpleMessage(
          "Bonvolu certigi, ke la datumoj dezirate importontaj lokiĝas tie, tiam premu la butono de importi sube.",
        ),
    "please_note_that_the_method_fritter_uses_to_import_subscriptions_is_heavily_rate_limited_by_twitter_so_this_may_fail_if_you_have_a_lot_of_followed_accounts":
        MessageLookupByLibrary.simpleMessage(
          "Bonvolu noti, ke la metodon Squawker uzas por importi abonojn peze rapidolimigante de Twitter/X, do eble malsukcesus se vi havus tre multajn da kontojn abonitajn.",
        ),
    "possibly_sensitive": MessageLookupByLibrary.simpleMessage("Eble sentema"),
    "possibly_sensitive_profile": MessageLookupByLibrary.simpleMessage(
      "Tiu ĉi profilo eble enhavas eble sentemajn bildojn, idiomon, aŭ alian enhavon. Ĉu vi ankoraŭ deziras vidi ĝin?",
    ),
    "possibly_sensitive_tweet": MessageLookupByLibrary.simpleMessage(
      "Tiu ĉi pepo enhavas enhavon eble senteman. Ĉu vi deziras vidi ĝin?",
    ),
    "prefix": MessageLookupByLibrary.simpleMessage("prefikso"),
    "private_profile": MessageLookupByLibrary.simpleMessage("Profilo privata"),
    "proxy_description": MessageLookupByLibrary.simpleMessage(""),
    "proxy_error": MessageLookupByLibrary.simpleMessage(""),
    "proxy_label": MessageLookupByLibrary.simpleMessage(""),
    "quality": MessageLookupByLibrary.simpleMessage(""),
    "regular_accounts": m14,
    "released_under_the_mit_license": MessageLookupByLibrary.simpleMessage(
      "Eldonis per la licenco MIT-a",
    ),
    "remove_from_feed": MessageLookupByLibrary.simpleMessage(""),
    "replying_to": MessageLookupByLibrary.simpleMessage("Respondas al"),
    "report": MessageLookupByLibrary.simpleMessage("Raporti"),
    "report_a_bug": MessageLookupByLibrary.simpleMessage("Raporti cimon"),
    "reporting_an_error": MessageLookupByLibrary.simpleMessage(
      "Raporti eraron",
    ),
    "reset_home_pages": MessageLookupByLibrary.simpleMessage(
      "Reagordi paĝojn defaŭlten",
    ),
    "restart_video_player": MessageLookupByLibrary.simpleMessage(""),
    "retry": MessageLookupByLibrary.simpleMessage("Reprovi"),
    "save": MessageLookupByLibrary.simpleMessage("Konservi"),
    "save_bandwidth_using_smaller_images": MessageLookupByLibrary.simpleMessage(
      "Konservi bendlarĝon per pli malgrandaj bildoj",
    ),
    "save_bandwidth_using_smaller_videos": MessageLookupByLibrary.simpleMessage(
      "",
    ),
    "saved": MessageLookupByLibrary.simpleMessage("Konservitaĵoj"),
    "saved_tweet_too_large": MessageLookupByLibrary.simpleMessage(
      "Tiu ĉi pepo konservita ne eblas vidiĝi, pro ĝi estas tro granda por ŝarĝi. Bonvolu raporti al la programistoj.",
    ),
    "search": MessageLookupByLibrary.simpleMessage("Serĉi"),
    "search_term": MessageLookupByLibrary.simpleMessage("Termino de serĉo"),
    "select": MessageLookupByLibrary.simpleMessage("Elekti"),
    "select_all": MessageLookupByLibrary.simpleMessage(""),
    "select_groups": MessageLookupByLibrary.simpleMessage(""),
    "selected_count": m15,
    "selecting_individual_accounts_to_import_and_assigning_groups_are_both_planned_for_the_future_already":
        MessageLookupByLibrary.simpleMessage(
          "Elektado de kontoj individuaj por importi, kaj asignado de grupoj estas ambaŭ planite estontece jam!",
        ),
    "send": MessageLookupByLibrary.simpleMessage("Sendi"),
    "settings": MessageLookupByLibrary.simpleMessage(""),
    "settings_saved": MessageLookupByLibrary.simpleMessage(""),
    "share_base_url": MessageLookupByLibrary.simpleMessage(
      "URL kunhavanta propra",
    ),
    "share_base_url_description": MessageLookupByLibrary.simpleMessage(
      "Uzi URL-on bazan propran kiam kunhavigi",
    ),
    "share_tweet_as_image": MessageLookupByLibrary.simpleMessage(""),
    "share_tweet_content": MessageLookupByLibrary.simpleMessage(
      "Kunhavigi la enhavon de la pepo",
    ),
    "share_tweet_content_and_link": MessageLookupByLibrary.simpleMessage(
      "Kunhavigi la enhavon kaj ligilon de la pepo",
    ),
    "share_tweet_link": MessageLookupByLibrary.simpleMessage(
      "Kunhavigi la ligilon de la pepo",
    ),
    "should_check_for_updates_description":
        MessageLookupByLibrary.simpleMessage(
          "Kontroli por ĝisdatigoj kiam Squawker komenciĝus",
        ),
    "should_check_for_updates_label": MessageLookupByLibrary.simpleMessage(
      "Kontroli por ĝisdatigoj",
    ),
    "small": MessageLookupByLibrary.simpleMessage("Malgranda"),
    "something_broke_in_fritter": MessageLookupByLibrary.simpleMessage(
      "Io malfunkciis en Squawker.",
    ),
    "something_just_went_wrong_in_fritter_and_an_error_report_has_been_generated":
        MessageLookupByLibrary.simpleMessage(
          "Io ĵus misokazis en Squawker, kaj raporto de la eraro kreiĝis. La raporto eblas sendiĝi al la programistoj de Squawker por helpi ripari la problemon.",
        ),
    "sorry_the_replied_tweet_could_not_be_found":
        MessageLookupByLibrary.simpleMessage(
          "Pardonu, la pepo alrespondita ne eblas troviĝi!",
        ),
    "subscribe": MessageLookupByLibrary.simpleMessage("Aboni"),
    "subscriptions": MessageLookupByLibrary.simpleMessage("Abonoj"),
    "subtitles": MessageLookupByLibrary.simpleMessage("Subtekstoj"),
    "successfully_saved_the_media": MessageLookupByLibrary.simpleMessage(
      "Konservis la plurmedion!",
    ),
    "system": MessageLookupByLibrary.simpleMessage("Sistema"),
    "tap_to_download_release_version": m16,
    "tap_to_show_getMediaType_item_type": m17,
    "thanks_for_helping_fritter": MessageLookupByLibrary.simpleMessage(
      "Dankon pro helpi Squawker! 💖",
    ),
    "the_file_does_not_exist_please_ensure_it_is_located_at_file_path": m18,
    "the_github_issue": MessageLookupByLibrary.simpleMessage(
      "la problemo ĉe GitHub (#143)",
    ),
    "the_tweet_did_not_contain_any_text_this_is_unexpected":
        MessageLookupByLibrary.simpleMessage(
          "La pepo ne enhavas iun ajn tekston. Estas ne atendite",
        ),
    "theme": MessageLookupByLibrary.simpleMessage("Temo"),
    "theme_mode": MessageLookupByLibrary.simpleMessage("Reĝimo de temo"),
    "there_were_no_trends_returned_this_is_unexpected_please_report_as_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "Ne tendencaĵoj revenis. Estas ne atendite! Bonvolu raporti kiel cimo, se eble.",
        ),
    "this_group_contains_no_subscriptions":
        MessageLookupByLibrary.simpleMessage("Tiu grupo enhavas ne abonojn!"),
    "this_took_too_long_to_load_please_check_your_network_connection":
        MessageLookupByLibrary.simpleMessage(
          "La ŝarĝado daŭris tro longe. Bonvolu kontroli vian konekton Interretan!",
        ),
    "this_tweet_is_unavailable": MessageLookupByLibrary.simpleMessage(
      "Tiu ĉi pepo estas maldisponebla. Ĝi probable foriĝis.",
    ),
    "this_tweet_user_name_retweeted": m19,
    "this_user_does_not_follow_anyone": MessageLookupByLibrary.simpleMessage(
      "Tiu ĉi uzanto ne observas iun ajn!",
    ),
    "this_user_does_not_have_anyone_following_them":
        MessageLookupByLibrary.simpleMessage(
          "Tiu ĉi uzanto ne havas iun ajn observante si!",
        ),
    "thread": MessageLookupByLibrary.simpleMessage("Diskutfadeno"),
    "thumbnail": MessageLookupByLibrary.simpleMessage("Miniaturo"),
    "thumbnail_not_available": MessageLookupByLibrary.simpleMessage(""),
    "timed_out": MessageLookupByLibrary.simpleMessage("Tempolimiĝis"),
    "to_import_specific_subscriptions_enter_your_comma_separated_usernames_below":
        MessageLookupByLibrary.simpleMessage(""),
    "to_import_subscriptions_from_an_existing_twitter_account_enter_your_username_below":
        MessageLookupByLibrary.simpleMessage(
          "Por importi abonojn el ekzistanta Twitter/X-konto, enigi vian uzantnomon sube.",
        ),
    "toggle_all": MessageLookupByLibrary.simpleMessage("Baskuli ĉiun"),
    "translator_label": MessageLookupByLibrary.simpleMessage(""),
    "translators_description": MessageLookupByLibrary.simpleMessage(""),
    "translators_label": MessageLookupByLibrary.simpleMessage(""),
    "trending": MessageLookupByLibrary.simpleMessage("Tendencaĵoj"),
    "trends": MessageLookupByLibrary.simpleMessage("Tendencaĵoj"),
    "true_black": MessageLookupByLibrary.simpleMessage("Nigro vera?"),
    "tweet_font_size_description": MessageLookupByLibrary.simpleMessage(""),
    "tweet_font_size_label": MessageLookupByLibrary.simpleMessage(""),
    "tweets": MessageLookupByLibrary.simpleMessage("Pepoj"),
    "tweets_and_replies": MessageLookupByLibrary.simpleMessage(
      "Pepoj k. Respondoj",
    ),
    "tweets_number": m20,
    "twitter_account_types_both": MessageLookupByLibrary.simpleMessage(""),
    "twitter_account_types_description": MessageLookupByLibrary.simpleMessage(
      "",
    ),
    "twitter_account_types_label": MessageLookupByLibrary.simpleMessage(""),
    "twitter_account_types_only_regular": MessageLookupByLibrary.simpleMessage(
      "",
    ),
    "twitter_account_types_priority_to_regular":
        MessageLookupByLibrary.simpleMessage(""),
    "two_home_pages_required": MessageLookupByLibrary.simpleMessage(
      "Vi bezonas havi malpleje 2 paĝojn de hejmekrano.",
    ),
    "unable_to_find_the_available_trend_locations":
        MessageLookupByLibrary.simpleMessage(
          "Ne eblas trovi la lokojn disponeblajn de tendencoj.",
        ),
    "unable_to_find_your_saved_tweets": MessageLookupByLibrary.simpleMessage(
      "Ne eblas trovi viajn pepojn konservitajn.",
    ),
    "unable_to_import": MessageLookupByLibrary.simpleMessage(
      "Ne eblas importi",
    ),
    "unable_to_load_home_pages": MessageLookupByLibrary.simpleMessage(
      "Ne eblas ŝarĝi viajn hejmpaĝojn",
    ),
    "unable_to_load_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "Ne eblas ŝarĝi la grupojn de abonoj",
    ),
    "unable_to_load_the_group": MessageLookupByLibrary.simpleMessage(
      "Ne eblas ŝarĝi la grupon",
    ),
    "unable_to_load_the_group_settings": MessageLookupByLibrary.simpleMessage(
      "Ne eblas ŝarĝi la agordojn de grupo",
    ),
    "unable_to_load_the_list_of_follows": MessageLookupByLibrary.simpleMessage(
      "Ne eblas ŝarĝi la liston de abonoj",
    ),
    "unable_to_load_the_next_page_of_follows":
        MessageLookupByLibrary.simpleMessage(
          "Ne eblas ŝarĝi la sekvan paĝon de abonoj",
        ),
    "unable_to_load_the_next_page_of_replies":
        MessageLookupByLibrary.simpleMessage(
          "Ne eblas ŝarĝi la sekvan paĝon de respondoj",
        ),
    "unable_to_load_the_next_page_of_tweets":
        MessageLookupByLibrary.simpleMessage(
          "Ne eblas ŝarĝi la sekvan paĝon de pepoj",
        ),
    "unable_to_load_the_profile": MessageLookupByLibrary.simpleMessage(
      "Ne eblas ŝarĝi la profilon",
    ),
    "unable_to_load_the_search_results": MessageLookupByLibrary.simpleMessage(
      "Ne eblas ŝarĝi la rezultojn de la serĉo.",
    ),
    "unable_to_load_the_trends_for_widget_place_name": m21,
    "unable_to_load_the_tweet": MessageLookupByLibrary.simpleMessage(
      "Ne eblas ŝarĝi la pepon",
    ),
    "unable_to_load_the_tweets": MessageLookupByLibrary.simpleMessage(
      "Ne eblas ŝarĝi la pepojn",
    ),
    "unable_to_load_the_tweets_for_the_feed":
        MessageLookupByLibrary.simpleMessage(
          "Ne eblas ŝarĝi la pepojn por la fluo",
        ),
    "unable_to_refresh_the_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Ne eblas aktualigi la abonojn",
    ),
    "unable_to_run_the_database_migrations":
        MessageLookupByLibrary.simpleMessage(
          "Ne eblas ruli migradojn de la datumbazo",
        ),
    "unable_to_save_the_media_twitter_returned_a_status_of_response_statusCode":
        m22,
    "unable_to_stream_the_trend_location_preference":
        MessageLookupByLibrary.simpleMessage(
          "Ne eblas fluigi la agordon de loko de tendencoj",
        ),
    "unknown": MessageLookupByLibrary.simpleMessage("Nekonata"),
    "unsave": MessageLookupByLibrary.simpleMessage("Malkonservi"),
    "unsubscribe": MessageLookupByLibrary.simpleMessage("Malaboni"),
    "unsupported_url": MessageLookupByLibrary.simpleMessage("URL malsubtenita"),
    "update_to_release_version_through_your_fdroid_client": m23,
    "updates": MessageLookupByLibrary.simpleMessage("Ĝisdatigoj"),
    "use_true_black_for_the_dark_mode_theme":
        MessageLookupByLibrary.simpleMessage(
          "Uzi nigron veran kun la reĝimo malhela de temo",
        ),
    "user_not_found": MessageLookupByLibrary.simpleMessage(
      "Uzanto ne troviĝis",
    ),
    "username": MessageLookupByLibrary.simpleMessage("Uzantnomo"),
    "username_exclude": MessageLookupByLibrary.simpleMessage(""),
    "username_label": MessageLookupByLibrary.simpleMessage(""),
    "usernames": MessageLookupByLibrary.simpleMessage(""),
    "version": MessageLookupByLibrary.simpleMessage("Versio"),
    "video_prefetch": MessageLookupByLibrary.simpleMessage(""),
    "video_prefetch_description": MessageLookupByLibrary.simpleMessage(""),
    "video_prefetch_seconds": m24,
    "video_prefetch_unlimited": MessageLookupByLibrary.simpleMessage(""),
    "warning_regular_account_unauthenticated_access_description":
        MessageLookupByLibrary.simpleMessage(""),
    "warning_regular_account_unauthenticated_access_title":
        MessageLookupByLibrary.simpleMessage(""),
    "when_a_new_app_update_is_available": MessageLookupByLibrary.simpleMessage(
      "Kiam ĝisdatigo de la apo estas disponebla",
    ),
    "whether_errors_should_be_reported_to_":
        MessageLookupByLibrary.simpleMessage("Ĉu eraroj raportiĝus al "),
    "whether_to_hide_tweets_marked_as_sensitive":
        MessageLookupByLibrary.simpleMessage(
          "Ĉu kaŝi pepojn markite kiel sentemaj",
        ),
    "which_tab_is_shown_when_the_app_opens":
        MessageLookupByLibrary.simpleMessage(
          "Kiu langeto vidiĝus kiam la apo malfermiĝus",
        ),
    "which_tab_is_shown_when_the_subscription_opens":
        MessageLookupByLibrary.simpleMessage(""),
    "would_you_like_to_enable_automatic_error_reporting":
        MessageLookupByLibrary.simpleMessage(
          "Ĉu vi volus ŝalti eraroraportadon aŭtomatan?",
        ),
    "x_api": MessageLookupByLibrary.simpleMessage(""),
    "x_client_transaction_id_provider": MessageLookupByLibrary.simpleMessage(
      "",
    ),
    "x_client_transaction_id_provider_description":
        MessageLookupByLibrary.simpleMessage(""),
    "yes": MessageLookupByLibrary.simpleMessage("Jes"),
    "yes_please": MessageLookupByLibrary.simpleMessage("Jes, bonvolu"),
    "you_have_not_saved_any_tweets_yet": MessageLookupByLibrary.simpleMessage(
      "Vi ne konservis iujn ajn pepojn ankoraŭ!",
    ),
    "you_must_have_at_least_2_home_screen_pages":
        MessageLookupByLibrary.simpleMessage(
          "Vi devas havi malpleje 2 paĝojn de hejmekrano",
        ),
    "your_profile_must_be_public_otherwise_the_import_will_not_work":
        MessageLookupByLibrary.simpleMessage(
          "Via profilo devas esti publika, alie la importo ne funkcios",
        ),
    "your_report_will_be_sent_to_fritter__project":
        MessageLookupByLibrary.simpleMessage(
          "Via raporto sendiĝos al -projekto de Squawker, kaj la detaloj de privateco eblas troviĝi ĉe:",
        ),
  };
}
