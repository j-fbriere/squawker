// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a uk locale. All the
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
  String get localeName => 'uk';

  static String m0(name) =>
      "Ви впевнені, що хочете видалити групу підписників ${name}?";

  static String m1(fileName) => "Дані експортовано до ${fileName}";

  static String m2(fullPath) => "Дані експортовано до ${fullPath}";

  static String m5(snapshotData) => "Завершено з ${snapshotData} користувачами";

  static String m7(snapshotData) => "${snapshotData} імпортованих користувачів";

  static String m8(date) => "Приєднався ${date}";

  static String m15(filePath) =>
      "Файл не існує. Переконайтеся, що він знаходиться за адресою ${filePath}";

  static String m18(widgetPlaceName) =>
      "Не вдалося завантажити тренди для ${widgetPlaceName}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("Про Squawker"),
    "activate_non_confirmation_bias_mode_description":
        MessageLookupByLibrary.simpleMessage(
          "Приховати авторів твітів. Уникайте підтвердження, заснованого на авторитетних аргументах.",
        ),
    "activate_non_confirmation_bias_mode_label":
        MessageLookupByLibrary.simpleMessage(
          "Активувати режим зсуву без підтвердження",
        ),
    "add_to_group": MessageLookupByLibrary.simpleMessage("Додати до групи"),
    "all": MessageLookupByLibrary.simpleMessage("Все"),
    "all_the_great_software_used_by_fritter":
        MessageLookupByLibrary.simpleMessage(
          "Все чудове програмне забезпечення, яке використовує Squawker",
        ),
    "are_you_sure": MessageLookupByLibrary.simpleMessage("Ви впевнені?"),
    "are_you_sure_you_want_to_delete_the_subscription_group_name_of_group": m0,
    "cancel": MessageLookupByLibrary.simpleMessage("Скасувати"),
    "close": MessageLookupByLibrary.simpleMessage("Закрити"),
    "contribute": MessageLookupByLibrary.simpleMessage("Зробити внесок"),
    "copied_address_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "Адресу скопійовано в буфер обміну",
    ),
    "copied_version_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "Версія скопійована в буфер обміну",
    ),
    "could_not_find_any_tweets_by_this_user":
        MessageLookupByLibrary.simpleMessage(
          "Не вдалося знайти жодного твіту цього користувача!",
        ),
    "could_not_find_any_tweets_from_the_last_7_days":
        MessageLookupByLibrary.simpleMessage(
          "Не вдалося знайти жодного твіту за останні 7 днів!",
        ),
    "dark": MessageLookupByLibrary.simpleMessage("Темна"),
    "data": MessageLookupByLibrary.simpleMessage("Дані"),
    "data_exported_to_fileName": m1,
    "data_exported_to_fullPath": m2,
    "data_imported_successfully": MessageLookupByLibrary.simpleMessage(
      "Дані успішно імпортовано",
    ),
    "date_created": MessageLookupByLibrary.simpleMessage("Дата створення"),
    "date_subscribed": MessageLookupByLibrary.simpleMessage("Дата підписки"),
    "default_tab": MessageLookupByLibrary.simpleMessage(
      "Вкладка за замовчуванням",
    ),
    "delete": MessageLookupByLibrary.simpleMessage("Видалити"),
    "disabled": MessageLookupByLibrary.simpleMessage("Вимкнено"),
    "donate": MessageLookupByLibrary.simpleMessage("Пожертвувати"),
    "enable_": MessageLookupByLibrary.simpleMessage("Увімкнути ?"),
    "enter_your_twitter_username": MessageLookupByLibrary.simpleMessage(
      "Введіть своє ім\'я користувача у Twitter/X",
    ),
    "export": MessageLookupByLibrary.simpleMessage("Експорт"),
    "export_settings": MessageLookupByLibrary.simpleMessage(
      "Експортувати налаштування?",
    ),
    "export_subscription_group_members": MessageLookupByLibrary.simpleMessage(
      "Експортувати членів групи підписників?",
    ),
    "export_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "Експортувати групи підписників?",
    ),
    "export_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Експортувати підписки?",
    ),
    "export_tweets": MessageLookupByLibrary.simpleMessage(
      "Експортувати твіти?",
    ),
    "export_your_data": MessageLookupByLibrary.simpleMessage(
      "Експортуйте свої дані",
    ),
    "feed": MessageLookupByLibrary.simpleMessage("Стрічка"),
    "filters": MessageLookupByLibrary.simpleMessage("Фільтри"),
    "finished_with_snapshotData_users": m5,
    "followers": MessageLookupByLibrary.simpleMessage("Підписники"),
    "following": MessageLookupByLibrary.simpleMessage("Слідкує"),
    "fritter": MessageLookupByLibrary.simpleMessage("Squawker"),
    "general": MessageLookupByLibrary.simpleMessage("Головне"),
    "groups": MessageLookupByLibrary.simpleMessage("Групи"),
    "help_make_fritter_even_better": MessageLookupByLibrary.simpleMessage(
      "Допоможіть зробити Squawker ще кращим",
    ),
    "help_support_fritters_future": MessageLookupByLibrary.simpleMessage(
      "Допоможіть підтримати майбутнє Squawker",
    ),
    "if_you_have_any_feedback_on_this_feature_please_leave_it_on":
        MessageLookupByLibrary.simpleMessage(
          "Якщо у вас є відгуки про цю функцію, будь ласка, залиште їх на",
        ),
    "import": MessageLookupByLibrary.simpleMessage("Імпорт"),
    "import_data_from_another_device": MessageLookupByLibrary.simpleMessage(
      "Імпортуйте дані з іншого пристрою",
    ),
    "import_from_twitter": MessageLookupByLibrary.simpleMessage(
      "Імпортувати з Twitter/X",
    ),
    "import_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Імпорт підписок",
    ),
    "imported_snapshot_data_users_so_far": m7,
    "include_replies": MessageLookupByLibrary.simpleMessage(
      "Включити відповіді",
    ),
    "include_retweets": MessageLookupByLibrary.simpleMessage(
      "Включити ретвіти",
    ),
    "joined": m8,
    "large": MessageLookupByLibrary.simpleMessage("Великий"),
    "legacy_android_import": MessageLookupByLibrary.simpleMessage(
      "Застарілий імпорт Android",
    ),
    "let_the_developers_know_if_something_is_broken":
        MessageLookupByLibrary.simpleMessage(
          "Повідомте розробників, якщо щось зламалося",
        ),
    "licenses": MessageLookupByLibrary.simpleMessage("Ліцензії"),
    "light": MessageLookupByLibrary.simpleMessage("Світла"),
    "logging": MessageLookupByLibrary.simpleMessage("Логування"),
    "media": MessageLookupByLibrary.simpleMessage("Медіа"),
    "media_size": MessageLookupByLibrary.simpleMessage("Розмір медіа"),
    "medium": MessageLookupByLibrary.simpleMessage("Середній"),
    "name": MessageLookupByLibrary.simpleMessage("Ім\'я"),
    "newTrans": MessageLookupByLibrary.simpleMessage("Нове"),
    "no": MessageLookupByLibrary.simpleMessage("Ні"),
    "no_results": MessageLookupByLibrary.simpleMessage("Немає результатів"),
    "no_results_for": MessageLookupByLibrary.simpleMessage(
      "Нічого не знайдено для:",
    ),
    "no_subscriptions_try_searching_or_importing_some":
        MessageLookupByLibrary.simpleMessage(
          "Немає підписок. Спробуйте пошукати або імпортувати!",
        ),
    "note_due_to_a_twitter_limitation_not_all_tweets_may_be_included":
        MessageLookupByLibrary.simpleMessage(
          "Примітка: Через обмеження Twitter/X, не всі твіти можуть бути включені",
        ),
    "ok": MessageLookupByLibrary.simpleMessage("Добре"),
    "pick_a_color": MessageLookupByLibrary.simpleMessage("Вибери колір!"),
    "pick_an_icon": MessageLookupByLibrary.simpleMessage("Вибери піктограму!"),
    "please_enter_a_name": MessageLookupByLibrary.simpleMessage(
      "Будь ласка, введіть ім\'я",
    ),
    "please_make_sure_the_data_you_wish_to_import_is_located_there_then_press_the_import_button_below":
        MessageLookupByLibrary.simpleMessage(
          "Будь ласка, переконайтеся, що дані, які ви хочете імпортувати, знаходяться там, а потім натисніть кнопку імпорту нижче.",
        ),
    "please_note_that_the_method_fritter_uses_to_import_subscriptions_is_heavily_rate_limited_by_twitter_so_this_may_fail_if_you_have_a_lot_of_followed_accounts":
        MessageLookupByLibrary.simpleMessage(
          "Будь ласка, зверніть увагу, що метод, який використовує Squawker для імпорту підписок, сильно обмежений Twitter/X, тому він може не спрацювати, якщо у вас багато акаунтів, на які ви підписані.",
        ),
    "prefix": MessageLookupByLibrary.simpleMessage("префікс"),
    "released_under_the_mit_license": MessageLookupByLibrary.simpleMessage(
      "Випущено за ліцензією MIT",
    ),
    "report_a_bug": MessageLookupByLibrary.simpleMessage(
      "Повідомити про помилку",
    ),
    "reporting_an_error": MessageLookupByLibrary.simpleMessage(
      "Повідомити про помилку",
    ),
    "save_bandwidth_using_smaller_images": MessageLookupByLibrary.simpleMessage(
      "Економте трафік за допомогою менших зображень",
    ),
    "saved": MessageLookupByLibrary.simpleMessage("Збережено"),
    "search": MessageLookupByLibrary.simpleMessage("Пошук"),
    "select": MessageLookupByLibrary.simpleMessage("Вибрати"),
    "selecting_individual_accounts_to_import_and_assigning_groups_are_both_planned_for_the_future_already":
        MessageLookupByLibrary.simpleMessage(
          "Вибір окремих облікових записів для імпорту та призначення груп вже заплановано на майбутнє!",
        ),
    "send": MessageLookupByLibrary.simpleMessage("Надіслати"),
    "small": MessageLookupByLibrary.simpleMessage("Маленький"),
    "something_just_went_wrong_in_fritter_and_an_error_report_has_been_generated":
        MessageLookupByLibrary.simpleMessage(
          "Щойно у Squawker щось пішло не так, і було створено звіт про помилку. Звіт можна відправити розробникам Squawker, щоб вони допомогли розв\'язати проблему.",
        ),
    "subscribe": MessageLookupByLibrary.simpleMessage("Підписатися"),
    "subscriptions": MessageLookupByLibrary.simpleMessage("Підписки"),
    "system": MessageLookupByLibrary.simpleMessage("Система"),
    "thanks_for_helping_fritter": MessageLookupByLibrary.simpleMessage(
      "Дякуємо за допомогу! 💖",
    ),
    "the_file_does_not_exist_please_ensure_it_is_located_at_file_path": m15,
    "the_github_issue": MessageLookupByLibrary.simpleMessage(
      "GitHub issue (#143)",
    ),
    "theme": MessageLookupByLibrary.simpleMessage("Тема"),
    "theme_mode": MessageLookupByLibrary.simpleMessage("Режим теми"),
    "there_were_no_trends_returned_this_is_unexpected_please_report_as_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "Немає повернених трендів. Це неочікувано! Будь ласка, повідомте про помилку, якщо можливо.",
        ),
    "this_group_contains_no_subscriptions":
        MessageLookupByLibrary.simpleMessage("Ця група не містить підписок!"),
    "this_user_does_not_follow_anyone": MessageLookupByLibrary.simpleMessage(
      "Цей користувач ні за ким не стежить!",
    ),
    "this_user_does_not_have_anyone_following_them":
        MessageLookupByLibrary.simpleMessage(
          "Цей користувач не має жодного підписника!",
        ),
    "thumbnail": MessageLookupByLibrary.simpleMessage("Ескіз"),
    "to_import_subscriptions_from_an_existing_twitter_account_enter_your_username_below":
        MessageLookupByLibrary.simpleMessage(
          "Щоб імпортувати підписки з наявного облікового запису Twitter/X, введіть своє ім\'я користувача нижче.",
        ),
    "toggle_all": MessageLookupByLibrary.simpleMessage("Перемкнути все"),
    "trending": MessageLookupByLibrary.simpleMessage("Тренди"),
    "true_black": MessageLookupByLibrary.simpleMessage("Справжній чорний?"),
    "tweets": MessageLookupByLibrary.simpleMessage("Твіти"),
    "tweets_and_replies": MessageLookupByLibrary.simpleMessage(
      "Твіти і відповіді",
    ),
    "unable_to_find_the_available_trend_locations":
        MessageLookupByLibrary.simpleMessage(
          "Не вдалося знайти доступні місцеположення трендів.",
        ),
    "unable_to_find_your_saved_tweets": MessageLookupByLibrary.simpleMessage(
      "Не вдається знайти збережені твіти.",
    ),
    "unable_to_import": MessageLookupByLibrary.simpleMessage(
      "Не вдалося імпортувати",
    ),
    "unable_to_load_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "Не вдається завантажити групи підписників",
    ),
    "unable_to_load_the_group": MessageLookupByLibrary.simpleMessage(
      "Не вдається завантажити групу",
    ),
    "unable_to_load_the_group_settings": MessageLookupByLibrary.simpleMessage(
      "Не вдається завантажити налаштування групи",
    ),
    "unable_to_load_the_list_of_follows": MessageLookupByLibrary.simpleMessage(
      "Не вдається завантажити список підписників",
    ),
    "unable_to_load_the_next_page_of_follows":
        MessageLookupByLibrary.simpleMessage(
          "Не вдається завантажити наступну сторінку з підписниками",
        ),
    "unable_to_load_the_next_page_of_replies":
        MessageLookupByLibrary.simpleMessage(
          "Не вдається завантажити наступну сторінку відповідей",
        ),
    "unable_to_load_the_next_page_of_tweets":
        MessageLookupByLibrary.simpleMessage(
          "Не вдається завантажити наступну сторінку твітів",
        ),
    "unable_to_load_the_profile": MessageLookupByLibrary.simpleMessage(
      "Не вдається завантажити профіль",
    ),
    "unable_to_load_the_search_results": MessageLookupByLibrary.simpleMessage(
      "Не вдається завантажити результати пошуку.",
    ),
    "unable_to_load_the_trends_for_widget_place_name": m18,
    "unable_to_load_the_tweet": MessageLookupByLibrary.simpleMessage(
      "Не вдається завантажити твіт",
    ),
    "unable_to_load_the_tweets": MessageLookupByLibrary.simpleMessage(
      "Не вдається завантажити твіти",
    ),
    "unable_to_load_the_tweets_for_the_feed":
        MessageLookupByLibrary.simpleMessage(
          "Не вдається завантажити твіти для стрічки",
        ),
    "unable_to_refresh_the_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Не вдалося оновити підписки",
    ),
    "unsubscribe": MessageLookupByLibrary.simpleMessage("Відписатися"),
    "use_true_black_for_the_dark_mode_theme":
        MessageLookupByLibrary.simpleMessage(
          "Використовуйте справжній чорний колір для темної теми",
        ),
    "username": MessageLookupByLibrary.simpleMessage("Ім\'я користувача"),
    "version": MessageLookupByLibrary.simpleMessage("Версія"),
    "whether_errors_should_be_reported_to_":
        MessageLookupByLibrary.simpleMessage(
          "Чи потрібно повідомляти про помилки в ",
        ),
    "which_tab_is_shown_when_the_app_opens":
        MessageLookupByLibrary.simpleMessage(
          "Яка вкладка відображатиметься під час відкриття додатка",
        ),
    "would_you_like_to_enable_automatic_error_reporting":
        MessageLookupByLibrary.simpleMessage(
          "Бажаєте увімкнути автоматичне повідомлення про помилки?",
        ),
    "yes": MessageLookupByLibrary.simpleMessage("Так"),
    "yes_please": MessageLookupByLibrary.simpleMessage("Так, будь ласка"),
    "you_have_not_saved_any_tweets_yet": MessageLookupByLibrary.simpleMessage(
      "Ви ще не зберегли жодного твіту!",
    ),
    "your_profile_must_be_public_otherwise_the_import_will_not_work":
        MessageLookupByLibrary.simpleMessage(
          "Ваш профіль має бути публічним, інакше імпорт не спрацює",
        ),
    "your_report_will_be_sent_to_fritter__project":
        MessageLookupByLibrary.simpleMessage(
          "Ваш звіт буде надіслано до проекту Squawker\'s , а деталі конфіденційності можна знайти за посиланням:",
        ),
  };
}
