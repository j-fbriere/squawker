// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  static String m0(name) =>
      "Voulez-vous vraiment supprimer le groupe d\'abonnement ${name} ?";

  static String m21(count) =>
      "Are you sure you want to remove ${count} users from the feed?";

  static String m22(count) =>
      "Voulez-vous vous désabonner de ${count} utilisateur?";

  static String m1(fileName) => "Données exportées vers ${fileName}";

  static String m2(fullPath) => "Données exportées vers ${fullPath}";

  static String m3(timeagoFormat) => "Terminé ${timeagoFormat}";

  static String m4(timeagoFormat) => "Fin ${timeagoFormat}";

  static String m5(snapshotData) =>
      "Terminé avec les utilisateurs ${snapshotData}";

  static String m6(name) => "Groupe : ${name}";

  static String m7(snapshotData) =>
      "${snapshotData} utilisateurs importés jusqu\'à présent";

  static String m8(date) => "S\'est inscrit(e) le ${date}";

  static String m9(nbrGuestAccounts) =>
      "Il y a ${nbrGuestAccounts} comptes invités";

  static String m10(num, numFormatted) =>
      "${Intl.plural(num, zero: 'Aucun vote', one: 'Un vote', two: 'Deux votes', few: '${numFormatted} votes', many: '${numFormatted} vote', other: '${numFormatted} votes')}";

  static String m11(errorMessage) =>
      "Veuillez vérifier votre connexion Internet.\n\n${errorMessage}";

  static String m12(nbrRegularAccounts) =>
      "Comptes Standards (${nbrRegularAccounts}) :";

  static String m23(count) => "${count} sélectionnés";

  static String m13(releaseVersion) =>
      "Appuyez pour télécharger ${releaseVersion}";

  static String m14(getMediaType) => "Appuyer pour afficher ${getMediaType}";

  static String m15(filePath) =>
      "Le fichier n’existe pas. Veuillez vous assurer qu’il se trouve à ${filePath}";

  static String m16(thisTweetUserName, timeAgo) =>
      "${thisTweetUserName} a retweeté ${timeAgo}";

  static String m17(num, numFormatted) =>
      "${Intl.plural(num, zero: 'no tweets', one: 'un tweet', two: 'deux tweets', few: '${numFormatted} tweets', many: '${numFormatted} tweet', other: '${numFormatted} tweets')}";

  static String m18(widgetPlaceName) =>
      "Impossible de charger les tendances pour ${widgetPlaceName}";

  static String m19(responseStatusCode) =>
      "Impossible d\'enregistrer le média. Twitter/X a renvoyé un statut de ${responseStatusCode}";

  static String m20(releaseVersion) =>
      "Mise à jour vers ${releaseVersion} via votre client F-Droid";

  static String m24(seconds) => "${seconds} s";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("À propos"),
    "about_download": MessageLookupByLibrary.simpleMessage("à propos"),
    "about_download_description": MessageLookupByLibrary.simpleMessage(
      "Télécharger des tweets en utilisant gallery-dl",
    ),
    "account": MessageLookupByLibrary.simpleMessage("Compte"),
    "account_suspended": MessageLookupByLibrary.simpleMessage(
      "Compte suspendu",
    ),
    "activate_non_confirmation_bias_mode_description":
        MessageLookupByLibrary.simpleMessage(
          "Masquer les auteurs des tweets. Évite les biais de confirmation basés sur des arguments faisant autorité.",
        ),
    "activate_non_confirmation_bias_mode_label":
        MessageLookupByLibrary.simpleMessage(
          "Activer le mode biais de non-confirmation",
        ),
    "add_account": MessageLookupByLibrary.simpleMessage("Ajouter un compte"),
    "add_account_title": MessageLookupByLibrary.simpleMessage(
      "Ajouter un compte",
    ),
    "add_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Ajouter des abonnements",
    ),
    "add_to_feed": MessageLookupByLibrary.simpleMessage("Ajouter au flux"),
    "add_to_group": MessageLookupByLibrary.simpleMessage("Ajouter au groupe"),
    "all": MessageLookupByLibrary.simpleMessage("Tout"),
    "all_the_great_software_used_by_fritter":
        MessageLookupByLibrary.simpleMessage(
          "Tous les excellents logiciels utilisés par Squawker",
        ),
    "allow_background_play_description": MessageLookupByLibrary.simpleMessage(
      "Permettre de jouer en arrière-plan",
    ),
    "allow_background_play_label": MessageLookupByLibrary.simpleMessage(
      "Jouer en arrière-plan",
    ),
    "allow_background_play_other_apps_description":
        MessageLookupByLibrary.simpleMessage(
          "Permettre aux apps externes de jouer en arrière-plan",
        ),
    "allow_background_play_other_apps_label":
        MessageLookupByLibrary.simpleMessage("Apps externes en arrière-plan"),
    "an_update_for_fritter_is_available": MessageLookupByLibrary.simpleMessage(
      "Une mise à jour pour Squawker est disponible ! 🚀",
    ),
    "api_key": MessageLookupByLibrary.simpleMessage("Clé d\'API"),
    "api_server": MessageLookupByLibrary.simpleMessage("Serveur d\'API"),
    "api_server_address": MessageLookupByLibrary.simpleMessage(
      "Addresse serveur de l\'API",
    ),
    "app_info": MessageLookupByLibrary.simpleMessage("Infos sur l’app"),
    "are_you_sure": MessageLookupByLibrary.simpleMessage("Êtes-vous sûr ?"),
    "are_you_sure_you_want_to_delete_the_subscription_group_name_of_group": m0,
    "autoplay_videos": MessageLookupByLibrary.simpleMessage(
      "Vidéos en lecture automatique",
    ),
    "autoplay_videos_description": MessageLookupByLibrary.simpleMessage(
      "Si activée, la lecture des vidéos commencera sans interaction de l\'utilisateur",
    ),
    "back": MessageLookupByLibrary.simpleMessage("Retour"),
    "bad_guest_token": MessageLookupByLibrary.simpleMessage(
      "Twitter/X a invalidé le jeton d\'accès. Essayez de relancer Squawker !",
    ),
    "batch_add_to_group": MessageLookupByLibrary.simpleMessage(
      "Ajouter en lot au Groupe",
    ),
    "batch_remove_from_feed": MessageLookupByLibrary.simpleMessage(
      "Supprimer en lot de Flux",
    ),
    "batch_remove_from_feed_confirm": m21,
    "batch_unsubscribe": MessageLookupByLibrary.simpleMessage(
      "Se désabonner en lot",
    ),
    "batch_unsubscribe_confirm": m22,
    "beta": MessageLookupByLibrary.simpleMessage("BÊTA"),
    "blue_theme_based_on_the_twitter_color_scheme":
        MessageLookupByLibrary.simpleMessage(
          "Thème bleu basé sur la palette de couleurs de Twitter/X",
        ),
    "cancel": MessageLookupByLibrary.simpleMessage("Annuler"),
    "catastrophic_failure": MessageLookupByLibrary.simpleMessage(
      "Défaillance catastrophique",
    ),
    "choose": MessageLookupByLibrary.simpleMessage("Choisissez"),
    "choose_pages": MessageLookupByLibrary.simpleMessage("Choisir les pages"),
    "close": MessageLookupByLibrary.simpleMessage("Fermer"),
    "community_notes_title": MessageLookupByLibrary.simpleMessage(
      "Note ajoutée par la communauté",
    ),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirmer"),
    "confirm_close_fritter": MessageLookupByLibrary.simpleMessage(
      "Êtes-vous sûr de vouloir fermer Squawker ?",
    ),
    "contribute": MessageLookupByLibrary.simpleMessage("Contribuer"),
    "copied_address_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "Copie de l\'adresse dans le presse-papiers",
    ),
    "copied_version_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "Copie de la version dans le presse-papiers",
    ),
    "could_not_contact_twitter": MessageLookupByLibrary.simpleMessage(
      "Impossible de contacter Twitter/X",
    ),
    "could_not_find_any_tweets_by_this_user":
        MessageLookupByLibrary.simpleMessage(
          "Impossible de trouver des tweets de cet utilisateur !",
        ),
    "could_not_find_any_tweets_from_the_last_7_days":
        MessageLookupByLibrary.simpleMessage(
          "Impossible de trouver des tweets des 7 derniers jours !",
        ),
    "country": MessageLookupByLibrary.simpleMessage("Pays"),
    "dark": MessageLookupByLibrary.simpleMessage("Sombre"),
    "data": MessageLookupByLibrary.simpleMessage("Données"),
    "data_exported_to_fileName": m1,
    "data_exported_to_fullPath": m2,
    "data_imported_successfully": MessageLookupByLibrary.simpleMessage(
      "Données importées avec succès",
    ),
    "date_created": MessageLookupByLibrary.simpleMessage("Date de création"),
    "date_subscribed": MessageLookupByLibrary.simpleMessage(
      "Date d\'inscription",
    ),
    "default_subscription_tab": MessageLookupByLibrary.simpleMessage(
      "Onglet d\'abonnement par défaut",
    ),
    "default_tab": MessageLookupByLibrary.simpleMessage("Onglet par défaut"),
    "delete": MessageLookupByLibrary.simpleMessage("Supprimer"),
    "deselect_all": MessageLookupByLibrary.simpleMessage("Désélectionner tout"),
    "disable_screenshots": MessageLookupByLibrary.simpleMessage(
      "Désactiver les captures d\'écran",
    ),
    "disable_screenshots_hint": MessageLookupByLibrary.simpleMessage(
      "Empêche la prise de captures d\'écran. Cela peut ne pas fonctionner sur tous les appareils.",
    ),
    "disabled": MessageLookupByLibrary.simpleMessage("Désactivé"),
    "doesnt_work_without_account": MessageLookupByLibrary.simpleMessage(
      "Squawker ne fonctionne pas sans compte.",
    ),
    "donate": MessageLookupByLibrary.simpleMessage("Faire un don"),
    "download": MessageLookupByLibrary.simpleMessage("Télécharger"),
    "download_all_tweets": MessageLookupByLibrary.simpleMessage(
      "Télécharger tous les tweets",
    ),
    "download_completed": MessageLookupByLibrary.simpleMessage(
      "Téléchargement complété!",
    ),
    "download_failed": MessageLookupByLibrary.simpleMessage(
      "Téléchargement failed",
    ),
    "download_handling": MessageLookupByLibrary.simpleMessage(
      "Traitement des téléchargements",
    ),
    "download_handling_description": MessageLookupByLibrary.simpleMessage(
      "Comment le téléchargement devrait fonctionner",
    ),
    "download_handling_type_ask": MessageLookupByLibrary.simpleMessage(
      "Toujours demander",
    ),
    "download_handling_type_directory": MessageLookupByLibrary.simpleMessage(
      "Enregistrer dans le répertoire",
    ),
    "download_media_no_url": MessageLookupByLibrary.simpleMessage(
      "Téléchargement impossible. Ce média pourrais être seulement disponible sous forme de flux, ce que Squawker ne sais pas encore télécharger.",
    ),
    "download_mode": MessageLookupByLibrary.simpleMessage(
      "Mode de téléchargement",
    ),
    "download_mode_fast": MessageLookupByLibrary.simpleMessage("Rapide (T=3)"),
    "download_mode_full_scan": MessageLookupByLibrary.simpleMessage(
      "Analyse complète",
    ),
    "download_mode_safe": MessageLookupByLibrary.simpleMessage("Sûre (T=20)"),
    "download_path": MessageLookupByLibrary.simpleMessage(
      "Chemin de téléchargement",
    ),
    "download_settings": MessageLookupByLibrary.simpleMessage(
      "Paramètres de téléchargement",
    ),
    "download_started": MessageLookupByLibrary.simpleMessage(
      "Téléchargement lancé...",
    ),
    "download_this_tweet": MessageLookupByLibrary.simpleMessage(
      "Télécharger ce tweet",
    ),
    "download_tweet": MessageLookupByLibrary.simpleMessage(
      "Télécharger un tweet",
    ),
    "download_video_best_quality_description":
        MessageLookupByLibrary.simpleMessage(
          "Télécharger des vidéos dans la meilleure qualité possible",
        ),
    "download_video_best_quality_label": MessageLookupByLibrary.simpleMessage(
      "Télécharger les vidéos avec la plus grande résolution",
    ),
    "downloading_media": MessageLookupByLibrary.simpleMessage(
      "Téléchargement des médias…",
    ),
    "edit_account_title": MessageLookupByLibrary.simpleMessage(
      "Modifier un compte",
    ),
    "email_label": MessageLookupByLibrary.simpleMessage("Courriel :"),
    "enable_": MessageLookupByLibrary.simpleMessage("Activer ?"),
    "ended_timeago_format_endsAt_allowFromNow_true": m3,
    "ends_timeago_format_endsAt_allowFromNow_true": m4,
    "enhanced_feeds_description": MessageLookupByLibrary.simpleMessage(
      "Requêtes améliorés pour les flux (mais avec des limites plus basses de fréquence)",
    ),
    "enhanced_feeds_label": MessageLookupByLibrary.simpleMessage(
      "Flux améliorés",
    ),
    "enhanced_profile_description": MessageLookupByLibrary.simpleMessage(
      "Requêtes améliorés pour le profil",
    ),
    "enhanced_profile_label": MessageLookupByLibrary.simpleMessage(
      "Profil amélioré",
    ),
    "enhanced_searches_description": MessageLookupByLibrary.simpleMessage(
      "Requêtes améliorés pour les recherches (mais avec des limites plus basses de fréquence)",
    ),
    "enhanced_searches_label": MessageLookupByLibrary.simpleMessage(
      "Recherches améliorés",
    ),
    "enter_comma_separated_twitter_usernames":
        MessageLookupByLibrary.simpleMessage(
          "Saisissez la liste d\'utilisateurs séparés par des virgules",
        ),
    "enter_your_twitter_username": MessageLookupByLibrary.simpleMessage(
      "Entrer votre nom d\'utilisateur Twitter/X",
    ),
    "error_from_twitter": MessageLookupByLibrary.simpleMessage(
      "Erreur De Twitter/X",
    ),
    "exclusions_feed_description": MessageLookupByLibrary.simpleMessage(
      "Liste des usagers à exclure des flux",
    ),
    "exclusions_feed_label": MessageLookupByLibrary.simpleMessage(
      "Exclusions dans les flux",
    ),
    "export": MessageLookupByLibrary.simpleMessage("Exporter"),
    "export_guest_accounts": MessageLookupByLibrary.simpleMessage(
      "Exporter les comptes invités ?",
    ),
    "export_settings": MessageLookupByLibrary.simpleMessage(
      "Exporter les paramètres ?",
    ),
    "export_subscription_group_members": MessageLookupByLibrary.simpleMessage(
      "Exporter les membres du groupe d\'abonnement ?",
    ),
    "export_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "Exporter les groupes d\'abonnement ?",
    ),
    "export_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Exporter les abonnements ?",
    ),
    "export_tweets": MessageLookupByLibrary.simpleMessage(
      "Exporter les tweets ?",
    ),
    "export_twitter_tokens": MessageLookupByLibrary.simpleMessage(
      "Exporter les jetons Twitter/X ?",
    ),
    "export_your_data": MessageLookupByLibrary.simpleMessage(
      "Exporter vos données",
    ),
    "failed_to_load_video": MessageLookupByLibrary.simpleMessage(
      "Échec du chargement de la vidéo",
    ),
    "feed": MessageLookupByLibrary.simpleMessage("Flux"),
    "filters": MessageLookupByLibrary.simpleMessage("Filtres"),
    "finish": MessageLookupByLibrary.simpleMessage("Terminer"),
    "finished_with_snapshotData_users": m5,
    "followers": MessageLookupByLibrary.simpleMessage("Abonnés"),
    "following": MessageLookupByLibrary.simpleMessage("Abonnements"),
    "forbidden": MessageLookupByLibrary.simpleMessage(
      "Twitter/X informe que l\'accès est interdit",
    ),
    "fritter": MessageLookupByLibrary.simpleMessage("Squawker"),
    "fritter_blue": MessageLookupByLibrary.simpleMessage("Squawker bleu"),
    "functionality_unsupported": MessageLookupByLibrary.simpleMessage(
      "Cette fonctionnalité n\'est plus prise en charge par Twitter/X !",
    ),
    "general": MessageLookupByLibrary.simpleMessage("Général"),
    "generic_username": MessageLookupByLibrary.simpleMessage("Utilisateur"),
    "group_name": m6,
    "groups": MessageLookupByLibrary.simpleMessage("Groupes"),
    "help_make_fritter_even_better": MessageLookupByLibrary.simpleMessage(
      "Contribuer à l\'amélioration de Squawker",
    ),
    "help_support_fritters_future": MessageLookupByLibrary.simpleMessage(
      "Soutenir le développement de Squawker",
    ),
    "hide_sensitive_tweets": MessageLookupByLibrary.simpleMessage(
      "Masquer les tweets sensibles",
    ),
    "home": MessageLookupByLibrary.simpleMessage("Accueil"),
    "if_you_have_any_feedback_on_this_feature_please_leave_it_on":
        MessageLookupByLibrary.simpleMessage(
          "Si vous avez des commentaires sur cette fonctionnalité, veuillez m\'en faire part",
        ),
    "import": MessageLookupByLibrary.simpleMessage("Importer"),
    "import_data_from_another_device": MessageLookupByLibrary.simpleMessage(
      "Importer des données depuis un autre appareil",
    ),
    "import_from_twitter": MessageLookupByLibrary.simpleMessage(
      "Importer depuis Twitter/X",
    ),
    "import_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Importer des abonnements",
    ),
    "imported_snapshot_data_users_so_far": m7,
    "include_replies": MessageLookupByLibrary.simpleMessage(
      "Inclure les réponses",
    ),
    "include_retweets": MessageLookupByLibrary.simpleMessage(
      "Inclure les retweets",
    ),
    "invert_selection": MessageLookupByLibrary.simpleMessage(
      "Inverser la sélection",
    ),
    "joined": m8,
    "keep_feed_offset_description": MessageLookupByLibrary.simpleMessage(
      "Retenir la position des flux lors de la réouverture d\'appli",
    ),
    "keep_feed_offset_label": MessageLookupByLibrary.simpleMessage(
      "Retenir la position des flux",
    ),
    "language": MessageLookupByLibrary.simpleMessage("Langue"),
    "language_subtitle": MessageLookupByLibrary.simpleMessage(
      "Nécessite un redémarrage",
    ),
    "large": MessageLookupByLibrary.simpleMessage("Grand"),
    "leaner_feeds_description": MessageLookupByLibrary.simpleMessage(
      "Les liens de prévisualisation ne sont pas affichés dans les tweets provenant de flux",
    ),
    "leaner_feeds_label": MessageLookupByLibrary.simpleMessage(
      "Flux plus léger",
    ),
    "legacy_android_import": MessageLookupByLibrary.simpleMessage(
      "Importation depuis un appareil Android ancien",
    ),
    "let_the_developers_know_if_something_is_broken":
        MessageLookupByLibrary.simpleMessage(
          "Faites savoir aux développeurs si quelque chose est défectueux",
        ),
    "libre_translate_host": MessageLookupByLibrary.simpleMessage(
      "Hôte LibreTranslate",
    ),
    "licenses": MessageLookupByLibrary.simpleMessage("Licences"),
    "light": MessageLookupByLibrary.simpleMessage("Clair"),
    "live": MessageLookupByLibrary.simpleMessage("EN DIRECT"),
    "logging": MessageLookupByLibrary.simpleMessage("Enregistrement"),
    "login": MessageLookupByLibrary.simpleMessage("Connexion"),
    "loop_videos": MessageLookupByLibrary.simpleMessage("Vidéos en boucle"),
    "loop_videos_description": MessageLookupByLibrary.simpleMessage(
      "Si activé, les vidéos seront diffusées en boucle une fois terminées",
    ),
    "mandatory_label": MessageLookupByLibrary.simpleMessage(
      "Champs obligatoires :",
    ),
    "material_3": MessageLookupByLibrary.simpleMessage("Material 3 ?"),
    "media": MessageLookupByLibrary.simpleMessage("Médias"),
    "media_image_quality": MessageLookupByLibrary.simpleMessage(
      "Qualité d\'image",
    ),
    "media_size": MessageLookupByLibrary.simpleMessage("Taille du média"),
    "media_video_quality": MessageLookupByLibrary.simpleMessage(
      "Qualité de vidéo",
    ),
    "medium": MessageLookupByLibrary.simpleMessage("Moyen"),
    "missing_page": MessageLookupByLibrary.simpleMessage("Page manquante"),
    "mute_video_description": MessageLookupByLibrary.simpleMessage(
      "Si les vidéos doivent être mises en sourdine par défaut",
    ),
    "mute_videos": MessageLookupByLibrary.simpleMessage(
      "Mettre les vidéos en sourdine",
    ),
    "name": MessageLookupByLibrary.simpleMessage("Nom"),
    "name_label": MessageLookupByLibrary.simpleMessage("Nom :"),
    "nbr_guest_accounts": m9,
    "newTrans": MessageLookupByLibrary.simpleMessage("Nouveau"),
    "next": MessageLookupByLibrary.simpleMessage("Suivant"),
    "no": MessageLookupByLibrary.simpleMessage("Non"),
    "no_data_was_returned_which_should_never_happen_please_report_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "Aucune donnée n\'a été renvoyée, ce qui ne devrait jamais arriver. Veuillez signaler une erreur, si possible !",
        ),
    "no_results": MessageLookupByLibrary.simpleMessage("Aucun résultat"),
    "no_results_for": MessageLookupByLibrary.simpleMessage(
      "Aucun résultat pour :",
    ),
    "no_subscriptions_try_searching_or_importing_some":
        MessageLookupByLibrary.simpleMessage(
          "Aucun abonnement. Essayez d’en rechercher ou d’en importer !",
        ),
    "not_logged_in": MessageLookupByLibrary.simpleMessage("Non connecté"),
    "not_set": MessageLookupByLibrary.simpleMessage("Non défini"),
    "note_due_to_a_twitter_limitation_not_all_tweets_may_be_included":
        MessageLookupByLibrary.simpleMessage(
          "Note : En raison d\'une limitation de Twitter/X, tous les tweets peuvent ne pas être inclus",
        ),
    "numberFormat_format_total_votes": m10,
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "only_public_subscriptions_can_be_imported":
        MessageLookupByLibrary.simpleMessage(
          "Les abonnements peuvent être importés seulement de profils publics",
        ),
    "oops_something_went_wrong": MessageLookupByLibrary.simpleMessage(
      "Oups ! Quelque chose a mal tourné 🥲",
    ),
    "open_app_settings": MessageLookupByLibrary.simpleMessage(
      "Ouvrir les paramètres de l\'appli",
    ),
    "open_in_browser": MessageLookupByLibrary.simpleMessage(
      "Ouvrir dans un navigateur",
    ),
    "option_confirm_close_description": MessageLookupByLibrary.simpleMessage(
      "Confirmation à la fermeture de l\'application",
    ),
    "option_confirm_close_label": MessageLookupByLibrary.simpleMessage(
      "Confirmation de fermeture",
    ),
    "option_navigation_animations_description":
        MessageLookupByLibrary.simpleMessage(
          "Activate les animations de navigation",
        ),
    "option_navigation_animations_label": MessageLookupByLibrary.simpleMessage(
      "Animations de navigation",
    ),
    "option_show_navigation_labels_description":
        MessageLookupByLibrary.simpleMessage(
          "Affiche les étiquettes des icônes de la barre de navigation",
        ),
    "option_show_navigation_labels_label": MessageLookupByLibrary.simpleMessage(
      "Étiquettes de la barre de navigation",
    ),
    "optional_label": MessageLookupByLibrary.simpleMessage(
      "Champs optionnels :",
    ),
    "page_not_found": MessageLookupByLibrary.simpleMessage(
      "Twitter/X informe que la page n\'existe pas, ce qui ne peux ne pas être vrai",
    ),
    "password_label": MessageLookupByLibrary.simpleMessage("Mot de passe :"),
    "permission_not_granted": MessageLookupByLibrary.simpleMessage(
      "Autorisation non accordée. Veuillez réessayer après avoir accordé l\'autorisation !",
    ),
    "phone_label": MessageLookupByLibrary.simpleMessage("Téléphone :"),
    "pick_a_color": MessageLookupByLibrary.simpleMessage(
      "Choisissez une couleur !",
    ),
    "pick_an_icon": MessageLookupByLibrary.simpleMessage(
      "Choisissez une icône !",
    ),
    "pinned_tweet": MessageLookupByLibrary.simpleMessage("Tweet épinglé"),
    "playback_speed": MessageLookupByLibrary.simpleMessage(
      "Vitesse de lecture",
    ),
    "please_check_your_internet_connection_error_message": m11,
    "please_enter_a_name": MessageLookupByLibrary.simpleMessage(
      "Veuillez entrer un nom",
    ),
    "please_make_sure_the_data_you_wish_to_import_is_located_there_then_press_the_import_button_below":
        MessageLookupByLibrary.simpleMessage(
          "Assurez-vous que les données que vous souhaitez importer s\'y trouvent, puis appuyez sur le bouton d\'importation ci-dessous.",
        ),
    "please_note_that_the_method_fritter_uses_to_import_subscriptions_is_heavily_rate_limited_by_twitter_so_this_may_fail_if_you_have_a_lot_of_followed_accounts":
        MessageLookupByLibrary.simpleMessage(
          "Veuillez noter que la méthode utilisée par Squawker pour importer les abonnements est fortement limitée par Twitter/X, cela peut donc échouer si vous avez beaucoup de comptes suivis.",
        ),
    "possibly_sensitive": MessageLookupByLibrary.simpleMessage(
      "Potentiellement sensible",
    ),
    "possibly_sensitive_profile": MessageLookupByLibrary.simpleMessage(
      "Ce profil peut contenir des images, un langage ou d\'autres contenus potentiellement sensibles. Voulez-vous toujours le consulter ?",
    ),
    "possibly_sensitive_tweet": MessageLookupByLibrary.simpleMessage(
      "Ce tweet contient un contenu potentiellement sensible. Voulez-vous le voir ?",
    ),
    "prefix": MessageLookupByLibrary.simpleMessage("préfixe"),
    "private_profile": MessageLookupByLibrary.simpleMessage("Profil privé"),
    "proxy_description": MessageLookupByLibrary.simpleMessage(
      "Proxy pour toutes les requêtes",
    ),
    "proxy_error": MessageLookupByLibrary.simpleMessage("Erreur Proxy"),
    "proxy_label": MessageLookupByLibrary.simpleMessage("Proxy"),
    "quality": MessageLookupByLibrary.simpleMessage("Qualité"),
    "regular_accounts": m12,
    "released_under_the_mit_license": MessageLookupByLibrary.simpleMessage(
      "Publié sous la licence MIT",
    ),
    "remove_from_feed": MessageLookupByLibrary.simpleMessage("Retirer du flux"),
    "replying_to": MessageLookupByLibrary.simpleMessage("Réponse à"),
    "report": MessageLookupByLibrary.simpleMessage("Signaler"),
    "report_a_bug": MessageLookupByLibrary.simpleMessage("Signaler un bogue"),
    "reporting_an_error": MessageLookupByLibrary.simpleMessage(
      "Signaler une erreur",
    ),
    "reset_home_pages": MessageLookupByLibrary.simpleMessage(
      "Réinitialiser les pages par défaut",
    ),
    "restart_video_player": MessageLookupByLibrary.simpleMessage(
      "Redémarrez le lecteur vidéo",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Réessayer"),
    "save": MessageLookupByLibrary.simpleMessage("Enregistrer"),
    "save_bandwidth_using_smaller_images": MessageLookupByLibrary.simpleMessage(
      "Économiser de la bande passante en chargeant des images plus petites",
    ),
    "save_bandwidth_using_smaller_videos": MessageLookupByLibrary.simpleMessage(
      "Économiser de la bande passante en chargeant des vidéos plus petits",
    ),
    "saved": MessageLookupByLibrary.simpleMessage("Enregistré"),
    "saved_tweet_too_large": MessageLookupByLibrary.simpleMessage(
      "Ce tweet enregistré n\'a pas pu être affiché, car il est trop lourd à charger. Veuillez le signaler aux développeurs.",
    ),
    "search": MessageLookupByLibrary.simpleMessage("Recherche"),
    "search_term": MessageLookupByLibrary.simpleMessage("Terme de recherche"),
    "select": MessageLookupByLibrary.simpleMessage("Sélectionner"),
    "select_all": MessageLookupByLibrary.simpleMessage("Sélectionner tout"),
    "select_groups": MessageLookupByLibrary.simpleMessage(
      "Sélectionner Groupes",
    ),
    "selected_count": m23,
    "selecting_individual_accounts_to_import_and_assigning_groups_are_both_planned_for_the_future_already":
        MessageLookupByLibrary.simpleMessage(
          "La sélection de comptes individuels à importer et l’affectation de groupes sont déjà en cours de développement !",
        ),
    "send": MessageLookupByLibrary.simpleMessage("Envoyer"),
    "settings": MessageLookupByLibrary.simpleMessage("Paramètres"),
    "settings_saved": MessageLookupByLibrary.simpleMessage(
      "Paramètres enregistrés",
    ),
    "share_base_url": MessageLookupByLibrary.simpleMessage(
      "URL de partage personnalisé",
    ),
    "share_base_url_description": MessageLookupByLibrary.simpleMessage(
      "Utiliser une URL de base personnalisée lors du partage",
    ),
    "share_tweet_as_image": MessageLookupByLibrary.simpleMessage(
      "Partager le tweet en image",
    ),
    "share_tweet_content": MessageLookupByLibrary.simpleMessage(
      "Partager le contenu du tweet",
    ),
    "share_tweet_content_and_link": MessageLookupByLibrary.simpleMessage(
      "Partager le contenu du tweet et le lien",
    ),
    "share_tweet_link": MessageLookupByLibrary.simpleMessage(
      "Partager le lien vers le tweet",
    ),
    "should_check_for_updates_description":
        MessageLookupByLibrary.simpleMessage(
          "Vérifier les mises à jour quand Squawker démarre",
        ),
    "should_check_for_updates_label": MessageLookupByLibrary.simpleMessage(
      "Vérifier les mises à jour",
    ),
    "small": MessageLookupByLibrary.simpleMessage("Petit"),
    "something_broke_in_fritter": MessageLookupByLibrary.simpleMessage(
      "Quelque chose s\'est cassé dans Squawker.",
    ),
    "something_just_went_wrong_in_fritter_and_an_error_report_has_been_generated":
        MessageLookupByLibrary.simpleMessage(
          "Un problème vient de se produire dans Squawker, et un rapport d\'erreur a été généré. Ce rapport peut être envoyé aux développeurs de Squawker pour les aider à résoudre le problème.",
        ),
    "sorry_the_replied_tweet_could_not_be_found":
        MessageLookupByLibrary.simpleMessage(
          "Désolé, impossible de trouver le tweet auquel on a répondu !",
        ),
    "subscribe": MessageLookupByLibrary.simpleMessage("S\'abonner"),
    "subscriptions": MessageLookupByLibrary.simpleMessage("Abonnements"),
    "subtitles": MessageLookupByLibrary.simpleMessage("Sous-titres"),
    "successfully_saved_the_media": MessageLookupByLibrary.simpleMessage(
      "Le média est sauvegardé !",
    ),
    "system": MessageLookupByLibrary.simpleMessage("Système"),
    "tap_to_download_release_version": m13,
    "tap_to_show_getMediaType_item_type": m14,
    "thanks_for_helping_fritter": MessageLookupByLibrary.simpleMessage(
      "Merci d\'avoir aidé Squawker ! 💖",
    ),
    "the_file_does_not_exist_please_ensure_it_is_located_at_file_path": m15,
    "the_github_issue": MessageLookupByLibrary.simpleMessage(
      "le problème GitHub (nº143)",
    ),
    "the_tweet_did_not_contain_any_text_this_is_unexpected":
        MessageLookupByLibrary.simpleMessage(
          "Le tweet ne contenait aucun texte. C’est inattendu",
        ),
    "theme": MessageLookupByLibrary.simpleMessage("Thème"),
    "theme_mode": MessageLookupByLibrary.simpleMessage("Mode du thème"),
    "there_were_no_trends_returned_this_is_unexpected_please_report_as_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "Aucune tendance n\'a été retournée. C\'est inattendu ! Veuillez le signaler comme erreur, si possible.",
        ),
    "this_group_contains_no_subscriptions":
        MessageLookupByLibrary.simpleMessage(
          "Ce groupe ne contient pas d\'abonnements !",
        ),
    "this_took_too_long_to_load_please_check_your_network_connection":
        MessageLookupByLibrary.simpleMessage(
          "Le chargement est trop long. Veuillez vérifier votre connexion réseau !",
        ),
    "this_tweet_is_unavailable": MessageLookupByLibrary.simpleMessage(
      "Ce tweet n’est pas disponible Il a probablement été supprimé.",
    ),
    "this_tweet_user_name_retweeted": m16,
    "this_user_does_not_follow_anyone": MessageLookupByLibrary.simpleMessage(
      "Cet utilisateur ne suit personne !",
    ),
    "this_user_does_not_have_anyone_following_them":
        MessageLookupByLibrary.simpleMessage(
          "Cet utilisateur n\'a personne qui le suit !",
        ),
    "thread": MessageLookupByLibrary.simpleMessage("Fil de discussion"),
    "thumbnail": MessageLookupByLibrary.simpleMessage("Miniature"),
    "thumbnail_not_available": MessageLookupByLibrary.simpleMessage(
      "Miniature non disponible",
    ),
    "timed_out": MessageLookupByLibrary.simpleMessage("Délai expiré"),
    "to_import_specific_subscriptions_enter_your_comma_separated_usernames_below":
        MessageLookupByLibrary.simpleMessage(
          "Pour importer des abonnements spécifiques, saisissez une liste d\'utilisateurs séparés par des virgules ci-dessous.",
        ),
    "to_import_subscriptions_from_an_existing_twitter_account_enter_your_username_below":
        MessageLookupByLibrary.simpleMessage(
          "Pour importer des abonnements depuis un compte Twitter/X existant, saisissez votre nom d\'utilisateur ci-dessous.",
        ),
    "toggle_all": MessageLookupByLibrary.simpleMessage("Tout basculer"),
    "translator_label": MessageLookupByLibrary.simpleMessage("Traducteur"),
    "translators_description": MessageLookupByLibrary.simpleMessage(
      "Spécifier les hôtes LibreTranslate",
    ),
    "translators_label": MessageLookupByLibrary.simpleMessage("Traducteurs"),
    "trending": MessageLookupByLibrary.simpleMessage("Tendances"),
    "trends": MessageLookupByLibrary.simpleMessage("Tendances"),
    "true_black": MessageLookupByLibrary.simpleMessage("Vrai noir ?"),
    "tweet_font_size_description": MessageLookupByLibrary.simpleMessage(
      "Taille de la police des tweets",
    ),
    "tweet_font_size_label": MessageLookupByLibrary.simpleMessage(
      "Taille de la police",
    ),
    "tweets": MessageLookupByLibrary.simpleMessage("Tweets"),
    "tweets_and_replies": MessageLookupByLibrary.simpleMessage(
      "Tweets & Réponses",
    ),
    "tweets_number": m17,
    "twitter_account_types_both": MessageLookupByLibrary.simpleMessage(
      "Invité et standard",
    ),
    "twitter_account_types_description": MessageLookupByLibrary.simpleMessage(
      "Type de compte utilisé",
    ),
    "twitter_account_types_label": MessageLookupByLibrary.simpleMessage(
      "Type de compte",
    ),
    "twitter_account_types_only_regular": MessageLookupByLibrary.simpleMessage(
      "Seulement standard",
    ),
    "twitter_account_types_priority_to_regular":
        MessageLookupByLibrary.simpleMessage("Priorité au standard"),
    "two_home_pages_required": MessageLookupByLibrary.simpleMessage(
      "Vous devez disposer d\'au moins deux pages d\'écran d\'accueil.",
    ),
    "unable_to_find_the_available_trend_locations":
        MessageLookupByLibrary.simpleMessage(
          "Impossible de trouver les emplacements de tendance disponibles.",
        ),
    "unable_to_find_your_saved_tweets": MessageLookupByLibrary.simpleMessage(
      "Impossible de trouver vos tweets enregistrés.",
    ),
    "unable_to_import": MessageLookupByLibrary.simpleMessage(
      "Importation impossible",
    ),
    "unable_to_load_home_pages": MessageLookupByLibrary.simpleMessage(
      "Impossible de charger vos pages d\'accueil",
    ),
    "unable_to_load_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "Impossible de charger les groupes d\'abonnement",
    ),
    "unable_to_load_the_group": MessageLookupByLibrary.simpleMessage(
      "Impossible de charger le groupe",
    ),
    "unable_to_load_the_group_settings": MessageLookupByLibrary.simpleMessage(
      "Impossible de charger les paramètres du groupe",
    ),
    "unable_to_load_the_list_of_follows": MessageLookupByLibrary.simpleMessage(
      "Impossible de charger la liste des abonnés",
    ),
    "unable_to_load_the_next_page_of_follows":
        MessageLookupByLibrary.simpleMessage(
          "Impossible de charger la page suivante",
        ),
    "unable_to_load_the_next_page_of_replies":
        MessageLookupByLibrary.simpleMessage(
          "Impossible de charger la page suivante de réponses",
        ),
    "unable_to_load_the_next_page_of_tweets":
        MessageLookupByLibrary.simpleMessage(
          "Impossible de charger la page suivante de tweets",
        ),
    "unable_to_load_the_profile": MessageLookupByLibrary.simpleMessage(
      "Impossible de charger le profil",
    ),
    "unable_to_load_the_search_results": MessageLookupByLibrary.simpleMessage(
      "Impossible de charger les résultats de la recherche.",
    ),
    "unable_to_load_the_trends_for_widget_place_name": m18,
    "unable_to_load_the_tweet": MessageLookupByLibrary.simpleMessage(
      "Impossible de charger le tweet",
    ),
    "unable_to_load_the_tweets": MessageLookupByLibrary.simpleMessage(
      "Impossible de charger les tweets",
    ),
    "unable_to_load_the_tweets_for_the_feed":
        MessageLookupByLibrary.simpleMessage(
          "Impossible de charger les tweets pour le flux",
        ),
    "unable_to_refresh_the_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Impossible de rafraîchir la liste des abonnements",
    ),
    "unable_to_run_the_database_migrations":
        MessageLookupByLibrary.simpleMessage(
          "Impossible d\'exécuter les migrations de la base de données",
        ),
    "unable_to_save_the_media_twitter_returned_a_status_of_response_statusCode":
        m19,
    "unable_to_stream_the_trend_location_preference":
        MessageLookupByLibrary.simpleMessage(
          "Impossible de diffuser la préférence de localisation de la tendance",
        ),
    "unknown": MessageLookupByLibrary.simpleMessage("Inconnu"),
    "unsave": MessageLookupByLibrary.simpleMessage("Désenregistrer"),
    "unsubscribe": MessageLookupByLibrary.simpleMessage("Se désabonner"),
    "unsupported_url": MessageLookupByLibrary.simpleMessage(
      "URL non pris en charge",
    ),
    "update_to_release_version_through_your_fdroid_client": m20,
    "updates": MessageLookupByLibrary.simpleMessage("Mises à jour"),
    "use_true_black_for_the_dark_mode_theme":
        MessageLookupByLibrary.simpleMessage(
          "Utilisez le noir profond pour le thème du mode sombre",
        ),
    "user_not_found": MessageLookupByLibrary.simpleMessage(
      "Utilisateur non trouvé",
    ),
    "username": MessageLookupByLibrary.simpleMessage("Nom d’utilisateur"),
    "username_exclude": MessageLookupByLibrary.simpleMessage(
      "Usager à exclure",
    ),
    "username_label": MessageLookupByLibrary.simpleMessage("Identifiant :"),
    "usernames": MessageLookupByLibrary.simpleMessage("Utilisateurs"),
    "version": MessageLookupByLibrary.simpleMessage("Version"),
    "video_prefetch": MessageLookupByLibrary.simpleMessage(
      "Durée de prélecture vidéo",
    ),
    "video_prefetch_description": MessageLookupByLibrary.simpleMessage(
      "Quelle quantité de vidéo est chargée avant la lecture. Une durée plus courte permet d\'économiser des données et de la mémoire, mais peut entraîner le chargement de davantage de pauses sur des connexions instables.",
    ),
    "video_prefetch_seconds": m24,
    "video_prefetch_unlimited": MessageLookupByLibrary.simpleMessage(
      "Illimitée (défaut)",
    ),
    "warning_regular_account_unauthenticated_access_description":
        MessageLookupByLibrary.simpleMessage(
          "Twitter/X a désactivé la possibilité de créer des comptes invités. Vous pouvez maintenant configurer des comptes réguliers dans Paramètres / Compte. Sans compte, il y a un accès partiel limité aux tweets et aux profils. Il est facile de créer un compte régulier anonyme, tel qu\'expliqué ici :",
        ),
    "warning_regular_account_unauthenticated_access_title":
        MessageLookupByLibrary.simpleMessage(
          "Comptes réguliers et accès non authentifié",
        ),
    "when_a_new_app_update_is_available": MessageLookupByLibrary.simpleMessage(
      "Lorsqu\'une nouvelle mise à jour de l\'application est disponible",
    ),
    "whether_errors_should_be_reported_to_":
        MessageLookupByLibrary.simpleMessage(
          "Si les erreurs doivent être signalées à ",
        ),
    "whether_to_hide_tweets_marked_as_sensitive":
        MessageLookupByLibrary.simpleMessage(
          "La possibilité de masquer les tweets marqués comme sensibles",
        ),
    "which_tab_is_shown_when_the_app_opens":
        MessageLookupByLibrary.simpleMessage(
          "Quel onglet s’affiche à l’ouverture de l’application",
        ),
    "which_tab_is_shown_when_the_subscription_opens":
        MessageLookupByLibrary.simpleMessage(
          "Quel onglet s’affiche à l’ouverture de l’abonnement",
        ),
    "would_you_like_to_enable_automatic_error_reporting":
        MessageLookupByLibrary.simpleMessage(
          "Voulez-vous activer le rapport d\'erreur automatique ?",
        ),
    "x_api": MessageLookupByLibrary.simpleMessage("API X"),
    "x_client_transaction_id_provider": MessageLookupByLibrary.simpleMessage(
      "Fournisseur x-client-transaction-id",
    ),
    "x_client_transaction_id_provider_description":
        MessageLookupByLibrary.simpleMessage(
          "Définissez le fournisseur x-client-transaction-id. Il doit s\'agir d\'un nom de domaine, sans https. Référence: https://github.com/Teskann/x-client-transaction-id-generator",
        ),
    "yes": MessageLookupByLibrary.simpleMessage("Oui"),
    "yes_please": MessageLookupByLibrary.simpleMessage("Oui, s\'il vous plaît"),
    "you_have_not_saved_any_tweets_yet": MessageLookupByLibrary.simpleMessage(
      "Vous n\'avez pas encore enregistré de tweets !",
    ),
    "you_must_have_at_least_2_home_screen_pages":
        MessageLookupByLibrary.simpleMessage(
          "Vous devez avoir au moins deux pages d\'accueil",
        ),
    "your_profile_must_be_public_otherwise_the_import_will_not_work":
        MessageLookupByLibrary.simpleMessage(
          "Votre profil doit être public, sinon l’importation ne fonctionnera pas",
        ),
    "your_report_will_be_sent_to_fritter__project":
        MessageLookupByLibrary.simpleMessage(
          "Votre rapport sera envoyé au projet Squawker, et les détails de la confidentialité peuvent être trouvés à l\'adresse suivante :",
        ),
  };
}
