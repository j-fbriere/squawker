// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_Hans locale. All the
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
  String get localeName => 'zh_Hans';

  static String m0(name) => "您确定要删除订阅组 ${name} 吗？";

  static String m1(fileName) => "导出数据至文件 ${fileName}";

  static String m2(fullPath) => "导出数据至路径 ${fullPath}";

  static String m3(timeagoFormat) => "${timeagoFormat} 已结束";

  static String m4(timeagoFormat) => "${timeagoFormat} 结束";

  static String m5(snapshotData) => "${snapshotData} 个用户已导入完成";

  static String m6(name) => "组：${name}";

  static String m7(snapshotData) => "已导入 ${snapshotData} 名用户";

  static String m8(date) => "加入于 ${date}";

  static String m9(nbrGuestAccounts) => "有 ${nbrGuestAccounts} 个来宾账户";

  static String m10(num, numFormatted) =>
      "${Intl.plural(num, zero: '0 票', one: '1 票', two: '2 票', few: '${numFormatted} 票', many: '${numFormatted} 票', other: '${numFormatted} 票')}";

  static String m11(errorMessage) => "请检查您的网络连接。\n\n${errorMessage}";

  static String m12(nbrRegularAccounts) => "常规账户 （${nbrRegularAccounts}）：";

  static String m13(releaseVersion) => "点击下载 ${releaseVersion}";

  static String m14(getMediaType) => "点击 ${getMediaType} 显示";

  static String m15(filePath) => "文件不存在。请确保它位于 ${filePath} 的位置";

  static String m16(thisTweetUserName, timeAgo) =>
      "${thisTweetUserName} 于 ${timeAgo} 前转推了";

  static String m17(num, numFormatted) =>
      "${Intl.plural(num, zero: '0 推文', one: '1 推文', two: '2 推文', few: '${numFormatted} 推文', many: '${numFormatted} 推文', other: '${numFormatted}推文')}";

  static String m18(widgetPlaceName) => "无法加载 ${widgetPlaceName} 的趋势";

  static String m19(responseStatusCode) =>
      "无法保存媒体。Twitter/X 返回的状态是 ${responseStatusCode}";

  static String m20(releaseVersion) => "从 F-Droid 客户端更新 ${releaseVersion}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("关于"),
    "account": MessageLookupByLibrary.simpleMessage("账户"),
    "account_suspended": MessageLookupByLibrary.simpleMessage("账号已被冻结"),
    "activate_non_confirmation_bias_mode_description":
        MessageLookupByLibrary.simpleMessage("隐藏推文作者以避免基于权威论据的确认偏向。"),
    "activate_non_confirmation_bias_mode_label":
        MessageLookupByLibrary.simpleMessage("激活非确认偏向模式"),
    "add_account": MessageLookupByLibrary.simpleMessage("添加账户"),
    "add_account_title": MessageLookupByLibrary.simpleMessage("添加账户"),
    "add_subscriptions": MessageLookupByLibrary.simpleMessage("添加订阅"),
    "add_to_feed": MessageLookupByLibrary.simpleMessage("加入时间轴"),
    "add_to_group": MessageLookupByLibrary.simpleMessage("添加到订阅组"),
    "all": MessageLookupByLibrary.simpleMessage("全部"),
    "all_the_great_software_used_by_fritter":
        MessageLookupByLibrary.simpleMessage("Squawker 所使用的伟大项目😇"),
    "allow_background_play_description": MessageLookupByLibrary.simpleMessage(
      "允许在后台播放",
    ),
    "allow_background_play_label": MessageLookupByLibrary.simpleMessage("后台播放"),
    "allow_background_play_other_apps_description":
        MessageLookupByLibrary.simpleMessage("允许其他应用在后台播放"),
    "allow_background_play_other_apps_label":
        MessageLookupByLibrary.simpleMessage("其他后台应用"),
    "an_update_for_fritter_is_available": MessageLookupByLibrary.simpleMessage(
      "Squawker 有新版本 🚀",
    ),
    "api_key": MessageLookupByLibrary.simpleMessage("API 密钥"),
    "app_info": MessageLookupByLibrary.simpleMessage("应用程序信息"),
    "are_you_sure": MessageLookupByLibrary.simpleMessage("你确定吗？"),
    "are_you_sure_you_want_to_delete_the_subscription_group_name_of_group": m0,
    "back": MessageLookupByLibrary.simpleMessage("返回"),
    "bad_guest_token": MessageLookupByLibrary.simpleMessage(
      "Twitter/X 使我们的访问令牌无效。请尝试重新打开 Squawker！",
    ),
    "beta": MessageLookupByLibrary.simpleMessage("测试版"),
    "blue_theme_based_on_the_twitter_color_scheme":
        MessageLookupByLibrary.simpleMessage("基于 Twitter/X 配色方案的蓝色主题"),
    "cancel": MessageLookupByLibrary.simpleMessage("取消"),
    "catastrophic_failure": MessageLookupByLibrary.simpleMessage("致命问题"),
    "choose": MessageLookupByLibrary.simpleMessage("选择"),
    "choose_pages": MessageLookupByLibrary.simpleMessage("选择页面"),
    "close": MessageLookupByLibrary.simpleMessage("关闭"),
    "community_notes_title": MessageLookupByLibrary.simpleMessage("读者添加了上下文"),
    "confirm_close_fritter": MessageLookupByLibrary.simpleMessage(
      "确定要关闭 Squawker 吗？",
    ),
    "contribute": MessageLookupByLibrary.simpleMessage("贡献 💖"),
    "copied_address_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "已将地址复制到剪切板",
    ),
    "copied_version_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "已复制版本号",
    ),
    "could_not_contact_twitter": MessageLookupByLibrary.simpleMessage(
      "无法访问 Twitter/X",
    ),
    "could_not_find_any_tweets_by_this_user":
        MessageLookupByLibrary.simpleMessage("找不到该用户的任何推文！"),
    "could_not_find_any_tweets_from_the_last_7_days":
        MessageLookupByLibrary.simpleMessage("找不到过去 7 天的任何推文！"),
    "country": MessageLookupByLibrary.simpleMessage("国家"),
    "dark": MessageLookupByLibrary.simpleMessage("暗色主题"),
    "data": MessageLookupByLibrary.simpleMessage("数据"),
    "data_exported_to_fileName": m1,
    "data_exported_to_fullPath": m2,
    "data_imported_successfully": MessageLookupByLibrary.simpleMessage(
      "数据导入成功",
    ),
    "date_created": MessageLookupByLibrary.simpleMessage("创建日期"),
    "date_subscribed": MessageLookupByLibrary.simpleMessage("订阅日期"),
    "default_subscription_tab": MessageLookupByLibrary.simpleMessage("关注页默认标签"),
    "default_tab": MessageLookupByLibrary.simpleMessage("默认页面"),
    "delete": MessageLookupByLibrary.simpleMessage("删除"),
    "disable_screenshots": MessageLookupByLibrary.simpleMessage("禁用截屏"),
    "disable_screenshots_hint": MessageLookupByLibrary.simpleMessage(
      "防止截屏。可能不适用于所有设备。",
    ),
    "disabled": MessageLookupByLibrary.simpleMessage("不显示"),
    "doesnt_work_without_account": MessageLookupByLibrary.simpleMessage(
      "没有账户 Squawker 不工作",
    ),
    "donate": MessageLookupByLibrary.simpleMessage("捐赠"),
    "download": MessageLookupByLibrary.simpleMessage("下载"),
    "download_handling": MessageLookupByLibrary.simpleMessage("下载处理"),
    "download_handling_description": MessageLookupByLibrary.simpleMessage(
      "下载应该如何工作",
    ),
    "download_handling_type_ask": MessageLookupByLibrary.simpleMessage("始终询问"),
    "download_handling_type_directory": MessageLookupByLibrary.simpleMessage(
      "保存到目录",
    ),
    "download_media_no_url": MessageLookupByLibrary.simpleMessage(
      "无法下载。 此媒体可能仅作为在线流提供，Squawker 尚无法下载。",
    ),
    "download_path": MessageLookupByLibrary.simpleMessage("下载路径"),
    "download_video_best_quality_description":
        MessageLookupByLibrary.simpleMessage("以可用的最高质量下载视频"),
    "download_video_best_quality_label": MessageLookupByLibrary.simpleMessage(
      "以最高质量下载视频",
    ),
    "downloading_media": MessageLookupByLibrary.simpleMessage("正在下载媒体…"),
    "edit_account_title": MessageLookupByLibrary.simpleMessage("修改账户"),
    "email_label": MessageLookupByLibrary.simpleMessage("电子邮箱："),
    "enable_": MessageLookupByLibrary.simpleMessage("启用 ？"),
    "ended_timeago_format_endsAt_allowFromNow_true": m3,
    "ends_timeago_format_endsAt_allowFromNow_true": m4,
    "enhanced_feeds_description": MessageLookupByLibrary.simpleMessage(
      "获取时间轴时使用增强版接口（但有更严格的请求速率限制）",
    ),
    "enhanced_feeds_label": MessageLookupByLibrary.simpleMessage("增强版时间轴"),
    "enhanced_profile_description": MessageLookupByLibrary.simpleMessage(
      "获取用户页时使用增强版接口",
    ),
    "enhanced_profile_label": MessageLookupByLibrary.simpleMessage("增强版用户页"),
    "enhanced_searches_description": MessageLookupByLibrary.simpleMessage(
      "搜索时使用增强版接口（但有更严格的请求速率限制）",
    ),
    "enhanced_searches_label": MessageLookupByLibrary.simpleMessage("增强版搜索"),
    "enter_comma_separated_twitter_usernames":
        MessageLookupByLibrary.simpleMessage("输入用英文逗号隔开的 Twitter/X 用户名"),
    "enter_your_twitter_username": MessageLookupByLibrary.simpleMessage(
      "输入您的 Twitter/X 用户名",
    ),
    "error_from_twitter": MessageLookupByLibrary.simpleMessage(
      "来自 Twitter/X 的错误",
    ),
    "exclusions_feed_description": MessageLookupByLibrary.simpleMessage(
      "要从 feed 中排除的用户名列表",
    ),
    "exclusions_feed_label": MessageLookupByLibrary.simpleMessage("feed 中的排除"),
    "export": MessageLookupByLibrary.simpleMessage("导出"),
    "export_guest_accounts": MessageLookupByLibrary.simpleMessage("导出游客账户？"),
    "export_settings": MessageLookupByLibrary.simpleMessage("导出设置？"),
    "export_subscription_group_members": MessageLookupByLibrary.simpleMessage(
      "导出订阅组成员？",
    ),
    "export_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "导出订阅组？",
    ),
    "export_subscriptions": MessageLookupByLibrary.simpleMessage("导出订阅？"),
    "export_tweets": MessageLookupByLibrary.simpleMessage("导出推文？"),
    "export_twitter_tokens": MessageLookupByLibrary.simpleMessage(
      "导出 Twitter/X 令牌？",
    ),
    "export_your_data": MessageLookupByLibrary.simpleMessage("导出您的数据"),
    "feed": MessageLookupByLibrary.simpleMessage("最新"),
    "filters": MessageLookupByLibrary.simpleMessage("过滤器"),
    "finish": MessageLookupByLibrary.simpleMessage("完毕"),
    "finished_with_snapshotData_users": m5,
    "followers": MessageLookupByLibrary.simpleMessage("关注者"),
    "following": MessageLookupByLibrary.simpleMessage("正在关注"),
    "forbidden": MessageLookupByLibrary.simpleMessage("Twitter/X 表示禁止访问此内容"),
    "fritter": MessageLookupByLibrary.simpleMessage("Squawker"),
    "fritter_blue": MessageLookupByLibrary.simpleMessage("Squawker 蓝"),
    "functionality_unsupported": MessageLookupByLibrary.simpleMessage(
      "Twitter/X 不再支持此功能！",
    ),
    "general": MessageLookupByLibrary.simpleMessage("通用"),
    "generic_username": MessageLookupByLibrary.simpleMessage("用户"),
    "group_name": m6,
    "groups": MessageLookupByLibrary.simpleMessage("订阅组"),
    "help_make_fritter_even_better": MessageLookupByLibrary.simpleMessage(
      "一起改进 Squawker，让它变得更好😉",
    ),
    "help_support_fritters_future": MessageLookupByLibrary.simpleMessage(
      "帮助支持 Squawker 的未来🍚",
    ),
    "hide_sensitive_tweets": MessageLookupByLibrary.simpleMessage("隐藏敏感推文"),
    "home": MessageLookupByLibrary.simpleMessage("主页"),
    "if_you_have_any_feedback_on_this_feature_please_leave_it_on":
        MessageLookupByLibrary.simpleMessage("如果您对此功能有任何反馈，请留言于"),
    "import": MessageLookupByLibrary.simpleMessage("导入"),
    "import_data_from_another_device": MessageLookupByLibrary.simpleMessage(
      "从其他设备导入数据",
    ),
    "import_from_twitter": MessageLookupByLibrary.simpleMessage(
      "从 Twitter/X 导入",
    ),
    "import_subscriptions": MessageLookupByLibrary.simpleMessage("导入订阅"),
    "imported_snapshot_data_users_so_far": m7,
    "include_replies": MessageLookupByLibrary.simpleMessage("包括回复"),
    "include_retweets": MessageLookupByLibrary.simpleMessage("包括转推"),
    "joined": m8,
    "keep_feed_offset_description": MessageLookupByLibrary.simpleMessage(
      "应用重启时，会保持时间轴的滚动位置不变",
    ),
    "keep_feed_offset_label": MessageLookupByLibrary.simpleMessage(
      "从上次的位置继续浏览时间轴",
    ),
    "language": MessageLookupByLibrary.simpleMessage("语言"),
    "language_subtitle": MessageLookupByLibrary.simpleMessage("需要重启应用"),
    "large": MessageLookupByLibrary.simpleMessage("大"),
    "leaner_feeds_description": MessageLookupByLibrary.simpleMessage(
      "预览链接不显示在来自源的推文中",
    ),
    "leaner_feeds_label": MessageLookupByLibrary.simpleMessage("时间轴紧凑模式"),
    "legacy_android_import": MessageLookupByLibrary.simpleMessage(
      "从旧的 Android 设备导入",
    ),
    "let_the_developers_know_if_something_is_broken":
        MessageLookupByLibrary.simpleMessage("有问题请告诉开发者🐦"),
    "libre_translate_host": MessageLookupByLibrary.simpleMessage(
      "LibreTranslate 主机",
    ),
    "licenses": MessageLookupByLibrary.simpleMessage("许可证"),
    "light": MessageLookupByLibrary.simpleMessage("亮色主题"),
    "live": MessageLookupByLibrary.simpleMessage("LIVE"),
    "logging": MessageLookupByLibrary.simpleMessage("日志"),
    "login": MessageLookupByLibrary.simpleMessage("登录"),
    "mandatory_label": MessageLookupByLibrary.simpleMessage("强制字段："),
    "material_3": MessageLookupByLibrary.simpleMessage(
      "使用第3版Material Design界面？",
    ),
    "media": MessageLookupByLibrary.simpleMessage("媒体"),
    "media_size": MessageLookupByLibrary.simpleMessage("媒体尺寸"),
    "medium": MessageLookupByLibrary.simpleMessage("中"),
    "missing_page": MessageLookupByLibrary.simpleMessage("缺失的页面"),
    "mute_video_description": MessageLookupByLibrary.simpleMessage(
      "是否应默认将视频静音",
    ),
    "mute_videos": MessageLookupByLibrary.simpleMessage("将视频静音"),
    "name": MessageLookupByLibrary.simpleMessage("取个名字"),
    "name_label": MessageLookupByLibrary.simpleMessage("名称："),
    "nbr_guest_accounts": m9,
    "newTrans": MessageLookupByLibrary.simpleMessage("新的"),
    "next": MessageLookupByLibrary.simpleMessage("下一条"),
    "no": MessageLookupByLibrary.simpleMessage("不"),
    "no_data_was_returned_which_should_never_happen_please_report_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage("没有返回任何数据，这不应该发生。如果可能，请反馈错误！"),
    "no_results": MessageLookupByLibrary.simpleMessage("没有结果"),
    "no_results_for": MessageLookupByLibrary.simpleMessage("搜索词无结果："),
    "no_subscriptions_try_searching_or_importing_some":
        MessageLookupByLibrary.simpleMessage("没有订阅。尝试搜索或导入一些！"),
    "not_logged_in": MessageLookupByLibrary.simpleMessage("未登录"),
    "not_set": MessageLookupByLibrary.simpleMessage("未设置"),
    "note_due_to_a_twitter_limitation_not_all_tweets_may_be_included":
        MessageLookupByLibrary.simpleMessage("注：由于 Twitter/X 的限制，可能不会包含所有推文"),
    "numberFormat_format_total_votes": m10,
    "ok": MessageLookupByLibrary.simpleMessage("确定"),
    "only_public_subscriptions_can_be_imported":
        MessageLookupByLibrary.simpleMessage("只能从公开的个人资料页导入订阅"),
    "oops_something_went_wrong": MessageLookupByLibrary.simpleMessage(
      "哎呀！出了点问题 🥲",
    ),
    "open_app_settings": MessageLookupByLibrary.simpleMessage("打开应用设置"),
    "open_in_browser": MessageLookupByLibrary.simpleMessage("在浏览器中打开"),
    "option_confirm_close_description": MessageLookupByLibrary.simpleMessage(
      "当关闭应用时进行确认",
    ),
    "option_confirm_close_label": MessageLookupByLibrary.simpleMessage("关闭时确认"),
    "option_navigation_animations_description":
        MessageLookupByLibrary.simpleMessage("开启导航动画"),
    "option_navigation_animations_label": MessageLookupByLibrary.simpleMessage(
      "导航动画",
    ),
    "option_show_navigation_labels_description":
        MessageLookupByLibrary.simpleMessage("显示来自导航栏图标的标签"),
    "option_show_navigation_labels_label": MessageLookupByLibrary.simpleMessage(
      "导航栏标签",
    ),
    "optional_label": MessageLookupByLibrary.simpleMessage("可选字段："),
    "page_not_found": MessageLookupByLibrary.simpleMessage(
      "Twitter/X 说该页面不存在，但这可能不是真的",
    ),
    "password_label": MessageLookupByLibrary.simpleMessage("密码："),
    "permission_not_granted": MessageLookupByLibrary.simpleMessage(
      "未授予权限。 请在授权后重试！",
    ),
    "phone_label": MessageLookupByLibrary.simpleMessage("电话号码："),
    "pick_a_color": MessageLookupByLibrary.simpleMessage("挑一种颜色吧！"),
    "pick_an_icon": MessageLookupByLibrary.simpleMessage("挑选图标！"),
    "pinned_tweet": MessageLookupByLibrary.simpleMessage("置顶推文"),
    "playback_speed": MessageLookupByLibrary.simpleMessage("播放速度"),
    "please_check_your_internet_connection_error_message": m11,
    "please_enter_a_name": MessageLookupByLibrary.simpleMessage("请输入订阅组名称"),
    "please_make_sure_the_data_you_wish_to_import_is_located_there_then_press_the_import_button_below":
        MessageLookupByLibrary.simpleMessage("请确保您要导入的数据位于此处，然后点击下方的导入按钮。"),
    "please_note_that_the_method_fritter_uses_to_import_subscriptions_is_heavily_rate_limited_by_twitter_so_this_may_fail_if_you_have_a_lot_of_followed_accounts":
        MessageLookupByLibrary.simpleMessage(
          "请注意，Squawker 用于导入订阅的方法受到 Twitter/X 严格的速率限制，因此如果您有很多关注账号，这可能会失败。",
        ),
    "possibly_sensitive": MessageLookupByLibrary.simpleMessage("潜在敏感"),
    "possibly_sensitive_profile": MessageLookupByLibrary.simpleMessage(
      "该个人资料可能包含潜在的敏感图像、语言或其他内容。是否仍要浏览？",
    ),
    "possibly_sensitive_tweet": MessageLookupByLibrary.simpleMessage(
      "该推文包含潜在的敏感内容。是否浏览？",
    ),
    "prefix": MessageLookupByLibrary.simpleMessage("字首"),
    "private_profile": MessageLookupByLibrary.simpleMessage("个人简介"),
    "proxy_description": MessageLookupByLibrary.simpleMessage("所有请求的代理"),
    "proxy_error": MessageLookupByLibrary.simpleMessage("代理出错"),
    "proxy_label": MessageLookupByLibrary.simpleMessage("代理"),
    "regular_accounts": m12,
    "released_under_the_mit_license": MessageLookupByLibrary.simpleMessage(
      "以 MIT 许可证发布",
    ),
    "remove_from_feed": MessageLookupByLibrary.simpleMessage("从时间轴中移除"),
    "replying_to": MessageLookupByLibrary.simpleMessage("回复"),
    "report": MessageLookupByLibrary.simpleMessage("报告"),
    "report_a_bug": MessageLookupByLibrary.simpleMessage("报告 Bug 🐞"),
    "reporting_an_error": MessageLookupByLibrary.simpleMessage("发送错误报告"),
    "reset_home_pages": MessageLookupByLibrary.simpleMessage("将页面重置为默认值"),
    "retry": MessageLookupByLibrary.simpleMessage("重试"),
    "save": MessageLookupByLibrary.simpleMessage("保存"),
    "save_bandwidth_using_smaller_images": MessageLookupByLibrary.simpleMessage(
      "使用较小的图像以节省带宽",
    ),
    "saved": MessageLookupByLibrary.simpleMessage("书签"),
    "saved_tweet_too_large": MessageLookupByLibrary.simpleMessage(
      "无法显示这条已保存的推文，因其太大导致难以加载。请将它报告给开发者。",
    ),
    "search": MessageLookupByLibrary.simpleMessage("搜索"),
    "search_term": MessageLookupByLibrary.simpleMessage("搜索词"),
    "select": MessageLookupByLibrary.simpleMessage("选择"),
    "selecting_individual_accounts_to_import_and_assigning_groups_are_both_planned_for_the_future_already":
        MessageLookupByLibrary.simpleMessage("未来我们会支持导入单个账号到指定组！"),
    "send": MessageLookupByLibrary.simpleMessage("发送"),
    "settings": MessageLookupByLibrary.simpleMessage("设置"),
    "share_base_url": MessageLookupByLibrary.simpleMessage("自定义分享 URL"),
    "share_base_url_description": MessageLookupByLibrary.simpleMessage(
      "分享时使用自定义的基 URL",
    ),
    "share_tweet_as_image": MessageLookupByLibrary.simpleMessage("以图片形式分享推文"),
    "share_tweet_content": MessageLookupByLibrary.simpleMessage("分享推特内容"),
    "share_tweet_content_and_link": MessageLookupByLibrary.simpleMessage(
      "分享推文内容和链接",
    ),
    "share_tweet_link": MessageLookupByLibrary.simpleMessage("分享推特链接"),
    "should_check_for_updates_description":
        MessageLookupByLibrary.simpleMessage("Squawker 启动时检查更新"),
    "should_check_for_updates_label": MessageLookupByLibrary.simpleMessage(
      "检查更新",
    ),
    "small": MessageLookupByLibrary.simpleMessage("小"),
    "something_broke_in_fritter": MessageLookupByLibrary.simpleMessage(
      "Squawker 发生异常。",
    ),
    "something_just_went_wrong_in_fritter_and_an_error_report_has_been_generated":
        MessageLookupByLibrary.simpleMessage(
          "Squawker 刚刚出了点问题，并生成了错误报告。可将该报告发送给 Squawker 开发者以帮助解决问题。",
        ),
    "sorry_the_replied_tweet_could_not_be_found":
        MessageLookupByLibrary.simpleMessage("对不起，无法找到回复的推文！"),
    "subscribe": MessageLookupByLibrary.simpleMessage("订阅"),
    "subscriptions": MessageLookupByLibrary.simpleMessage("订阅"),
    "subtitles": MessageLookupByLibrary.simpleMessage("字幕"),
    "successfully_saved_the_media": MessageLookupByLibrary.simpleMessage(
      "已保存媒体文件！",
    ),
    "system": MessageLookupByLibrary.simpleMessage("跟随系统"),
    "tap_to_download_release_version": m13,
    "tap_to_show_getMediaType_item_type": m14,
    "thanks_for_helping_fritter": MessageLookupByLibrary.simpleMessage(
      "感谢您帮助 Squawker！💖",
    ),
    "the_file_does_not_exist_please_ensure_it_is_located_at_file_path": m15,
    "the_github_issue": MessageLookupByLibrary.simpleMessage(
      "GitHub Issue (#143)",
    ),
    "the_tweet_did_not_contain_any_text_this_is_unexpected":
        MessageLookupByLibrary.simpleMessage("该推文不包含任何文字"),
    "theme": MessageLookupByLibrary.simpleMessage("主题"),
    "theme_mode": MessageLookupByLibrary.simpleMessage("主题模式"),
    "there_were_no_trends_returned_this_is_unexpected_please_report_as_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage("没有返回的趋势。这是出乎意料的！如果可能，请反馈错误。"),
    "this_group_contains_no_subscriptions":
        MessageLookupByLibrary.simpleMessage("该组不包含任何订阅！"),
    "this_took_too_long_to_load_please_check_your_network_connection":
        MessageLookupByLibrary.simpleMessage("加载时间太长了。 检查您的网络连接！"),
    "this_tweet_is_unavailable": MessageLookupByLibrary.simpleMessage(
      "此推文不可用。它可能已被删除。",
    ),
    "this_tweet_user_name_retweeted": m16,
    "this_user_does_not_follow_anyone": MessageLookupByLibrary.simpleMessage(
      "该用户没有关注任何人！",
    ),
    "this_user_does_not_have_anyone_following_them":
        MessageLookupByLibrary.simpleMessage("该用户无人关注！"),
    "thread": MessageLookupByLibrary.simpleMessage("时间线"),
    "thumbnail": MessageLookupByLibrary.simpleMessage("缩略图"),
    "thumbnail_not_available": MessageLookupByLibrary.simpleMessage("缩略图不可用"),
    "timed_out": MessageLookupByLibrary.simpleMessage("超时"),
    "to_import_specific_subscriptions_enter_your_comma_separated_usernames_below":
        MessageLookupByLibrary.simpleMessage("要导入特定订阅，请在下方输入用英文逗号隔开的用户名。"),
    "to_import_subscriptions_from_an_existing_twitter_account_enter_your_username_below":
        MessageLookupByLibrary.simpleMessage(
          "要从现有的 Twitter/X 账号导入订阅，请在下方输入您的用户名。",
        ),
    "toggle_all": MessageLookupByLibrary.simpleMessage("全选"),
    "translator_label": MessageLookupByLibrary.simpleMessage("翻译器"),
    "translators_description": MessageLookupByLibrary.simpleMessage(
      "使用自定义的 LibreTranslate 实例",
    ),
    "translators_label": MessageLookupByLibrary.simpleMessage("翻译器"),
    "trending": MessageLookupByLibrary.simpleMessage("趋势"),
    "trends": MessageLookupByLibrary.simpleMessage("趋势"),
    "true_black": MessageLookupByLibrary.simpleMessage("纯黑模式？"),
    "tweet_font_size_description": MessageLookupByLibrary.simpleMessage(
      "推文的字体大小",
    ),
    "tweet_font_size_label": MessageLookupByLibrary.simpleMessage("字体大小"),
    "tweets": MessageLookupByLibrary.simpleMessage("推文"),
    "tweets_and_replies": MessageLookupByLibrary.simpleMessage("推文和回复"),
    "tweets_number": m17,
    "twitter_account_types_both": MessageLookupByLibrary.simpleMessage(
      "来宾和常规账户",
    ),
    "twitter_account_types_description": MessageLookupByLibrary.simpleMessage(
      "要使用的账户类型",
    ),
    "twitter_account_types_label": MessageLookupByLibrary.simpleMessage("账户类型"),
    "twitter_account_types_only_regular": MessageLookupByLibrary.simpleMessage(
      "仅常规账户",
    ),
    "twitter_account_types_priority_to_regular":
        MessageLookupByLibrary.simpleMessage("优先使用常规账户"),
    "two_home_pages_required": MessageLookupByLibrary.simpleMessage(
      "你需要有至少 2 个主屏页面。",
    ),
    "unable_to_find_the_available_trend_locations":
        MessageLookupByLibrary.simpleMessage("无法找到可用的趋势位置。"),
    "unable_to_find_your_saved_tweets": MessageLookupByLibrary.simpleMessage(
      "无法找到您保存的推文。",
    ),
    "unable_to_import": MessageLookupByLibrary.simpleMessage("无法导入"),
    "unable_to_load_home_pages": MessageLookupByLibrary.simpleMessage("无法加载主页"),
    "unable_to_load_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "无法载入订阅组",
    ),
    "unable_to_load_the_group": MessageLookupByLibrary.simpleMessage("无法加载该组"),
    "unable_to_load_the_group_settings": MessageLookupByLibrary.simpleMessage(
      "无法加载订阅组的设置",
    ),
    "unable_to_load_the_list_of_follows": MessageLookupByLibrary.simpleMessage(
      "无法加载关注列表",
    ),
    "unable_to_load_the_next_page_of_follows":
        MessageLookupByLibrary.simpleMessage("无法载入下一页关注列表"),
    "unable_to_load_the_next_page_of_replies":
        MessageLookupByLibrary.simpleMessage("无法载入下一页回复"),
    "unable_to_load_the_next_page_of_tweets":
        MessageLookupByLibrary.simpleMessage("无法载入下一页的推文"),
    "unable_to_load_the_profile": MessageLookupByLibrary.simpleMessage(
      "无法载入个人资料",
    ),
    "unable_to_load_the_search_results": MessageLookupByLibrary.simpleMessage(
      "无法载入搜索结果。",
    ),
    "unable_to_load_the_trends_for_widget_place_name": m18,
    "unable_to_load_the_tweet": MessageLookupByLibrary.simpleMessage(
      "无法载入这条推文",
    ),
    "unable_to_load_the_tweets": MessageLookupByLibrary.simpleMessage("无法载入推文"),
    "unable_to_load_the_tweets_for_the_feed":
        MessageLookupByLibrary.simpleMessage("无法载入最新推文"),
    "unable_to_refresh_the_subscriptions": MessageLookupByLibrary.simpleMessage(
      "无法刷新订阅",
    ),
    "unable_to_run_the_database_migrations":
        MessageLookupByLibrary.simpleMessage("无法进行数据迁移"),
    "unable_to_save_the_media_twitter_returned_a_status_of_response_statusCode":
        m19,
    "unable_to_stream_the_trend_location_preference":
        MessageLookupByLibrary.simpleMessage("无法传输趋势位置首选项"),
    "unknown": MessageLookupByLibrary.simpleMessage("未知"),
    "unsave": MessageLookupByLibrary.simpleMessage("取消保存"),
    "unsubscribe": MessageLookupByLibrary.simpleMessage("取消订阅"),
    "unsupported_url": MessageLookupByLibrary.simpleMessage("不受支持的 URL"),
    "update_to_release_version_through_your_fdroid_client": m20,
    "updates": MessageLookupByLibrary.simpleMessage("更新"),
    "use_true_black_for_the_dark_mode_theme":
        MessageLookupByLibrary.simpleMessage("在暗色主题中使用纯黑"),
    "user_not_found": MessageLookupByLibrary.simpleMessage("未找到用户"),
    "username": MessageLookupByLibrary.simpleMessage("用户名"),
    "username_exclude": MessageLookupByLibrary.simpleMessage("要排除的用户名"),
    "username_label": MessageLookupByLibrary.simpleMessage("用户名："),
    "usernames": MessageLookupByLibrary.simpleMessage("用户名"),
    "version": MessageLookupByLibrary.simpleMessage("版本"),
    "warning_regular_account_unauthenticated_access_description":
        MessageLookupByLibrary.simpleMessage(
          "Twitter/X 已经禁止了创建来宾账户的能力。你应该在“设置/账户”下配置常规账户。没有常规账户，只能访问推文和个人资料页。创建匿名的常规账户并不难，步骤见：",
        ),
    "warning_regular_account_unauthenticated_access_title":
        MessageLookupByLibrary.simpleMessage("常规账户和未经身份验证的访问"),
    "when_a_new_app_update_is_available": MessageLookupByLibrary.simpleMessage(
      "当有更新可用时",
    ),
    "whether_errors_should_be_reported_to_":
        MessageLookupByLibrary.simpleMessage("是否应将错误报告给 "),
    "whether_to_hide_tweets_marked_as_sensitive":
        MessageLookupByLibrary.simpleMessage("是否隐藏被标记为敏感的推文"),
    "which_tab_is_shown_when_the_app_opens":
        MessageLookupByLibrary.simpleMessage("打开应用时显示哪个页面"),
    "which_tab_is_shown_when_the_subscription_opens":
        MessageLookupByLibrary.simpleMessage("打开关注页时展示哪个标签"),
    "would_you_like_to_enable_automatic_error_reporting":
        MessageLookupByLibrary.simpleMessage("您希望自动发送错误报告吗？"),
    "x_api": MessageLookupByLibrary.simpleMessage("X API"),
    "x_client_transaction_id_provider": MessageLookupByLibrary.simpleMessage(
      "x-client-transaction-id 提供者",
    ),
    "x_client_transaction_id_provider_description":
        MessageLookupByLibrary.simpleMessage(
          "设置 x-client-transaction-id 提供者。 它必须是域名，不带 https。参考：https://github.com/Teskann/x-client-transaction-id-generator",
        ),
    "yes": MessageLookupByLibrary.simpleMessage("好"),
    "yes_please": MessageLookupByLibrary.simpleMessage("是，请让我看"),
    "you_have_not_saved_any_tweets_yet": MessageLookupByLibrary.simpleMessage(
      "您尚未保存任何推文！",
    ),
    "you_must_have_at_least_2_home_screen_pages":
        MessageLookupByLibrary.simpleMessage("必须至少有 2 个主屏幕页面"),
    "your_profile_must_be_public_otherwise_the_import_will_not_work":
        MessageLookupByLibrary.simpleMessage("你的个人资料必须是公开的，否则无法导入"),
    "your_report_will_be_sent_to_fritter__project":
        MessageLookupByLibrary.simpleMessage(
          "您的报告将被发送至 Squawker 的  项目，隐私详情可在下述位置找到：",
        ),
  };
}
