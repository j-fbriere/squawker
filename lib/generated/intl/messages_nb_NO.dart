// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a nb_NO locale. All the
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
  String get localeName => 'nb_NO';

  static String m0(name) => "Slett ${name}-abonnementsgruppen?";

  static String m1(fileName) => "Data eksportert til ${fileName}";

  static String m2(fullPath) => "Data eksportert til ${fullPath}";

  static String m3(timeagoFormat) => "Sluttet ${timeagoFormat}";

  static String m4(timeagoFormat) => "Slutter ${timeagoFormat}";

  static String m5(snapshotData) => "Fullført med ${snapshotData} brukere";

  static String m6(name) => "Gruppe: ${name}";

  static String m7(snapshotData) =>
      "${snapshotData} brukere importert så langt";

  static String m8(date) => "Tok del ${date}";

  static String m9(num, numFormatted) =>
      "${Intl.plural(num, zero: 'ingen stemmer', one: 'én stemme', two: 'to stemmer', few: '${numFormatted} stemmer', many: '${numFormatted} stemme', other: '${numFormatted} stemmer')}";

  static String m10(errorMessage) =>
      "Sjekk at du er tilkoblet Internett.\n\n${errorMessage}";

  static String m11(releaseVersion) =>
      "Trykk for å laste ned ${releaseVersion}";

  static String m12(getMediaType) => "Trykk for å vise ${getMediaType}";

  static String m13(filePath) =>
      "Filen finnes ikke. Sørg for at den er å finne i ${filePath}";

  static String m14(thisTweetUserName, timeAgo) =>
      "${thisTweetUserName} re-tvitret";

  static String m15(num, numFormatted) =>
      "${Intl.plural(num, zero: 'ingen tvitringer', one: 'én tvitring', two: 'to tvitringer', few: '${numFormatted} tvitringer', many: '${numFormatted} tvitringer', other: '${numFormatted} tvitringer')}";

  static String m16(widgetPlaceName) =>
      "Kunne ikke laste ned tendenser for ${widgetPlaceName}";

  static String m17(responseStatusCode) =>
      "Kunne ikke lagre mediafilen. Twitter/X svarte med ${responseStatusCode}";

  static String m18(releaseVersion) =>
      "Oppgrader til ${releaseVersion} med din F-Droid-klient";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("Om"),
        "account_suspended":
            MessageLookupByLibrary.simpleMessage("Kontoen er suspendert"),
        "activate_non_confirmation_bias_mode_description":
            MessageLookupByLibrary.simpleMessage(
                "Skjul forfattere av tvitringer. Unngå bekreftelsesbias basert på argumenter i form av autoriteter."),
        "activate_non_confirmation_bias_mode_label":
            MessageLookupByLibrary.simpleMessage("Forhindre bekreftelsesbias"),
        "add_subscriptions":
            MessageLookupByLibrary.simpleMessage("Legg til abonnementer"),
        "add_to_feed": MessageLookupByLibrary.simpleMessage(
            "Legg til i informasjonsstrøm"),
        "add_to_group":
            MessageLookupByLibrary.simpleMessage("Legg til i gruppe"),
        "all": MessageLookupByLibrary.simpleMessage("Alle"),
        "all_the_great_software_used_by_fritter":
            MessageLookupByLibrary.simpleMessage(
                "All den flotte programvaren som brukes av Squawker"),
        "an_update_for_fritter_is_available":
            MessageLookupByLibrary.simpleMessage(
                "En oppdatering for Squawker er tilgjengelig! 🚀"),
        "app_info": MessageLookupByLibrary.simpleMessage("Programinfo"),
        "are_you_sure": MessageLookupByLibrary.simpleMessage("Er du sikker?"),
        "are_you_sure_you_want_to_delete_the_subscription_group_name_of_group":
            m0,
        "back": MessageLookupByLibrary.simpleMessage("Tilbake"),
        "bad_guest_token": MessageLookupByLibrary.simpleMessage(
            "X har ugyldiggjort vårt tilgangssymbol. Åpne Squawker på ny."),
        "beta": MessageLookupByLibrary.simpleMessage("Beta"),
        "blue_theme_based_on_the_twitter_color_scheme":
            MessageLookupByLibrary.simpleMessage(
                "Blå drakt basert på Twitter/X-fargepaletten"),
        "cancel": MessageLookupByLibrary.simpleMessage("Avbryt"),
        "catastrophic_failure":
            MessageLookupByLibrary.simpleMessage("Katastrofal feil"),
        "choose": MessageLookupByLibrary.simpleMessage("Velg"),
        "choose_pages": MessageLookupByLibrary.simpleMessage("Velg sider"),
        "close": MessageLookupByLibrary.simpleMessage("Lukk"),
        "confirm_close_fritter":
            MessageLookupByLibrary.simpleMessage("Lukk Squawker?"),
        "contribute": MessageLookupByLibrary.simpleMessage("Bidra"),
        "copied_address_to_clipboard": MessageLookupByLibrary.simpleMessage(
            "Adresse kopiert til utklippstavle"),
        "copied_version_to_clipboard": MessageLookupByLibrary.simpleMessage(
            "Versjon kopiert til utklippstavlen"),
        "could_not_contact_twitter": MessageLookupByLibrary.simpleMessage(
            "Kunne ikke kontakte Twitter/X"),
        "could_not_find_any_tweets_by_this_user":
            MessageLookupByLibrary.simpleMessage(
                "Kunne ikke finne noen tweets fra denne brukeren!"),
        "could_not_find_any_tweets_from_the_last_7_days":
            MessageLookupByLibrary.simpleMessage(
                "Kunne ikke finne noen tweets fra de siste 7 dagene!"),
        "country": MessageLookupByLibrary.simpleMessage("Land"),
        "dark": MessageLookupByLibrary.simpleMessage("Mørk"),
        "data": MessageLookupByLibrary.simpleMessage("Data"),
        "data_exported_to_fileName": m1,
        "data_exported_to_fullPath": m2,
        "data_imported_successfully":
            MessageLookupByLibrary.simpleMessage("Data importert"),
        "date_created":
            MessageLookupByLibrary.simpleMessage("Opprettelsesdato"),
        "date_subscribed":
            MessageLookupByLibrary.simpleMessage("Abonneringsdato"),
        "default_subscription_tab":
            MessageLookupByLibrary.simpleMessage("Forvalgt abonnementsfane"),
        "default_tab": MessageLookupByLibrary.simpleMessage("Forvalgt fane"),
        "delete": MessageLookupByLibrary.simpleMessage("Slett"),
        "disable_screenshots":
            MessageLookupByLibrary.simpleMessage("Skru av skjermavbildninger"),
        "disable_screenshots_hint": MessageLookupByLibrary.simpleMessage(
            "Forhindre skjermavbildninger. Trenger ikke å fungere på alle enheter."),
        "disabled": MessageLookupByLibrary.simpleMessage("Avskrudd"),
        "donate": MessageLookupByLibrary.simpleMessage("Doner"),
        "download": MessageLookupByLibrary.simpleMessage("Last ned"),
        "download_handling":
            MessageLookupByLibrary.simpleMessage("Nedlastingshåndtering"),
        "download_handling_description": MessageLookupByLibrary.simpleMessage(
            "Hvordan nedlasting burde fungere"),
        "download_handling_type_ask":
            MessageLookupByLibrary.simpleMessage("Alltid spør"),
        "download_handling_type_directory":
            MessageLookupByLibrary.simpleMessage("Lagre i mappe"),
        "download_media_no_url": MessageLookupByLibrary.simpleMessage(
            "Kunne ikke laste ned. Media kan være kun tilgjengelig som strøm, som Squawker ikke kan laste ned enda."),
        "download_path": MessageLookupByLibrary.simpleMessage("Nedlastingssti"),
        "download_video_best_quality_description":
            MessageLookupByLibrary.simpleMessage(
                "Last ned videoer i best tilgjengelige kvalitet"),
        "download_video_best_quality_label":
            MessageLookupByLibrary.simpleMessage(
                "Last ned videoer i beste kvalitet"),
        "downloading_media":
            MessageLookupByLibrary.simpleMessage("Laster ned media …"),
        "enable_": MessageLookupByLibrary.simpleMessage("Vil du aktivere ?"),
        "ended_timeago_format_endsAt_allowFromNow_true": m3,
        "ends_timeago_format_endsAt_allowFromNow_true": m4,
        "enhanced_feeds_description": MessageLookupByLibrary.simpleMessage(
            "Forbedrede forespørsler for informasjonsstrømmer (men med lavere bruksgrense)"),
        "enhanced_feeds_label": MessageLookupByLibrary.simpleMessage(
            "Forberede informasjonsstrømmer"),
        "enhanced_profile_description":
            MessageLookupByLibrary.simpleMessage("Forbedret profilforespørsel"),
        "enhanced_profile_label":
            MessageLookupByLibrary.simpleMessage("Forbedret profil"),
        "enhanced_searches_description": MessageLookupByLibrary.simpleMessage(
            "Forbedrede forespørsler for søk (men med lavere bruksgrense)"),
        "enhanced_searches_label":
            MessageLookupByLibrary.simpleMessage("Forbedrede søk"),
        "enter_your_twitter_username": MessageLookupByLibrary.simpleMessage(
            "Skriv inn ditt Twitter/X-brukernavn"),
        "export": MessageLookupByLibrary.simpleMessage("Eksporter"),
        "export_guest_accounts":
            MessageLookupByLibrary.simpleMessage("Eksporter gjestekontoer?"),
        "export_settings":
            MessageLookupByLibrary.simpleMessage("Eksporter innstillinger?"),
        "export_subscription_group_members":
            MessageLookupByLibrary.simpleMessage(
                "Eksporter abonnementsgruppemedlemmer?"),
        "export_subscription_groups": MessageLookupByLibrary.simpleMessage(
            "Eksporter abonnementsgrupper?"),
        "export_subscriptions":
            MessageLookupByLibrary.simpleMessage("Eksporter abonnementer?"),
        "export_tweets":
            MessageLookupByLibrary.simpleMessage("Eksporter tvitringer?"),
        "export_your_data":
            MessageLookupByLibrary.simpleMessage("Eksporter dataen din"),
        "feed": MessageLookupByLibrary.simpleMessage("Informasjonsstrøm"),
        "filters": MessageLookupByLibrary.simpleMessage("Filtre"),
        "finish": MessageLookupByLibrary.simpleMessage("Fullfør"),
        "finished_with_snapshotData_users": m5,
        "followers": MessageLookupByLibrary.simpleMessage("Følgere"),
        "following": MessageLookupByLibrary.simpleMessage("Følger"),
        "forbidden": MessageLookupByLibrary.simpleMessage(
            "X sier at tilgang til dette er forbudt."),
        "fritter": MessageLookupByLibrary.simpleMessage("Squawker"),
        "fritter_blue": MessageLookupByLibrary.simpleMessage("Squawker-blå"),
        "functionality_unsupported": MessageLookupByLibrary.simpleMessage(
            "Denne funksjonaliteten støttes ikke av X lenger."),
        "general": MessageLookupByLibrary.simpleMessage("Generelt"),
        "generic_username": MessageLookupByLibrary.simpleMessage("Bruker"),
        "group_name": m6,
        "groups": MessageLookupByLibrary.simpleMessage("Grupper"),
        "help_make_fritter_even_better": MessageLookupByLibrary.simpleMessage(
            "Hjelp til å gjøre Squawker enda bedre"),
        "help_support_fritters_future": MessageLookupByLibrary.simpleMessage(
            "Hjelp til å støtte Squawkers fremtid"),
        "hide_sensitive_tweets": MessageLookupByLibrary.simpleMessage(
            "Skjul sensurerbare tvitringer"),
        "home": MessageLookupByLibrary.simpleMessage("Hjem"),
        "if_you_have_any_feedback_on_this_feature_please_leave_it_on":
            MessageLookupByLibrary.simpleMessage(
                "Hvis du har tilbakemeldinger om denne funksjonen, vennligst la den være på"),
        "import": MessageLookupByLibrary.simpleMessage("Importer"),
        "import_data_from_another_device": MessageLookupByLibrary.simpleMessage(
            "Importer data fra en annen enhet"),
        "import_from_twitter":
            MessageLookupByLibrary.simpleMessage("Importer fra Twitter/X"),
        "import_subscriptions":
            MessageLookupByLibrary.simpleMessage("Importer abonnementer"),
        "imported_snapshot_data_users_so_far": m7,
        "include_replies": MessageLookupByLibrary.simpleMessage("Ta med svar"),
        "include_retweets":
            MessageLookupByLibrary.simpleMessage("Inkluder retweets"),
        "joined": m8,
        "keep_feed_offset_description": MessageLookupByLibrary.simpleMessage(
            "Tidslinjeforskyvelsen beholdes for informasjonsstrømmer når programmet startes på ny"),
        "keep_feed_offset_label": MessageLookupByLibrary.simpleMessage(
            "Beholder informasjonsstrømmer forskjøvet"),
        "language": MessageLookupByLibrary.simpleMessage("Språk"),
        "language_subtitle":
            MessageLookupByLibrary.simpleMessage("Krever omstart"),
        "large": MessageLookupByLibrary.simpleMessage("Stort"),
        "leaner_feeds_description": MessageLookupByLibrary.simpleMessage(
            "Forhåndsvisningslenker vises ikke i tvitringer fra informasjonsstrømmer"),
        "leaner_feeds_label":
            MessageLookupByLibrary.simpleMessage("Renere informasjonsstrømmer"),
        "legacy_android_import":
            MessageLookupByLibrary.simpleMessage("Gammeldags Android-import"),
        "let_the_developers_know_if_something_is_broken":
            MessageLookupByLibrary.simpleMessage(
                "Gi beskjed til utviklerne hvis noe er ødelagt"),
        "licenses": MessageLookupByLibrary.simpleMessage("Lisenser"),
        "light": MessageLookupByLibrary.simpleMessage("Lys"),
        "live": MessageLookupByLibrary.simpleMessage("DIREKTE"),
        "logging": MessageLookupByLibrary.simpleMessage("Loggføring"),
        "material_3": MessageLookupByLibrary.simpleMessage("Materiell 3?"),
        "media": MessageLookupByLibrary.simpleMessage("Media"),
        "media_size": MessageLookupByLibrary.simpleMessage("Mediastørrelse"),
        "medium": MessageLookupByLibrary.simpleMessage("Middels"),
        "missing_page": MessageLookupByLibrary.simpleMessage("Manglende side"),
        "mute_video_description": MessageLookupByLibrary.simpleMessage(
            "Hvorvidt videoer skal forstummes som forvalg"),
        "mute_videos": MessageLookupByLibrary.simpleMessage("Forstum videoer"),
        "name": MessageLookupByLibrary.simpleMessage("Navn"),
        "newTrans": MessageLookupByLibrary.simpleMessage("Ny"),
        "next": MessageLookupByLibrary.simpleMessage("Neste"),
        "no": MessageLookupByLibrary.simpleMessage("Nei"),
        "no_data_was_returned_which_should_never_happen_please_report_a_bug_if_possible":
            MessageLookupByLibrary.simpleMessage(
                "Ingen data ble returnert, noe som aldri skulle skje. Vennligst rapporter en feil, hvis mulig!"),
        "no_results": MessageLookupByLibrary.simpleMessage("Ingen resultater"),
        "no_results_for":
            MessageLookupByLibrary.simpleMessage("Ingen resultater for:"),
        "no_subscriptions_try_searching_or_importing_some":
            MessageLookupByLibrary.simpleMessage(
                "Ingen abonnementer. Prøv å søke eller importere noen!"),
        "not_set": MessageLookupByLibrary.simpleMessage("Ikke satt"),
        "note_due_to_a_twitter_limitation_not_all_tweets_may_be_included":
            MessageLookupByLibrary.simpleMessage(
                "Merk: På grunn av en Twitter/X-begrensning kan det hende at ikke alle tweets er inkludert"),
        "numberFormat_format_total_votes": m9,
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "only_public_subscriptions_can_be_imported":
            MessageLookupByLibrary.simpleMessage(
                "Abonnementer kan kun importeres fra offentlige profiler"),
        "oops_something_went_wrong":
            MessageLookupByLibrary.simpleMessage("Oops! Noe gikk galt 🥲"),
        "open_app_settings":
            MessageLookupByLibrary.simpleMessage("Åpne programinnstillingene"),
        "open_in_browser":
            MessageLookupByLibrary.simpleMessage("Åpne i nettleser"),
        "option_confirm_close_description":
            MessageLookupByLibrary.simpleMessage(
                "Bekreft når programmet lukkes"),
        "option_confirm_close_label":
            MessageLookupByLibrary.simpleMessage("Bekreft lukking"),
        "page_not_found": MessageLookupByLibrary.simpleMessage(
            "X sier at siden ikke finnes, men det trenger ikke å stemme."),
        "permission_not_granted": MessageLookupByLibrary.simpleMessage(
            "Tilgang ikke innvilget. Prøv igjen etter innvilgelse."),
        "pick_a_color": MessageLookupByLibrary.simpleMessage("Velg en farge!"),
        "pick_an_icon": MessageLookupByLibrary.simpleMessage("Velg et ikon"),
        "pinned_tweet": MessageLookupByLibrary.simpleMessage("Festet tvitring"),
        "playback_speed":
            MessageLookupByLibrary.simpleMessage("Avspillingshastighet"),
        "please_check_your_internet_connection_error_message": m10,
        "please_enter_a_name":
            MessageLookupByLibrary.simpleMessage("Vennligst skriv inn et navn"),
        "please_make_sure_the_data_you_wish_to_import_is_located_there_then_press_the_import_button_below":
            MessageLookupByLibrary.simpleMessage(
                "Forsikre deg om at dataen du ønsker å importere er å finne der. Deretter trykker du på «Import»-knappen nedenfor."),
        "please_note_that_the_method_fritter_uses_to_import_subscriptions_is_heavily_rate_limited_by_twitter_so_this_may_fail_if_you_have_a_lot_of_followed_accounts":
            MessageLookupByLibrary.simpleMessage(
                "Vær oppmerksom på at metoden Squawker bruker for å importere abonnementer er sterkt takstbegrenset av Twitter/X, så dette kan mislykkes hvis du har mange fulgte kontoer."),
        "possibly_sensitive":
            MessageLookupByLibrary.simpleMessage("Mulig sensitivt"),
        "possibly_sensitive_profile": MessageLookupByLibrary.simpleMessage(
            "Denne profilen kan inneholde mulig sensurerbare bilder, språk, eller annet innhold. Vil du fremdeles vise den?"),
        "possibly_sensitive_tweet": MessageLookupByLibrary.simpleMessage(
            "Denne tvitringer inneholder mulig sensurerbart innhold. Vil du vise den?"),
        "prefix": MessageLookupByLibrary.simpleMessage("prefiks"),
        "private_profile":
            MessageLookupByLibrary.simpleMessage("Privat profil"),
        "released_under_the_mit_license":
            MessageLookupByLibrary.simpleMessage("Utgitt under MIT-lisensen"),
        "remove_from_feed":
            MessageLookupByLibrary.simpleMessage("Fjern fra informasjonsstrøm"),
        "replying_to": MessageLookupByLibrary.simpleMessage("Svarer til"),
        "report": MessageLookupByLibrary.simpleMessage("Rapporter"),
        "report_a_bug":
            MessageLookupByLibrary.simpleMessage("Rapporter en feil"),
        "reporting_an_error":
            MessageLookupByLibrary.simpleMessage("Rapporterer en feil"),
        "reset_home_pages": MessageLookupByLibrary.simpleMessage(
            "Tilbakestill sider til forvalg"),
        "retry": MessageLookupByLibrary.simpleMessage("Prøv på nytt"),
        "save": MessageLookupByLibrary.simpleMessage("Lagre"),
        "save_bandwidth_using_smaller_images":
            MessageLookupByLibrary.simpleMessage(
                "Spar båndbredde ved å bruke mindre bilder"),
        "saved": MessageLookupByLibrary.simpleMessage("Lagret"),
        "saved_tweet_too_large": MessageLookupByLibrary.simpleMessage(
            "Den lagrede tvitringen er for stor til å vises. Rapporter det til utviklerne."),
        "search": MessageLookupByLibrary.simpleMessage("Søk"),
        "search_term": MessageLookupByLibrary.simpleMessage("Søkebegrep"),
        "select": MessageLookupByLibrary.simpleMessage("Velg"),
        "selecting_individual_accounts_to_import_and_assigning_groups_are_both_planned_for_the_future_already":
            MessageLookupByLibrary.simpleMessage(
                "Valg av individuelle kontoer og importere, samt tildeling av grupper er allerede planlagt."),
        "send": MessageLookupByLibrary.simpleMessage("Send"),
        "settings": MessageLookupByLibrary.simpleMessage("Innstillinger"),
        "share_base_url": MessageLookupByLibrary.simpleMessage(
            "Egendefinert delingsnettadresse"),
        "share_base_url_description": MessageLookupByLibrary.simpleMessage(
            "Bruk egendefinert grunn-nettadresse ved deling"),
        "share_tweet_content":
            MessageLookupByLibrary.simpleMessage("Del tvitringsinnhold"),
        "share_tweet_content_and_link": MessageLookupByLibrary.simpleMessage(
            "Del tvitringsinnhold og lenk"),
        "share_tweet_link":
            MessageLookupByLibrary.simpleMessage("Del tweet-lenke"),
        "should_check_for_updates_description":
            MessageLookupByLibrary.simpleMessage(
                "Se etter nye versjoner når Squawker starter"),
        "should_check_for_updates_label":
            MessageLookupByLibrary.simpleMessage("Se etter nye versjoner"),
        "small": MessageLookupByLibrary.simpleMessage("Lite"),
        "something_broke_in_fritter":
            MessageLookupByLibrary.simpleMessage("Noe brakk i Squawker."),
        "something_just_went_wrong_in_fritter_and_an_error_report_has_been_generated":
            MessageLookupByLibrary.simpleMessage(
                "Noe gikk galt i Squawker, og en feilrapport har blitt generert. Rapporten kan sendes til Squawker-utviklerne for å hjelpe med å fikse problemet."),
        "sorry_the_replied_tweet_could_not_be_found":
            MessageLookupByLibrary.simpleMessage("Fant ikke svar-tvitringen."),
        "subscribe": MessageLookupByLibrary.simpleMessage("Abonnere"),
        "subscriptions": MessageLookupByLibrary.simpleMessage("Abonnementer"),
        "subtitles": MessageLookupByLibrary.simpleMessage("Undertitler"),
        "successfully_saved_the_media":
            MessageLookupByLibrary.simpleMessage("Media lagret."),
        "system": MessageLookupByLibrary.simpleMessage("System"),
        "tap_to_download_release_version": m11,
        "tap_to_show_getMediaType_item_type": m12,
        "thanks_for_helping_fritter": MessageLookupByLibrary.simpleMessage(
            "Takk for at du hjelper Squawker. 💖"),
        "the_file_does_not_exist_please_ensure_it_is_located_at_file_path": m13,
        "the_github_issue":
            MessageLookupByLibrary.simpleMessage("GitHub-feilrapport (#143)"),
        "the_tweet_did_not_contain_any_text_this_is_unexpected":
            MessageLookupByLibrary.simpleMessage(
                "Tweeten inneholdt ingen tekst. Dette er uventet"),
        "theme": MessageLookupByLibrary.simpleMessage("Drakt"),
        "theme_mode": MessageLookupByLibrary.simpleMessage("Draktmodus"),
        "there_were_no_trends_returned_this_is_unexpected_please_report_as_a_bug_if_possible":
            MessageLookupByLibrary.simpleMessage(
                "Det var ingen trender tilbake. Dette er uventet! Vennligst rapporter som en feil, hvis mulig."),
        "this_group_contains_no_subscriptions":
            MessageLookupByLibrary.simpleMessage(
                "Denne gruppen inneholder ingen abonnementer!"),
        "this_took_too_long_to_load_please_check_your_network_connection":
            MessageLookupByLibrary.simpleMessage(
                "Dette tok for lang tid å laste. Vennligst sjekk nettverkstilkoblingen din!"),
        "this_tweet_is_unavailable": MessageLookupByLibrary.simpleMessage(
            "Denne tweeten er utilgjengelig"),
        "this_tweet_user_name_retweeted": m14,
        "this_user_does_not_follow_anyone":
            MessageLookupByLibrary.simpleMessage(
                "Denne brukeren følger ingen!"),
        "this_user_does_not_have_anyone_following_them":
            MessageLookupByLibrary.simpleMessage(
                "Denne brukeren har ingen som følger dem!"),
        "thread": MessageLookupByLibrary.simpleMessage("Tråd"),
        "thumbnail": MessageLookupByLibrary.simpleMessage("Miniatyrbilde"),
        "thumbnail_not_available": MessageLookupByLibrary.simpleMessage(
            "Miniatyrbilde ikke tilgjengelig"),
        "timed_out": MessageLookupByLibrary.simpleMessage("Tidsavbrudd"),
        "to_import_subscriptions_from_an_existing_twitter_account_enter_your_username_below":
            MessageLookupByLibrary.simpleMessage(
                "Skriv inn brukernavnet ditt nedenfor hvis du vil importere abonnementer fra en eksisterende Twitter/X-konto."),
        "toggle_all": MessageLookupByLibrary.simpleMessage("Veksle alt"),
        "trending": MessageLookupByLibrary.simpleMessage("Trender"),
        "trends": MessageLookupByLibrary.simpleMessage("Trender"),
        "true_black": MessageLookupByLibrary.simpleMessage("Helt svart?"),
        "tweet_font_size_description": MessageLookupByLibrary.simpleMessage(
            "Skriftstørrelse for tvitringene"),
        "tweet_font_size_label":
            MessageLookupByLibrary.simpleMessage("Skriftstørrelse"),
        "tweets": MessageLookupByLibrary.simpleMessage("Tvitringer"),
        "tweets_and_replies":
            MessageLookupByLibrary.simpleMessage("Tvitringer og svar"),
        "tweets_number": m15,
        "two_home_pages_required": MessageLookupByLibrary.simpleMessage(
            "Du må ha minst to hjemmeskjermssider."),
        "unable_to_find_the_available_trend_locations":
            MessageLookupByLibrary.simpleMessage(
                "Kan ikke finne tilgjengelige trendplasseringer."),
        "unable_to_find_your_saved_tweets":
            MessageLookupByLibrary.simpleMessage(
                "Kan ikke finne dine lagrede tweets."),
        "unable_to_import":
            MessageLookupByLibrary.simpleMessage("Kan ikke importere"),
        "unable_to_load_home_pages": MessageLookupByLibrary.simpleMessage(
            "Kunne ikke laste inn dine hjemmesider"),
        "unable_to_load_subscription_groups":
            MessageLookupByLibrary.simpleMessage(
                "Kan ikke laste inn abonnementsgrupper"),
        "unable_to_load_the_group":
            MessageLookupByLibrary.simpleMessage("Kan ikke laste inn gruppen"),
        "unable_to_load_the_group_settings":
            MessageLookupByLibrary.simpleMessage(
                "Kan ikke laste inn gruppeinnstillingene"),
        "unable_to_load_the_list_of_follows":
            MessageLookupByLibrary.simpleMessage(
                "Kan ikke laste inn listen over følger"),
        "unable_to_load_the_next_page_of_follows":
            MessageLookupByLibrary.simpleMessage(
                "Kunne ikke laste inn neste side med følgere"),
        "unable_to_load_the_next_page_of_replies":
            MessageLookupByLibrary.simpleMessage(
                "Kan ikke laste inn neste side med svar"),
        "unable_to_load_the_next_page_of_tweets":
            MessageLookupByLibrary.simpleMessage(
                "Kan ikke laste inn neste side med tweets"),
        "unable_to_load_the_profile": MessageLookupByLibrary.simpleMessage(
            "Kunne ikke laste inn profilen"),
        "unable_to_load_the_search_results":
            MessageLookupByLibrary.simpleMessage(
                "Kan ikke laste søkeresultatene."),
        "unable_to_load_the_trends_for_widget_place_name": m16,
        "unable_to_load_the_tweet":
            MessageLookupByLibrary.simpleMessage("Kan ikke laste tweeten"),
        "unable_to_load_the_tweets": MessageLookupByLibrary.simpleMessage(
            "Kunne ikke laste inn tvitringene"),
        "unable_to_load_the_tweets_for_the_feed":
            MessageLookupByLibrary.simpleMessage(
                "Kan ikke laste inn tweets for feeden"),
        "unable_to_refresh_the_subscriptions":
            MessageLookupByLibrary.simpleMessage(
                "Kunne ikke gjenoppfriske abonnementer"),
        "unable_to_run_the_database_migrations":
            MessageLookupByLibrary.simpleMessage(
                "Kunne ikke kjøre databaseflytting"),
        "unable_to_save_the_media_twitter_returned_a_status_of_response_statusCode":
            m17,
        "unable_to_stream_the_trend_location_preference":
            MessageLookupByLibrary.simpleMessage(
                "Kunne ikke strømme tendensposisjonsvalg"),
        "unknown": MessageLookupByLibrary.simpleMessage("Ukjent"),
        "unsave": MessageLookupByLibrary.simpleMessage("Opphev lagring"),
        "unsubscribe":
            MessageLookupByLibrary.simpleMessage("Avslutte abonnementet"),
        "unsupported_url":
            MessageLookupByLibrary.simpleMessage("Ustøttet nettadresse"),
        "update_to_release_version_through_your_fdroid_client": m18,
        "updates": MessageLookupByLibrary.simpleMessage("Oppdateringer"),
        "use_true_black_for_the_dark_mode_theme":
            MessageLookupByLibrary.simpleMessage(
                "Bruk svart drakt for mørkt valg"),
        "user_not_found":
            MessageLookupByLibrary.simpleMessage("Bruker ikke funnet"),
        "username": MessageLookupByLibrary.simpleMessage("Brukernavn"),
        "version": MessageLookupByLibrary.simpleMessage("Versjon"),
        "when_a_new_app_update_is_available":
            MessageLookupByLibrary.simpleMessage(
                "Når en ny appoppdatering er tilgjengelig"),
        "whether_errors_should_be_reported_to_":
            MessageLookupByLibrary.simpleMessage(
                "Om feil skal rapporteres til "),
        "whether_to_hide_tweets_marked_as_sensitive":
            MessageLookupByLibrary.simpleMessage(
                "Hvorvidt tvitringer merket som sensitive skal skjules"),
        "which_tab_is_shown_when_the_app_opens":
            MessageLookupByLibrary.simpleMessage(
                "Hvilken fane som vises når programmet åpnes"),
        "which_tab_is_shown_when_the_subscription_opens":
            MessageLookupByLibrary.simpleMessage(
                "Hvilken fane som vises når abonnement åpnes"),
        "would_you_like_to_enable_automatic_error_reporting":
            MessageLookupByLibrary.simpleMessage(
                "Vil du aktivere automatisk feilrapportering?"),
        "x_api": MessageLookupByLibrary.simpleMessage("X-API"),
        "yes": MessageLookupByLibrary.simpleMessage("Ja"),
        "yes_please": MessageLookupByLibrary.simpleMessage("Ja"),
        "you_have_not_saved_any_tweets_yet":
            MessageLookupByLibrary.simpleMessage(
                "Du har ikke lagret noen tweets ennå!"),
        "you_must_have_at_least_2_home_screen_pages":
            MessageLookupByLibrary.simpleMessage(
                "Du må ha minst to hjemmeskjermssider"),
        "your_profile_must_be_public_otherwise_the_import_will_not_work":
            MessageLookupByLibrary.simpleMessage(
                "Profilen din må være offentlig, ellers vil ikke importen fungere"),
        "your_report_will_be_sent_to_fritter__project":
            MessageLookupByLibrary.simpleMessage(
                "Rapporten din vil bli sendt til Squawker\'s -prosjekt, og personverndetaljer kan finnes på:")
      };
}
