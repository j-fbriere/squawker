// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static String m0(name) =>
      "Вы уверены, что хотите удалить группу подписок ${name}?";

  static String m1(fileName) => "Данные экспортируются в ${fileName}";

  static String m2(fullPath) => "Данные экспортируются в ${fullPath}";

  static String m3(timeagoFormat) => "Завершено ${timeagoFormat}";

  static String m4(timeagoFormat) => "Завершится через ${timeagoFormat}";

  static String m5(snapshotData) =>
      "Завершена работа с аккаунтами ${snapshotData}";

  static String m6(name) => "Группа: ${name}";

  static String m7(snapshotData) =>
      "Импортировано ${snapshotData} аккаунтов на данный момент";

  static String m8(date) => "Регистрация: ${date}";

  static String m10(num, numFormatted) =>
      "${Intl.plural(num, zero: 'нет голосов', one: 'голос', two: 'голоса', few: '${numFormatted} голосов', many: '${numFormatted} голосов', other: '${numFormatted} голос')}";

  static String m11(errorMessage) =>
      "Пожалуйста, проверьте ваше сетевое подключение.\n\n${errorMessage}";

  static String m13(releaseVersion) =>
      "Нажмите, чтобы установить ${releaseVersion}";

  static String m14(getMediaType) => "Нажмите, чтобы показать ${getMediaType}";

  static String m15(filePath) =>
      "Файл не существует. Пожалуйста, убедитесь, что он находится по адресу ${filePath}";

  static String m16(thisTweetUserName, timeAgo) =>
      "${thisTweetUserName} ретвитнул(а) ${timeAgo}";

  static String m17(num, numFormatted) =>
      "${Intl.plural(num, zero: 'нет твитов', one: 'твит', two: 'твита', few: '${numFormatted} твитов', many: '${numFormatted} твитов', other: '${numFormatted} твит')}";

  static String m18(widgetPlaceName) =>
      "Невозможно загрузить актуальное для ${widgetPlaceName}";

  static String m19(responseStatusCode) =>
      "Невозможно сохранить медиафайл. Twitter/X вернул статус ${responseStatusCode}";

  static String m20(releaseVersion) =>
      "Обновить до ${releaseVersion} через клиент F-Droid";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("О программе"),
    "account_suspended": MessageLookupByLibrary.simpleMessage(
      "Учётная запись приостановлена",
    ),
    "activate_non_confirmation_bias_mode_description":
        MessageLookupByLibrary.simpleMessage(
          "Скрывайте авторов твитов. Избегайте предубеждения подтверждения, основанного на авторитетных аргументах.",
        ),
    "activate_non_confirmation_bias_mode_label":
        MessageLookupByLibrary.simpleMessage(
          "Включить режим смещения без подтверждения",
        ),
    "add_to_group": MessageLookupByLibrary.simpleMessage("Добавить в группу"),
    "all": MessageLookupByLibrary.simpleMessage("Все"),
    "all_the_great_software_used_by_fritter":
        MessageLookupByLibrary.simpleMessage(
          "Всё замечательное программное обеспечение, используемое Squawker",
        ),
    "an_update_for_fritter_is_available": MessageLookupByLibrary.simpleMessage(
      "Обновление Squawker доступно! 🚀",
    ),
    "are_you_sure": MessageLookupByLibrary.simpleMessage("Вы уверены?"),
    "are_you_sure_you_want_to_delete_the_subscription_group_name_of_group": m0,
    "back": MessageLookupByLibrary.simpleMessage("Назад"),
    "bad_guest_token": MessageLookupByLibrary.simpleMessage(
      "Twitter/X признал недействительным наш маркер доступа. Пожалуйста, попробуйте снова открыть Squawker!",
    ),
    "blue_theme_based_on_the_twitter_color_scheme":
        MessageLookupByLibrary.simpleMessage(
          "Синяя тема, основанная на цветовой схеме Twitter/X",
        ),
    "cancel": MessageLookupByLibrary.simpleMessage("Отмена"),
    "catastrophic_failure": MessageLookupByLibrary.simpleMessage(
      "Катастрофическая ошибка",
    ),
    "choose": MessageLookupByLibrary.simpleMessage("Выбрать"),
    "close": MessageLookupByLibrary.simpleMessage("Закрыть"),
    "confirm_close_fritter": MessageLookupByLibrary.simpleMessage(
      "Вы действительно хотите закрыть Squawker?",
    ),
    "contribute": MessageLookupByLibrary.simpleMessage("Поддержать"),
    "copied_address_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "Адрес скопирован в буфер обмена",
    ),
    "copied_version_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "Версия скопирована в буфер обмена",
    ),
    "could_not_contact_twitter": MessageLookupByLibrary.simpleMessage(
      "Не удаётся связаться с Twitter/X",
    ),
    "could_not_find_any_tweets_by_this_user":
        MessageLookupByLibrary.simpleMessage(
          "Не удалось найти ни одного твита этого пользователя!",
        ),
    "could_not_find_any_tweets_from_the_last_7_days":
        MessageLookupByLibrary.simpleMessage(
          "Не удаётся найти какие-либо твиты за последние 7 дней!",
        ),
    "country": MessageLookupByLibrary.simpleMessage("Страна"),
    "dark": MessageLookupByLibrary.simpleMessage("Тёмная"),
    "data": MessageLookupByLibrary.simpleMessage("Данные"),
    "data_exported_to_fileName": m1,
    "data_exported_to_fullPath": m2,
    "data_imported_successfully": MessageLookupByLibrary.simpleMessage(
      "Данные успешно импортированы",
    ),
    "date_created": MessageLookupByLibrary.simpleMessage("Дата создания"),
    "date_subscribed": MessageLookupByLibrary.simpleMessage("Дата подписки"),
    "default_tab": MessageLookupByLibrary.simpleMessage("Вкладка по умолчанию"),
    "delete": MessageLookupByLibrary.simpleMessage("Удалить"),
    "disable_screenshots": MessageLookupByLibrary.simpleMessage(
      "Отключить скриншоты",
    ),
    "disable_screenshots_hint": MessageLookupByLibrary.simpleMessage(
      "Предотвращение создания скриншотов. Это может работать не на всех устройствах.",
    ),
    "disabled": MessageLookupByLibrary.simpleMessage("Отключено"),
    "donate": MessageLookupByLibrary.simpleMessage("Поддержать проект"),
    "download": MessageLookupByLibrary.simpleMessage("Скачать"),
    "download_handling": MessageLookupByLibrary.simpleMessage(
      "Обработка загрузки",
    ),
    "download_handling_description": MessageLookupByLibrary.simpleMessage(
      "Как должна работать загрузка",
    ),
    "download_handling_type_ask": MessageLookupByLibrary.simpleMessage(
      "Всегда спрашивайте",
    ),
    "download_handling_type_directory": MessageLookupByLibrary.simpleMessage(
      "Сохранить в папку",
    ),
    "download_media_no_url": MessageLookupByLibrary.simpleMessage(
      "Невозможно загрузить. Это медиа может быть доступно только в виде потока, который Squawker пока не может загрузить.",
    ),
    "download_path": MessageLookupByLibrary.simpleMessage("Путь для загрузки"),
    "downloading_media": MessageLookupByLibrary.simpleMessage(
      "Загрузка медиа...",
    ),
    "enable_": MessageLookupByLibrary.simpleMessage("Активировать ?"),
    "ended_timeago_format_endsAt_allowFromNow_true": m3,
    "ends_timeago_format_endsAt_allowFromNow_true": m4,
    "enter_your_twitter_username": MessageLookupByLibrary.simpleMessage(
      "Введите Ваше имя пользователя в Twitter/X",
    ),
    "export": MessageLookupByLibrary.simpleMessage("Экспортировать"),
    "export_settings": MessageLookupByLibrary.simpleMessage(
      "Экспортировать настройки?",
    ),
    "export_subscription_group_members": MessageLookupByLibrary.simpleMessage(
      "Экспортировать участников групп подписок?",
    ),
    "export_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "Экспортировать группы подписок?",
    ),
    "export_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Экспортировать подписки?",
    ),
    "export_tweets": MessageLookupByLibrary.simpleMessage(
      "Экспортировать твиты?",
    ),
    "export_your_data": MessageLookupByLibrary.simpleMessage(
      "Экспортировать ваши данные",
    ),
    "feed": MessageLookupByLibrary.simpleMessage("Лента"),
    "filters": MessageLookupByLibrary.simpleMessage("Фильтры"),
    "finished_with_snapshotData_users": m5,
    "followers": MessageLookupByLibrary.simpleMessage("Читатели"),
    "following": MessageLookupByLibrary.simpleMessage("Читает"),
    "forbidden": MessageLookupByLibrary.simpleMessage(
      "Twitter/X говорит, что доступ к этому запрещен",
    ),
    "fritter": MessageLookupByLibrary.simpleMessage("Squawker"),
    "fritter_blue": MessageLookupByLibrary.simpleMessage("Squawker blue"),
    "general": MessageLookupByLibrary.simpleMessage("Основные"),
    "group_name": m6,
    "groups": MessageLookupByLibrary.simpleMessage("Группы"),
    "help_make_fritter_even_better": MessageLookupByLibrary.simpleMessage(
      "Помогите сделать Squawker ещё лучше",
    ),
    "help_support_fritters_future": MessageLookupByLibrary.simpleMessage(
      "Поддержите Squawker",
    ),
    "hide_sensitive_tweets": MessageLookupByLibrary.simpleMessage(
      "Скрывать чувствительный контент",
    ),
    "home": MessageLookupByLibrary.simpleMessage("Главная"),
    "if_you_have_any_feedback_on_this_feature_please_leave_it_on":
        MessageLookupByLibrary.simpleMessage(
          "Если у вас есть отзывы об этой функции, пожалуйста, оставьте их на",
        ),
    "import": MessageLookupByLibrary.simpleMessage("Импортировать"),
    "import_data_from_another_device": MessageLookupByLibrary.simpleMessage(
      "Импортировать данные с другого устройства",
    ),
    "import_from_twitter": MessageLookupByLibrary.simpleMessage(
      "Импортировать из Twitter/X",
    ),
    "import_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Импортировать подписки",
    ),
    "imported_snapshot_data_users_so_far": m7,
    "include_replies": MessageLookupByLibrary.simpleMessage("Включая ответы"),
    "include_retweets": MessageLookupByLibrary.simpleMessage("Включая ретвиты"),
    "joined": m8,
    "language": MessageLookupByLibrary.simpleMessage("Язык"),
    "language_subtitle": MessageLookupByLibrary.simpleMessage(
      "Необходим перезапуск",
    ),
    "large": MessageLookupByLibrary.simpleMessage("Большой"),
    "legacy_android_import": MessageLookupByLibrary.simpleMessage(
      "Импорт с устаревшей версии Android",
    ),
    "let_the_developers_know_if_something_is_broken":
        MessageLookupByLibrary.simpleMessage(
          "Сообщите разработчикам если что-то пошло не так",
        ),
    "licenses": MessageLookupByLibrary.simpleMessage("Лицензии"),
    "light": MessageLookupByLibrary.simpleMessage("Светлая"),
    "live": MessageLookupByLibrary.simpleMessage("Прямой эфир"),
    "logging": MessageLookupByLibrary.simpleMessage("Журнал"),
    "media": MessageLookupByLibrary.simpleMessage("Медиа"),
    "media_size": MessageLookupByLibrary.simpleMessage("Размер медиа"),
    "medium": MessageLookupByLibrary.simpleMessage("Средний"),
    "name": MessageLookupByLibrary.simpleMessage("Имя"),
    "newTrans": MessageLookupByLibrary.simpleMessage("Новые"),
    "no": MessageLookupByLibrary.simpleMessage("Нет"),
    "no_data_was_returned_which_should_never_happen_please_report_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "Никакие данные не были возвращены, чего никогда не должно происходить. Пожалуйста, сообщите об ошибке, если это возможно!",
        ),
    "no_results": MessageLookupByLibrary.simpleMessage("Ничего не найдено"),
    "no_results_for": MessageLookupByLibrary.simpleMessage(
      "Результаты отсутствуют:",
    ),
    "no_subscriptions_try_searching_or_importing_some":
        MessageLookupByLibrary.simpleMessage(
          "Нет подписок. Попробуйте поискать или импортировать некоторые!",
        ),
    "not_set": MessageLookupByLibrary.simpleMessage("Не установлено"),
    "note_due_to_a_twitter_limitation_not_all_tweets_may_be_included":
        MessageLookupByLibrary.simpleMessage(
          "Примечание: В связи с ограничением Twitter/X, не все твиты могут быть включены",
        ),
    "numberFormat_format_total_votes": m10,
    "ok": MessageLookupByLibrary.simpleMessage("Ок"),
    "oops_something_went_wrong": MessageLookupByLibrary.simpleMessage(
      "Ой! Что-то пошло не так 🥲",
    ),
    "open_app_settings": MessageLookupByLibrary.simpleMessage(
      "Открыть настройки приложения",
    ),
    "page_not_found": MessageLookupByLibrary.simpleMessage(
      "Twiiter говорит, что эта страница не существует, но это может оказаться неправдой",
    ),
    "permission_not_granted": MessageLookupByLibrary.simpleMessage(
      "Разрешение не предоставлено. Пожалуйста, повторите попытку после предоставления!",
    ),
    "pick_a_color": MessageLookupByLibrary.simpleMessage("Выберите цвет!"),
    "pick_an_icon": MessageLookupByLibrary.simpleMessage("Выберите иконку!"),
    "pinned_tweet": MessageLookupByLibrary.simpleMessage("Закреплённый твит"),
    "playback_speed": MessageLookupByLibrary.simpleMessage(
      "Скорость воспроизведения",
    ),
    "please_check_your_internet_connection_error_message": m11,
    "please_enter_a_name": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста, введите имя",
    ),
    "please_make_sure_the_data_you_wish_to_import_is_located_there_then_press_the_import_button_below":
        MessageLookupByLibrary.simpleMessage(
          "Убедитесь, что данные, которые вы хотите импортировать, находятся там, затем нажмите кнопку импорта ниже.",
        ),
    "please_note_that_the_method_fritter_uses_to_import_subscriptions_is_heavily_rate_limited_by_twitter_so_this_may_fail_if_you_have_a_lot_of_followed_accounts":
        MessageLookupByLibrary.simpleMessage(
          "Учтите, что метод, используемый Squawker для импорта подписок, сильно ограничен скоростью Twitter/X, поэтому при наличии большого количества подписок это может не сработать.",
        ),
    "possibly_sensitive": MessageLookupByLibrary.simpleMessage(
      "Возможно чувствительно",
    ),
    "possibly_sensitive_profile": MessageLookupByLibrary.simpleMessage(
      "Этот профиль может содержать потенциально чувствительные изображения, высказывания или другое содержимое. Вы все еще хотите просмотреть его?",
    ),
    "possibly_sensitive_tweet": MessageLookupByLibrary.simpleMessage(
      "Этот твит содержит потенциально чувствительный контент. Вы действительно хотите его посмотреть?",
    ),
    "prefix": MessageLookupByLibrary.simpleMessage("префикс"),
    "private_profile": MessageLookupByLibrary.simpleMessage(
      "Приватный профиль",
    ),
    "released_under_the_mit_license": MessageLookupByLibrary.simpleMessage(
      "Опубликовано под лицензией MIT",
    ),
    "replying_to": MessageLookupByLibrary.simpleMessage("Ответить"),
    "report": MessageLookupByLibrary.simpleMessage("Сообщить"),
    "report_a_bug": MessageLookupByLibrary.simpleMessage("Сообщить об ошибке"),
    "reporting_an_error": MessageLookupByLibrary.simpleMessage(
      "Сообщить об ошибке",
    ),
    "reset_home_pages": MessageLookupByLibrary.simpleMessage(
      "Сброс страниц к значениям по умолчанию",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Повторить"),
    "save": MessageLookupByLibrary.simpleMessage("Сохранить"),
    "save_bandwidth_using_smaller_images": MessageLookupByLibrary.simpleMessage(
      "Экономьте место на экране, с изображениями меньшего размера",
    ),
    "saved": MessageLookupByLibrary.simpleMessage("Избранное"),
    "search": MessageLookupByLibrary.simpleMessage("Поиск"),
    "search_term": MessageLookupByLibrary.simpleMessage("Поисковый запрос"),
    "select": MessageLookupByLibrary.simpleMessage("Выбрать"),
    "selecting_individual_accounts_to_import_and_assigning_groups_are_both_planned_for_the_future_already":
        MessageLookupByLibrary.simpleMessage(
          "Выбор отдельных аккаунтов для импорта и назначение групп уже запланированы на будущее!",
        ),
    "send": MessageLookupByLibrary.simpleMessage("Отправить"),
    "share_tweet_content": MessageLookupByLibrary.simpleMessage(
      "Поделиться содержимым твита",
    ),
    "share_tweet_content_and_link": MessageLookupByLibrary.simpleMessage(
      "Отправить содержимое и ссылку",
    ),
    "share_tweet_link": MessageLookupByLibrary.simpleMessage(
      "Поделиться ссылкой на твит",
    ),
    "should_check_for_updates_description":
        MessageLookupByLibrary.simpleMessage(
          "Проверять наличие обновлений при запуске",
        ),
    "should_check_for_updates_label": MessageLookupByLibrary.simpleMessage(
      "Проверить обновления",
    ),
    "small": MessageLookupByLibrary.simpleMessage("Маленький"),
    "something_broke_in_fritter": MessageLookupByLibrary.simpleMessage(
      "Что-то пошло не так.",
    ),
    "something_just_went_wrong_in_fritter_and_an_error_report_has_been_generated":
        MessageLookupByLibrary.simpleMessage(
          "Что-то пошло не так в Squawker, и был создан отчет об ошибке. Отчет можно отправить разработчикам Squawker, чтобы они могли устранить проблему.",
        ),
    "sorry_the_replied_tweet_could_not_be_found":
        MessageLookupByLibrary.simpleMessage(
          "Извините, ответ не удалось найти!",
        ),
    "subscribe": MessageLookupByLibrary.simpleMessage("Читать"),
    "subscriptions": MessageLookupByLibrary.simpleMessage("Подписки"),
    "subtitles": MessageLookupByLibrary.simpleMessage("Субтитры"),
    "successfully_saved_the_media": MessageLookupByLibrary.simpleMessage(
      "Файл сохранён!",
    ),
    "system": MessageLookupByLibrary.simpleMessage("Системная"),
    "tap_to_download_release_version": m13,
    "tap_to_show_getMediaType_item_type": m14,
    "thanks_for_helping_fritter": MessageLookupByLibrary.simpleMessage(
      "Спасибо за помощь Squawker! 💖",
    ),
    "the_file_does_not_exist_please_ensure_it_is_located_at_file_path": m15,
    "the_github_issue": MessageLookupByLibrary.simpleMessage(
      "предложение GitHub (#143)",
    ),
    "the_tweet_did_not_contain_any_text_this_is_unexpected":
        MessageLookupByLibrary.simpleMessage(
          "Твит не содержал никакого текста. Это неожиданно",
        ),
    "theme": MessageLookupByLibrary.simpleMessage("Тема"),
    "theme_mode": MessageLookupByLibrary.simpleMessage("Тема"),
    "there_were_no_trends_returned_this_is_unexpected_please_report_as_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "Не было возвращено ничего из актуального. Это неожиданно! Пожалуйста, сообщите об этом как об ошибке, если это возможно.",
        ),
    "this_group_contains_no_subscriptions":
        MessageLookupByLibrary.simpleMessage("В этой группе нет подписок!"),
    "this_took_too_long_to_load_please_check_your_network_connection":
        MessageLookupByLibrary.simpleMessage(
          "Загрузка заняла слишком много времени. Пожалуйста, проверьте ваше сетевое подключение!",
        ),
    "this_tweet_is_unavailable": MessageLookupByLibrary.simpleMessage(
      "Этот твит недоступен. Возможно он был удалён.",
    ),
    "this_tweet_user_name_retweeted": m16,
    "this_user_does_not_follow_anyone": MessageLookupByLibrary.simpleMessage(
      "Этот пользователь никого не читает!",
    ),
    "this_user_does_not_have_anyone_following_them":
        MessageLookupByLibrary.simpleMessage(
          "Этого пользователя никто не читает!",
        ),
    "thread": MessageLookupByLibrary.simpleMessage("Ветка"),
    "thumbnail": MessageLookupByLibrary.simpleMessage("Миниатюра"),
    "timed_out": MessageLookupByLibrary.simpleMessage("Время вышло"),
    "to_import_subscriptions_from_an_existing_twitter_account_enter_your_username_below":
        MessageLookupByLibrary.simpleMessage(
          "Чтобы импортировать подписки из существующего аккаунта Twitter/X, введите свое имя пользователя ниже.",
        ),
    "toggle_all": MessageLookupByLibrary.simpleMessage("Выбрать все"),
    "trending": MessageLookupByLibrary.simpleMessage("Актуальное"),
    "trends": MessageLookupByLibrary.simpleMessage("Актуальные темы"),
    "true_black": MessageLookupByLibrary.simpleMessage(
      "Настоящий чёрный (AMOLED)?",
    ),
    "tweets": MessageLookupByLibrary.simpleMessage("Твиты"),
    "tweets_and_replies": MessageLookupByLibrary.simpleMessage(
      "Твиты и Ответы",
    ),
    "tweets_number": m17,
    "unable_to_find_the_available_trend_locations":
        MessageLookupByLibrary.simpleMessage(
          "Не удается найти доступные страны для актуального.",
        ),
    "unable_to_find_your_saved_tweets": MessageLookupByLibrary.simpleMessage(
      "Не удаётся найти ваши сохранённые твиты.",
    ),
    "unable_to_import": MessageLookupByLibrary.simpleMessage(
      "Не удаётся импортировать",
    ),
    "unable_to_load_home_pages": MessageLookupByLibrary.simpleMessage(
      "Невозможно загрузить вашу главную страницу",
    ),
    "unable_to_load_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "Не удаётся загрузить группы подписок",
    ),
    "unable_to_load_the_group": MessageLookupByLibrary.simpleMessage(
      "Не удаётся загрузить группу",
    ),
    "unable_to_load_the_group_settings": MessageLookupByLibrary.simpleMessage(
      "Не удаётся загрузить настройки группы",
    ),
    "unable_to_load_the_list_of_follows": MessageLookupByLibrary.simpleMessage(
      "Не удаётся загрузить список читаемых",
    ),
    "unable_to_load_the_next_page_of_follows":
        MessageLookupByLibrary.simpleMessage(
          "Не удаётся загрузить следующую страницу читаемых",
        ),
    "unable_to_load_the_next_page_of_replies":
        MessageLookupByLibrary.simpleMessage(
          "Не удаётся загрузить следующую страницу ответов",
        ),
    "unable_to_load_the_next_page_of_tweets":
        MessageLookupByLibrary.simpleMessage(
          "Не удаётся загрузить следующую страницу твитов",
        ),
    "unable_to_load_the_profile": MessageLookupByLibrary.simpleMessage(
      "Не удаётся загрузить профиль",
    ),
    "unable_to_load_the_search_results": MessageLookupByLibrary.simpleMessage(
      "Не удаётся загрузить результаты поиска.",
    ),
    "unable_to_load_the_trends_for_widget_place_name": m18,
    "unable_to_load_the_tweet": MessageLookupByLibrary.simpleMessage(
      "Не удаётся загрузить твит",
    ),
    "unable_to_load_the_tweets": MessageLookupByLibrary.simpleMessage(
      "Не удаётся загрузить твиты",
    ),
    "unable_to_load_the_tweets_for_the_feed":
        MessageLookupByLibrary.simpleMessage(
          "Не удаётся загрузить твиты для ленты",
        ),
    "unable_to_refresh_the_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Невозможно обновить подписки",
    ),
    "unable_to_run_the_database_migrations":
        MessageLookupByLibrary.simpleMessage(
          "Не удалось произвести перемещение базы данных",
        ),
    "unable_to_save_the_media_twitter_returned_a_status_of_response_statusCode":
        m19,
    "unable_to_stream_the_trend_location_preference":
        MessageLookupByLibrary.simpleMessage(
          "Невозможно выполнить передачу местных предпочтений",
        ),
    "unknown": MessageLookupByLibrary.simpleMessage("Неизвестный"),
    "unsave": MessageLookupByLibrary.simpleMessage("Отменить сохранение"),
    "unsubscribe": MessageLookupByLibrary.simpleMessage("Перестать читать"),
    "update_to_release_version_through_your_fdroid_client": m20,
    "updates": MessageLookupByLibrary.simpleMessage("Обновления"),
    "use_true_black_for_the_dark_mode_theme":
        MessageLookupByLibrary.simpleMessage(
          "Использовать настоящий чёрный (AMOLED) для тёмной темы",
        ),
    "user_not_found": MessageLookupByLibrary.simpleMessage(
      "Пользователь не найден",
    ),
    "username": MessageLookupByLibrary.simpleMessage("Имя пользователя"),
    "version": MessageLookupByLibrary.simpleMessage("Версия"),
    "when_a_new_app_update_is_available": MessageLookupByLibrary.simpleMessage(
      "Когда новое обновление доступно",
    ),
    "whether_errors_should_be_reported_to_":
        MessageLookupByLibrary.simpleMessage("Сообщать об ошибках в "),
    "whether_to_hide_tweets_marked_as_sensitive":
        MessageLookupByLibrary.simpleMessage(
          "Следует ли скрывать твиты, помеченные как чувствительные",
        ),
    "which_tab_is_shown_when_the_app_opens":
        MessageLookupByLibrary.simpleMessage(
          "Какая вкладка отображается при открытии приложения",
        ),
    "would_you_like_to_enable_automatic_error_reporting":
        MessageLookupByLibrary.simpleMessage(
          "Вы хотите включить автоматическое информирование об ошибках?",
        ),
    "yes": MessageLookupByLibrary.simpleMessage("Да"),
    "yes_please": MessageLookupByLibrary.simpleMessage("Да, пожалуйста"),
    "you_have_not_saved_any_tweets_yet": MessageLookupByLibrary.simpleMessage(
      "Вы ещё не сохранили ни одного твита!",
    ),
    "you_must_have_at_least_2_home_screen_pages":
        MessageLookupByLibrary.simpleMessage(
          "Вы должны установить как минимум две страницы для главного экрана",
        ),
    "your_profile_must_be_public_otherwise_the_import_will_not_work":
        MessageLookupByLibrary.simpleMessage(
          "Ваш профиль должен быть открытым, иначе импортирование не будет работать",
        ),
    "your_report_will_be_sent_to_fritter__project":
        MessageLookupByLibrary.simpleMessage(
          "Ваш отчет будет отправлен в  Squawker, а информацию о конфиденциальности можно найти здесь:",
        ),
  };
}
