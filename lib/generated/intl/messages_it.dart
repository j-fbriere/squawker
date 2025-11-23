// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a it locale. All the
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
  String get localeName => 'it';

  static String m0(name) =>
      "Sei sicuro/a di voler eliminare il gruppo di iscrizioni ${name}?";

  static String m1(fileName) => "Dati esportati in ${fileName}";

  static String m2(fullPath) => "Dati esportati in ${fullPath}";

  static String m3(timeagoFormat) => "Finito ${timeagoFormat}";

  static String m4(timeagoFormat) => "Finisce ${timeagoFormat}";

  static String m5(snapshotData) => "Finito con ${snapshotData} utenti";

  static String m6(name) => "Gruppo: ${name}";

  static String m7(snapshotData) => "${snapshotData} utenti importati finora";

  static String m8(date) => "Iscrizione: ${date}";

  static String m10(num, numFormatted) =>
      "${Intl.plural(num, zero: 'Nessun voto', one: 'Un voto', two: 'Due voti', few: '${numFormatted} voti', many: '${numFormatted} voto', other: '${numFormatted} voti')}";

  static String m11(errorMessage) =>
      "Controlla la tua connessione a Internet.\n\n${errorMessage}";

  static String m13(releaseVersion) => "Tocca per scaricare ${releaseVersion}";

  static String m14(getMediaType) => "Tocca per mostrare ${getMediaType}";

  static String m15(filePath) =>
      "Il file non esiste. Assicurati che si trovi in ${filePath}";

  static String m16(thisTweetUserName, timeAgo) =>
      "${thisTweetUserName} ha ritwittato ${timeAgo}";

  static String m17(num, numFormatted) =>
      "${Intl.plural(num, zero: 'nessun tweet', one: 'un tweet', two: 'due tweet', few: '${numFormatted} tweet', many: '${numFormatted} tweet', other: '${numFormatted} tweet')}";

  static String m18(widgetPlaceName) =>
      "Impossibile caricare le tendenze per ${widgetPlaceName}";

  static String m19(responseStatusCode) =>
      "Impossibile salvare il contenuto. Twitter/X ha restituito uno stato di ${responseStatusCode}";

  static String m20(releaseVersion) =>
      "Aggiorna a ${releaseVersion} tramite il tuo client F-Droid";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("Info"),
    "account_suspended": MessageLookupByLibrary.simpleMessage(
      "Profilo sospeso",
    ),
    "activate_non_confirmation_bias_mode_description":
        MessageLookupByLibrary.simpleMessage(
          "Nascondi gli autori dei tweet. Evita il bias di conferma causato dall\'appello all\'autorità.",
        ),
    "activate_non_confirmation_bias_mode_label":
        MessageLookupByLibrary.simpleMessage("Modalità anti-bias di conferma"),
    "add_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Aggiungi abbonamenti",
    ),
    "add_to_group": MessageLookupByLibrary.simpleMessage("Aggiungi al gruppo"),
    "all": MessageLookupByLibrary.simpleMessage("Tutti"),
    "all_the_great_software_used_by_fritter":
        MessageLookupByLibrary.simpleMessage(
          "Tutto l\'ottimo software utilizzato da Squawker",
        ),
    "an_update_for_fritter_is_available": MessageLookupByLibrary.simpleMessage(
      "È disponibile un aggiornamento di Squawker! 🚀",
    ),
    "are_you_sure": MessageLookupByLibrary.simpleMessage("Sei sicuro?"),
    "are_you_sure_you_want_to_delete_the_subscription_group_name_of_group": m0,
    "back": MessageLookupByLibrary.simpleMessage("Indietro"),
    "bad_guest_token": MessageLookupByLibrary.simpleMessage(
      "Twitter/X ha invalidato il nostro token di accesso. Prova a riaprire Squawker!",
    ),
    "blue_theme_based_on_the_twitter_color_scheme":
        MessageLookupByLibrary.simpleMessage(
          "Tema blu basato sui colori di Twitter/X",
        ),
    "cancel": MessageLookupByLibrary.simpleMessage("Annulla"),
    "catastrophic_failure": MessageLookupByLibrary.simpleMessage(
      "Fallimento catastrofico",
    ),
    "choose": MessageLookupByLibrary.simpleMessage("Scegli"),
    "choose_pages": MessageLookupByLibrary.simpleMessage("Scegli le pagine"),
    "close": MessageLookupByLibrary.simpleMessage("Chiudi"),
    "confirm_close_fritter": MessageLookupByLibrary.simpleMessage(
      "Sei sicuro di voler chiudere Squawker?",
    ),
    "contribute": MessageLookupByLibrary.simpleMessage("Contribuisci"),
    "copied_address_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "Indirizzo copiato negli appunti",
    ),
    "copied_version_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "Versione copiata negli appunti",
    ),
    "could_not_contact_twitter": MessageLookupByLibrary.simpleMessage(
      "Impossibile contattare Twitter/X",
    ),
    "could_not_find_any_tweets_by_this_user":
        MessageLookupByLibrary.simpleMessage(
          "Non è stato trovato nessun tweet di questo utente!",
        ),
    "could_not_find_any_tweets_from_the_last_7_days":
        MessageLookupByLibrary.simpleMessage(
          "Impossibile trovare tweet negli ultimi 7 giorni!",
        ),
    "country": MessageLookupByLibrary.simpleMessage("Nazione"),
    "dark": MessageLookupByLibrary.simpleMessage("Scuro"),
    "data": MessageLookupByLibrary.simpleMessage("Dati"),
    "data_exported_to_fileName": m1,
    "data_exported_to_fullPath": m2,
    "data_imported_successfully": MessageLookupByLibrary.simpleMessage(
      "Dati importati con successo",
    ),
    "date_created": MessageLookupByLibrary.simpleMessage("Data di creazione"),
    "date_subscribed": MessageLookupByLibrary.simpleMessage(
      "Data di iscrizione",
    ),
    "default_tab": MessageLookupByLibrary.simpleMessage("Scheda predefinita"),
    "delete": MessageLookupByLibrary.simpleMessage("Elimina"),
    "disable_screenshots": MessageLookupByLibrary.simpleMessage(
      "Disattiva screenshot",
    ),
    "disable_screenshots_hint": MessageLookupByLibrary.simpleMessage(
      "Impedisce di poter acquisire screenshot. Potrebbe non funzionare su tutti i dispositivi.",
    ),
    "disabled": MessageLookupByLibrary.simpleMessage("Disabilitato"),
    "donate": MessageLookupByLibrary.simpleMessage("Dona"),
    "download": MessageLookupByLibrary.simpleMessage("Scarica"),
    "download_handling": MessageLookupByLibrary.simpleMessage(
      "Gestione degli scaricamenti",
    ),
    "download_handling_description": MessageLookupByLibrary.simpleMessage(
      "Come dovrebbe funzionare lo scaricamento",
    ),
    "download_handling_type_ask": MessageLookupByLibrary.simpleMessage(
      "Chiedi sempre",
    ),
    "download_handling_type_directory": MessageLookupByLibrary.simpleMessage(
      "Salva nella cartella",
    ),
    "download_media_no_url": MessageLookupByLibrary.simpleMessage(
      "Impossibile effettuare il download. Questo contenuto potrebbe essere disponibile soltanto come stream, che Squawker non è ancora in grado di scaricare.",
    ),
    "download_path": MessageLookupByLibrary.simpleMessage(
      "Percorso di download",
    ),
    "downloading_media": MessageLookupByLibrary.simpleMessage(
      "Download del contenuto in corso...",
    ),
    "enable_": MessageLookupByLibrary.simpleMessage("Abilitare ?"),
    "ended_timeago_format_endsAt_allowFromNow_true": m3,
    "ends_timeago_format_endsAt_allowFromNow_true": m4,
    "enter_your_twitter_username": MessageLookupByLibrary.simpleMessage(
      "Inserisci il tuo nome utente di Twitter/X",
    ),
    "export": MessageLookupByLibrary.simpleMessage("Esporta"),
    "export_settings": MessageLookupByLibrary.simpleMessage(
      "Esportare le impostazioni?",
    ),
    "export_subscription_group_members": MessageLookupByLibrary.simpleMessage(
      "Esportare i membri dei gruppi di iscrizioni?",
    ),
    "export_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "Esportare i gruppi di iscrizioni?",
    ),
    "export_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Esportare le iscrizioni?",
    ),
    "export_tweets": MessageLookupByLibrary.simpleMessage("Esportare i tweet?"),
    "export_your_data": MessageLookupByLibrary.simpleMessage(
      "Esporta i tuoi dati",
    ),
    "feed": MessageLookupByLibrary.simpleMessage("Feed"),
    "filters": MessageLookupByLibrary.simpleMessage("Filtri"),
    "finish": MessageLookupByLibrary.simpleMessage("Fine"),
    "finished_with_snapshotData_users": m5,
    "followers": MessageLookupByLibrary.simpleMessage("Seguaci"),
    "following": MessageLookupByLibrary.simpleMessage("Seguiti"),
    "forbidden": MessageLookupByLibrary.simpleMessage(
      "Twitter/X dice che l\'accesso non è consentito",
    ),
    "fritter": MessageLookupByLibrary.simpleMessage("Squawker"),
    "fritter_blue": MessageLookupByLibrary.simpleMessage("Blu Squawker"),
    "functionality_unsupported": MessageLookupByLibrary.simpleMessage(
      "Questa funzionalità non è più supportata da Twitter/X!",
    ),
    "general": MessageLookupByLibrary.simpleMessage("Generale"),
    "group_name": m6,
    "groups": MessageLookupByLibrary.simpleMessage("Gruppi"),
    "help_make_fritter_even_better": MessageLookupByLibrary.simpleMessage(
      "Aiuta a rendere Squawker migliore",
    ),
    "help_support_fritters_future": MessageLookupByLibrary.simpleMessage(
      "Aiuta a supportare il futuro di Squawker",
    ),
    "hide_sensitive_tweets": MessageLookupByLibrary.simpleMessage(
      "Nascondi tweet sensibili",
    ),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "if_you_have_any_feedback_on_this_feature_please_leave_it_on":
        MessageLookupByLibrary.simpleMessage(
          "Se hai qualche feedback su questa funzione, lascialo nella",
        ),
    "import": MessageLookupByLibrary.simpleMessage("Importa"),
    "import_data_from_another_device": MessageLookupByLibrary.simpleMessage(
      "Importa dati da un altro dispositivo",
    ),
    "import_from_twitter": MessageLookupByLibrary.simpleMessage(
      "Importa da Twitter/X",
    ),
    "import_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Importa iscrizioni",
    ),
    "imported_snapshot_data_users_so_far": m7,
    "include_replies": MessageLookupByLibrary.simpleMessage("Includi risposte"),
    "include_retweets": MessageLookupByLibrary.simpleMessage("Includi retweet"),
    "joined": m8,
    "language": MessageLookupByLibrary.simpleMessage("Lingua"),
    "language_subtitle": MessageLookupByLibrary.simpleMessage(
      "Richiede un riavvio",
    ),
    "large": MessageLookupByLibrary.simpleMessage("Grande"),
    "legacy_android_import": MessageLookupByLibrary.simpleMessage(
      "Importa Android Legacy",
    ),
    "let_the_developers_know_if_something_is_broken":
        MessageLookupByLibrary.simpleMessage(
          "Fai sapere agli sviluppatori se qualcosa non funziona",
        ),
    "licenses": MessageLookupByLibrary.simpleMessage("Licenze"),
    "light": MessageLookupByLibrary.simpleMessage("Chiaro"),
    "live": MessageLookupByLibrary.simpleMessage("LIVE"),
    "logging": MessageLookupByLibrary.simpleMessage("Registro"),
    "media": MessageLookupByLibrary.simpleMessage("Contenuti"),
    "media_size": MessageLookupByLibrary.simpleMessage(
      "Dimensione dei contenuti multimediali",
    ),
    "medium": MessageLookupByLibrary.simpleMessage("Medio"),
    "missing_page": MessageLookupByLibrary.simpleMessage("Pagina mancante"),
    "mute_video_description": MessageLookupByLibrary.simpleMessage(
      "Se i video dovrebbero essere silenziati per impostazione predefinita",
    ),
    "mute_videos": MessageLookupByLibrary.simpleMessage("Silenzia i video"),
    "name": MessageLookupByLibrary.simpleMessage("Nome"),
    "newTrans": MessageLookupByLibrary.simpleMessage("Nuovo"),
    "next": MessageLookupByLibrary.simpleMessage("Avanti"),
    "no": MessageLookupByLibrary.simpleMessage("No"),
    "no_data_was_returned_which_should_never_happen_please_report_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "Nessun dato è stato restituito, il che non dovrebbe mai accadere. Si prega di segnalare un errore, se possibile!",
        ),
    "no_results": MessageLookupByLibrary.simpleMessage("Nessun risultato"),
    "no_results_for": MessageLookupByLibrary.simpleMessage(
      "Nessun risultato per:",
    ),
    "no_subscriptions_try_searching_or_importing_some":
        MessageLookupByLibrary.simpleMessage(
          "Nessuna iscrizione. Prova a cercare o importane alcuni!",
        ),
    "not_set": MessageLookupByLibrary.simpleMessage("Non impostato"),
    "note_due_to_a_twitter_limitation_not_all_tweets_may_be_included":
        MessageLookupByLibrary.simpleMessage(
          "Nota: a causa di una limitazione di Twitter/X, non tutti i tweet potrebbero essere inclusi",
        ),
    "numberFormat_format_total_votes": m10,
    "ok": MessageLookupByLibrary.simpleMessage("Ok"),
    "only_public_subscriptions_can_be_imported":
        MessageLookupByLibrary.simpleMessage(
          "Le iscrizioni possono essere importate soltanto da profili pubblici",
        ),
    "oops_something_went_wrong": MessageLookupByLibrary.simpleMessage(
      "Ops! Qualcosa è andato storto 🥲",
    ),
    "open_app_settings": MessageLookupByLibrary.simpleMessage(
      "Apri le impostazioni dell\'app",
    ),
    "page_not_found": MessageLookupByLibrary.simpleMessage(
      "Twitter/X dice che la pagina non esiste, ma potrebbe non essere vero",
    ),
    "permission_not_granted": MessageLookupByLibrary.simpleMessage(
      "Permesso non concesso. Si prega di riprovare dopo la concessione!",
    ),
    "pick_a_color": MessageLookupByLibrary.simpleMessage("Scegli un colore!"),
    "pick_an_icon": MessageLookupByLibrary.simpleMessage("Scegli un\'icona!"),
    "pinned_tweet": MessageLookupByLibrary.simpleMessage("Tweet fissato"),
    "playback_speed": MessageLookupByLibrary.simpleMessage(
      "Velocità di riproduzione",
    ),
    "please_check_your_internet_connection_error_message": m11,
    "please_enter_a_name": MessageLookupByLibrary.simpleMessage(
      "Inserisci un nome",
    ),
    "please_make_sure_the_data_you_wish_to_import_is_located_there_then_press_the_import_button_below":
        MessageLookupByLibrary.simpleMessage(
          "Assicurati che i dati che vuoi importare si trovino lì, poi premi il pulsante di importazione qui sotto.",
        ),
    "please_note_that_the_method_fritter_uses_to_import_subscriptions_is_heavily_rate_limited_by_twitter_so_this_may_fail_if_you_have_a_lot_of_followed_accounts":
        MessageLookupByLibrary.simpleMessage(
          "Si ricorda che il metodo che Squawker usa per importare le iscrizioni è fortemente limitato da Twitter/X, quindi potrebbe fallire se segui molti account.",
        ),
    "possibly_sensitive": MessageLookupByLibrary.simpleMessage(
      "Potenzialmente sensibile",
    ),
    "possibly_sensitive_profile": MessageLookupByLibrary.simpleMessage(
      "Questo profilo può includere immagini, linguaggio o altri contenuti potenzialmente sensibili. Desideri comunque vederlo?",
    ),
    "possibly_sensitive_tweet": MessageLookupByLibrary.simpleMessage(
      "Questo tweet contiene contenuti potenzialmente sensibili. Desideri visualizzarlo?",
    ),
    "prefix": MessageLookupByLibrary.simpleMessage("prefisso"),
    "private_profile": MessageLookupByLibrary.simpleMessage("Profilo privato"),
    "released_under_the_mit_license": MessageLookupByLibrary.simpleMessage(
      "Rilasciato sotto licenza MIT",
    ),
    "replying_to": MessageLookupByLibrary.simpleMessage("In risposta a"),
    "report": MessageLookupByLibrary.simpleMessage("Segnala"),
    "report_a_bug": MessageLookupByLibrary.simpleMessage("Segnala un errore"),
    "reporting_an_error": MessageLookupByLibrary.simpleMessage(
      "Segnalazione di un errore",
    ),
    "reset_home_pages": MessageLookupByLibrary.simpleMessage(
      "Reimposta pagine predefinite",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Riprova"),
    "save": MessageLookupByLibrary.simpleMessage("Salva"),
    "save_bandwidth_using_smaller_images": MessageLookupByLibrary.simpleMessage(
      "Risparmia banda usando immagini più piccole",
    ),
    "saved": MessageLookupByLibrary.simpleMessage("Salvati"),
    "saved_tweet_too_large": MessageLookupByLibrary.simpleMessage(
      "Non è stato possibile visualizzare questo tweet salvato, poiché è troppo grande per essere caricato. Si prega di segnalarlo agli sviluppatori.",
    ),
    "search": MessageLookupByLibrary.simpleMessage("Ricerca"),
    "search_term": MessageLookupByLibrary.simpleMessage("Ricerca"),
    "select": MessageLookupByLibrary.simpleMessage("Seleziona"),
    "selecting_individual_accounts_to_import_and_assigning_groups_are_both_planned_for_the_future_already":
        MessageLookupByLibrary.simpleMessage(
          "La selezione dei singoli account da importare e l\'assegnazione dei gruppi sono entrambe già pianificate per il futuro!",
        ),
    "send": MessageLookupByLibrary.simpleMessage("Invia"),
    "share_base_url": MessageLookupByLibrary.simpleMessage(
      "URL di condivisione personalizzato",
    ),
    "share_base_url_description": MessageLookupByLibrary.simpleMessage(
      "Usa un URL di base personalizzato per la condivisione",
    ),
    "share_tweet_content": MessageLookupByLibrary.simpleMessage(
      "Condividi il contenuto del tweet",
    ),
    "share_tweet_content_and_link": MessageLookupByLibrary.simpleMessage(
      "Condividi il link e il contenuto del tweet",
    ),
    "share_tweet_link": MessageLookupByLibrary.simpleMessage(
      "Condividi il link al tweet",
    ),
    "should_check_for_updates_description":
        MessageLookupByLibrary.simpleMessage(
          "Controlla gli aggiornamenti all\'avvio di Squawker",
        ),
    "should_check_for_updates_label": MessageLookupByLibrary.simpleMessage(
      "Controlla gli aggiornamenti",
    ),
    "small": MessageLookupByLibrary.simpleMessage("Piccolo"),
    "something_broke_in_fritter": MessageLookupByLibrary.simpleMessage(
      "Qualcosa si è rotto in Squawker.",
    ),
    "something_just_went_wrong_in_fritter_and_an_error_report_has_been_generated":
        MessageLookupByLibrary.simpleMessage(
          "Qualcosa è andato storto in Squawker ed è stato generato un rapporto di errore. Il rapporto può essere inviato agli sviluppatori di Squawker per aiutare a risolvere il problema.",
        ),
    "sorry_the_replied_tweet_could_not_be_found":
        MessageLookupByLibrary.simpleMessage(
          "Spiacenti, il tweet a cui è riferita la risposta non è stato trovato!",
        ),
    "subscribe": MessageLookupByLibrary.simpleMessage("Iscriviti"),
    "subscriptions": MessageLookupByLibrary.simpleMessage("Iscrizioni"),
    "subtitles": MessageLookupByLibrary.simpleMessage("Sottotitoli"),
    "successfully_saved_the_media": MessageLookupByLibrary.simpleMessage(
      "Contenuto salvato!",
    ),
    "system": MessageLookupByLibrary.simpleMessage("Sistema"),
    "tap_to_download_release_version": m13,
    "tap_to_show_getMediaType_item_type": m14,
    "thanks_for_helping_fritter": MessageLookupByLibrary.simpleMessage(
      "Grazie per aver aiutato Squawker! 💖",
    ),
    "the_file_does_not_exist_please_ensure_it_is_located_at_file_path": m15,
    "the_github_issue": MessageLookupByLibrary.simpleMessage(
      "issue GitHub (#143)",
    ),
    "the_tweet_did_not_contain_any_text_this_is_unexpected":
        MessageLookupByLibrary.simpleMessage(
          "Il tweet non contiene alcun testo. Questo è inaspettato",
        ),
    "theme": MessageLookupByLibrary.simpleMessage("Tema"),
    "theme_mode": MessageLookupByLibrary.simpleMessage("Modalità del tema"),
    "there_were_no_trends_returned_this_is_unexpected_please_report_as_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "Non è stata restituita alcuna tendenza. Questo è inaspettato! Si prega di segnalare un errore, se possibile.",
        ),
    "this_group_contains_no_subscriptions":
        MessageLookupByLibrary.simpleMessage(
          "Questo gruppo non contiene iscrizioni!",
        ),
    "this_took_too_long_to_load_please_check_your_network_connection":
        MessageLookupByLibrary.simpleMessage(
          "Il caricamento ha impiegato troppo tempo. Si prega di controllare la connessione di rete!",
        ),
    "this_tweet_is_unavailable": MessageLookupByLibrary.simpleMessage(
      "Questo tweet non è disponibile. Probabilmente è stato cancellato.",
    ),
    "this_tweet_user_name_retweeted": m16,
    "this_user_does_not_follow_anyone": MessageLookupByLibrary.simpleMessage(
      "Questo utente non segue nessuno!",
    ),
    "this_user_does_not_have_anyone_following_them":
        MessageLookupByLibrary.simpleMessage(
          "Nessuno sta seguendo questo utente!",
        ),
    "thread": MessageLookupByLibrary.simpleMessage("Discussione"),
    "thumbnail": MessageLookupByLibrary.simpleMessage("Miniatura"),
    "timed_out": MessageLookupByLibrary.simpleMessage("Tempo scaduto"),
    "to_import_subscriptions_from_an_existing_twitter_account_enter_your_username_below":
        MessageLookupByLibrary.simpleMessage(
          "Per importare le iscrizioni da un account Twitter/X esistente, inserisci il tuo nome utente qui sotto.",
        ),
    "toggle_all": MessageLookupByLibrary.simpleMessage("Seleziona tutto"),
    "trending": MessageLookupByLibrary.simpleMessage("Tendenze"),
    "trends": MessageLookupByLibrary.simpleMessage("Tendenze"),
    "true_black": MessageLookupByLibrary.simpleMessage("Nero assoluto?"),
    "tweets": MessageLookupByLibrary.simpleMessage("Tweet"),
    "tweets_and_replies": MessageLookupByLibrary.simpleMessage(
      "Tweet e risposte",
    ),
    "tweets_number": m17,
    "two_home_pages_required": MessageLookupByLibrary.simpleMessage(
      "È necessario avere almeno due pagine nella home.",
    ),
    "unable_to_find_the_available_trend_locations":
        MessageLookupByLibrary.simpleMessage(
          "Impossibile trovare le posizioni delle tendenze disponibili.",
        ),
    "unable_to_find_your_saved_tweets": MessageLookupByLibrary.simpleMessage(
      "Impossibile trovare i tuoi tweet salvati.",
    ),
    "unable_to_import": MessageLookupByLibrary.simpleMessage(
      "Impossibile importare",
    ),
    "unable_to_load_home_pages": MessageLookupByLibrary.simpleMessage(
      "Impossibile caricare le tue pagine della home",
    ),
    "unable_to_load_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "Impossibile caricare i gruppi di iscrizioni",
    ),
    "unable_to_load_the_group": MessageLookupByLibrary.simpleMessage(
      "Impossibile caricare il gruppo",
    ),
    "unable_to_load_the_group_settings": MessageLookupByLibrary.simpleMessage(
      "Impossibile caricare le impostazioni del gruppo",
    ),
    "unable_to_load_the_list_of_follows": MessageLookupByLibrary.simpleMessage(
      "Impossibile caricare l\'elenco dei seguiti",
    ),
    "unable_to_load_the_next_page_of_follows":
        MessageLookupByLibrary.simpleMessage(
          "Impossibile caricare la pagina successiva dei seguiti",
        ),
    "unable_to_load_the_next_page_of_replies":
        MessageLookupByLibrary.simpleMessage(
          "Impossibile caricare la pagina successiva delle risposte",
        ),
    "unable_to_load_the_next_page_of_tweets":
        MessageLookupByLibrary.simpleMessage(
          "Impossibile caricare la pagina successiva dei tweet",
        ),
    "unable_to_load_the_profile": MessageLookupByLibrary.simpleMessage(
      "Impossibile caricare il profilo",
    ),
    "unable_to_load_the_search_results": MessageLookupByLibrary.simpleMessage(
      "Impossibile caricare i risultati della ricerca.",
    ),
    "unable_to_load_the_trends_for_widget_place_name": m18,
    "unable_to_load_the_tweet": MessageLookupByLibrary.simpleMessage(
      "Impossibile caricare il tweet",
    ),
    "unable_to_load_the_tweets": MessageLookupByLibrary.simpleMessage(
      "Impossibile caricare i tweet",
    ),
    "unable_to_load_the_tweets_for_the_feed":
        MessageLookupByLibrary.simpleMessage(
          "Impossibile caricare i tweet per il feed",
        ),
    "unable_to_refresh_the_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Impossibile aggiornare le iscrizioni",
    ),
    "unable_to_run_the_database_migrations":
        MessageLookupByLibrary.simpleMessage(
          "Impossibile eseguire le migrazioni del database",
        ),
    "unable_to_save_the_media_twitter_returned_a_status_of_response_statusCode":
        m19,
    "unable_to_stream_the_trend_location_preference":
        MessageLookupByLibrary.simpleMessage(
          "Impossibile trasmettere la preferenza della posizione delle tendenze",
        ),
    "unknown": MessageLookupByLibrary.simpleMessage("Sconosciuto"),
    "unsave": MessageLookupByLibrary.simpleMessage("Annulla salvataggio"),
    "unsubscribe": MessageLookupByLibrary.simpleMessage("Annulla iscrizione"),
    "unsupported_url": MessageLookupByLibrary.simpleMessage(
      "URL non supportato",
    ),
    "update_to_release_version_through_your_fdroid_client": m20,
    "updates": MessageLookupByLibrary.simpleMessage("Aggiornamenti"),
    "use_true_black_for_the_dark_mode_theme":
        MessageLookupByLibrary.simpleMessage(
          "Usa un nero vero per il tema scuro",
        ),
    "user_not_found": MessageLookupByLibrary.simpleMessage(
      "Utente non trovato",
    ),
    "username": MessageLookupByLibrary.simpleMessage("Nome utente"),
    "version": MessageLookupByLibrary.simpleMessage("Versione"),
    "when_a_new_app_update_is_available": MessageLookupByLibrary.simpleMessage(
      "Quando è disponibile un nuovo aggiornamento dell\'app",
    ),
    "whether_errors_should_be_reported_to_":
        MessageLookupByLibrary.simpleMessage(
          "Se gli errori dovrebbero essere segnalati a ",
        ),
    "whether_to_hide_tweets_marked_as_sensitive":
        MessageLookupByLibrary.simpleMessage(
          "Se nascondere i tweet segnalati come sensibili",
        ),
    "which_tab_is_shown_when_the_app_opens":
        MessageLookupByLibrary.simpleMessage(
          "Quale scheda viene visualizzata quando si apre l\'app",
        ),
    "would_you_like_to_enable_automatic_error_reporting":
        MessageLookupByLibrary.simpleMessage(
          "Vorresti abilitare la segnalazione automatica degli errori?",
        ),
    "yes": MessageLookupByLibrary.simpleMessage("Sì"),
    "yes_please": MessageLookupByLibrary.simpleMessage("Si, grazie"),
    "you_have_not_saved_any_tweets_yet": MessageLookupByLibrary.simpleMessage(
      "Non hai ancora salvato un tweet!",
    ),
    "you_must_have_at_least_2_home_screen_pages":
        MessageLookupByLibrary.simpleMessage(
          "Devi avere almeno due pagine nella home",
        ),
    "your_profile_must_be_public_otherwise_the_import_will_not_work":
        MessageLookupByLibrary.simpleMessage(
          "Il tuo profilo deve essere pubblico, altrimenti l\'importazione non funzionerà",
        ),
    "your_report_will_be_sent_to_fritter__project":
        MessageLookupByLibrary.simpleMessage(
          "Il tuo rapporto verrà inviato al progetto Squawker di , i dettagli sulla privacy possono essere trovati a:",
        ),
  };
}
