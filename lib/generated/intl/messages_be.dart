// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a be locale. All the
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
  String get localeName => 'be';

  static String m0(name) =>
      "Вы ўпэўненыя, што жадаеце выдаліць групу падпісак ${name}?";

  static String m1(fileName) => "Дадзеныя экспартуюцца ў ${fileName}";

  static String m2(fullPath) => "Дадзеныя экспартуюцца ў ${fullPath}";

  static String m3(timeagoFormat) => "Завершана ${timeagoFormat}";

  static String m4(timeagoFormat) => "Завершыцца праз ${timeagoFormat}";

  static String m5(snapshotData) =>
      "Завершана праца з акаўнтамі ${snapshotData}";

  static String m6(name) => "Група: ${name}";

  static String m7(snapshotData) =>
      "Імпартавана ${snapshotData} акаўнтаў на дадзены момант";

  static String m8(date) => "Рэгістрацыя: ${date}";

  static String m10(num, numFormatted) =>
      "${Intl.plural(num, zero: 'няма галасоў', one: 'голас', two: 'галасы', few: '${numFormatted} галасы', many: '${numFormatted} галасоў', other: '${numFormatted} голас')}";

  static String m11(errorMessage) =>
      "Калі ласка, праверце вашае сеткавае падлучэнне.\n\n${errorMessage}";

  static String m13(releaseVersion) =>
      "Націсніце, каб усталяваць ${releaseVersion}";

  static String m14(getMediaType) => "Націсніце, каб паказаць ${getMediaType}";

  static String m15(filePath) =>
      "Файл не існуе. Калі ласка, упэўніцеся, што ён знаходзіцца па адрасе ${filePath}";

  static String m16(thisTweetUserName, timeAgo) =>
      "${thisTweetUserName} ретвітнуў(ла) ${timeAgo}";

  static String m17(num, numFormatted) =>
      "${Intl.plural(num, zero: 'няма твітаў', one: 'твіт', two: 'твіта', few: '${numFormatted} твіты', many: '${numFormatted} твитаў', other: '${numFormatted} твит')}";

  static String m18(widgetPlaceName) =>
      "Немагчыма загрузіць актуальнае для ${widgetPlaceName}";

  static String m19(responseStatusCode) =>
      "Немагчыма захаваць мэдыяфайл. Twitter/X вярнуў статус ${responseStatusCode}";

  static String m20(releaseVersion) =>
      "Абнавіць да ${releaseVersion} праз кліент F-Droid";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("Аб праграме"),
    "account_suspended": MessageLookupByLibrary.simpleMessage(
      "Уліковы запіс прыпынены",
    ),
    "activate_non_confirmation_bias_mode_description":
        MessageLookupByLibrary.simpleMessage(
          "Схаваць аўтараў твітаў. Пазбягайце прадузятасці пацверджання, заснаванага на аўтарытэтных аргументах.",
        ),
    "activate_non_confirmation_bias_mode_label":
        MessageLookupByLibrary.simpleMessage(
          "Уключыць рэжым зрушэння без пацверджання",
        ),
    "add_to_group": MessageLookupByLibrary.simpleMessage("Дадаць у групу"),
    "all": MessageLookupByLibrary.simpleMessage("Усе"),
    "all_the_great_software_used_by_fritter":
        MessageLookupByLibrary.simpleMessage(
          "Усё выдатнае праграмнае забеспячэнне, якое выкарыстоўваецца Squawker",
        ),
    "an_update_for_fritter_is_available": MessageLookupByLibrary.simpleMessage(
      "Абнаўленне Squawker даступна! 🚀",
    ),
    "are_you_sure": MessageLookupByLibrary.simpleMessage("Вы ўпэўнены?"),
    "are_you_sure_you_want_to_delete_the_subscription_group_name_of_group": m0,
    "back": MessageLookupByLibrary.simpleMessage("Назад"),
    "bad_guest_token": MessageLookupByLibrary.simpleMessage(
      "Twitter/X прызнаў несапраўдным наш маркер доступу. Калі ласка, паспрабуйце зноў адкрыць Squawker!",
    ),
    "blue_theme_based_on_the_twitter_color_scheme":
        MessageLookupByLibrary.simpleMessage(
          "Сіняя тэма, заснаваная на каляровай схеме Twitter/X",
        ),
    "cancel": MessageLookupByLibrary.simpleMessage("Скасаваць"),
    "catastrophic_failure": MessageLookupByLibrary.simpleMessage(
      "Крытычная памылка",
    ),
    "choose": MessageLookupByLibrary.simpleMessage("Выбраць"),
    "close": MessageLookupByLibrary.simpleMessage("Закрыць"),
    "confirm_close_fritter": MessageLookupByLibrary.simpleMessage(
      "Вы сапраўды хочаце закрыць Squawker?",
    ),
    "contribute": MessageLookupByLibrary.simpleMessage("Падтрымаць"),
    "copied_address_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "Адрас скапіяваны ў буфер абмену",
    ),
    "copied_version_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "Версія скапіяваная ў буфер абмену",
    ),
    "could_not_contact_twitter": MessageLookupByLibrary.simpleMessage(
      "Не атрымоўваецца звязацца з Twitter/X",
    ),
    "could_not_find_any_tweets_by_this_user":
        MessageLookupByLibrary.simpleMessage(
          "Не атрымалася знайсці ні аднаго твіту гэтага карыстальніка!",
        ),
    "could_not_find_any_tweets_from_the_last_7_days":
        MessageLookupByLibrary.simpleMessage(
          "Не атрымліваецца знайсці якія-небудзь твіты за апошнія 7 дзён!",
        ),
    "country": MessageLookupByLibrary.simpleMessage("Краіна"),
    "dark": MessageLookupByLibrary.simpleMessage("Цёмная"),
    "data": MessageLookupByLibrary.simpleMessage("Дадзеныя"),
    "data_exported_to_fileName": m1,
    "data_exported_to_fullPath": m2,
    "data_imported_successfully": MessageLookupByLibrary.simpleMessage(
      "Дадзеныя паспяхова імпартаваны",
    ),
    "date_created": MessageLookupByLibrary.simpleMessage("Дата стварэння"),
    "date_subscribed": MessageLookupByLibrary.simpleMessage("Дата падпіскі"),
    "default_tab": MessageLookupByLibrary.simpleMessage("Укладка па змаўчанні"),
    "delete": MessageLookupByLibrary.simpleMessage("Выдаліць"),
    "disable_screenshots": MessageLookupByLibrary.simpleMessage(
      "Адключыць скрыншоты",
    ),
    "disable_screenshots_hint": MessageLookupByLibrary.simpleMessage(
      "Прадухіленне стварэння скрыншотаў. Гэта можа працаваць не на ўсіх прыладах.",
    ),
    "disabled": MessageLookupByLibrary.simpleMessage("Адключана"),
    "donate": MessageLookupByLibrary.simpleMessage("Падтрымаць праект"),
    "download": MessageLookupByLibrary.simpleMessage("Спампаваць"),
    "download_handling": MessageLookupByLibrary.simpleMessage(
      "Апрацоўка загрузкі",
    ),
    "download_handling_description": MessageLookupByLibrary.simpleMessage(
      "Як павінна працаваць спампоўка",
    ),
    "download_handling_type_ask": MessageLookupByLibrary.simpleMessage(
      "Заўсёды пытаць",
    ),
    "download_handling_type_directory": MessageLookupByLibrary.simpleMessage(
      "Захаваць у тэчку",
    ),
    "download_media_no_url": MessageLookupByLibrary.simpleMessage(
      "Немагчыма загрузіць. Гэта медыя можа быць даступна толькі ў выглядзе патоку, які Squawker пакуль не можа загрузіць.",
    ),
    "download_path": MessageLookupByLibrary.simpleMessage("Шлях для спампоўкі"),
    "downloading_media": MessageLookupByLibrary.simpleMessage(
      "Загрузка медыя...",
    ),
    "enable_": MessageLookupByLibrary.simpleMessage("Актываваць ?"),
    "ended_timeago_format_endsAt_allowFromNow_true": m3,
    "ends_timeago_format_endsAt_allowFromNow_true": m4,
    "enter_your_twitter_username": MessageLookupByLibrary.simpleMessage(
      "Увядзіце Ваша імя карыстальніка ў Twitter/X",
    ),
    "export": MessageLookupByLibrary.simpleMessage("Экспартаваць"),
    "export_settings": MessageLookupByLibrary.simpleMessage(
      "Экспартаваць наладкі?",
    ),
    "export_subscription_group_members": MessageLookupByLibrary.simpleMessage(
      "Экспартаваць удзельнікаў груп падпісак?",
    ),
    "export_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "Экспартаваць групы падпісак?",
    ),
    "export_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Экспартаваць падпіскі?",
    ),
    "export_tweets": MessageLookupByLibrary.simpleMessage(
      "Экспартаваць твіты?",
    ),
    "export_your_data": MessageLookupByLibrary.simpleMessage(
      "Экспартаваць вашыя дадзеныя",
    ),
    "feed": MessageLookupByLibrary.simpleMessage("Стужка"),
    "filters": MessageLookupByLibrary.simpleMessage("Фільтры"),
    "finished_with_snapshotData_users": m5,
    "followers": MessageLookupByLibrary.simpleMessage("Чытачы"),
    "following": MessageLookupByLibrary.simpleMessage("Чытае"),
    "forbidden": MessageLookupByLibrary.simpleMessage(
      "Twitter/X кажа, што доступ да гэтага забаронены",
    ),
    "fritter": MessageLookupByLibrary.simpleMessage("Squawker"),
    "fritter_blue": MessageLookupByLibrary.simpleMessage("Squawker blue"),
    "general": MessageLookupByLibrary.simpleMessage("Асноўныя"),
    "group_name": m6,
    "groups": MessageLookupByLibrary.simpleMessage("Групы"),
    "help_make_fritter_even_better": MessageLookupByLibrary.simpleMessage(
      "Дапамажыце зрабіць Squawker яшчэ лепш",
    ),
    "help_support_fritters_future": MessageLookupByLibrary.simpleMessage(
      "Падтрымайце будучыню Squawker",
    ),
    "hide_sensitive_tweets": MessageLookupByLibrary.simpleMessage(
      "Хаваць чуллівы кантэнт",
    ),
    "home": MessageLookupByLibrary.simpleMessage("Галоўная"),
    "if_you_have_any_feedback_on_this_feature_please_leave_it_on":
        MessageLookupByLibrary.simpleMessage(
          "Калі ў вас ёсць водгукі аб гэтай функцыі, калі ласка, пакіньце іх на",
        ),
    "import": MessageLookupByLibrary.simpleMessage("Імпартаваць"),
    "import_data_from_another_device": MessageLookupByLibrary.simpleMessage(
      "Імпартаваць дадзеныя з іншай прылады",
    ),
    "import_from_twitter": MessageLookupByLibrary.simpleMessage(
      "Імпартаваць з Twitter/X",
    ),
    "import_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Імпартаваць падпіскі",
    ),
    "imported_snapshot_data_users_so_far": m7,
    "include_replies": MessageLookupByLibrary.simpleMessage("Уключаючы адказы"),
    "include_retweets": MessageLookupByLibrary.simpleMessage(
      "Уключаючы рэтвіты",
    ),
    "joined": m8,
    "language": MessageLookupByLibrary.simpleMessage("Мова"),
    "language_subtitle": MessageLookupByLibrary.simpleMessage(
      "Неабходны перазапуск",
    ),
    "large": MessageLookupByLibrary.simpleMessage("Вялікі"),
    "legacy_android_import": MessageLookupByLibrary.simpleMessage(
      "Імпарт з устарэлай версіі Android",
    ),
    "let_the_developers_know_if_something_is_broken":
        MessageLookupByLibrary.simpleMessage(
          "Паведаміце распрацоўшчыкам калі нешта пайшло не так",
        ),
    "licenses": MessageLookupByLibrary.simpleMessage("Ліцэнзіі"),
    "light": MessageLookupByLibrary.simpleMessage("Светлая"),
    "live": MessageLookupByLibrary.simpleMessage("Прамы эфір"),
    "logging": MessageLookupByLibrary.simpleMessage("Журнал"),
    "media": MessageLookupByLibrary.simpleMessage("Медыя"),
    "media_size": MessageLookupByLibrary.simpleMessage("Памер медыя"),
    "medium": MessageLookupByLibrary.simpleMessage("Сярэдні"),
    "name": MessageLookupByLibrary.simpleMessage("Імя"),
    "newTrans": MessageLookupByLibrary.simpleMessage("Новыя"),
    "no": MessageLookupByLibrary.simpleMessage("Не"),
    "no_data_was_returned_which_should_never_happen_please_report_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "Ніякія дадзеныя не былі вернуты, чаго ніколі не павінна адбывацца. Калі ласка, паведамце аб памылцы, калі гэта магчыма!",
        ),
    "no_results": MessageLookupByLibrary.simpleMessage("Нічога не знойдзена"),
    "no_results_for": MessageLookupByLibrary.simpleMessage(
      "Вынікі адсутнічаюць:",
    ),
    "no_subscriptions_try_searching_or_importing_some":
        MessageLookupByLibrary.simpleMessage(
          "Няма падпісак. Паспрабуйце пашукаць або імпартаваць нешта!",
        ),
    "not_set": MessageLookupByLibrary.simpleMessage("Не ўстаноўлена"),
    "note_due_to_a_twitter_limitation_not_all_tweets_may_be_included":
        MessageLookupByLibrary.simpleMessage(
          "Заўвага: У сувязі з абмежаваннем Twitter/X, не ўсе твіты могуць быць уключаны",
        ),
    "numberFormat_format_total_votes": m10,
    "ok": MessageLookupByLibrary.simpleMessage("Добра"),
    "oops_something_went_wrong": MessageLookupByLibrary.simpleMessage(
      "Ой! Нешта пайшло не так 🥲",
    ),
    "open_app_settings": MessageLookupByLibrary.simpleMessage(
      "Адкрыць налады прыкладання",
    ),
    "page_not_found": MessageLookupByLibrary.simpleMessage(
      "Twitter/X кажа, што гэтая старонка не існуе, але гэта можа быць няпраўдай",
    ),
    "permission_not_granted": MessageLookupByLibrary.simpleMessage(
      "Дазвол не дадзены. Калі ласка, паспрабуйце яшчэ раз пасля прадастаўлення!",
    ),
    "pick_a_color": MessageLookupByLibrary.simpleMessage("Абярыце колер!"),
    "pick_an_icon": MessageLookupByLibrary.simpleMessage("Выберыце іконку!"),
    "pinned_tweet": MessageLookupByLibrary.simpleMessage("Замацаваны твіт"),
    "playback_speed": MessageLookupByLibrary.simpleMessage(
      "Хуткасць прайгравання",
    ),
    "please_check_your_internet_connection_error_message": m11,
    "please_enter_a_name": MessageLookupByLibrary.simpleMessage(
      "Калі ласка, увядзіце імя",
    ),
    "please_make_sure_the_data_you_wish_to_import_is_located_there_then_press_the_import_button_below":
        MessageLookupByLibrary.simpleMessage(
          "Пераканайцеся, што дадзеныя, якія вы хочаце імпартаваць, знаходзяцца там, затым націсніце кнопку імпарту ніжэй.",
        ),
    "please_note_that_the_method_fritter_uses_to_import_subscriptions_is_heavily_rate_limited_by_twitter_so_this_may_fail_if_you_have_a_lot_of_followed_accounts":
        MessageLookupByLibrary.simpleMessage(
          "Улічыце, што метад, які выкарыстоўвае Squawker для імпарту падпісак, вельмі абмежаваны хуткасцю Twitter/X, таму пры наяўнасці вялікай колькасці падпісак гэта можа не спрацаваць.",
        ),
    "possibly_sensitive": MessageLookupByLibrary.simpleMessage(
      "Магчыма чулліва",
    ),
    "possibly_sensitive_profile": MessageLookupByLibrary.simpleMessage(
      "Гэты профіль можа змяшчаць патэнцыйна чуллівыя выявы, выказванні або іншае змесціва. Вы ўсё яшчэ хочаце прагледзець яго?",
    ),
    "possibly_sensitive_tweet": MessageLookupByLibrary.simpleMessage(
      "Гэты твіт змяшчае патэнцыйна чуллівы кантэнт. Вы сапраўды хочаце яго паглядзець?",
    ),
    "prefix": MessageLookupByLibrary.simpleMessage("прэфікс"),
    "private_profile": MessageLookupByLibrary.simpleMessage("Прыватны профіль"),
    "released_under_the_mit_license": MessageLookupByLibrary.simpleMessage(
      "Апублікавана пад ліцэнзіяй MIT",
    ),
    "replying_to": MessageLookupByLibrary.simpleMessage("Адказаць"),
    "report": MessageLookupByLibrary.simpleMessage("Паведаміць"),
    "report_a_bug": MessageLookupByLibrary.simpleMessage(
      "Паведаміць аб памылцы",
    ),
    "reporting_an_error": MessageLookupByLibrary.simpleMessage(
      "Паведаміць аб памылцы",
    ),
    "reset_home_pages": MessageLookupByLibrary.simpleMessage(
      "Скід старонак да значэнняў па змаўчанні",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Паўтарыць"),
    "save": MessageLookupByLibrary.simpleMessage("Захаваць"),
    "save_bandwidth_using_smaller_images": MessageLookupByLibrary.simpleMessage(
      "Эканомце месца на экране, з выявамі меншага памеру",
    ),
    "saved": MessageLookupByLibrary.simpleMessage("Захаванае"),
    "search": MessageLookupByLibrary.simpleMessage("Пошук"),
    "search_term": MessageLookupByLibrary.simpleMessage("Пошукавы запыт"),
    "select": MessageLookupByLibrary.simpleMessage("Выбраць"),
    "selecting_individual_accounts_to_import_and_assigning_groups_are_both_planned_for_the_future_already":
        MessageLookupByLibrary.simpleMessage(
          "Выбар асобных акаўнтаў для імпарту і прызначэнне груп ужо запланаваны на будучыню!",
        ),
    "send": MessageLookupByLibrary.simpleMessage("Даслаць"),
    "share_tweet_content": MessageLookupByLibrary.simpleMessage(
      "Падзяліцца змесцівам твіту",
    ),
    "share_tweet_content_and_link": MessageLookupByLibrary.simpleMessage(
      "Адправіць змесціва і спасылку",
    ),
    "share_tweet_link": MessageLookupByLibrary.simpleMessage(
      "Падзяліцца спасылкай на твіт",
    ),
    "should_check_for_updates_description":
        MessageLookupByLibrary.simpleMessage(
          "Правяраць наяўнасць абнаўленняў пры запуску",
        ),
    "should_check_for_updates_label": MessageLookupByLibrary.simpleMessage(
      "Праверыць абнаўлення",
    ),
    "small": MessageLookupByLibrary.simpleMessage("Маленькі"),
    "something_broke_in_fritter": MessageLookupByLibrary.simpleMessage(
      "Нешта пайшло не так.",
    ),
    "something_just_went_wrong_in_fritter_and_an_error_report_has_been_generated":
        MessageLookupByLibrary.simpleMessage(
          "Нешта пайшло не так у Squawker, і была створаная справаздача аб памылцы. Справаздачу можна адправіць распрацоўнікам Squawker, каб яны маглі ўхіліць праблему.",
        ),
    "sorry_the_replied_tweet_could_not_be_found":
        MessageLookupByLibrary.simpleMessage(
          "На жаль, твіт з адказам не знойдзены!",
        ),
    "subscribe": MessageLookupByLibrary.simpleMessage("Чытаць"),
    "subscriptions": MessageLookupByLibrary.simpleMessage("Падпіскі"),
    "subtitles": MessageLookupByLibrary.simpleMessage("Субцітры"),
    "successfully_saved_the_media": MessageLookupByLibrary.simpleMessage(
      "Файл захаваны!",
    ),
    "system": MessageLookupByLibrary.simpleMessage("Сістэмная"),
    "tap_to_download_release_version": m13,
    "tap_to_show_getMediaType_item_type": m14,
    "thanks_for_helping_fritter": MessageLookupByLibrary.simpleMessage(
      "Дзякуй за дапамогу Squawker! 💖",
    ),
    "the_file_does_not_exist_please_ensure_it_is_located_at_file_path": m15,
    "the_github_issue": MessageLookupByLibrary.simpleMessage(
      "Прапанова GitHub (#143)",
    ),
    "the_tweet_did_not_contain_any_text_this_is_unexpected":
        MessageLookupByLibrary.simpleMessage(
          "Твіт не змяшчаў ніякага тэксту. Гэта нечакана",
        ),
    "theme": MessageLookupByLibrary.simpleMessage("Тэма"),
    "theme_mode": MessageLookupByLibrary.simpleMessage("Тэма"),
    "there_were_no_trends_returned_this_is_unexpected_please_report_as_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "Не было вернута нічога з актуальнага. Гэта нечакана! Калі ласка, паведаміце аб гэтым як аб памылцы, калі гэта магчыма.",
        ),
    "this_group_contains_no_subscriptions":
        MessageLookupByLibrary.simpleMessage("У гэтай групе няма падпісак!"),
    "this_took_too_long_to_load_please_check_your_network_connection":
        MessageLookupByLibrary.simpleMessage(
          "Загрузка заняла зашмат часу. Калі ласка, праверце ваша сеткавае падключэнне!",
        ),
    "this_tweet_is_unavailable": MessageLookupByLibrary.simpleMessage(
      "Гэты твіт недаступны. Магчыма ён быў выдалены.",
    ),
    "this_tweet_user_name_retweeted": m16,
    "this_user_does_not_follow_anyone": MessageLookupByLibrary.simpleMessage(
      "Гэты карыстальнік нікога не чытае!",
    ),
    "this_user_does_not_have_anyone_following_them":
        MessageLookupByLibrary.simpleMessage(
          "Гэтага карыстальніка ніхто не чытае!",
        ),
    "thread": MessageLookupByLibrary.simpleMessage("Галінка"),
    "thumbnail": MessageLookupByLibrary.simpleMessage("Мініяцюра"),
    "timed_out": MessageLookupByLibrary.simpleMessage("Час выйшаў"),
    "to_import_subscriptions_from_an_existing_twitter_account_enter_your_username_below":
        MessageLookupByLibrary.simpleMessage(
          "Каб імпартаваць падпіскі з існуючага акаўнта Twitter/X, увядзіце сваё імя карыстальніка ніжэй.",
        ),
    "toggle_all": MessageLookupByLibrary.simpleMessage("Выбраць усе"),
    "trending": MessageLookupByLibrary.simpleMessage("Актуальнае"),
    "trends": MessageLookupByLibrary.simpleMessage("Актуальныя тэмы"),
    "true_black": MessageLookupByLibrary.simpleMessage(
      "Сапраўдны чорны (AMOLED)?",
    ),
    "tweets": MessageLookupByLibrary.simpleMessage("Твіты"),
    "tweets_and_replies": MessageLookupByLibrary.simpleMessage(
      "Твіты і Адказы",
    ),
    "tweets_number": m17,
    "unable_to_find_the_available_trend_locations":
        MessageLookupByLibrary.simpleMessage(
          "Немагчыма знайсці даступныя краіны для актуальнага.",
        ),
    "unable_to_find_your_saved_tweets": MessageLookupByLibrary.simpleMessage(
      "Немагчыма знайсці вашыя захаваныя твіты.",
    ),
    "unable_to_import": MessageLookupByLibrary.simpleMessage(
      "Не атрымоўваецца імпартаваць",
    ),
    "unable_to_load_home_pages": MessageLookupByLibrary.simpleMessage(
      "Немагчыма загрузіць галоўную старонку",
    ),
    "unable_to_load_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "Не ўдаецца загрузіць групы падпісак",
    ),
    "unable_to_load_the_group": MessageLookupByLibrary.simpleMessage(
      "Немагчыма загрузіць групу",
    ),
    "unable_to_load_the_group_settings": MessageLookupByLibrary.simpleMessage(
      "Немагчыма загрузіць наладкі групы",
    ),
    "unable_to_load_the_list_of_follows": MessageLookupByLibrary.simpleMessage(
      "Не атрымоўваецца загрузіць спіс падпісак",
    ),
    "unable_to_load_the_next_page_of_follows":
        MessageLookupByLibrary.simpleMessage(
          "Не атрымоўваецца загрузіць наступную старонку чытаемых",
        ),
    "unable_to_load_the_next_page_of_replies":
        MessageLookupByLibrary.simpleMessage(
          "Не ўдаецца загрузіць наступную старонку адказаў",
        ),
    "unable_to_load_the_next_page_of_tweets":
        MessageLookupByLibrary.simpleMessage(
          "Немагчыма загрузіць наступную старонку твітаў",
        ),
    "unable_to_load_the_profile": MessageLookupByLibrary.simpleMessage(
      "Немагчыма загрузіць профіль",
    ),
    "unable_to_load_the_search_results": MessageLookupByLibrary.simpleMessage(
      "Немагчыма загрузіць вынікі пошуку.",
    ),
    "unable_to_load_the_trends_for_widget_place_name": m18,
    "unable_to_load_the_tweet": MessageLookupByLibrary.simpleMessage(
      "Не ўдаецца загрузіць твіт",
    ),
    "unable_to_load_the_tweets": MessageLookupByLibrary.simpleMessage(
      "Не атрымоўваецца загрузіць твіты",
    ),
    "unable_to_load_the_tweets_for_the_feed":
        MessageLookupByLibrary.simpleMessage(
          "Не атрымліваецца загрузіць твіты для стужкі",
        ),
    "unable_to_refresh_the_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Немагчыма абнавіць падпіскі",
    ),
    "unable_to_run_the_database_migrations":
        MessageLookupByLibrary.simpleMessage(
          "Не ўдалося зрабіць перамяшчэнне базы даных",
        ),
    "unable_to_save_the_media_twitter_returned_a_status_of_response_statusCode":
        m19,
    "unable_to_stream_the_trend_location_preference":
        MessageLookupByLibrary.simpleMessage(
          "Немагчыма выканаць перадачу мясцовых пераваг",
        ),
    "unknown": MessageLookupByLibrary.simpleMessage("Невядомы"),
    "unsave": MessageLookupByLibrary.simpleMessage("Адмяніць захаванне"),
    "unsubscribe": MessageLookupByLibrary.simpleMessage("Перастаць чытаць"),
    "update_to_release_version_through_your_fdroid_client": m20,
    "updates": MessageLookupByLibrary.simpleMessage("Абнаўленні"),
    "use_true_black_for_the_dark_mode_theme":
        MessageLookupByLibrary.simpleMessage(
          "Выкарыстоўваць сапраўдны чорны (AMOLED) для цёмнай тэмы",
        ),
    "user_not_found": MessageLookupByLibrary.simpleMessage(
      "Карыстальнік не знойдзены",
    ),
    "username": MessageLookupByLibrary.simpleMessage("Імя карыстальніка"),
    "version": MessageLookupByLibrary.simpleMessage("Версія"),
    "when_a_new_app_update_is_available": MessageLookupByLibrary.simpleMessage(
      "Калі новае абнаўленне даступна",
    ),
    "whether_errors_should_be_reported_to_":
        MessageLookupByLibrary.simpleMessage("Паведамляць пра памылкі ў "),
    "whether_to_hide_tweets_marked_as_sensitive":
        MessageLookupByLibrary.simpleMessage(
          "Ці варта хаваць твіты, пазначаныя як чуллівыя",
        ),
    "which_tab_is_shown_when_the_app_opens":
        MessageLookupByLibrary.simpleMessage(
          "Якая ўкладка адлюстроўваецца пры адкрыцці дадатку",
        ),
    "would_you_like_to_enable_automatic_error_reporting":
        MessageLookupByLibrary.simpleMessage(
          "Вы хочаце ўключыць аўтаматычнае інфармаванне аб памылках?",
        ),
    "yes": MessageLookupByLibrary.simpleMessage("Так"),
    "yes_please": MessageLookupByLibrary.simpleMessage("Так, калі ласка"),
    "you_have_not_saved_any_tweets_yet": MessageLookupByLibrary.simpleMessage(
      "Вы яшчэ не захавалі ніводнага твіту!",
    ),
    "you_must_have_at_least_2_home_screen_pages":
        MessageLookupByLibrary.simpleMessage(
          "Вы павінны ўсталяваць як мінімум дзве старонкі для галоўнага экрана",
        ),
    "your_profile_must_be_public_otherwise_the_import_will_not_work":
        MessageLookupByLibrary.simpleMessage(
          "Ваш профіль павінен быць адкрытым, інакш імпарт ня будзе працаваць",
        ),
    "your_report_will_be_sent_to_fritter__project":
        MessageLookupByLibrary.simpleMessage(
          "Ваша справаздача будзе даслана ў  Squawker, а інфармацыю пра канфідэнцыйнасць можна знайсці тут:",
        ),
  };
}
