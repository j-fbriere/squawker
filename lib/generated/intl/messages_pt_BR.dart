// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt_BR locale. All the
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
  String get localeName => 'pt_BR';

  static String m0(name) =>
      "Tem certeza de que deseja excluir o grupo de inscrições ${name}?";

  static String m1(fileName) => "Dados exportados para ${fileName}";

  static String m2(fullPath) => "Dados exportados para ${fullPath}";

  static String m3(timeagoFormat) => "Finalizado ${timeagoFormat}";

  static String m4(timeagoFormat) => "Termina ${timeagoFormat}";

  static String m5(snapshotData) => "Terminou com ${snapshotData} usuários";

  static String m6(name) => "Grupo: ${name}";

  static String m7(snapshotData) =>
      "${snapshotData} usuários importados até agora";

  static String m8(date) => "Ingressou em ${date}";

  static String m9(nbrGuestAccounts) =>
      "Existem ${nbrGuestAccounts} contas de convidados";

  static String m10(num, numFormatted) =>
      "${Intl.plural(num, zero: 'Nenhum voto', one: 'Um voto', two: 'Dois votos', few: '${numFormatted} votos', many: '${numFormatted} voto', other: '${numFormatted} votos')}";

  static String m11(errorMessage) =>
      "Por favor, verifique sua conexão à internet.\n\n${errorMessage}";

  static String m12(nbrRegularAccounts) =>
      "Contas regulares (${nbrRegularAccounts}):";

  static String m13(releaseVersion) => "Toque para baixar ${releaseVersion}";

  static String m14(getMediaType) => "Toque para mostrar ${getMediaType}";

  static String m15(filePath) =>
      "O arquivo não existe. Certifique-se de que está localizado em ${filePath}";

  static String m16(thisTweetUserName, timeAgo) =>
      "${thisTweetUserName} retweetado ${timeAgo}";

  static String m17(num, numFormatted) =>
      "${Intl.plural(num, zero: 'nenhum tweet', one: 'um tweet', two: 'dois tweets', few: '${numFormatted} tweets', many: '${numFormatted} tweet', other: '${numFormatted} tweets')}";

  static String m18(widgetPlaceName) =>
      "Não foi possível carregar as tendências para ${widgetPlaceName}";

  static String m19(responseStatusCode) =>
      "Não foi possível salvar a mídia. O Twitter/X retornou um status de ${responseStatusCode}";

  static String m20(releaseVersion) =>
      "Atualizar para ${releaseVersion} através do seu cliente F-Droid";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("Sobre"),
    "account": MessageLookupByLibrary.simpleMessage("Conta"),
    "account_suspended": MessageLookupByLibrary.simpleMessage("Conta suspensa"),
    "activate_non_confirmation_bias_mode_description":
        MessageLookupByLibrary.simpleMessage(
          "Esconda autores de tweets. Evitar confirmação de viés baseado em argumentos autoritários.",
        ),
    "activate_non_confirmation_bias_mode_label":
        MessageLookupByLibrary.simpleMessage(
          "Ativar modo de não-confirmação de viés",
        ),
    "add_account": MessageLookupByLibrary.simpleMessage("Adicionar uma conta"),
    "add_account_title": MessageLookupByLibrary.simpleMessage(
      "Adicionar uma conta",
    ),
    "add_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Adicionar inscrições",
    ),
    "add_to_feed": MessageLookupByLibrary.simpleMessage("Adicionar ao feed"),
    "add_to_group": MessageLookupByLibrary.simpleMessage("Adicionar ao grupo"),
    "all": MessageLookupByLibrary.simpleMessage("Tudo"),
    "all_the_great_software_used_by_fritter":
        MessageLookupByLibrary.simpleMessage(
          "Todo o ótimo software usado por Squawker",
        ),
    "allow_background_play_description": MessageLookupByLibrary.simpleMessage(
      "Permitir reprodução de vídeos em segundo plano",
    ),
    "allow_background_play_label": MessageLookupByLibrary.simpleMessage(
      "Reprodução em segundo plano",
    ),
    "allow_background_play_other_apps_description":
        MessageLookupByLibrary.simpleMessage(
          "Permitir que outros aplicativos sejam reproduzidos em segundo plano",
        ),
    "allow_background_play_other_apps_label":
        MessageLookupByLibrary.simpleMessage(
          "Outros aplicativos em segundo plano",
        ),
    "an_update_for_fritter_is_available": MessageLookupByLibrary.simpleMessage(
      "Uma atualização para o Squawker está disponível! 🚀",
    ),
    "api_key": MessageLookupByLibrary.simpleMessage("Chave API"),
    "app_info": MessageLookupByLibrary.simpleMessage(
      "Informações do aplicativo",
    ),
    "are_you_sure": MessageLookupByLibrary.simpleMessage("Tem certeza?"),
    "are_you_sure_you_want_to_delete_the_subscription_group_name_of_group": m0,
    "back": MessageLookupByLibrary.simpleMessage("Voltar"),
    "bad_guest_token": MessageLookupByLibrary.simpleMessage(
      "Twitter/X invalidou nosso token de acesso. Por favor tente reabrir o Squawker!",
    ),
    "beta": MessageLookupByLibrary.simpleMessage("BETA"),
    "blue_theme_based_on_the_twitter_color_scheme":
        MessageLookupByLibrary.simpleMessage(
          "Tema azul baseado no esquema de cores do Twitter/X",
        ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
    "catastrophic_failure": MessageLookupByLibrary.simpleMessage(
      "Falha catastrófica",
    ),
    "choose": MessageLookupByLibrary.simpleMessage("Escolher"),
    "choose_pages": MessageLookupByLibrary.simpleMessage("Escolha as páginas"),
    "close": MessageLookupByLibrary.simpleMessage("Fechar"),
    "community_notes_title": MessageLookupByLibrary.simpleMessage(
      "Contexto adicionado pelos leitores",
    ),
    "confirm_close_fritter": MessageLookupByLibrary.simpleMessage(
      "Tem certeza de que deseja fechar o Squawker?",
    ),
    "contribute": MessageLookupByLibrary.simpleMessage("Contribuir"),
    "copied_address_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "Endereço copiado para a área de transferência",
    ),
    "copied_version_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "Versão copiada para a área de transferência",
    ),
    "could_not_contact_twitter": MessageLookupByLibrary.simpleMessage(
      "Não foi possível entrar em contato com o Twitter/X",
    ),
    "could_not_find_any_tweets_by_this_user":
        MessageLookupByLibrary.simpleMessage(
          "Não foi possível encontrar nenhum tweet deste usuário!",
        ),
    "could_not_find_any_tweets_from_the_last_7_days":
        MessageLookupByLibrary.simpleMessage(
          "Não foi possível encontrar nenhum tweet dos últimos 7 dias!",
        ),
    "country": MessageLookupByLibrary.simpleMessage("País"),
    "dark": MessageLookupByLibrary.simpleMessage("Escuro"),
    "data": MessageLookupByLibrary.simpleMessage("Dados"),
    "data_exported_to_fileName": m1,
    "data_exported_to_fullPath": m2,
    "data_imported_successfully": MessageLookupByLibrary.simpleMessage(
      "Dados importados com sucesso",
    ),
    "date_created": MessageLookupByLibrary.simpleMessage("Data de Criação"),
    "date_subscribed": MessageLookupByLibrary.simpleMessage(
      "Data de Inscrição",
    ),
    "default_subscription_tab": MessageLookupByLibrary.simpleMessage(
      "Aba de inscrição padrão",
    ),
    "default_tab": MessageLookupByLibrary.simpleMessage("Aba padrão"),
    "delete": MessageLookupByLibrary.simpleMessage("Excluir"),
    "disable_screenshots": MessageLookupByLibrary.simpleMessage(
      "Desabilitar capturas de tela",
    ),
    "disable_screenshots_hint": MessageLookupByLibrary.simpleMessage(
      "Previne que sejam feitas capturas de tela. Isso pode não funcionar em todos os dispositivos.",
    ),
    "disabled": MessageLookupByLibrary.simpleMessage("Desativado"),
    "doesnt_work_without_account": MessageLookupByLibrary.simpleMessage(
      "O Squawker não funciona sem uma conta",
    ),
    "donate": MessageLookupByLibrary.simpleMessage("Doar"),
    "download": MessageLookupByLibrary.simpleMessage("Download"),
    "download_handling": MessageLookupByLibrary.simpleMessage(
      "Manipulação de downloads",
    ),
    "download_handling_description": MessageLookupByLibrary.simpleMessage(
      "Como o download deve funcionar",
    ),
    "download_handling_type_ask": MessageLookupByLibrary.simpleMessage(
      "Sempre perguntar",
    ),
    "download_handling_type_directory": MessageLookupByLibrary.simpleMessage(
      "Salvar no diretório",
    ),
    "download_media_no_url": MessageLookupByLibrary.simpleMessage(
      "Incapaz de baixar. Esta mídia pode estar disponível apenas como uma transmissão, que Squawker ainda não pode baixar.",
    ),
    "download_path": MessageLookupByLibrary.simpleMessage(
      "Caminho do download",
    ),
    "download_video_best_quality_description":
        MessageLookupByLibrary.simpleMessage(
          "Baixar videos na melhor qualidade disponivel",
        ),
    "download_video_best_quality_label": MessageLookupByLibrary.simpleMessage(
      "Baixar videos com melhor qualidade",
    ),
    "downloading_media": MessageLookupByLibrary.simpleMessage(
      "Baixando mídia…",
    ),
    "edit_account_title": MessageLookupByLibrary.simpleMessage(
      "Modificar uma conta",
    ),
    "email_label": MessageLookupByLibrary.simpleMessage("Email:"),
    "enable_": MessageLookupByLibrary.simpleMessage("Ativar ?"),
    "ended_timeago_format_endsAt_allowFromNow_true": m3,
    "ends_timeago_format_endsAt_allowFromNow_true": m4,
    "enhanced_feeds_description": MessageLookupByLibrary.simpleMessage(
      "Solicitações aprimoradas de feeds (mas com limites de taxa mais baixos)",
    ),
    "enhanced_feeds_label": MessageLookupByLibrary.simpleMessage(
      "Feeds aprimorados",
    ),
    "enhanced_profile_description": MessageLookupByLibrary.simpleMessage(
      "Solicitações aprimoradas de perfis",
    ),
    "enhanced_profile_label": MessageLookupByLibrary.simpleMessage(
      "Perfis aprimorados",
    ),
    "enhanced_searches_description": MessageLookupByLibrary.simpleMessage(
      "Solicitações aprimoradas de pesquisas (mas com limites de taxas mais baixas)",
    ),
    "enhanced_searches_label": MessageLookupByLibrary.simpleMessage(
      "Pesquisas aprimoradas",
    ),
    "enter_comma_separated_twitter_usernames":
        MessageLookupByLibrary.simpleMessage(
          "Insira seus nomes de usuário do Twitter/X separados por vírgula",
        ),
    "enter_your_twitter_username": MessageLookupByLibrary.simpleMessage(
      "Digite seu nome de usuário do Twitter/X",
    ),
    "error_from_twitter": MessageLookupByLibrary.simpleMessage(
      "Erro do Twitter/X",
    ),
    "exclusions_feed_description": MessageLookupByLibrary.simpleMessage(
      "Lista de nomes de usuário a serem excluídos do feed",
    ),
    "exclusions_feed_label": MessageLookupByLibrary.simpleMessage(
      "Exclusões no feed",
    ),
    "export": MessageLookupByLibrary.simpleMessage("Exportar"),
    "export_guest_accounts": MessageLookupByLibrary.simpleMessage(
      "Exportar contas de convidado?",
    ),
    "export_settings": MessageLookupByLibrary.simpleMessage(
      "Exportar configurações?",
    ),
    "export_subscription_group_members": MessageLookupByLibrary.simpleMessage(
      "Exportar membros do grupo de inscrições?",
    ),
    "export_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "Exportar grupos de inscrições?",
    ),
    "export_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Exportar inscrições?",
    ),
    "export_tweets": MessageLookupByLibrary.simpleMessage("Exportar tweets?"),
    "export_twitter_tokens": MessageLookupByLibrary.simpleMessage(
      "Exportar tokens do Twitter/X?",
    ),
    "export_your_data": MessageLookupByLibrary.simpleMessage(
      "Exportar seus dados",
    ),
    "feed": MessageLookupByLibrary.simpleMessage("Feed"),
    "filters": MessageLookupByLibrary.simpleMessage("Filtros"),
    "finish": MessageLookupByLibrary.simpleMessage("Terminar"),
    "finished_with_snapshotData_users": m5,
    "followers": MessageLookupByLibrary.simpleMessage("Seguidores"),
    "following": MessageLookupByLibrary.simpleMessage("Seguindo"),
    "forbidden": MessageLookupByLibrary.simpleMessage(
      "Twitter/X diz que o acesso a isso é proibido",
    ),
    "fritter": MessageLookupByLibrary.simpleMessage("Squawker"),
    "fritter_blue": MessageLookupByLibrary.simpleMessage("Squawker azul"),
    "functionality_unsupported": MessageLookupByLibrary.simpleMessage(
      "Esta funcionalidade não é mais suportada pelo Twitter/X!",
    ),
    "general": MessageLookupByLibrary.simpleMessage("Geral"),
    "generic_username": MessageLookupByLibrary.simpleMessage("Usuário"),
    "group_name": m6,
    "groups": MessageLookupByLibrary.simpleMessage("Grupos"),
    "help_make_fritter_even_better": MessageLookupByLibrary.simpleMessage(
      "Ajude a deixar o Squawker ainda melhor",
    ),
    "help_support_fritters_future": MessageLookupByLibrary.simpleMessage(
      "Ajude a apoiar o futuro do Squawker",
    ),
    "hide_sensitive_tweets": MessageLookupByLibrary.simpleMessage(
      "Ocultar tweets sensíveis",
    ),
    "home": MessageLookupByLibrary.simpleMessage("Início"),
    "if_you_have_any_feedback_on_this_feature_please_leave_it_on":
        MessageLookupByLibrary.simpleMessage(
          "Se você tiver algum comentário sobre esse recurso, deixe-o em",
        ),
    "import": MessageLookupByLibrary.simpleMessage("Importar"),
    "import_data_from_another_device": MessageLookupByLibrary.simpleMessage(
      "Importar dados de outro dispositivo",
    ),
    "import_from_twitter": MessageLookupByLibrary.simpleMessage(
      "Importar do Twitter/X",
    ),
    "import_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Importar inscrições",
    ),
    "imported_snapshot_data_users_so_far": m7,
    "include_replies": MessageLookupByLibrary.simpleMessage(
      "Incluir respostas",
    ),
    "include_retweets": MessageLookupByLibrary.simpleMessage(
      "Incluir retweets",
    ),
    "joined": m8,
    "keep_feed_offset_description": MessageLookupByLibrary.simpleMessage(
      "A posição da linha do tempo é mantida para os feeds quando o aplicativo é reiniciado",
    ),
    "keep_feed_offset_label": MessageLookupByLibrary.simpleMessage(
      "Manter a posição dos feeds",
    ),
    "language": MessageLookupByLibrary.simpleMessage("Idioma"),
    "language_subtitle": MessageLookupByLibrary.simpleMessage(
      "Requer um reinício",
    ),
    "large": MessageLookupByLibrary.simpleMessage("Grande"),
    "leaner_feeds_description": MessageLookupByLibrary.simpleMessage(
      "As prévias dos links não serão mostrados nos tweets dos feeds",
    ),
    "leaner_feeds_label": MessageLookupByLibrary.simpleMessage(
      "Feeds mais magros",
    ),
    "legacy_android_import": MessageLookupByLibrary.simpleMessage(
      "Importação do Android antigo",
    ),
    "let_the_developers_know_if_something_is_broken":
        MessageLookupByLibrary.simpleMessage(
          "Deixe os desenvolvedores saberem se algo está quebrado",
        ),
    "libre_translate_host": MessageLookupByLibrary.simpleMessage(
      "Host do LibreTranslate",
    ),
    "licenses": MessageLookupByLibrary.simpleMessage("Licenças"),
    "light": MessageLookupByLibrary.simpleMessage("Claro"),
    "live": MessageLookupByLibrary.simpleMessage("LIVE"),
    "logging": MessageLookupByLibrary.simpleMessage("Criando Log"),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "mandatory_label": MessageLookupByLibrary.simpleMessage(
      "Campos obrigatórios:",
    ),
    "material_3": MessageLookupByLibrary.simpleMessage("Material 3?"),
    "media": MessageLookupByLibrary.simpleMessage("Mídia"),
    "media_size": MessageLookupByLibrary.simpleMessage("Tamanho da mídia"),
    "medium": MessageLookupByLibrary.simpleMessage("Média"),
    "missing_page": MessageLookupByLibrary.simpleMessage("Página ausente"),
    "mute_video_description": MessageLookupByLibrary.simpleMessage(
      "Se os vídeos devem ser silenciados por padrão",
    ),
    "mute_videos": MessageLookupByLibrary.simpleMessage("Silenciar vídeos"),
    "name": MessageLookupByLibrary.simpleMessage("Nome"),
    "name_label": MessageLookupByLibrary.simpleMessage("Nome:"),
    "nbr_guest_accounts": m9,
    "newTrans": MessageLookupByLibrary.simpleMessage("Novo"),
    "next": MessageLookupByLibrary.simpleMessage("Próximo"),
    "no": MessageLookupByLibrary.simpleMessage("Não"),
    "no_data_was_returned_which_should_never_happen_please_report_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "Nenhum dado foi retornado, o que nunca deveria acontecer. Por favor, reporte um bug, se possível!",
        ),
    "no_results": MessageLookupByLibrary.simpleMessage("Nenhum resultado"),
    "no_results_for": MessageLookupByLibrary.simpleMessage(
      "Sem resultados para:",
    ),
    "no_subscriptions_try_searching_or_importing_some":
        MessageLookupByLibrary.simpleMessage(
          "Nenhuma inscrição. Tente pesquisar ou importar alguns!",
        ),
    "not_logged_in": MessageLookupByLibrary.simpleMessage("Não está logado"),
    "not_set": MessageLookupByLibrary.simpleMessage("Não configurado"),
    "note_due_to_a_twitter_limitation_not_all_tweets_may_be_included":
        MessageLookupByLibrary.simpleMessage(
          "Observação: devido a uma limitação do Twitter/X, nem todos os tweets podem ser incluídos",
        ),
    "numberFormat_format_total_votes": m10,
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "only_public_subscriptions_can_be_imported":
        MessageLookupByLibrary.simpleMessage(
          "As inscrições só podem ser importadas de perfis públicos",
        ),
    "oops_something_went_wrong": MessageLookupByLibrary.simpleMessage(
      "Ops! Algo deu errado 🥲",
    ),
    "open_app_settings": MessageLookupByLibrary.simpleMessage(
      "Abrir as configurações do aplicativo",
    ),
    "open_in_browser": MessageLookupByLibrary.simpleMessage(
      "Abrir no navegador",
    ),
    "option_confirm_close_description": MessageLookupByLibrary.simpleMessage(
      "Confirmar quando fechar o aplicativo",
    ),
    "option_confirm_close_label": MessageLookupByLibrary.simpleMessage(
      "Confirmar fechamento",
    ),
    "option_navigation_animations_description":
        MessageLookupByLibrary.simpleMessage(
          "Habilitar as animações de navegação",
        ),
    "option_navigation_animations_label": MessageLookupByLibrary.simpleMessage(
      "Animações de navegação",
    ),
    "option_show_navigation_labels_description":
        MessageLookupByLibrary.simpleMessage(
          "Mostrar os rótulos dos ícones da barra de navegação",
        ),
    "option_show_navigation_labels_label": MessageLookupByLibrary.simpleMessage(
      "Rótulos da barra de navegação",
    ),
    "optional_label": MessageLookupByLibrary.simpleMessage("Campos opcionais:"),
    "page_not_found": MessageLookupByLibrary.simpleMessage(
      "Twitter/X diz que a página não existe, mas isso pode não ser verdade",
    ),
    "password_label": MessageLookupByLibrary.simpleMessage("Senha:"),
    "permission_not_granted": MessageLookupByLibrary.simpleMessage(
      "Permissão não concedida. Por favor, tente novamente após a concessão!",
    ),
    "phone_label": MessageLookupByLibrary.simpleMessage("Telefone:"),
    "pick_a_color": MessageLookupByLibrary.simpleMessage("Escolha uma cor!"),
    "pick_an_icon": MessageLookupByLibrary.simpleMessage("Escolher um ícone!"),
    "pinned_tweet": MessageLookupByLibrary.simpleMessage("Tweet fixado"),
    "playback_speed": MessageLookupByLibrary.simpleMessage(
      "Velocidade de reprodução",
    ),
    "please_check_your_internet_connection_error_message": m11,
    "please_enter_a_name": MessageLookupByLibrary.simpleMessage(
      "Por favor, digite um nome",
    ),
    "please_make_sure_the_data_you_wish_to_import_is_located_there_then_press_the_import_button_below":
        MessageLookupByLibrary.simpleMessage(
          "Certifique-se de que os dados que deseja importar estão localizados lá e pressione o botão de importação abaixo.",
        ),
    "please_note_that_the_method_fritter_uses_to_import_subscriptions_is_heavily_rate_limited_by_twitter_so_this_may_fail_if_you_have_a_lot_of_followed_accounts":
        MessageLookupByLibrary.simpleMessage(
          "Observe que o método que o Squawker usa para importar inscrições é fortemente limitado pelo Twitter/X, portanto, isso pode falhar se você estiver seguindo muitas contas.",
        ),
    "possibly_sensitive": MessageLookupByLibrary.simpleMessage(
      "Potencialmente sensível",
    ),
    "possibly_sensitive_profile": MessageLookupByLibrary.simpleMessage(
      "Este perfil pode conter imagens, idiomas, ou outros conteúdos potencialmente sensíveis. Você ainda quer vê-lo?",
    ),
    "possibly_sensitive_tweet": MessageLookupByLibrary.simpleMessage(
      "Este tweet contém conteúdo potencialmente sensível. Você gostaria de vê-lo?",
    ),
    "prefix": MessageLookupByLibrary.simpleMessage("prefixo"),
    "private_profile": MessageLookupByLibrary.simpleMessage("Perfil privado"),
    "proxy_description": MessageLookupByLibrary.simpleMessage(
      "Proxy para todas as solicitações",
    ),
    "proxy_error": MessageLookupByLibrary.simpleMessage("Erro de proxy"),
    "proxy_label": MessageLookupByLibrary.simpleMessage("Proxy"),
    "regular_accounts": m12,
    "released_under_the_mit_license": MessageLookupByLibrary.simpleMessage(
      "Lançado sob a licença MIT",
    ),
    "remove_from_feed": MessageLookupByLibrary.simpleMessage("Remover do feed"),
    "replying_to": MessageLookupByLibrary.simpleMessage("Respondendo a"),
    "report": MessageLookupByLibrary.simpleMessage("Reportar"),
    "report_a_bug": MessageLookupByLibrary.simpleMessage("Reportar um erro"),
    "reporting_an_error": MessageLookupByLibrary.simpleMessage(
      "Relatar um erro",
    ),
    "reset_home_pages": MessageLookupByLibrary.simpleMessage(
      "Redefinir páginas para o padrão",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Tentar novamente"),
    "save": MessageLookupByLibrary.simpleMessage("Salvar"),
    "save_bandwidth_using_smaller_images": MessageLookupByLibrary.simpleMessage(
      "Economize largura de banda com imagens menores",
    ),
    "saved": MessageLookupByLibrary.simpleMessage("Salvo"),
    "saved_tweet_too_large": MessageLookupByLibrary.simpleMessage(
      "Este tweet salvo não pôde ser exibido porque é muito grande para carregar. Por favor, denuncie aos desenvolvedores.",
    ),
    "search": MessageLookupByLibrary.simpleMessage("Buscar"),
    "search_term": MessageLookupByLibrary.simpleMessage("Buscar termo"),
    "select": MessageLookupByLibrary.simpleMessage("Selecionar"),
    "selecting_individual_accounts_to_import_and_assigning_groups_are_both_planned_for_the_future_already":
        MessageLookupByLibrary.simpleMessage(
          "A seleção de contas individuais para importação e a atribuição de grupos já estão planejadas para o futuro!",
        ),
    "send": MessageLookupByLibrary.simpleMessage("Enviar"),
    "settings": MessageLookupByLibrary.simpleMessage("Configurações"),
    "share_base_url": MessageLookupByLibrary.simpleMessage(
      "URL de compartilhamento personalizado",
    ),
    "share_base_url_description": MessageLookupByLibrary.simpleMessage(
      "Use um URL base personalizado ao compartilhar",
    ),
    "share_tweet_as_image": MessageLookupByLibrary.simpleMessage(
      "Compartilhar tweet como imagem",
    ),
    "share_tweet_content": MessageLookupByLibrary.simpleMessage(
      "Compartilhar conteúdo do tweet",
    ),
    "share_tweet_content_and_link": MessageLookupByLibrary.simpleMessage(
      "Compartilhar conteúdo e link do tweet",
    ),
    "share_tweet_link": MessageLookupByLibrary.simpleMessage(
      "Compartilhar link do tweet",
    ),
    "should_check_for_updates_description":
        MessageLookupByLibrary.simpleMessage(
          "Verificar se há atualizações quando o Squawker iniciar",
        ),
    "should_check_for_updates_label": MessageLookupByLibrary.simpleMessage(
      "Verificar se há atualizações",
    ),
    "small": MessageLookupByLibrary.simpleMessage("Pequena"),
    "something_broke_in_fritter": MessageLookupByLibrary.simpleMessage(
      "Algo quebrou no Squawker.",
    ),
    "something_just_went_wrong_in_fritter_and_an_error_report_has_been_generated":
        MessageLookupByLibrary.simpleMessage(
          "Algo deu errado no Squawker e um relatório de erro foi gerado. O relatório pode ser enviado aos desenvolvedores do Squawker para ajudar a corrigir o problema.",
        ),
    "sorry_the_replied_tweet_could_not_be_found":
        MessageLookupByLibrary.simpleMessage(
          "Desculpe, o tweet respondido não foi encontrado!",
        ),
    "subscribe": MessageLookupByLibrary.simpleMessage("Inscrever-se"),
    "subscriptions": MessageLookupByLibrary.simpleMessage("Inscrições"),
    "subtitles": MessageLookupByLibrary.simpleMessage("Legendas"),
    "successfully_saved_the_media": MessageLookupByLibrary.simpleMessage(
      "Salvou a mídia!",
    ),
    "system": MessageLookupByLibrary.simpleMessage("Sistema"),
    "tap_to_download_release_version": m13,
    "tap_to_show_getMediaType_item_type": m14,
    "thanks_for_helping_fritter": MessageLookupByLibrary.simpleMessage(
      "Obrigado por ajudar o Squawker! 💖",
    ),
    "the_file_does_not_exist_please_ensure_it_is_located_at_file_path": m15,
    "the_github_issue": MessageLookupByLibrary.simpleMessage(
      "o problema do GitHub (#143)",
    ),
    "the_tweet_did_not_contain_any_text_this_is_unexpected":
        MessageLookupByLibrary.simpleMessage(
          "O tweet não continha nenhum texto. Isso é inesperado",
        ),
    "theme": MessageLookupByLibrary.simpleMessage("Tema"),
    "theme_mode": MessageLookupByLibrary.simpleMessage("Modo Tema"),
    "there_were_no_trends_returned_this_is_unexpected_please_report_as_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "Não houve tendências devolvidas. Isso é inesperado! Por favor, reporte como um bug, se possível.",
        ),
    "this_group_contains_no_subscriptions":
        MessageLookupByLibrary.simpleMessage(
          "Este grupo não contém inscrições!",
        ),
    "this_took_too_long_to_load_please_check_your_network_connection":
        MessageLookupByLibrary.simpleMessage(
          "Isso demorou muito para carregar. Verifique sua conexão de rede!",
        ),
    "this_tweet_is_unavailable": MessageLookupByLibrary.simpleMessage(
      "Este tweet está indisponível. Provavelmente foi deletado.",
    ),
    "this_tweet_user_name_retweeted": m16,
    "this_user_does_not_follow_anyone": MessageLookupByLibrary.simpleMessage(
      "Este usuário não segue ninguém!",
    ),
    "this_user_does_not_have_anyone_following_them":
        MessageLookupByLibrary.simpleMessage(
          "Este usuário não tem nenhum seguidor!",
        ),
    "thread": MessageLookupByLibrary.simpleMessage("Thread"),
    "thumbnail": MessageLookupByLibrary.simpleMessage("Miniatura"),
    "thumbnail_not_available": MessageLookupByLibrary.simpleMessage(
      "Miniatura não disponivel",
    ),
    "timed_out": MessageLookupByLibrary.simpleMessage("Tempo esgotado"),
    "to_import_specific_subscriptions_enter_your_comma_separated_usernames_below":
        MessageLookupByLibrary.simpleMessage(
          "Para importar inscrições específicas, insira abaixo seus nomes de usuário separados por vírgulas.",
        ),
    "to_import_subscriptions_from_an_existing_twitter_account_enter_your_username_below":
        MessageLookupByLibrary.simpleMessage(
          "Para importar assinaturas de uma conta existente do Twitter/X, digite seu nome de usuário abaixo.",
        ),
    "toggle_all": MessageLookupByLibrary.simpleMessage("Alternar Tudo"),
    "translator_label": MessageLookupByLibrary.simpleMessage("Tradutor"),
    "translators_description": MessageLookupByLibrary.simpleMessage(
      "Use instâncias personalizadas do LibreTranslate",
    ),
    "translators_label": MessageLookupByLibrary.simpleMessage("Tradutores"),
    "trending": MessageLookupByLibrary.simpleMessage("Tendência"),
    "trends": MessageLookupByLibrary.simpleMessage("Tendências"),
    "true_black": MessageLookupByLibrary.simpleMessage("Preto Verdadeiro?"),
    "tweet_font_size_description": MessageLookupByLibrary.simpleMessage(
      "Tamanho da fonte dos tweets",
    ),
    "tweet_font_size_label": MessageLookupByLibrary.simpleMessage(
      "Tamanho da fonte",
    ),
    "tweets": MessageLookupByLibrary.simpleMessage("Tweets"),
    "tweets_and_replies": MessageLookupByLibrary.simpleMessage(
      "Tweets e Respostas",
    ),
    "tweets_number": m17,
    "twitter_account_types_both": MessageLookupByLibrary.simpleMessage(
      "Convidado e regular",
    ),
    "twitter_account_types_description": MessageLookupByLibrary.simpleMessage(
      "Tipo de conta para ser usada",
    ),
    "twitter_account_types_label": MessageLookupByLibrary.simpleMessage(
      "Tipo de conta",
    ),
    "twitter_account_types_only_regular": MessageLookupByLibrary.simpleMessage(
      "Apenas as regulares",
    ),
    "twitter_account_types_priority_to_regular":
        MessageLookupByLibrary.simpleMessage("Priorizar contas regulares"),
    "two_home_pages_required": MessageLookupByLibrary.simpleMessage(
      "Você precisa ter pelo menos 2 páginas iniciais.",
    ),
    "unable_to_find_the_available_trend_locations":
        MessageLookupByLibrary.simpleMessage(
          "Não foi possível encontrar os locais de tendências disponíveis.",
        ),
    "unable_to_find_your_saved_tweets": MessageLookupByLibrary.simpleMessage(
      "Não foi possível encontrar seus tweets salvos.",
    ),
    "unable_to_import": MessageLookupByLibrary.simpleMessage(
      "Não foi possível importar",
    ),
    "unable_to_load_home_pages": MessageLookupByLibrary.simpleMessage(
      "Não foi possível carregar suas páginas iniciais",
    ),
    "unable_to_load_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "Não foi possível carregar os grupos de inscrições",
    ),
    "unable_to_load_the_group": MessageLookupByLibrary.simpleMessage(
      "Não foi possível carregar o grupo",
    ),
    "unable_to_load_the_group_settings": MessageLookupByLibrary.simpleMessage(
      "Não foi possível carregar as configurações do grupo",
    ),
    "unable_to_load_the_list_of_follows": MessageLookupByLibrary.simpleMessage(
      "Não foi possível carregar a lista de seguidores",
    ),
    "unable_to_load_the_next_page_of_follows":
        MessageLookupByLibrary.simpleMessage(
          "Não foi possível carregar a próxima página de seguidores",
        ),
    "unable_to_load_the_next_page_of_replies":
        MessageLookupByLibrary.simpleMessage(
          "Não foi possível carregar a próxima página de respostas",
        ),
    "unable_to_load_the_next_page_of_tweets":
        MessageLookupByLibrary.simpleMessage(
          "Não foi possível carregar a próxima página de tweets",
        ),
    "unable_to_load_the_profile": MessageLookupByLibrary.simpleMessage(
      "Não foi possível carregar o perfil",
    ),
    "unable_to_load_the_search_results": MessageLookupByLibrary.simpleMessage(
      "Não foi possível carregar os resultados da pesquisa.",
    ),
    "unable_to_load_the_trends_for_widget_place_name": m18,
    "unable_to_load_the_tweet": MessageLookupByLibrary.simpleMessage(
      "Não foi possível carregar o tweet",
    ),
    "unable_to_load_the_tweets": MessageLookupByLibrary.simpleMessage(
      "Não foi possível carregar os tweets",
    ),
    "unable_to_load_the_tweets_for_the_feed":
        MessageLookupByLibrary.simpleMessage(
          "Não foi possível carregar os tweets para o feed",
        ),
    "unable_to_refresh_the_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Incapaz de atualizar as inscrições",
    ),
    "unable_to_run_the_database_migrations":
        MessageLookupByLibrary.simpleMessage(
          "Não é possível executar as migrações de banco de dados",
        ),
    "unable_to_save_the_media_twitter_returned_a_status_of_response_statusCode":
        m19,
    "unable_to_stream_the_trend_location_preference":
        MessageLookupByLibrary.simpleMessage(
          "Não é possível transmitir a preferência de localização da tendência",
        ),
    "unknown": MessageLookupByLibrary.simpleMessage("Desconhecido"),
    "unsave": MessageLookupByLibrary.simpleMessage("Remover dos salvos"),
    "unsubscribe": MessageLookupByLibrary.simpleMessage("Cancelar inscrição"),
    "unsupported_url": MessageLookupByLibrary.simpleMessage(
      "URL não suportado",
    ),
    "update_to_release_version_through_your_fdroid_client": m20,
    "updates": MessageLookupByLibrary.simpleMessage("Atualizações"),
    "use_true_black_for_the_dark_mode_theme":
        MessageLookupByLibrary.simpleMessage(
          "Use preto verdadeiro para o tema do modo escuro",
        ),
    "user_not_found": MessageLookupByLibrary.simpleMessage(
      "Usuário não encontrado",
    ),
    "username": MessageLookupByLibrary.simpleMessage("Nome de usuário"),
    "username_exclude": MessageLookupByLibrary.simpleMessage(
      "Nome de usuário a ser excluído",
    ),
    "username_label": MessageLookupByLibrary.simpleMessage("Usuário:"),
    "usernames": MessageLookupByLibrary.simpleMessage("Usuários"),
    "version": MessageLookupByLibrary.simpleMessage("Versão"),
    "warning_regular_account_unauthenticated_access_description":
        MessageLookupByLibrary.simpleMessage(
          "O Twitter/X desativou a capacidade de criar contas de convidados. Agora você deve definir contas regulares em Configurações/Conta. Sem conta, o acesso parcial é limitado apenas a tweets e perfis. É fácil criar uma conta regular anônima conforme explicado aqui:",
        ),
    "warning_regular_account_unauthenticated_access_title":
        MessageLookupByLibrary.simpleMessage(
          "Contas regulares e acesso não autenticado",
        ),
    "when_a_new_app_update_is_available": MessageLookupByLibrary.simpleMessage(
      "Quando uma nova atualização do aplicativo está disponível",
    ),
    "whether_errors_should_be_reported_to_":
        MessageLookupByLibrary.simpleMessage(
          "Se os erros devem ser relatados ao ",
        ),
    "whether_to_hide_tweets_marked_as_sensitive":
        MessageLookupByLibrary.simpleMessage(
          "Se os tweets marcados como sensíveis devem ser ocultados",
        ),
    "which_tab_is_shown_when_the_app_opens":
        MessageLookupByLibrary.simpleMessage(
          "Qual aba é mostrada quando o aplicativo é aberto",
        ),
    "which_tab_is_shown_when_the_subscription_opens":
        MessageLookupByLibrary.simpleMessage(
          "Qual guia é mostrada quando as inscrições são abertas",
        ),
    "would_you_like_to_enable_automatic_error_reporting":
        MessageLookupByLibrary.simpleMessage(
          "Deseja ativar o relatório automático de erros?",
        ),
    "x_api": MessageLookupByLibrary.simpleMessage("API do X"),
    "x_client_transaction_id_provider": MessageLookupByLibrary.simpleMessage(
      "Provedor do x-client-transaction-id",
    ),
    "x_client_transaction_id_provider_description":
        MessageLookupByLibrary.simpleMessage(
          "Configure o provedor do x-client-transaction-id. Ele tem que ser um domínio, sem https. Referencia: https://github.com/Teskann/x-client-transaction-id-generator",
        ),
    "yes": MessageLookupByLibrary.simpleMessage("Sim"),
    "yes_please": MessageLookupByLibrary.simpleMessage("Sim, por favor"),
    "you_have_not_saved_any_tweets_yet": MessageLookupByLibrary.simpleMessage(
      "Você ainda não salvou nenhum tweet!",
    ),
    "you_must_have_at_least_2_home_screen_pages":
        MessageLookupByLibrary.simpleMessage(
          "Você deve ter pelo menos 2 páginas de tela inicial",
        ),
    "your_profile_must_be_public_otherwise_the_import_will_not_work":
        MessageLookupByLibrary.simpleMessage(
          "Seu perfil deve ser público, caso contrário a importação não funcionará",
        ),
    "your_report_will_be_sent_to_fritter__project":
        MessageLookupByLibrary.simpleMessage(
          "Seu relatório será enviado para o projeto  do Squawker, e os detalhes de privacidade podem ser encontrados em:",
        ),
  };
}
