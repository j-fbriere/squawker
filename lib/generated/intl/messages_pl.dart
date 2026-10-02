// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pl locale. All the
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
  String get localeName => 'pl';

  static String m0(name) =>
      "Czy na pewno chcesz usunąć grupę subskrypcji ${name}?";

  static String m1(count) => "";

  static String m2(count) => "";

  static String m3(fileName) => "Dane wyeksportowano do ${fileName}";

  static String m4(fullPath) => "Dane wyeksportowano do ${fullPath}";

  static String m5(timeagoFormat) => "Zakończono ${timeagoFormat}";

  static String m6(timeagoFormat) => "Kończy się za ${timeagoFormat}";

  static String m7(snapshotData) => "Ukończono z ${snapshotData} użytkownikami";

  static String m8(name) => "Grupa: ${name}";

  static String m9(snapshotData) =>
      "Do tej pory zaimportowano ${snapshotData} użytkowników";

  static String m10(date) => "Dołączył(a) ${date}";

  static String m11(nbrGuestAccounts) =>
      "Istnieje ${nbrGuestAccounts} kont gości";

  static String m12(num, numFormatted) =>
      "${Intl.plural(num, zero: 'Brak głosów', one: '1 głos', two: '2 głosy', few: '${numFormatted} głosy', many: '${numFormatted} głosów', other: '${numFormatted} głosów')}";

  static String m13(errorMessage) =>
      "Sprawdź swoje połączenie internetowe.\n\n${errorMessage}";

  static String m14(nbrRegularAccounts) =>
      "Konta zwykłe (${nbrRegularAccounts}):";

  static String m15(count) => "";

  static String m16(releaseVersion) => "Naciśnij, aby pobrać ${releaseVersion}";

  static String m17(getMediaType) => "Naciśnij, aby wyświetlić ${getMediaType}";

  static String m18(filePath) =>
      "Plik nie istnieje. Upewnij się, że znajduje się w ${filePath}";

  static String m19(thisTweetUserName, timeAgo) =>
      "${thisTweetUserName} podał(a) dalej tweeta ${timeAgo}";

  static String m20(num, numFormatted) =>
      "${Intl.plural(num, zero: 'brak tweetów', one: '1 tweet', two: '2 tweety', few: '${numFormatted} tweety', many: '${numFormatted} tweetów', other: '${numFormatted} tweetów')}";

  static String m21(widgetPlaceName) =>
      "Nie można załadować trendów dla ${widgetPlaceName}";

  static String m22(responseStatusCode) =>
      "Nie można zapisać multimediów. Twitter/X zwrócił status ${responseStatusCode}";

  static String m23(releaseVersion) =>
      "Zaktualizuj do ${releaseVersion} przez klienta F-Droid";

  static String m24(seconds) => "";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("O aplikacji"),
    "about_download": MessageLookupByLibrary.simpleMessage(""),
    "about_download_description": MessageLookupByLibrary.simpleMessage(""),
    "account": MessageLookupByLibrary.simpleMessage("Konto"),
    "account_suspended": MessageLookupByLibrary.simpleMessage(
      "Konto zawieszone",
    ),
    "activate_non_confirmation_bias_mode_description":
        MessageLookupByLibrary.simpleMessage(
          "Ukrywaj autorów tweetów. Unikaj efektu potwierdzenia opartego na autorytatywnych argumentach.",
        ),
    "activate_non_confirmation_bias_mode_label":
        MessageLookupByLibrary.simpleMessage(
          "Aktywuj tryb bez efektu potwierdzenia",
        ),
    "add_account": MessageLookupByLibrary.simpleMessage("Dodaj konto"),
    "add_account_title": MessageLookupByLibrary.simpleMessage("Dodaj konto"),
    "add_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Dodaj subskrypcje",
    ),
    "add_to_feed": MessageLookupByLibrary.simpleMessage("Dodaj do kanału"),
    "add_to_group": MessageLookupByLibrary.simpleMessage("Dodaj do grupy"),
    "all": MessageLookupByLibrary.simpleMessage("Wszystkie"),
    "all_the_great_software_used_by_fritter":
        MessageLookupByLibrary.simpleMessage(
          "Całe świetne oprogramowanie używane przez Squawkera",
        ),
    "allow_background_play_description": MessageLookupByLibrary.simpleMessage(
      "Zezwól na odtwarzanie w tle",
    ),
    "allow_background_play_label": MessageLookupByLibrary.simpleMessage(
      "Odtwarzanie w tle",
    ),
    "allow_background_play_other_apps_description":
        MessageLookupByLibrary.simpleMessage(
          "Zezwalaj innym aplikacjom na działanie w tle",
        ),
    "allow_background_play_other_apps_label":
        MessageLookupByLibrary.simpleMessage("Inne aplikacje działające w tle"),
    "an_update_for_fritter_is_available": MessageLookupByLibrary.simpleMessage(
      "Dostępna jest aktualizacja Squawkera! 🚀",
    ),
    "api_key": MessageLookupByLibrary.simpleMessage("Klucz API"),
    "api_server": MessageLookupByLibrary.simpleMessage(""),
    "api_server_address": MessageLookupByLibrary.simpleMessage(""),
    "app_info": MessageLookupByLibrary.simpleMessage("Informacje o aplikacji"),
    "are_you_sure": MessageLookupByLibrary.simpleMessage("Czy na pewno?"),
    "are_you_sure_you_want_to_delete_the_subscription_group_name_of_group": m0,
    "autoplay_videos": MessageLookupByLibrary.simpleMessage(""),
    "autoplay_videos_description": MessageLookupByLibrary.simpleMessage(""),
    "back": MessageLookupByLibrary.simpleMessage("Wstecz"),
    "bad_guest_token": MessageLookupByLibrary.simpleMessage(
      "Twitter/X unieważnił nasz token dostępu. Spróbuj ponownie otworzyć Squawkera!",
    ),
    "batch_add_to_group": MessageLookupByLibrary.simpleMessage(""),
    "batch_remove_from_feed": MessageLookupByLibrary.simpleMessage(""),
    "batch_remove_from_feed_confirm": m1,
    "batch_unsubscribe": MessageLookupByLibrary.simpleMessage(""),
    "batch_unsubscribe_confirm": m2,
    "beta": MessageLookupByLibrary.simpleMessage("BETA"),
    "blue_theme_based_on_the_twitter_color_scheme":
        MessageLookupByLibrary.simpleMessage(
          "Niebieski motyw oparty na kolorystyce Twitter/Xa",
        ),
    "cancel": MessageLookupByLibrary.simpleMessage("Anuluj"),
    "catastrophic_failure": MessageLookupByLibrary.simpleMessage(
      "Katastrofalna awaria",
    ),
    "choose": MessageLookupByLibrary.simpleMessage("Wybierz"),
    "choose_pages": MessageLookupByLibrary.simpleMessage("Wybierz karty"),
    "close": MessageLookupByLibrary.simpleMessage("Zamknij"),
    "community_notes_title": MessageLookupByLibrary.simpleMessage(
      "Czytelnicy dodali kontekst",
    ),
    "confirm": MessageLookupByLibrary.simpleMessage(""),
    "confirm_close_fritter": MessageLookupByLibrary.simpleMessage(
      "Czy na pewno chcesz zamknąć Squawkera?",
    ),
    "contribute": MessageLookupByLibrary.simpleMessage("Wnieś swój wkład"),
    "copied_address_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "Skopiowano adres do schowka",
    ),
    "copied_version_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "Skopiowano wersję do schowka",
    ),
    "could_not_contact_twitter": MessageLookupByLibrary.simpleMessage(
      "Nie udało się połączyć z Twitter/Xem",
    ),
    "could_not_find_any_tweets_by_this_user":
        MessageLookupByLibrary.simpleMessage(
          "Nie udało się znaleźć żadnych tweetów tego użytkownika!",
        ),
    "could_not_find_any_tweets_from_the_last_7_days":
        MessageLookupByLibrary.simpleMessage(
          "Nie udało się znaleźć żadnych tweetów z ostatnich 7 dni!",
        ),
    "country": MessageLookupByLibrary.simpleMessage("Kraj"),
    "dark": MessageLookupByLibrary.simpleMessage("Ciemny"),
    "data": MessageLookupByLibrary.simpleMessage("Dane"),
    "data_exported_to_fileName": m3,
    "data_exported_to_fullPath": m4,
    "data_imported_successfully": MessageLookupByLibrary.simpleMessage(
      "Dane zostały zaimportowane",
    ),
    "date_created": MessageLookupByLibrary.simpleMessage("Data utworzenia"),
    "date_subscribed": MessageLookupByLibrary.simpleMessage("Data subskrypcji"),
    "default_subscription_tab": MessageLookupByLibrary.simpleMessage(
      "Domyślna zakładka subskrypcji",
    ),
    "default_tab": MessageLookupByLibrary.simpleMessage("Domyślna karta"),
    "delete": MessageLookupByLibrary.simpleMessage("Usuń"),
    "deselect_all": MessageLookupByLibrary.simpleMessage(""),
    "disable_screenshots": MessageLookupByLibrary.simpleMessage(
      "Wyłącz zrzuty ekranu",
    ),
    "disable_screenshots_hint": MessageLookupByLibrary.simpleMessage(
      "Zapobiegaj robieniu zrzutów ekranu. Może to nie działać na wszystkich urządzeniach.",
    ),
    "disabled": MessageLookupByLibrary.simpleMessage("Wyłączone"),
    "doesnt_work_without_account": MessageLookupByLibrary.simpleMessage(""),
    "donate": MessageLookupByLibrary.simpleMessage("Przekaż datek"),
    "download": MessageLookupByLibrary.simpleMessage("Pobierz"),
    "download_all_tweets": MessageLookupByLibrary.simpleMessage(""),
    "download_completed": MessageLookupByLibrary.simpleMessage(""),
    "download_failed": MessageLookupByLibrary.simpleMessage(""),
    "download_handling": MessageLookupByLibrary.simpleMessage(
      "Obsługa pobierania",
    ),
    "download_handling_description": MessageLookupByLibrary.simpleMessage(
      "Jak powinno działać pobieranie",
    ),
    "download_handling_type_ask": MessageLookupByLibrary.simpleMessage(
      "Zawsze pytaj",
    ),
    "download_handling_type_directory": MessageLookupByLibrary.simpleMessage(
      "Zapisuj w katalogu",
    ),
    "download_media_no_url": MessageLookupByLibrary.simpleMessage(
      "Nie można pobrać. Te multimedia mogą być dostępne tylko jako strumień, którego Squawker jeszcze nie obsługuje.",
    ),
    "download_mode": MessageLookupByLibrary.simpleMessage(""),
    "download_mode_fast": MessageLookupByLibrary.simpleMessage(""),
    "download_mode_full_scan": MessageLookupByLibrary.simpleMessage(""),
    "download_mode_safe": MessageLookupByLibrary.simpleMessage(""),
    "download_path": MessageLookupByLibrary.simpleMessage("Ścieżka pobierania"),
    "download_settings": MessageLookupByLibrary.simpleMessage(""),
    "download_started": MessageLookupByLibrary.simpleMessage(""),
    "download_this_tweet": MessageLookupByLibrary.simpleMessage(""),
    "download_tweet": MessageLookupByLibrary.simpleMessage(""),
    "download_video_best_quality_description":
        MessageLookupByLibrary.simpleMessage(
          "Pobieraj filmy w najlepszej dostępnej jakości",
        ),
    "download_video_best_quality_label": MessageLookupByLibrary.simpleMessage(
      "Pobieraj filmy w najlepszej jakości",
    ),
    "downloading_media": MessageLookupByLibrary.simpleMessage(
      "Pobieranie multimediów…",
    ),
    "edit_account_title": MessageLookupByLibrary.simpleMessage(
      "Modyfikowanie konta",
    ),
    "email_label": MessageLookupByLibrary.simpleMessage("Email:"),
    "enable_": MessageLookupByLibrary.simpleMessage("Włączyć ?"),
    "ended_timeago_format_endsAt_allowFromNow_true": m5,
    "ends_timeago_format_endsAt_allowFromNow_true": m6,
    "enhanced_feeds_description": MessageLookupByLibrary.simpleMessage(
      "Ulepszone żądania dotyczące kanałów (ale z niższymi limitami szybkości)",
    ),
    "enhanced_feeds_label": MessageLookupByLibrary.simpleMessage(
      "Ulepszone kanały",
    ),
    "enhanced_profile_description": MessageLookupByLibrary.simpleMessage(
      "Ulepszone żądania dotyczące profilu",
    ),
    "enhanced_profile_label": MessageLookupByLibrary.simpleMessage(
      "Ulepszony profil",
    ),
    "enhanced_searches_description": MessageLookupByLibrary.simpleMessage(
      "Ulepszone żądania wyszukiwania (ale z niższymi limitami szybkości)",
    ),
    "enhanced_searches_label": MessageLookupByLibrary.simpleMessage(
      "Ulepszone wyszukiwanie",
    ),
    "enter_comma_separated_twitter_usernames":
        MessageLookupByLibrary.simpleMessage(
          "Wprowadź rozdzielone przecinkami nazwy użytkowników Twittera/X",
        ),
    "enter_your_twitter_username": MessageLookupByLibrary.simpleMessage(
      "Wprowadź swoją nazwę użytkownika Twitter/Xa",
    ),
    "error_from_twitter": MessageLookupByLibrary.simpleMessage(
      "Błąd z Twittera/X",
    ),
    "exclusions_feed_description": MessageLookupByLibrary.simpleMessage(
      "Lista nazw użytkowników do wykluczenia z kanału",
    ),
    "exclusions_feed_label": MessageLookupByLibrary.simpleMessage(
      "Wykluczenia w kanałach",
    ),
    "export": MessageLookupByLibrary.simpleMessage("Eksportuj"),
    "export_guest_accounts": MessageLookupByLibrary.simpleMessage(
      "Wyeksportować konta gościa?",
    ),
    "export_settings": MessageLookupByLibrary.simpleMessage(
      "Wyeksportować ustawienia?",
    ),
    "export_subscription_group_members": MessageLookupByLibrary.simpleMessage(
      "Wyeksportować członków grup subskrypcji?",
    ),
    "export_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "Wyeksportować grupy subskrypcji?",
    ),
    "export_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Wyeksportować subskrypcje?",
    ),
    "export_tweets": MessageLookupByLibrary.simpleMessage(
      "Wyeksportować tweety?",
    ),
    "export_twitter_tokens": MessageLookupByLibrary.simpleMessage(
      "Eksportować tokeny Twitter/X?",
    ),
    "export_your_data": MessageLookupByLibrary.simpleMessage(
      "Wyeksportuj swoje dane",
    ),
    "failed_to_load_video": MessageLookupByLibrary.simpleMessage(""),
    "feed": MessageLookupByLibrary.simpleMessage("Główna"),
    "filters": MessageLookupByLibrary.simpleMessage("Filtry"),
    "finish": MessageLookupByLibrary.simpleMessage("Zakończ"),
    "finished_with_snapshotData_users": m7,
    "followers": MessageLookupByLibrary.simpleMessage("Obserwujący"),
    "following": MessageLookupByLibrary.simpleMessage("Obserwowani"),
    "forbidden": MessageLookupByLibrary.simpleMessage(
      "Twitter/X mówi, że dostęp do tego jest zabroniony",
    ),
    "fritter": MessageLookupByLibrary.simpleMessage("Squawker"),
    "fritter_blue": MessageLookupByLibrary.simpleMessage("Squawker Blue"),
    "functionality_unsupported": MessageLookupByLibrary.simpleMessage(
      "Ta funkcja nie jest już obsługiwana przez Twitter/Xa!",
    ),
    "general": MessageLookupByLibrary.simpleMessage("Ogólne"),
    "generic_username": MessageLookupByLibrary.simpleMessage("Użytkownik"),
    "group_name": m8,
    "groups": MessageLookupByLibrary.simpleMessage("Grupy"),
    "help_make_fritter_even_better": MessageLookupByLibrary.simpleMessage(
      "Pomóż uczynić Squawker jeszcze lepszym",
    ),
    "help_support_fritters_future": MessageLookupByLibrary.simpleMessage(
      "Pomóż wesprzeć przyszłość Squawkera",
    ),
    "hide_sensitive_tweets": MessageLookupByLibrary.simpleMessage(
      "Ukrywaj wrażliwe tweety",
    ),
    "home": MessageLookupByLibrary.simpleMessage("Karty"),
    "if_you_have_any_feedback_on_this_feature_please_leave_it_on":
        MessageLookupByLibrary.simpleMessage(
          "Jeśli masz jakieś uwagi na temat tej funkcji, zgłoś je w",
        ),
    "import": MessageLookupByLibrary.simpleMessage("Importuj"),
    "import_data_from_another_device": MessageLookupByLibrary.simpleMessage(
      "Zaimportuj dane z innego urządzenia",
    ),
    "import_from_twitter": MessageLookupByLibrary.simpleMessage(
      "Importuj z Twitter/Xa",
    ),
    "import_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Importuj subskrypcje",
    ),
    "imported_snapshot_data_users_so_far": m9,
    "include_replies": MessageLookupByLibrary.simpleMessage(
      "Uwzględniaj odpowiedzi",
    ),
    "include_retweets": MessageLookupByLibrary.simpleMessage(
      "Uwzględniaj tweety podane dalej",
    ),
    "invert_selection": MessageLookupByLibrary.simpleMessage(""),
    "joined": m10,
    "keep_feed_offset_description": MessageLookupByLibrary.simpleMessage(
      "Przesunięcie osi czasu jest zachowywane dla kanałów po ponownym uruchomieniu aplikacji",
    ),
    "keep_feed_offset_label": MessageLookupByLibrary.simpleMessage(
      "Zachowaj przesunięcie kanałów",
    ),
    "language": MessageLookupByLibrary.simpleMessage("Język"),
    "language_subtitle": MessageLookupByLibrary.simpleMessage(
      "Wymaga ponownego uruchomienia",
    ),
    "large": MessageLookupByLibrary.simpleMessage("Duże"),
    "leaner_feeds_description": MessageLookupByLibrary.simpleMessage(
      "Linki podglądu nie są wyświetlane w tweetach z kanałów",
    ),
    "leaner_feeds_label": MessageLookupByLibrary.simpleMessage(
      "Odchudzone kanały",
    ),
    "legacy_android_import": MessageLookupByLibrary.simpleMessage(
      "Importowanie ze starszej wersji Androida",
    ),
    "let_the_developers_know_if_something_is_broken":
        MessageLookupByLibrary.simpleMessage(
          "Daj znać programistom, jeśli coś się zepsuło",
        ),
    "libre_translate_host": MessageLookupByLibrary.simpleMessage(
      "Host LibreTranslate",
    ),
    "licenses": MessageLookupByLibrary.simpleMessage("Licencje"),
    "light": MessageLookupByLibrary.simpleMessage("Jasny"),
    "live": MessageLookupByLibrary.simpleMessage("NA ŻYWO"),
    "logging": MessageLookupByLibrary.simpleMessage("Zbieranie danych"),
    "login": MessageLookupByLibrary.simpleMessage(""),
    "loop_videos": MessageLookupByLibrary.simpleMessage(""),
    "loop_videos_description": MessageLookupByLibrary.simpleMessage(""),
    "mandatory_label": MessageLookupByLibrary.simpleMessage(
      "Pola obowiązkowe:",
    ),
    "material_3": MessageLookupByLibrary.simpleMessage("Material 3?"),
    "media": MessageLookupByLibrary.simpleMessage("Multimedia"),
    "media_image_quality": MessageLookupByLibrary.simpleMessage(""),
    "media_size": MessageLookupByLibrary.simpleMessage("Rozmiar multimediów"),
    "media_video_quality": MessageLookupByLibrary.simpleMessage(""),
    "medium": MessageLookupByLibrary.simpleMessage("Średnie"),
    "missing_page": MessageLookupByLibrary.simpleMessage("Brakująca karta"),
    "mute_video_description": MessageLookupByLibrary.simpleMessage(
      "Domyślnie wyciszaj wideo",
    ),
    "mute_videos": MessageLookupByLibrary.simpleMessage("Wyciszaj wideo"),
    "name": MessageLookupByLibrary.simpleMessage("Nazwa"),
    "name_label": MessageLookupByLibrary.simpleMessage("Nazwa:"),
    "nbr_guest_accounts": m11,
    "newTrans": MessageLookupByLibrary.simpleMessage("Nowa"),
    "next": MessageLookupByLibrary.simpleMessage("Dalej"),
    "no": MessageLookupByLibrary.simpleMessage("Nie"),
    "no_data_was_returned_which_should_never_happen_please_report_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "Żadne dane nie zostały zwrócone, co nigdy nie powinno się zdarzyć. Jeśli to możliwe, zgłoś błąd!",
        ),
    "no_results": MessageLookupByLibrary.simpleMessage("Brak wyników"),
    "no_results_for": MessageLookupByLibrary.simpleMessage("Brak wyników dla:"),
    "no_subscriptions_try_searching_or_importing_some":
        MessageLookupByLibrary.simpleMessage(
          "Brak subskrypcji. Spróbuj wyszukać lub zaimportować trochę!",
        ),
    "not_logged_in": MessageLookupByLibrary.simpleMessage(""),
    "not_set": MessageLookupByLibrary.simpleMessage("Nie ustawiono"),
    "note_due_to_a_twitter_limitation_not_all_tweets_may_be_included":
        MessageLookupByLibrary.simpleMessage(
          "Uwaga: Ze względu na ograniczenia Twitter/Xa nie wszystkie tweety mogą zostać uwzględnione",
        ),
    "numberFormat_format_total_votes": m12,
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "only_public_subscriptions_can_be_imported":
        MessageLookupByLibrary.simpleMessage(
          "Subskrypcje mogą być importowane tylko z profili publicznych",
        ),
    "oops_something_went_wrong": MessageLookupByLibrary.simpleMessage(
      "Ups! Coś poszło nie tak 🥲",
    ),
    "open_app_settings": MessageLookupByLibrary.simpleMessage(
      "Otwórz ustawienia aplikacji",
    ),
    "open_in_browser": MessageLookupByLibrary.simpleMessage(
      "Otwórz w przeglądarce",
    ),
    "option_confirm_close_description": MessageLookupByLibrary.simpleMessage(
      "Potwierdź przy zamykaniu aplikacji",
    ),
    "option_confirm_close_label": MessageLookupByLibrary.simpleMessage(
      "Potwierdź zamknięcie",
    ),
    "option_navigation_animations_description":
        MessageLookupByLibrary.simpleMessage("Włącz animacje nawigacji"),
    "option_navigation_animations_label": MessageLookupByLibrary.simpleMessage(
      "Animacje nawigacji",
    ),
    "option_show_navigation_labels_description":
        MessageLookupByLibrary.simpleMessage(
          "Pokaż etykiety pod ikonami na pasku nawigacji",
        ),
    "option_show_navigation_labels_label": MessageLookupByLibrary.simpleMessage(
      "Etykiety paska nawigacji",
    ),
    "optional_label": MessageLookupByLibrary.simpleMessage("Pola opcjonalne:"),
    "page_not_found": MessageLookupByLibrary.simpleMessage(
      "Twitter/X twierdzi, że strona nie istnieje, ale to może nie być prawda",
    ),
    "password_label": MessageLookupByLibrary.simpleMessage("Hasło:"),
    "permission_not_granted": MessageLookupByLibrary.simpleMessage(
      "Nie przyznano uprawnienia. Spróbuj ponownie po przyznaniu!",
    ),
    "phone_label": MessageLookupByLibrary.simpleMessage("Telefon:"),
    "pick_a_color": MessageLookupByLibrary.simpleMessage("Wybierz kolor!"),
    "pick_an_icon": MessageLookupByLibrary.simpleMessage("Wybierz ikonę!"),
    "pinned_tweet": MessageLookupByLibrary.simpleMessage("Przypięty tweet"),
    "playback_speed": MessageLookupByLibrary.simpleMessage(
      "Prędkość odtwarzania",
    ),
    "please_check_your_internet_connection_error_message": m13,
    "please_enter_a_name": MessageLookupByLibrary.simpleMessage(
      "Wprowadź nazwę",
    ),
    "please_make_sure_the_data_you_wish_to_import_is_located_there_then_press_the_import_button_below":
        MessageLookupByLibrary.simpleMessage(
          "Upewnij się, że znajdują się tam dane, które chcesz zaimportować, a następnie naciśnij przycisk importu poniżej.",
        ),
    "please_note_that_the_method_fritter_uses_to_import_subscriptions_is_heavily_rate_limited_by_twitter_so_this_may_fail_if_you_have_a_lot_of_followed_accounts":
        MessageLookupByLibrary.simpleMessage(
          "Pamiętaj, że metoda, której używa Squawker do importowania subskrypcji, jest mocno ograniczona przez Twitter/Xa, więc może się to nie udać, jeśli masz dużo obserwowanych kont.",
        ),
    "possibly_sensitive": MessageLookupByLibrary.simpleMessage(
      "Potencjalnie wrażliwy",
    ),
    "possibly_sensitive_profile": MessageLookupByLibrary.simpleMessage(
      "Ten profil może zawierać potencjalnie wrażliwe obrazy, język lub inne treści. Czy nadal chcesz go wyświetlić?",
    ),
    "possibly_sensitive_tweet": MessageLookupByLibrary.simpleMessage(
      "Ten tweet zawiera potencjalnie wrażliwe treści. Czy chcesz go wyświetlić?",
    ),
    "prefix": MessageLookupByLibrary.simpleMessage("prefiks"),
    "private_profile": MessageLookupByLibrary.simpleMessage("Profil prywatny"),
    "proxy_description": MessageLookupByLibrary.simpleMessage(
      "Używanie serwera proxy dla każdego zapytania",
    ),
    "proxy_error": MessageLookupByLibrary.simpleMessage("Błąd serwera proxy"),
    "proxy_label": MessageLookupByLibrary.simpleMessage("Serwer proxy"),
    "quality": MessageLookupByLibrary.simpleMessage(""),
    "regular_accounts": m14,
    "released_under_the_mit_license": MessageLookupByLibrary.simpleMessage(
      "Wydany na licencji MIT",
    ),
    "remove_from_feed": MessageLookupByLibrary.simpleMessage("Usuń z kanału"),
    "replying_to": MessageLookupByLibrary.simpleMessage("W odpowiedzi do"),
    "report": MessageLookupByLibrary.simpleMessage("Zgłoś"),
    "report_a_bug": MessageLookupByLibrary.simpleMessage("Zgłoś błąd"),
    "reporting_an_error": MessageLookupByLibrary.simpleMessage(
      "Zgłaszanie błędu",
    ),
    "reset_home_pages": MessageLookupByLibrary.simpleMessage(
      "Przywróć domyślne",
    ),
    "restart_video_player": MessageLookupByLibrary.simpleMessage(""),
    "retry": MessageLookupByLibrary.simpleMessage("Ponów"),
    "save": MessageLookupByLibrary.simpleMessage("Zapisz"),
    "save_bandwidth_using_smaller_images": MessageLookupByLibrary.simpleMessage(
      "Oszczędzaj transfer dzięki mniejszym obrazom",
    ),
    "save_bandwidth_using_smaller_videos": MessageLookupByLibrary.simpleMessage(
      "",
    ),
    "saved": MessageLookupByLibrary.simpleMessage("Zapisane"),
    "saved_tweet_too_large": MessageLookupByLibrary.simpleMessage(
      "Ten zapisany tweet nie mógł zostać wyświetlony, ponieważ jest zbyt duży, aby go załadować. Zgłoś to programistom.",
    ),
    "search": MessageLookupByLibrary.simpleMessage("Szukaj"),
    "search_term": MessageLookupByLibrary.simpleMessage("Fraza wyszukiwania"),
    "select": MessageLookupByLibrary.simpleMessage("Wybierz"),
    "select_all": MessageLookupByLibrary.simpleMessage(""),
    "select_groups": MessageLookupByLibrary.simpleMessage(""),
    "selected_count": m15,
    "selecting_individual_accounts_to_import_and_assigning_groups_are_both_planned_for_the_future_already":
        MessageLookupByLibrary.simpleMessage(
          "Wybieranie poszczególnych kont do zaimportowania i przypisywanie grup są już zaplanowane na przyszłość!",
        ),
    "send": MessageLookupByLibrary.simpleMessage("Wyślij"),
    "settings": MessageLookupByLibrary.simpleMessage("Ustawienia"),
    "settings_saved": MessageLookupByLibrary.simpleMessage(""),
    "share_base_url": MessageLookupByLibrary.simpleMessage(
      "Niestandardowy URL udostępniania",
    ),
    "share_base_url_description": MessageLookupByLibrary.simpleMessage(
      "Używaj niestandardowej podstawy adresu URL podczas udostępniania",
    ),
    "share_tweet_as_image": MessageLookupByLibrary.simpleMessage(
      "Udostępnij wpis jako obraz",
    ),
    "share_tweet_content": MessageLookupByLibrary.simpleMessage(
      "Udostępnij treść tweeta",
    ),
    "share_tweet_content_and_link": MessageLookupByLibrary.simpleMessage(
      "Udostępnij treść tweeta i link",
    ),
    "share_tweet_link": MessageLookupByLibrary.simpleMessage(
      "Udostępnij link do tweeta",
    ),
    "should_check_for_updates_description":
        MessageLookupByLibrary.simpleMessage(
          "Sprawdzaj aktualizacje po uruchomieniu Squawkera",
        ),
    "should_check_for_updates_label": MessageLookupByLibrary.simpleMessage(
      "Sprawdzaj aktualizacje",
    ),
    "small": MessageLookupByLibrary.simpleMessage("Małe"),
    "something_broke_in_fritter": MessageLookupByLibrary.simpleMessage(
      "Coś się popsuło we Squawkerze.",
    ),
    "something_just_went_wrong_in_fritter_and_an_error_report_has_been_generated":
        MessageLookupByLibrary.simpleMessage(
          "Coś poszło nie tak we Squawkerze, dlatego został wygenerowany raport o błędzie. Raport można wysłać do programistów Squawkera, aby pomóc w rozwiązaniu problemu.",
        ),
    "sorry_the_replied_tweet_could_not_be_found":
        MessageLookupByLibrary.simpleMessage(
          "Przepraszamy, nie znaleziono tweeta z odpowiedzią!",
        ),
    "subscribe": MessageLookupByLibrary.simpleMessage("Subskrybuj"),
    "subscriptions": MessageLookupByLibrary.simpleMessage("Subskrypcje"),
    "subtitles": MessageLookupByLibrary.simpleMessage("Napisy"),
    "successfully_saved_the_media": MessageLookupByLibrary.simpleMessage(
      "Zapisano multimedia!",
    ),
    "system": MessageLookupByLibrary.simpleMessage("Systemowy"),
    "tap_to_download_release_version": m16,
    "tap_to_show_getMediaType_item_type": m17,
    "thanks_for_helping_fritter": MessageLookupByLibrary.simpleMessage(
      "Dzięki za pomoc Squawkerowi! 💖",
    ),
    "the_file_does_not_exist_please_ensure_it_is_located_at_file_path": m18,
    "the_github_issue": MessageLookupByLibrary.simpleMessage(
      "zgłoszeniu (#143) na GitHubie",
    ),
    "the_tweet_did_not_contain_any_text_this_is_unexpected":
        MessageLookupByLibrary.simpleMessage(
          "Tweet nie zawierał żadnego tekstu. Jest to nieoczekiwane",
        ),
    "theme": MessageLookupByLibrary.simpleMessage("Motyw"),
    "theme_mode": MessageLookupByLibrary.simpleMessage("Tryb motywu"),
    "there_were_no_trends_returned_this_is_unexpected_please_report_as_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "Nie zwrócono żadnych trendów. To nieoczekiwane! Jeśli to możliwe, zgłoś błąd.",
        ),
    "this_group_contains_no_subscriptions":
        MessageLookupByLibrary.simpleMessage(
          "Ta grupa nie zawiera subskrypcji!",
        ),
    "this_took_too_long_to_load_please_check_your_network_connection":
        MessageLookupByLibrary.simpleMessage(
          "Ładowanie trwało zbyt długo. Sprawdź swoje połączenie sieciowe!",
        ),
    "this_tweet_is_unavailable": MessageLookupByLibrary.simpleMessage(
      "Ten tweet jest niedostępny. Prawdopodobnie został usunięty.",
    ),
    "this_tweet_user_name_retweeted": m19,
    "this_user_does_not_follow_anyone": MessageLookupByLibrary.simpleMessage(
      "Ten użytkownik nikogo nie obserwuje!",
    ),
    "this_user_does_not_have_anyone_following_them":
        MessageLookupByLibrary.simpleMessage(
          "Ten użytkownik nie jest obserwowany przez nikogo!",
        ),
    "thread": MessageLookupByLibrary.simpleMessage("Wątek"),
    "thumbnail": MessageLookupByLibrary.simpleMessage("Miniatury"),
    "thumbnail_not_available": MessageLookupByLibrary.simpleMessage(
      "Miniatura niedostępna",
    ),
    "timed_out": MessageLookupByLibrary.simpleMessage(
      "Przekroczono limit czasu",
    ),
    "to_import_specific_subscriptions_enter_your_comma_separated_usernames_below":
        MessageLookupByLibrary.simpleMessage(
          "Aby zaimportować określone subskrypcje, wprowadź poniżej nazwy użytkownika rozdzielone przecinkami.",
        ),
    "to_import_subscriptions_from_an_existing_twitter_account_enter_your_username_below":
        MessageLookupByLibrary.simpleMessage(
          "Aby zaimportować subskrypcje z istniejącego konta na Twitter/Xze, wprowadź poniżej swoją nazwę użytkownika.",
        ),
    "toggle_all": MessageLookupByLibrary.simpleMessage("Przełącz"),
    "translator_label": MessageLookupByLibrary.simpleMessage("Tłumacz"),
    "translators_description": MessageLookupByLibrary.simpleMessage(
      "Użyj niestandardowych instancji LibreTranslate",
    ),
    "translators_label": MessageLookupByLibrary.simpleMessage("Tłumacze"),
    "trending": MessageLookupByLibrary.simpleMessage("Trendy"),
    "trends": MessageLookupByLibrary.simpleMessage("Trendy"),
    "true_black": MessageLookupByLibrary.simpleMessage("Prawdziwa czerń?"),
    "tweet_font_size_description": MessageLookupByLibrary.simpleMessage(
      "Rozmiar czcionki tweetów",
    ),
    "tweet_font_size_label": MessageLookupByLibrary.simpleMessage(
      "Rozmiar czcionki",
    ),
    "tweets": MessageLookupByLibrary.simpleMessage("Tweety"),
    "tweets_and_replies": MessageLookupByLibrary.simpleMessage(
      "Tweety i odpowiedzi",
    ),
    "tweets_number": m20,
    "twitter_account_types_both": MessageLookupByLibrary.simpleMessage(
      "Gość i stały",
    ),
    "twitter_account_types_description": MessageLookupByLibrary.simpleMessage(
      "Typ konta, którego chcesz użyć",
    ),
    "twitter_account_types_label": MessageLookupByLibrary.simpleMessage(
      "Typ konta",
    ),
    "twitter_account_types_only_regular": MessageLookupByLibrary.simpleMessage(
      "Tylko regularne",
    ),
    "twitter_account_types_priority_to_regular":
        MessageLookupByLibrary.simpleMessage("Priorytetyzuj regularnie"),
    "two_home_pages_required": MessageLookupByLibrary.simpleMessage(
      "Musisz mieć co najmniej 2 karty.",
    ),
    "unable_to_find_the_available_trend_locations":
        MessageLookupByLibrary.simpleMessage(
          "Nie można znaleźć dostępnych lokalizacji trendów.",
        ),
    "unable_to_find_your_saved_tweets": MessageLookupByLibrary.simpleMessage(
      "Nie można znaleźć Twoich zapisanych tweetów.",
    ),
    "unable_to_import": MessageLookupByLibrary.simpleMessage(
      "Nie można zaimportować",
    ),
    "unable_to_load_home_pages": MessageLookupByLibrary.simpleMessage(
      "Nie można załadować Twoich kart",
    ),
    "unable_to_load_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "Nie można załadować grup subskrypcji",
    ),
    "unable_to_load_the_group": MessageLookupByLibrary.simpleMessage(
      "Nie można załadować grupy",
    ),
    "unable_to_load_the_group_settings": MessageLookupByLibrary.simpleMessage(
      "Nie można załadować ustawień grupy",
    ),
    "unable_to_load_the_list_of_follows": MessageLookupByLibrary.simpleMessage(
      "Nie można załadować listy obserwowanych",
    ),
    "unable_to_load_the_next_page_of_follows":
        MessageLookupByLibrary.simpleMessage(
          "Nie można załadować następnej strony z obserwowanymi",
        ),
    "unable_to_load_the_next_page_of_replies":
        MessageLookupByLibrary.simpleMessage(
          "Nie można załadować następnej strony z odpowiedziami",
        ),
    "unable_to_load_the_next_page_of_tweets":
        MessageLookupByLibrary.simpleMessage(
          "Nie można załadować następnej strony z tweetami",
        ),
    "unable_to_load_the_profile": MessageLookupByLibrary.simpleMessage(
      "Nie można załadować profilu",
    ),
    "unable_to_load_the_search_results": MessageLookupByLibrary.simpleMessage(
      "Nie można załadować wyników wyszukiwania.",
    ),
    "unable_to_load_the_trends_for_widget_place_name": m21,
    "unable_to_load_the_tweet": MessageLookupByLibrary.simpleMessage(
      "Nie można załadować tweeta",
    ),
    "unable_to_load_the_tweets": MessageLookupByLibrary.simpleMessage(
      "Nie można załadować tweetów",
    ),
    "unable_to_load_the_tweets_for_the_feed":
        MessageLookupByLibrary.simpleMessage(
          "Nie można załadować tweetów na stronę główną",
        ),
    "unable_to_refresh_the_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Nie można odświeżyć subskrypcji",
    ),
    "unable_to_run_the_database_migrations":
        MessageLookupByLibrary.simpleMessage(
          "Nie można uruchomić migracji bazy danych",
        ),
    "unable_to_save_the_media_twitter_returned_a_status_of_response_statusCode":
        m22,
    "unable_to_stream_the_trend_location_preference":
        MessageLookupByLibrary.simpleMessage(
          "Nie można przesłać strumieniowo preferencji lokalizacji trendu",
        ),
    "unknown": MessageLookupByLibrary.simpleMessage("Nieznane"),
    "unsave": MessageLookupByLibrary.simpleMessage("Usuń z zapisanych"),
    "unsubscribe": MessageLookupByLibrary.simpleMessage("Odsubskrybuj"),
    "unsupported_url": MessageLookupByLibrary.simpleMessage(
      "Nieobsługiwany adres URL",
    ),
    "update_to_release_version_through_your_fdroid_client": m23,
    "updates": MessageLookupByLibrary.simpleMessage("Aktualizacje"),
    "use_true_black_for_the_dark_mode_theme":
        MessageLookupByLibrary.simpleMessage(
          "Używaj prawdziwej czerni dla ciemnego motywu",
        ),
    "user_not_found": MessageLookupByLibrary.simpleMessage(
      "Nie znaleziono użytkownika",
    ),
    "username": MessageLookupByLibrary.simpleMessage("Nazwa użytkownika"),
    "username_exclude": MessageLookupByLibrary.simpleMessage(
      "Nazwa użytkownika do wykluczenia",
    ),
    "username_label": MessageLookupByLibrary.simpleMessage(
      "Nazwa użytkownika:",
    ),
    "usernames": MessageLookupByLibrary.simpleMessage("Nazwy użytkowników"),
    "version": MessageLookupByLibrary.simpleMessage("Wersja"),
    "video_prefetch": MessageLookupByLibrary.simpleMessage(""),
    "video_prefetch_description": MessageLookupByLibrary.simpleMessage(""),
    "video_prefetch_seconds": m24,
    "video_prefetch_unlimited": MessageLookupByLibrary.simpleMessage(""),
    "warning_regular_account_unauthenticated_access_description":
        MessageLookupByLibrary.simpleMessage(
          "Twitter/X wyłączył możliwość tworzenia kont gości. Powinieneś teraz ustawić zwykłe konto w Ustawienia / Konto. Bez konta dostęp częściowy jest ograniczony wyłącznie do tweetów i profili. Utworzenie anonimowego zwykłego konta jest łatwe, jak wyjaśniono tutaj:",
        ),
    "warning_regular_account_unauthenticated_access_title":
        MessageLookupByLibrary.simpleMessage(
          "Zwykłe konta i nieuwierzytelniony dostęp",
        ),
    "when_a_new_app_update_is_available": MessageLookupByLibrary.simpleMessage(
      "Gdy dostępna jest nowa aktualizacja aplikacji",
    ),
    "whether_errors_should_be_reported_to_":
        MessageLookupByLibrary.simpleMessage("Zgłaszaj błędy do "),
    "whether_to_hide_tweets_marked_as_sensitive":
        MessageLookupByLibrary.simpleMessage(
          "Ukrywaj tweety oznaczone jako wrażliwe",
        ),
    "which_tab_is_shown_when_the_app_opens":
        MessageLookupByLibrary.simpleMessage(
          "Karta wyświetlana po otwarciu aplikacji",
        ),
    "which_tab_is_shown_when_the_subscription_opens":
        MessageLookupByLibrary.simpleMessage(
          "Która karta jest wyświetlana po otwarciu subskrypcji",
        ),
    "would_you_like_to_enable_automatic_error_reporting":
        MessageLookupByLibrary.simpleMessage(
          "Czy chcesz włączyć automatyczne raportowanie błędów?",
        ),
    "x_api": MessageLookupByLibrary.simpleMessage("API X"),
    "x_client_transaction_id_provider": MessageLookupByLibrary.simpleMessage(
      "",
    ),
    "x_client_transaction_id_provider_description":
        MessageLookupByLibrary.simpleMessage(""),
    "yes": MessageLookupByLibrary.simpleMessage("Tak"),
    "yes_please": MessageLookupByLibrary.simpleMessage("Tak, proszę"),
    "you_have_not_saved_any_tweets_yet": MessageLookupByLibrary.simpleMessage(
      "Nie zapisałeś(-aś) jeszcze żadnych tweetów!",
    ),
    "you_must_have_at_least_2_home_screen_pages":
        MessageLookupByLibrary.simpleMessage(
          "Musisz mieć co najmniej dwie karty",
        ),
    "your_profile_must_be_public_otherwise_the_import_will_not_work":
        MessageLookupByLibrary.simpleMessage(
          "Profil musi być publiczny, inaczej import nie zadziała",
        ),
    "your_report_will_be_sent_to_fritter__project":
        MessageLookupByLibrary.simpleMessage(
          "Twoje zgłoszenie zostanie wysłane do projektu Squawker na , a szczegóły dotyczące prywatności można znaleźć na:",
        ),
  };
}
