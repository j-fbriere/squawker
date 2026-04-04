// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
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
  String get localeName => 'ar';

  static String m0(name) => "هل أنت متأكد من حذف اسم مجموعة الاشتراك ${name}?";

  static String m1(fileName) => "صُدِّرَت البيانات إلى ${fileName}";

  static String m2(fullPath) => "صُدِّرَت البيانات إلى ${fullPath}";

  static String m3(timeagoFormat) => "اتنهى ${timeagoFormat}";

  static String m4(timeagoFormat) => "يتنهي ${timeagoFormat}";

  static String m5(snapshotData) => "تم الانتهاء بـ${snapshotData} مستخدم";

  static String m6(name) => "المجموعة: ${name}";

  static String m7(snapshotData) =>
      "${snapshotData} المستخدمين المستوردون حتى الآن";

  static String m8(date) => "انضم ${date}";

  static String m9(nbrGuestAccounts) => "هناك ${nbrGuestAccounts} حسابات ضيوف";

  static String m10(num, numFormatted) =>
      "${Intl.plural(num, zero: 'ولا تصويت', one: 'تصويت واحد', two: 'تصويتان', few: '${numFormatted} تصويتات', many: '${numFormatted} تصويت', other: '${numFormatted} تصويتات')}";

  static String m11(errorMessage) =>
      "رجائاً تحقق من اتصال الشبكة لديك.\n\n${errorMessage}";

  static String m12(nbrRegularAccounts) =>
      "الحسابات العادية (${nbrRegularAccounts}):";

  static String m13(releaseVersion) => "انقر للتحميل ${releaseVersion}";

  static String m14(getMediaType) => "انقر للعرض ${getMediaType}";

  static String m15(filePath) =>
      "الملف غير موجود. رجائاً تأكد أنه موجو في ${filePath}";

  static String m16(thisTweetUserName, timeAgo) =>
      "${thisTweetUserName} أعاد تغريد ${timeAgo}";

  static String m17(num, numFormatted) =>
      "${Intl.plural(num, zero: 'لا تغريدات', one: 'تغريدة واحدة', two: 'تغريدتان', few: '${numFormatted} تغريدات', many: '${numFormatted} تغريدة', other: '${numFormatted} تغريدات')}";

  static String m18(widgetPlaceName) =>
      "غير قادر على تحميل الترندات لـ${widgetPlaceName}";

  static String m19(responseStatusCode) =>
      "تعذر حفظ الوسائط. أعاد تويتر حالة ${responseStatusCode}";

  static String m20(releaseVersion) =>
      "حدّث إلى ${releaseVersion} عبر عميل الـF-Droid لديك";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("عن"),
    "account": MessageLookupByLibrary.simpleMessage("الحساب"),
    "account_suspended": MessageLookupByLibrary.simpleMessage("الحساب معلق"),
    "activate_non_confirmation_bias_mode_description":
        MessageLookupByLibrary.simpleMessage(
          "إخفاء مؤلفي التغريدات. تجنب التحيز التأكيدي بناء على الحجج الموثوقة.",
        ),
    "activate_non_confirmation_bias_mode_label":
        MessageLookupByLibrary.simpleMessage("تفعيل نمط التحيز غير المؤكد"),
    "add_account": MessageLookupByLibrary.simpleMessage("إضافة حساب"),
    "add_account_title": MessageLookupByLibrary.simpleMessage("اضافة حساب"),
    "add_subscriptions": MessageLookupByLibrary.simpleMessage("إضافة اشتراكات"),
    "add_to_feed": MessageLookupByLibrary.simpleMessage("إضافة إلى الموجز"),
    "add_to_group": MessageLookupByLibrary.simpleMessage("أضف إلى المجموعة"),
    "all": MessageLookupByLibrary.simpleMessage("الكل"),
    "all_the_great_software_used_by_fritter":
        MessageLookupByLibrary.simpleMessage(
          "كافة البرمجيات الرائعة التي يستخدمها Squawker",
        ),
    "allow_background_play_description": MessageLookupByLibrary.simpleMessage(
      "السماح بالتشغيل في الخلفية",
    ),
    "allow_background_play_label": MessageLookupByLibrary.simpleMessage(
      "التشغيل في الخلفية",
    ),
    "allow_background_play_other_apps_description":
        MessageLookupByLibrary.simpleMessage(
          "السماح للتطبيقات الأخرى بالتشغيل في الخلفية",
        ),
    "allow_background_play_other_apps_label":
        MessageLookupByLibrary.simpleMessage("تطبيقات أخرى في الخلفية"),
    "an_update_for_fritter_is_available": MessageLookupByLibrary.simpleMessage(
      "هناك تحديث متوفر لـ Squawker! 🚀",
    ),
    "api_key": MessageLookupByLibrary.simpleMessage("مفتاح API"),
    "app_info": MessageLookupByLibrary.simpleMessage("معلومات عن التطبيق"),
    "are_you_sure": MessageLookupByLibrary.simpleMessage("هل أنت متأكد؟"),
    "are_you_sure_you_want_to_delete_the_subscription_group_name_of_group": m0,
    "back": MessageLookupByLibrary.simpleMessage("رجوع"),
    "bad_guest_token": MessageLookupByLibrary.simpleMessage(
      "لقد ألغى Twitter/X رمز الوصول الخاص بنا. من فضلك حاول إعادة فتح Squawker!",
    ),
    "beta": MessageLookupByLibrary.simpleMessage("تجريبي"),
    "blue_theme_based_on_the_twitter_color_scheme":
        MessageLookupByLibrary.simpleMessage(
          "السمة الزرقاء بنائاً على سمة تويتر",
        ),
    "cancel": MessageLookupByLibrary.simpleMessage("الغاء"),
    "catastrophic_failure": MessageLookupByLibrary.simpleMessage("فشل ذريع"),
    "choose": MessageLookupByLibrary.simpleMessage("أختر"),
    "choose_pages": MessageLookupByLibrary.simpleMessage("اختيار الصفحات"),
    "close": MessageLookupByLibrary.simpleMessage("اغلاق"),
    "community_notes_title": MessageLookupByLibrary.simpleMessage(
      "القراء أضافوا السياق",
    ),
    "confirm_close_fritter": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد من أنك تريد إغلاق Squawker؟",
    ),
    "contribute": MessageLookupByLibrary.simpleMessage("المساهمة"),
    "copied_address_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "نسخ العنوان إلى الحافظة",
    ),
    "copied_version_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "نُسخ الإصدار إلى الحافظة",
    ),
    "could_not_contact_twitter": MessageLookupByLibrary.simpleMessage(
      "غير قادر على التواصل مع تويتر",
    ),
    "could_not_find_any_tweets_by_this_user":
        MessageLookupByLibrary.simpleMessage(
          "لم يتم العثور على أي تغريدة من هذا المستخدم!",
        ),
    "could_not_find_any_tweets_from_the_last_7_days":
        MessageLookupByLibrary.simpleMessage(
          "لم يُعثر على أي تغريدات من الأيام الـ7 الماضية!",
        ),
    "country": MessageLookupByLibrary.simpleMessage("البلد"),
    "dark": MessageLookupByLibrary.simpleMessage("داكن"),
    "data": MessageLookupByLibrary.simpleMessage("البيانات"),
    "data_exported_to_fileName": m1,
    "data_exported_to_fullPath": m2,
    "data_imported_successfully": MessageLookupByLibrary.simpleMessage(
      "استوردت البيانات بنجاح",
    ),
    "date_created": MessageLookupByLibrary.simpleMessage("تاريخ الإنشاء"),
    "date_subscribed": MessageLookupByLibrary.simpleMessage("تاريخ الاشتراك"),
    "default_subscription_tab": MessageLookupByLibrary.simpleMessage(
      "علامة تبويب الاشتراك الافتراضية",
    ),
    "default_tab": MessageLookupByLibrary.simpleMessage("اللسان الافتراضي"),
    "delete": MessageLookupByLibrary.simpleMessage("حذف"),
    "disable_screenshots": MessageLookupByLibrary.simpleMessage(
      "تعطيل لقطات الشاشة",
    ),
    "disable_screenshots_hint": MessageLookupByLibrary.simpleMessage(
      "منع التقاط لقطات الشاشة. قد لا يعمل هذا على جميع الأجهزة.",
    ),
    "disabled": MessageLookupByLibrary.simpleMessage("معطل"),
    "doesnt_work_without_account": MessageLookupByLibrary.simpleMessage(
      "Squawker لا يعمل بدون حساب",
    ),
    "donate": MessageLookupByLibrary.simpleMessage("التبرع"),
    "download": MessageLookupByLibrary.simpleMessage("تحميل"),
    "download_handling": MessageLookupByLibrary.simpleMessage(
      "التعامل مع التحميل",
    ),
    "download_handling_description": MessageLookupByLibrary.simpleMessage(
      "كيفية عمل التنزيل",
    ),
    "download_handling_type_ask": MessageLookupByLibrary.simpleMessage(
      "اسأل دائما",
    ),
    "download_handling_type_directory": MessageLookupByLibrary.simpleMessage(
      "حفظ في المسار",
    ),
    "download_media_no_url": MessageLookupByLibrary.simpleMessage(
      "تعذّر التنزيل. قد تكون هذه الوسائط متاحة فقط على شكل بث، لا يمكن لـ Squawker تنزيلها.",
    ),
    "download_path": MessageLookupByLibrary.simpleMessage("مسار التنزيل"),
    "download_video_best_quality_description":
        MessageLookupByLibrary.simpleMessage(
          "تنزيل مقاطع الفيديو بأفضل جودة متاحة",
        ),
    "download_video_best_quality_label": MessageLookupByLibrary.simpleMessage(
      "قم بتنزيل مقاطع الفيديو بأفضل جودة",
    ),
    "downloading_media": MessageLookupByLibrary.simpleMessage("تحميل الوسائط…"),
    "edit_account_title": MessageLookupByLibrary.simpleMessage("تعديل الحساب"),
    "email_label": MessageLookupByLibrary.simpleMessage("البريد الالكتروني:"),
    "enable_": MessageLookupByLibrary.simpleMessage("تفعيل الحارس؟"),
    "ended_timeago_format_endsAt_allowFromNow_true": m3,
    "ends_timeago_format_endsAt_allowFromNow_true": m4,
    "enhanced_feeds_description": MessageLookupByLibrary.simpleMessage(
      "الطلبات المحسنة للخلاصات (ولكن مع حدود معدل أقل)",
    ),
    "enhanced_feeds_label": MessageLookupByLibrary.simpleMessage(
      "خلاصات محسنة",
    ),
    "enhanced_profile_description": MessageLookupByLibrary.simpleMessage(
      "طلبات محسنة للملف الشخصي",
    ),
    "enhanced_profile_label": MessageLookupByLibrary.simpleMessage(
      "ملف تعريف مُحسّن",
    ),
    "enhanced_searches_description": MessageLookupByLibrary.simpleMessage(
      "طلبات محسنة لعمليات البحث (ولكن مع حدود معدل أقل)",
    ),
    "enhanced_searches_label": MessageLookupByLibrary.simpleMessage(
      "عمليات البحث المحسنة",
    ),
    "enter_comma_separated_twitter_usernames":
        MessageLookupByLibrary.simpleMessage(
          "أدخل أسماء مستخدمي Twitter/X المفصولة بفواصل",
        ),
    "enter_your_twitter_username": MessageLookupByLibrary.simpleMessage(
      "ادخل اسم مستخدم للتويتر",
    ),
    "error_from_twitter": MessageLookupByLibrary.simpleMessage(
      "خطأ من تويتر/X",
    ),
    "exclusions_feed_description": MessageLookupByLibrary.simpleMessage(
      "قائمة بأسماء المستخدمين المراد استبعادها من التغذية",
    ),
    "exclusions_feed_label": MessageLookupByLibrary.simpleMessage(
      "استثناءات في التغذية",
    ),
    "export": MessageLookupByLibrary.simpleMessage("تصدير"),
    "export_guest_accounts": MessageLookupByLibrary.simpleMessage(
      "تصدير حسابات الضيوف؟",
    ),
    "export_settings": MessageLookupByLibrary.simpleMessage("تصدير الإعدادات؟"),
    "export_subscription_group_members": MessageLookupByLibrary.simpleMessage(
      "تصدير أعضاء مجموعات الاشتراكات؟",
    ),
    "export_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "تصدير مجموعات الاشتراكات؟",
    ),
    "export_subscriptions": MessageLookupByLibrary.simpleMessage(
      "تصدير الاشتراكات؟",
    ),
    "export_tweets": MessageLookupByLibrary.simpleMessage("تصدير التغريدات؟"),
    "export_twitter_tokens": MessageLookupByLibrary.simpleMessage(
      "هل تريد تصدير رمز الجلسة Twitter/X؟",
    ),
    "export_your_data": MessageLookupByLibrary.simpleMessage("تصدير بياناتك"),
    "feed": MessageLookupByLibrary.simpleMessage("الموجز"),
    "filters": MessageLookupByLibrary.simpleMessage("المرشحات"),
    "finish": MessageLookupByLibrary.simpleMessage("انهاء"),
    "finished_with_snapshotData_users": m5,
    "followers": MessageLookupByLibrary.simpleMessage("المتابِعون"),
    "following": MessageLookupByLibrary.simpleMessage("المتابَعون"),
    "forbidden": MessageLookupByLibrary.simpleMessage(
      "تويتر يقول إن الوصول إلى هذا ممنوع",
    ),
    "fritter": MessageLookupByLibrary.simpleMessage("Squawker"),
    "fritter_blue": MessageLookupByLibrary.simpleMessage("سكاوكر أزرق"),
    "functionality_unsupported": MessageLookupByLibrary.simpleMessage(
      "لم يعد تويتر يدعم هذه الميزة!",
    ),
    "general": MessageLookupByLibrary.simpleMessage("العامة"),
    "generic_username": MessageLookupByLibrary.simpleMessage("مستخدِم"),
    "group_name": m6,
    "groups": MessageLookupByLibrary.simpleMessage("المجموعات"),
    "help_make_fritter_even_better": MessageLookupByLibrary.simpleMessage(
      "المساعدة في جعل Squawker أفضل",
    ),
    "help_support_fritters_future": MessageLookupByLibrary.simpleMessage(
      "المساعدة على دعم تطوير Squawker",
    ),
    "hide_sensitive_tweets": MessageLookupByLibrary.simpleMessage(
      "إخفاء التغريدات الحساسة",
    ),
    "home": MessageLookupByLibrary.simpleMessage("الرئيسية"),
    "if_you_have_any_feedback_on_this_feature_please_leave_it_on":
        MessageLookupByLibrary.simpleMessage(
          "إذا كان لديك أي تعليقات عن هذه الميزة، رجائاً اكتبها هنا",
        ),
    "import": MessageLookupByLibrary.simpleMessage("استيراد"),
    "import_data_from_another_device": MessageLookupByLibrary.simpleMessage(
      "استيراد البيانات من جهاز آخر",
    ),
    "import_from_twitter": MessageLookupByLibrary.simpleMessage(
      "الاستيراد من تويتر",
    ),
    "import_subscriptions": MessageLookupByLibrary.simpleMessage(
      "استيراد الاشتراكات",
    ),
    "imported_snapshot_data_users_so_far": m7,
    "include_replies": MessageLookupByLibrary.simpleMessage("تضمين الردود"),
    "include_retweets": MessageLookupByLibrary.simpleMessage(
      "تضمين التغريدات المعاد نشرها",
    ),
    "joined": m8,
    "keep_feed_offset_description": MessageLookupByLibrary.simpleMessage(
      "يتم الاحتفاظ بإزاحة المخطط الزمني للخلاصات عند إعادة تشغيل التطبيق",
    ),
    "keep_feed_offset_label": MessageLookupByLibrary.simpleMessage(
      "حافظ على موازنة الخلاصات",
    ),
    "language": MessageLookupByLibrary.simpleMessage("اللغات"),
    "language_subtitle": MessageLookupByLibrary.simpleMessage(
      "يتطلب إعادة تشغيل",
    ),
    "large": MessageLookupByLibrary.simpleMessage("كبير"),
    "leaner_feeds_description": MessageLookupByLibrary.simpleMessage(
      "لا تظهر روابط المعاينة في التغريدات من الخلاصات",
    ),
    "leaner_feeds_label": MessageLookupByLibrary.simpleMessage("موجز خفيف"),
    "legacy_android_import": MessageLookupByLibrary.simpleMessage(
      "استيردات البيانات للأندرويد القديم",
    ),
    "let_the_developers_know_if_something_is_broken":
        MessageLookupByLibrary.simpleMessage(
          "دع المطورين يعرفون ما إذا كان هناك خطأ ما",
        ),
    "libre_translate_host": MessageLookupByLibrary.simpleMessage(
      "مضيف LibreTranslate",
    ),
    "licenses": MessageLookupByLibrary.simpleMessage("الرخص"),
    "light": MessageLookupByLibrary.simpleMessage("فاتح"),
    "live": MessageLookupByLibrary.simpleMessage("مباشر"),
    "logging": MessageLookupByLibrary.simpleMessage("تسجيل البيانات"),
    "login": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
    "mandatory_label": MessageLookupByLibrary.simpleMessage(
      "الميادين الإلزامية:",
    ),
    "material_3": MessageLookupByLibrary.simpleMessage("Material 3؟"),
    "media": MessageLookupByLibrary.simpleMessage("الوسائط"),
    "media_size": MessageLookupByLibrary.simpleMessage("حجم الوسائط"),
    "medium": MessageLookupByLibrary.simpleMessage("متوسط"),
    "missing_page": MessageLookupByLibrary.simpleMessage("صفحة مفقودة"),
    "mute_video_description": MessageLookupByLibrary.simpleMessage(
      "لتحديد ما إذا كان يجب كتم مقاطع الفيديو افتراضيًا",
    ),
    "mute_videos": MessageLookupByLibrary.simpleMessage(
      "كتم صوت مقاطع الفيديو",
    ),
    "name": MessageLookupByLibrary.simpleMessage("الاسم"),
    "name_label": MessageLookupByLibrary.simpleMessage("الاسم:"),
    "nbr_guest_accounts": m9,
    "newTrans": MessageLookupByLibrary.simpleMessage("الجديد"),
    "next": MessageLookupByLibrary.simpleMessage("التالي"),
    "no": MessageLookupByLibrary.simpleMessage("لا"),
    "no_data_was_returned_which_should_never_happen_please_report_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "لم يتم إرجاع أي بيانات، وهو ما لا ينبغي أن يحدث أبدا. يرجى الإبلاغ عن وجود خلل، إذا كان ذلك ممكنا!",
        ),
    "no_results": MessageLookupByLibrary.simpleMessage("لا نتائج"),
    "no_results_for": MessageLookupByLibrary.simpleMessage("لا توجد نتائج لـ:"),
    "no_subscriptions_try_searching_or_importing_some":
        MessageLookupByLibrary.simpleMessage(
          "لا اشتراكات. حاول أن تبحث أو أن تستورد البعض!",
        ),
    "not_logged_in": MessageLookupByLibrary.simpleMessage(
      "لم يتم تسجيل الدخول",
    ),
    "not_set": MessageLookupByLibrary.simpleMessage("لم يتم تعيينه"),
    "note_due_to_a_twitter_limitation_not_all_tweets_may_be_included":
        MessageLookupByLibrary.simpleMessage(
          "ملاحظة: نظراً لقَيد معين من تويتر، قد لا يتم تضمين جميع التغريدات",
        ),
    "numberFormat_format_total_votes": m10,
    "ok": MessageLookupByLibrary.simpleMessage("تمام"),
    "only_public_subscriptions_can_be_imported":
        MessageLookupByLibrary.simpleMessage(
          "لا يمكن استيراد الاشتراكات إلا من الملفات الشخصية العامة",
        ),
    "oops_something_went_wrong": MessageLookupByLibrary.simpleMessage(
      "أوبسي! حدث خطأ ما 🥲",
    ),
    "open_app_settings": MessageLookupByLibrary.simpleMessage(
      "افتح إعدادات التطبيق",
    ),
    "open_in_browser": MessageLookupByLibrary.simpleMessage("فتح في المتصفّح"),
    "option_confirm_close_description": MessageLookupByLibrary.simpleMessage(
      "قم بالتأكيد عند إغلاق التطبيق",
    ),
    "option_confirm_close_label": MessageLookupByLibrary.simpleMessage(
      "تأكيد الإغلاق",
    ),
    "option_navigation_animations_description":
        MessageLookupByLibrary.simpleMessage("تمكين تأثيرات التنقل"),
    "option_navigation_animations_label": MessageLookupByLibrary.simpleMessage(
      "تأثيرات التنقل",
    ),
    "option_show_navigation_labels_description":
        MessageLookupByLibrary.simpleMessage(
          "إظهار التسميات من أيقونات شريط التنقل",
        ),
    "option_show_navigation_labels_label": MessageLookupByLibrary.simpleMessage(
      "تسميات شريط التنقل",
    ),
    "optional_label": MessageLookupByLibrary.simpleMessage(
      "الحقول الاختيارية:",
    ),
    "page_not_found": MessageLookupByLibrary.simpleMessage(
      "تويتر يقول إن الصفحة غير موجودة، ولكن هذا قد لا يكون صحيحا",
    ),
    "password_label": MessageLookupByLibrary.simpleMessage("كلمة السر:"),
    "permission_not_granted": MessageLookupByLibrary.simpleMessage(
      "الإذن غير ممنوح. يرجى المحاولة مرة أخرى بعد منحه!",
    ),
    "phone_label": MessageLookupByLibrary.simpleMessage("الهاتف:"),
    "pick_a_color": MessageLookupByLibrary.simpleMessage("اختر لون!"),
    "pick_an_icon": MessageLookupByLibrary.simpleMessage("اختر أيقونة!"),
    "pinned_tweet": MessageLookupByLibrary.simpleMessage("تغريدة مثبتة"),
    "playback_speed": MessageLookupByLibrary.simpleMessage("سرعة التشغيل"),
    "please_check_your_internet_connection_error_message": m11,
    "please_enter_a_name": MessageLookupByLibrary.simpleMessage(
      "رجائاً اكتب اسماً",
    ),
    "please_make_sure_the_data_you_wish_to_import_is_located_there_then_press_the_import_button_below":
        MessageLookupByLibrary.simpleMessage(
          "رجائاً تأكد ما إذا كانت البيانات موجودة هناك, ومن ثم اضغط على زر الاستيراد في أدناه.",
        ),
    "please_note_that_the_method_fritter_uses_to_import_subscriptions_is_heavily_rate_limited_by_twitter_so_this_may_fail_if_you_have_a_lot_of_followed_accounts":
        MessageLookupByLibrary.simpleMessage(
          "يرجى ملاحظة أن الطريقة التي يستخدمها Squawker لاستيراد الاشتراكات محدودة بشكل كبير من قبل Twitter/X ، لذلك قد يفشل هذا إذا كان لديك الكثير من الحسابات المتابعة.",
        ),
    "possibly_sensitive": MessageLookupByLibrary.simpleMessage(
      "يحتمل أن تكون حساسة",
    ),
    "possibly_sensitive_profile": MessageLookupByLibrary.simpleMessage(
      "قد يتضمن ملف التعريف هذا صورًا أو لغة أو محتوى آخر يحتمل أن يكون حساسًا. هل مازلت تريد مشاهدته؟",
    ),
    "possibly_sensitive_tweet": MessageLookupByLibrary.simpleMessage(
      "تحتوي هذه التغريدة على محتوى يحتمل أن يكون حساسا. هل ترغب في مشاهدته؟",
    ),
    "prefix": MessageLookupByLibrary.simpleMessage("السابقة"),
    "private_profile": MessageLookupByLibrary.simpleMessage("ملف شخصي خاص"),
    "proxy_description": MessageLookupByLibrary.simpleMessage(
      "الوكيل لجميع الطلبات",
    ),
    "proxy_error": MessageLookupByLibrary.simpleMessage("خطأ في الوكيل"),
    "proxy_label": MessageLookupByLibrary.simpleMessage("الوكيل"),
    "regular_accounts": m12,
    "released_under_the_mit_license": MessageLookupByLibrary.simpleMessage(
      "منشور تحت رخصة الإم أي تي (MIT License)",
    ),
    "remove_from_feed": MessageLookupByLibrary.simpleMessage("تنحية من الموجز"),
    "replying_to": MessageLookupByLibrary.simpleMessage("يرد على"),
    "report": MessageLookupByLibrary.simpleMessage("إبلاغ"),
    "report_a_bug": MessageLookupByLibrary.simpleMessage("الإبلاغ عن خطأ"),
    "reporting_an_error": MessageLookupByLibrary.simpleMessage(
      "الإبلاغ غن خطأ",
    ),
    "reset_home_pages": MessageLookupByLibrary.simpleMessage(
      "إعادة تعيين الصفحة إلى القيمة الافتراضية",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("إعادة المحاولة"),
    "save": MessageLookupByLibrary.simpleMessage("حفظ"),
    "save_bandwidth_using_smaller_images": MessageLookupByLibrary.simpleMessage(
      "حفظ النطاق الترددي مع صور أصغر",
    ),
    "saved": MessageLookupByLibrary.simpleMessage("تم حفظه"),
    "saved_tweet_too_large": MessageLookupByLibrary.simpleMessage(
      "تعذر عرض هذه التغريدة المحفوظة لأنها كبيرة جدًا بحيث لا يمكن تحميلها. الرجاء الإبلاغ عن ذلك للمطورين.",
    ),
    "search": MessageLookupByLibrary.simpleMessage("البحث"),
    "search_term": MessageLookupByLibrary.simpleMessage("مصطلح البحث"),
    "select": MessageLookupByLibrary.simpleMessage("اختيار"),
    "selecting_individual_accounts_to_import_and_assigning_groups_are_both_planned_for_the_future_already":
        MessageLookupByLibrary.simpleMessage(
          "تحديد حسابات مفردة، وتعيين مجموعات هما ميزات قد خُطط لها بالفعل للمستقبل!",
        ),
    "send": MessageLookupByLibrary.simpleMessage("إرسال"),
    "settings": MessageLookupByLibrary.simpleMessage("اﻹعدادات"),
    "share_base_url": MessageLookupByLibrary.simpleMessage(
      "عنوان URL المخصص للمشاركة",
    ),
    "share_base_url_description": MessageLookupByLibrary.simpleMessage(
      "استخدام عنوان URL أساسي مخصص عند المشاركة",
    ),
    "share_tweet_as_image": MessageLookupByLibrary.simpleMessage(
      "مشاركة التغريدة كصورة",
    ),
    "share_tweet_content": MessageLookupByLibrary.simpleMessage(
      "مشاركة محتوى التغريدة",
    ),
    "share_tweet_content_and_link": MessageLookupByLibrary.simpleMessage(
      "مشاركة محتوى التغريدة والرابط",
    ),
    "share_tweet_link": MessageLookupByLibrary.simpleMessage(
      "مشاركة رابط التغريدة",
    ),
    "should_check_for_updates_description":
        MessageLookupByLibrary.simpleMessage(
          "تحقق من وجود تحديثات عندما يبدأ Squawker",
        ),
    "should_check_for_updates_label": MessageLookupByLibrary.simpleMessage(
      "التحقق من وجود تحديثات",
    ),
    "small": MessageLookupByLibrary.simpleMessage("صغير"),
    "something_broke_in_fritter": MessageLookupByLibrary.simpleMessage(
      "حدث خطأ ما في Squawker.",
    ),
    "something_just_went_wrong_in_fritter_and_an_error_report_has_been_generated":
        MessageLookupByLibrary.simpleMessage(
          "حدث خطأ ما في Squawker، وتم إنشاء تقرير لهذا الخطأ، يمكن ارسال التقرير إلى مطوري Squawker لمساعدتهم على إصلاح المشكلة.",
        ),
    "sorry_the_replied_tweet_could_not_be_found":
        MessageLookupByLibrary.simpleMessage(
          "عذرا ، لم يتم العثور على التغريدة التي تم الرد عليها!",
        ),
    "subscribe": MessageLookupByLibrary.simpleMessage("اشتراك"),
    "subscriptions": MessageLookupByLibrary.simpleMessage("الإشتراكات"),
    "subtitles": MessageLookupByLibrary.simpleMessage("السطرجة"),
    "successfully_saved_the_media": MessageLookupByLibrary.simpleMessage(
      "تم حفظ الوسائط!",
    ),
    "system": MessageLookupByLibrary.simpleMessage("النظام"),
    "tap_to_download_release_version": m13,
    "tap_to_show_getMediaType_item_type": m14,
    "thanks_for_helping_fritter": MessageLookupByLibrary.simpleMessage(
      "شكراً على مساعدتك لـ Squawker! 💖",
    ),
    "the_file_does_not_exist_please_ensure_it_is_located_at_file_path": m15,
    "the_github_issue": MessageLookupByLibrary.simpleMessage(
      "مشكلة جيثب (# 143)",
    ),
    "the_tweet_did_not_contain_any_text_this_is_unexpected":
        MessageLookupByLibrary.simpleMessage(
          "التغريدة لا تحتوي على أي نص. هذا غير متوقع",
        ),
    "theme": MessageLookupByLibrary.simpleMessage("السمة"),
    "theme_mode": MessageLookupByLibrary.simpleMessage("وضع النسق"),
    "there_were_no_trends_returned_this_is_unexpected_please_report_as_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "لم يتم إرجاع أي ترند. هذا غير متوقع! رجائاً أبلغ عن خطأ، إذا كان ممكناً.",
        ),
    "this_group_contains_no_subscriptions":
        MessageLookupByLibrary.simpleMessage(
          "هذه المجموعة لا تحتوي على اشتراكات!",
        ),
    "this_took_too_long_to_load_please_check_your_network_connection":
        MessageLookupByLibrary.simpleMessage(
          "استغرق هذا وقتا طويلا للتحميل. رجائاً تأكد من اتصال الشبكة لديك!",
        ),
    "this_tweet_is_unavailable": MessageLookupByLibrary.simpleMessage(
      "هذه التغريدة غير متوفرة. ربما تم حذفها.",
    ),
    "this_tweet_user_name_retweeted": m16,
    "this_user_does_not_follow_anyone": MessageLookupByLibrary.simpleMessage(
      "هذا المستخدم لا يتابِع أحداً!",
    ),
    "this_user_does_not_have_anyone_following_them":
        MessageLookupByLibrary.simpleMessage(
          "ليس لهذا المستخدم أي شخص يتابعه!",
        ),
    "thread": MessageLookupByLibrary.simpleMessage("سلسلة"),
    "thumbnail": MessageLookupByLibrary.simpleMessage("الصورة المصغرة"),
    "thumbnail_not_available": MessageLookupByLibrary.simpleMessage(
      "المعاينة غير متوفرة",
    ),
    "timed_out": MessageLookupByLibrary.simpleMessage("انتهت المهلة"),
    "to_import_specific_subscriptions_enter_your_comma_separated_usernames_below":
        MessageLookupByLibrary.simpleMessage(
          "لاستيراد اشتراكات محددة، أدخل أسماء المستخدمين المفصولة بفواصل أدناه.",
        ),
    "to_import_subscriptions_from_an_existing_twitter_account_enter_your_username_below":
        MessageLookupByLibrary.simpleMessage(
          "لاستيراد الاشتراكات من حساب تويتر موجود، أدخل اسم المستخدم أدناه.",
        ),
    "toggle_all": MessageLookupByLibrary.simpleMessage("تبديل الكل"),
    "translator_label": MessageLookupByLibrary.simpleMessage("المترجم"),
    "translators_description": MessageLookupByLibrary.simpleMessage(
      "استخدم مثيلات LibreTranslate المخصصة",
    ),
    "translators_label": MessageLookupByLibrary.simpleMessage("المترجمين"),
    "trending": MessageLookupByLibrary.simpleMessage("المتداولة"),
    "trends": MessageLookupByLibrary.simpleMessage("الترندات"),
    "true_black": MessageLookupByLibrary.simpleMessage("أسود حقيقي؟"),
    "tweet_font_size_description": MessageLookupByLibrary.simpleMessage(
      "حجم خط التغريدات",
    ),
    "tweet_font_size_label": MessageLookupByLibrary.simpleMessage("حجم الخط"),
    "tweets": MessageLookupByLibrary.simpleMessage("التغريدات"),
    "tweets_and_replies": MessageLookupByLibrary.simpleMessage(
      "التغريدات والردود",
    ),
    "tweets_number": m17,
    "twitter_account_types_both": MessageLookupByLibrary.simpleMessage(
      "ضيف وعادي",
    ),
    "twitter_account_types_description": MessageLookupByLibrary.simpleMessage(
      "نوع الحساب المستخدم",
    ),
    "twitter_account_types_label": MessageLookupByLibrary.simpleMessage(
      "نوع الحساب",
    ),
    "twitter_account_types_only_regular": MessageLookupByLibrary.simpleMessage(
      "عادي فقط",
    ),
    "twitter_account_types_priority_to_regular":
        MessageLookupByLibrary.simpleMessage("الأولويات العادية"),
    "two_home_pages_required": MessageLookupByLibrary.simpleMessage(
      "تحتاج إلى صفحتان على الأقل من صفحات الشاشة الرئيسية.",
    ),
    "unable_to_find_the_available_trend_locations":
        MessageLookupByLibrary.simpleMessage(
          "غير قادر على تحديد موقع الترندات.",
        ),
    "unable_to_find_your_saved_tweets": MessageLookupByLibrary.simpleMessage(
      "غير قادر على العثور على تغريداتك المحفوظة.",
    ),
    "unable_to_import": MessageLookupByLibrary.simpleMessage(
      "غير قادر على الاستيراد",
    ),
    "unable_to_load_home_pages": MessageLookupByLibrary.simpleMessage(
      "تعذر تحميل الصفحات الرئيسية الخاصة بك",
    ),
    "unable_to_load_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "تعذّر تحميل مجموعات الاشتراك",
    ),
    "unable_to_load_the_group": MessageLookupByLibrary.simpleMessage(
      "تعذّر تحميل المجموعة",
    ),
    "unable_to_load_the_group_settings": MessageLookupByLibrary.simpleMessage(
      "غير قادر على تحميل إعدادات المجموعة",
    ),
    "unable_to_load_the_list_of_follows": MessageLookupByLibrary.simpleMessage(
      "غير قادر على تحميل قائمة المتابَعون",
    ),
    "unable_to_load_the_next_page_of_follows":
        MessageLookupByLibrary.simpleMessage(
          "غير قادر على تحميل الصفحة المتابَعون التالية",
        ),
    "unable_to_load_the_next_page_of_replies":
        MessageLookupByLibrary.simpleMessage(
          "غير قادر على تحميل الصفحة التالية من الردود",
        ),
    "unable_to_load_the_next_page_of_tweets":
        MessageLookupByLibrary.simpleMessage(
          "غير قادر على تحميل الصفحة التالية من التغريدات",
        ),
    "unable_to_load_the_profile": MessageLookupByLibrary.simpleMessage(
      "تعذّر تحميل الملف الشخصي",
    ),
    "unable_to_load_the_search_results": MessageLookupByLibrary.simpleMessage(
      "غير قادر على تحميل نتائج البحث.",
    ),
    "unable_to_load_the_trends_for_widget_place_name": m18,
    "unable_to_load_the_tweet": MessageLookupByLibrary.simpleMessage(
      "تعذّر تحميل التغريدات",
    ),
    "unable_to_load_the_tweets": MessageLookupByLibrary.simpleMessage(
      "تعذّر تحميل التغريدات",
    ),
    "unable_to_load_the_tweets_for_the_feed":
        MessageLookupByLibrary.simpleMessage(
          "غير قادر على تحميل التغريدات للمُوجز",
        ),
    "unable_to_refresh_the_subscriptions": MessageLookupByLibrary.simpleMessage(
      "غير قادر على تحديث الاشتراكات",
    ),
    "unable_to_run_the_database_migrations":
        MessageLookupByLibrary.simpleMessage(
          "غير قادر على تشغيل تحديث قاعدة البيانات",
        ),
    "unable_to_save_the_media_twitter_returned_a_status_of_response_statusCode":
        m19,
    "unable_to_stream_the_trend_location_preference":
        MessageLookupByLibrary.simpleMessage(
          "غير قادر على بث تفضيل موقع الترندات",
        ),
    "unknown": MessageLookupByLibrary.simpleMessage("غير معروف"),
    "unsave": MessageLookupByLibrary.simpleMessage("الغاء الحفظ"),
    "unsubscribe": MessageLookupByLibrary.simpleMessage("إلغاء الاشتراك"),
    "unsupported_url": MessageLookupByLibrary.simpleMessage(
      "عنوان URL غير مدعوم",
    ),
    "update_to_release_version_through_your_fdroid_client": m20,
    "updates": MessageLookupByLibrary.simpleMessage("التحديثات"),
    "use_true_black_for_the_dark_mode_theme":
        MessageLookupByLibrary.simpleMessage(
          "استخدم ميزة الأسود الحقيقي للسمة الداكنة",
        ),
    "user_not_found": MessageLookupByLibrary.simpleMessage(
      "لم يُعثر على المستخدم",
    ),
    "username": MessageLookupByLibrary.simpleMessage("اسم المستخدم"),
    "username_exclude": MessageLookupByLibrary.simpleMessage(
      "اسم المستخدم المراد استبعاده",
    ),
    "username_label": MessageLookupByLibrary.simpleMessage("اسم المستخدم:"),
    "usernames": MessageLookupByLibrary.simpleMessage("أسماء المستخدمين"),
    "version": MessageLookupByLibrary.simpleMessage("الإصدار"),
    "warning_regular_account_unauthenticated_access_description":
        MessageLookupByLibrary.simpleMessage(
          "قام Twitter/X بتعطيل القدرة على إنشاء حسابات ضيوف. يجب عليك الآن تعيين الحساب (الحسابات) العادية في الإعدادات / الحساب. مع عدم وجود حساب، يتوفر وصول جزئي يقتصر على التغريدات والملفات الشخصية فقط. من السهل إنشاء حساب عادي مجهول كما هو موضح هنا:",
        ),
    "warning_regular_account_unauthenticated_access_title":
        MessageLookupByLibrary.simpleMessage(
          "الحسابات العادية والوصول غير المتحقق",
        ),
    "when_a_new_app_update_is_available": MessageLookupByLibrary.simpleMessage(
      "عندما يكون هناك تحديث جديد للتطبيق",
    ),
    "whether_errors_should_be_reported_to_":
        MessageLookupByLibrary.simpleMessage(
          "ما إذا يجب على الأخطاء البرمجية أن يُبلّغ عنها إلى ",
        ),
    "whether_to_hide_tweets_marked_as_sensitive":
        MessageLookupByLibrary.simpleMessage(
          "ما إذا كنت تريد إخفاء التغريدات التي تم وضع علامة عليها على أنها حساسة",
        ),
    "which_tab_is_shown_when_the_app_opens":
        MessageLookupByLibrary.simpleMessage(
          "أي لسان سيظهر عندما يفتح التطبيق",
        ),
    "which_tab_is_shown_when_the_subscription_opens":
        MessageLookupByLibrary.simpleMessage(
          "علامة التبويب التي تظهر عند فتح الاشتراك",
        ),
    "would_you_like_to_enable_automatic_error_reporting":
        MessageLookupByLibrary.simpleMessage(
          "هل تُحب أن تفعل مُبَلغ الأخطاء الآلي؟",
        ),
    "x_api": MessageLookupByLibrary.simpleMessage("واجهة برمجة التطبيقات لـ X"),
    "x_client_transaction_id_provider": MessageLookupByLibrary.simpleMessage(
      "x-client-transaction-id provider",
    ),
    "x_client_transaction_id_provider_description":
        MessageLookupByLibrary.simpleMessage(
          "اختر وضع مقدِّم خدمات المعاملات عبر العميل. لا بدّ أنّه اسم محلي، بدون أحرف. المرجع: https://github.com/Teskann/x-client-transaction-id-generator",
        ),
    "yes": MessageLookupByLibrary.simpleMessage("نعم"),
    "yes_please": MessageLookupByLibrary.simpleMessage("نعم، من فضلك"),
    "you_have_not_saved_any_tweets_yet": MessageLookupByLibrary.simpleMessage(
      "لم تحفظ أي تغريدة حتى الآن!",
    ),
    "you_must_have_at_least_2_home_screen_pages":
        MessageLookupByLibrary.simpleMessage(
          "يجب أن يكون لديك على الأقل صفحتان للشاشة الرئيسية",
        ),
    "your_profile_must_be_public_otherwise_the_import_will_not_work":
        MessageLookupByLibrary.simpleMessage(
          "يجب أن يكون ملف التعريف الخاص بك عاما، وإلا لن يعمل الاستيراد",
        ),
    "your_report_will_be_sent_to_fritter__project":
        MessageLookupByLibrary.simpleMessage(
          "تقريرك سيُبعث إلى مشروع Squawker، ويمكن العثور على تفاصيل الخصوصية في:",
        ),
  };
}
