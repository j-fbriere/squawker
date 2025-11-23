// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_Hant locale. All the
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
  String get localeName => 'zh_Hant';

  static String m3(timeagoFormat) => "已結束 ${timeagoFormat}";

  static String m4(timeagoFormat) => "結束 ${timeagoFormat}";

  static String m6(name) => "${name}";

  static String m8(date) => "加入於 ${date}";

  static String m12(nbrRegularAccounts) => "常規帳戶（${nbrRegularAccounts}）：";

  static String m16(thisTweetUserName, timeAgo) =>
      "${thisTweetUserName} 於 ${timeAgo} 前轉推了";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("關於"),
    "account": MessageLookupByLibrary.simpleMessage("帳戶"),
    "account_suspended": MessageLookupByLibrary.simpleMessage("帳戶被暫停"),
    "add_account": MessageLookupByLibrary.simpleMessage("新增一個帳戶"),
    "add_account_title": MessageLookupByLibrary.simpleMessage("新增一個帳戶"),
    "add_subscriptions": MessageLookupByLibrary.simpleMessage("新增訂閱"),
    "add_to_group": MessageLookupByLibrary.simpleMessage("新增至群組"),
    "all": MessageLookupByLibrary.simpleMessage("全部"),
    "allow_background_play_label": MessageLookupByLibrary.simpleMessage("背景播放"),
    "app_info": MessageLookupByLibrary.simpleMessage("應用程式資訊"),
    "are_you_sure": MessageLookupByLibrary.simpleMessage("你確定嗎？"),
    "back": MessageLookupByLibrary.simpleMessage("返回"),
    "beta": MessageLookupByLibrary.simpleMessage("測試版"),
    "cancel": MessageLookupByLibrary.simpleMessage("取消"),
    "catastrophic_failure": MessageLookupByLibrary.simpleMessage("災難性故障"),
    "choose": MessageLookupByLibrary.simpleMessage("選擇"),
    "choose_pages": MessageLookupByLibrary.simpleMessage("選擇頁面"),
    "close": MessageLookupByLibrary.simpleMessage("關閉"),
    "contribute": MessageLookupByLibrary.simpleMessage("貢獻"),
    "could_not_find_any_tweets_by_this_user":
        MessageLookupByLibrary.simpleMessage("找不到這個使用者的任何推文！"),
    "could_not_find_any_tweets_from_the_last_7_days":
        MessageLookupByLibrary.simpleMessage("找不到過去 7 天的推文！"),
    "country": MessageLookupByLibrary.simpleMessage("國家"),
    "dark": MessageLookupByLibrary.simpleMessage("深色"),
    "data": MessageLookupByLibrary.simpleMessage("資料"),
    "data_imported_successfully": MessageLookupByLibrary.simpleMessage(
      "資料匯入成功",
    ),
    "date_created": MessageLookupByLibrary.simpleMessage("建立日期"),
    "date_subscribed": MessageLookupByLibrary.simpleMessage("訂閱日期"),
    "default_subscription_tab": MessageLookupByLibrary.simpleMessage("預設訂閱分頁"),
    "default_tab": MessageLookupByLibrary.simpleMessage("預設分頁"),
    "delete": MessageLookupByLibrary.simpleMessage("刪除"),
    "disable_screenshots": MessageLookupByLibrary.simpleMessage("停用螢幕截圖"),
    "disabled": MessageLookupByLibrary.simpleMessage("已停用"),
    "donate": MessageLookupByLibrary.simpleMessage("捐贈"),
    "download": MessageLookupByLibrary.simpleMessage("下載"),
    "download_handling": MessageLookupByLibrary.simpleMessage("下載正在處理"),
    "download_handling_type_ask": MessageLookupByLibrary.simpleMessage("總是詢問"),
    "download_handling_type_directory": MessageLookupByLibrary.simpleMessage(
      "儲存至目錄",
    ),
    "download_media_no_url": MessageLookupByLibrary.simpleMessage(
      "無法下載。此媒體可能僅以串流形式提供，而 Squawker 尚無法下載。",
    ),
    "download_path": MessageLookupByLibrary.simpleMessage("下載路徑"),
    "downloading_media": MessageLookupByLibrary.simpleMessage("正在下載媒體…"),
    "edit_account_title": MessageLookupByLibrary.simpleMessage("修改一個帳戶"),
    "email_label": MessageLookupByLibrary.simpleMessage("電子郵件："),
    "enable_": MessageLookupByLibrary.simpleMessage("啟用？"),
    "ended_timeago_format_endsAt_allowFromNow_true": m3,
    "ends_timeago_format_endsAt_allowFromNow_true": m4,
    "enhanced_profile_label": MessageLookupByLibrary.simpleMessage("增強個人檔案"),
    "enhanced_searches_label": MessageLookupByLibrary.simpleMessage("增強搜尋"),
    "error_from_twitter": MessageLookupByLibrary.simpleMessage(
      "來自 Twitter／X 的錯誤",
    ),
    "export": MessageLookupByLibrary.simpleMessage("匯出"),
    "export_guest_accounts": MessageLookupByLibrary.simpleMessage("匯出訪客帳戶？"),
    "export_settings": MessageLookupByLibrary.simpleMessage("匯出設定？"),
    "export_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "匯出訂閱群組？",
    ),
    "export_subscriptions": MessageLookupByLibrary.simpleMessage("匯出訂閱？"),
    "export_tweets": MessageLookupByLibrary.simpleMessage("匯出推文？"),
    "export_twitter_tokens": MessageLookupByLibrary.simpleMessage(
      "匯出 Twitter／X 令牌？",
    ),
    "export_your_data": MessageLookupByLibrary.simpleMessage("匯出你的資料"),
    "filters": MessageLookupByLibrary.simpleMessage("過濾器"),
    "finish": MessageLookupByLibrary.simpleMessage("結束"),
    "followers": MessageLookupByLibrary.simpleMessage("關注者"),
    "following": MessageLookupByLibrary.simpleMessage("正在關注"),
    "fritter": MessageLookupByLibrary.simpleMessage("Squawker"),
    "fritter_blue": MessageLookupByLibrary.simpleMessage("Squawker 藍"),
    "general": MessageLookupByLibrary.simpleMessage("一般"),
    "generic_username": MessageLookupByLibrary.simpleMessage("使用者"),
    "group_name": m6,
    "groups": MessageLookupByLibrary.simpleMessage("群組"),
    "hide_sensitive_tweets": MessageLookupByLibrary.simpleMessage("隱藏敏感推文"),
    "home": MessageLookupByLibrary.simpleMessage("主頁"),
    "import": MessageLookupByLibrary.simpleMessage("匯入"),
    "import_from_twitter": MessageLookupByLibrary.simpleMessage(
      "從 Twitter／X 匯入",
    ),
    "import_subscriptions": MessageLookupByLibrary.simpleMessage("匯入訂閱"),
    "include_replies": MessageLookupByLibrary.simpleMessage("包括回覆"),
    "include_retweets": MessageLookupByLibrary.simpleMessage("包括轉推"),
    "joined": m8,
    "language": MessageLookupByLibrary.simpleMessage("語言"),
    "language_subtitle": MessageLookupByLibrary.simpleMessage("需要重新啟動"),
    "large": MessageLookupByLibrary.simpleMessage("大"),
    "legacy_android_import": MessageLookupByLibrary.simpleMessage(
      "舊版 Android 匯入",
    ),
    "licenses": MessageLookupByLibrary.simpleMessage("許可證"),
    "light": MessageLookupByLibrary.simpleMessage("淺色"),
    "live": MessageLookupByLibrary.simpleMessage("直播"),
    "logging": MessageLookupByLibrary.simpleMessage("記錄"),
    "mandatory_label": MessageLookupByLibrary.simpleMessage("必須填寫欄位："),
    "material_3": MessageLookupByLibrary.simpleMessage("Material 3？"),
    "media": MessageLookupByLibrary.simpleMessage("媒體"),
    "media_size": MessageLookupByLibrary.simpleMessage("媒體尺寸"),
    "medium": MessageLookupByLibrary.simpleMessage("中"),
    "missing_page": MessageLookupByLibrary.simpleMessage("缺少頁面"),
    "mute_videos": MessageLookupByLibrary.simpleMessage("將影片靜音"),
    "name": MessageLookupByLibrary.simpleMessage("名稱"),
    "name_label": MessageLookupByLibrary.simpleMessage("名稱："),
    "newTrans": MessageLookupByLibrary.simpleMessage("新"),
    "next": MessageLookupByLibrary.simpleMessage("下一條"),
    "no": MessageLookupByLibrary.simpleMessage("否"),
    "no_data_was_returned_which_should_never_happen_please_report_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage("未返回任何資料，這不應該發生。若有可能，請回報此錯誤！"),
    "no_results": MessageLookupByLibrary.simpleMessage("沒有結果"),
    "no_results_for": MessageLookupByLibrary.simpleMessage("沒有結果："),
    "not_set": MessageLookupByLibrary.simpleMessage("沒有設定"),
    "note_due_to_a_twitter_limitation_not_all_tweets_may_be_included":
        MessageLookupByLibrary.simpleMessage("注意：由於 Twitter／X 的限制，並非所有推文都包含在內"),
    "ok": MessageLookupByLibrary.simpleMessage("好的"),
    "open_app_settings": MessageLookupByLibrary.simpleMessage("開啟應用程式設定"),
    "open_in_browser": MessageLookupByLibrary.simpleMessage("在瀏覽器中開啟"),
    "option_confirm_close_label": MessageLookupByLibrary.simpleMessage("確認關閉"),
    "option_navigation_animations_label": MessageLookupByLibrary.simpleMessage(
      "導航動畫",
    ),
    "optional_label": MessageLookupByLibrary.simpleMessage("選擇性欄位："),
    "password_label": MessageLookupByLibrary.simpleMessage("密碼："),
    "phone_label": MessageLookupByLibrary.simpleMessage("電話："),
    "pick_a_color": MessageLookupByLibrary.simpleMessage("選擇一種顏色！"),
    "pick_an_icon": MessageLookupByLibrary.simpleMessage("選擇一個圖示！"),
    "pinned_tweet": MessageLookupByLibrary.simpleMessage("已釘選的推文"),
    "playback_speed": MessageLookupByLibrary.simpleMessage("播放速度"),
    "please_note_that_the_method_fritter_uses_to_import_subscriptions_is_heavily_rate_limited_by_twitter_so_this_may_fail_if_you_have_a_lot_of_followed_accounts":
        MessageLookupByLibrary.simpleMessage(
          "請注意，Squawker 使用的訂閱匯入方法受限於 Twitter/X 的速率限制，因此如果您關注了大量帳戶，這可能會失敗。",
        ),
    "possibly_sensitive": MessageLookupByLibrary.simpleMessage("潛在敏感"),
    "possibly_sensitive_profile": MessageLookupByLibrary.simpleMessage(
      "此設定檔可能包含潛在敏感的圖片、語言或其他內容。您是否仍然想要查看？",
    ),
    "prefix": MessageLookupByLibrary.simpleMessage("前綴"),
    "private_profile": MessageLookupByLibrary.simpleMessage("私人個人檔案"),
    "proxy_error": MessageLookupByLibrary.simpleMessage("代理錯誤"),
    "proxy_label": MessageLookupByLibrary.simpleMessage("代理"),
    "regular_accounts": m12,
    "replying_to": MessageLookupByLibrary.simpleMessage("回覆至"),
    "report": MessageLookupByLibrary.simpleMessage("報告"),
    "report_a_bug": MessageLookupByLibrary.simpleMessage("報告錯誤"),
    "reporting_an_error": MessageLookupByLibrary.simpleMessage("報告錯誤"),
    "retry": MessageLookupByLibrary.simpleMessage("重試"),
    "save": MessageLookupByLibrary.simpleMessage("儲存"),
    "saved": MessageLookupByLibrary.simpleMessage("已儲存"),
    "saved_tweet_too_large": MessageLookupByLibrary.simpleMessage(
      "此已儲存的推文無法顯示，因為內容過大無法載入。請向開發者回報此問題。",
    ),
    "search": MessageLookupByLibrary.simpleMessage("搜尋"),
    "search_term": MessageLookupByLibrary.simpleMessage("搜尋詞語"),
    "select": MessageLookupByLibrary.simpleMessage("選擇"),
    "selecting_individual_accounts_to_import_and_assigning_groups_are_both_planned_for_the_future_already":
        MessageLookupByLibrary.simpleMessage("選擇個別帳戶進行匯入以及指派群組功能已經在未來的計劃中！"),
    "send": MessageLookupByLibrary.simpleMessage("傳送"),
    "settings": MessageLookupByLibrary.simpleMessage("設定"),
    "share_base_url": MessageLookupByLibrary.simpleMessage("自訂分享網址"),
    "share_tweet_content": MessageLookupByLibrary.simpleMessage("分享推文內容"),
    "share_tweet_link": MessageLookupByLibrary.simpleMessage("分享推文連結"),
    "should_check_for_updates_label": MessageLookupByLibrary.simpleMessage(
      "檢查更新",
    ),
    "small": MessageLookupByLibrary.simpleMessage("小"),
    "something_just_went_wrong_in_fritter_and_an_error_report_has_been_generated":
        MessageLookupByLibrary.simpleMessage(
          "Squawker 剛剛出現了問題，並產生了錯誤報告。該報告可以傳送給 Squawker 開發人員以協助解決問題。",
        ),
    "subscribe": MessageLookupByLibrary.simpleMessage("訂閱"),
    "subscriptions": MessageLookupByLibrary.simpleMessage("訂閱"),
    "subtitles": MessageLookupByLibrary.simpleMessage("字幕"),
    "successfully_saved_the_media": MessageLookupByLibrary.simpleMessage(
      "已儲存媒體！",
    ),
    "system": MessageLookupByLibrary.simpleMessage("系統"),
    "theme": MessageLookupByLibrary.simpleMessage("主題"),
    "theme_mode": MessageLookupByLibrary.simpleMessage("主題模式"),
    "this_group_contains_no_subscriptions":
        MessageLookupByLibrary.simpleMessage("這個群組不包含訂閱！"),
    "this_took_too_long_to_load_please_check_your_network_connection":
        MessageLookupByLibrary.simpleMessage("加載時間過長。請檢查您的網路連線！"),
    "this_tweet_user_name_retweeted": m16,
    "this_user_does_not_follow_anyone": MessageLookupByLibrary.simpleMessage(
      "這個使用者沒有關注任何人！",
    ),
    "thumbnail": MessageLookupByLibrary.simpleMessage("縮圖"),
    "thumbnail_not_available": MessageLookupByLibrary.simpleMessage("縮圖不可用"),
    "timed_out": MessageLookupByLibrary.simpleMessage("逾時"),
    "to_import_specific_subscriptions_enter_your_comma_separated_usernames_below":
        MessageLookupByLibrary.simpleMessage("若要匯入特定的訂閱，請在下方輸入以逗號分隔的使用者名稱。"),
    "toggle_all": MessageLookupByLibrary.simpleMessage("切換全部"),
    "trending": MessageLookupByLibrary.simpleMessage("流行趨勢"),
    "trends": MessageLookupByLibrary.simpleMessage("趨勢"),
    "true_black": MessageLookupByLibrary.simpleMessage("純黑？"),
    "tweet_font_size_label": MessageLookupByLibrary.simpleMessage("字體大小"),
    "tweets": MessageLookupByLibrary.simpleMessage("推文"),
    "tweets_and_replies": MessageLookupByLibrary.simpleMessage("推文和回覆"),
    "twitter_account_types_both": MessageLookupByLibrary.simpleMessage("訪客和常規"),
    "twitter_account_types_label": MessageLookupByLibrary.simpleMessage("帳戶類型"),
    "unable_to_find_your_saved_tweets": MessageLookupByLibrary.simpleMessage(
      "無法找到你已儲存的推文。",
    ),
    "unable_to_import": MessageLookupByLibrary.simpleMessage("無法匯入"),
    "unable_to_load_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "無法載入訂閱群組",
    ),
    "unable_to_load_the_group": MessageLookupByLibrary.simpleMessage("無法載入群組"),
    "unable_to_load_the_group_settings": MessageLookupByLibrary.simpleMessage(
      "無法載入群組設定",
    ),
    "unable_to_load_the_list_of_follows": MessageLookupByLibrary.simpleMessage(
      "無法載入關注列表",
    ),
    "unable_to_load_the_next_page_of_follows":
        MessageLookupByLibrary.simpleMessage("無法載入下一頁的關注列表"),
    "unable_to_load_the_next_page_of_replies":
        MessageLookupByLibrary.simpleMessage("無法載入下一頁的回覆"),
    "unable_to_load_the_next_page_of_tweets":
        MessageLookupByLibrary.simpleMessage("無法載入下一頁的推文"),
    "unable_to_load_the_search_results": MessageLookupByLibrary.simpleMessage(
      "無法載入搜尋結果。",
    ),
    "unable_to_load_the_tweet": MessageLookupByLibrary.simpleMessage("無法載入推文"),
    "unknown": MessageLookupByLibrary.simpleMessage("未知"),
    "unsave": MessageLookupByLibrary.simpleMessage("取消儲存"),
    "unsubscribe": MessageLookupByLibrary.simpleMessage("取消訂閱"),
    "unsupported_url": MessageLookupByLibrary.simpleMessage("不支援的網址"),
    "updates": MessageLookupByLibrary.simpleMessage("更新"),
    "user_not_found": MessageLookupByLibrary.simpleMessage("找不到使用者"),
    "username": MessageLookupByLibrary.simpleMessage("使用者名稱"),
    "username_exclude": MessageLookupByLibrary.simpleMessage("要排除的使用者名稱"),
    "username_label": MessageLookupByLibrary.simpleMessage("使用者名稱："),
    "usernames": MessageLookupByLibrary.simpleMessage("使用者名稱"),
    "version": MessageLookupByLibrary.simpleMessage("版本"),
    "warning_regular_account_unauthenticated_access_description":
        MessageLookupByLibrary.simpleMessage(
          "Twitter/X 已停用建立訪客帳戶的功能。您現在應該在「設定 / 帳戶」中設置一般帳戶。如果沒有帳戶，將只能部分存取推文和設定檔。您可以按照此處的說明輕鬆創建匿名的一般帳戶：",
        ),
    "would_you_like_to_enable_automatic_error_reporting":
        MessageLookupByLibrary.simpleMessage("你想啟用自動錯誤回報嗎？"),
    "x_api": MessageLookupByLibrary.simpleMessage("X API"),
    "yes": MessageLookupByLibrary.simpleMessage("是"),
    "yes_please": MessageLookupByLibrary.simpleMessage("是的，請"),
    "you_have_not_saved_any_tweets_yet": MessageLookupByLibrary.simpleMessage(
      "你還沒有儲存任何推文！",
    ),
    "your_report_will_be_sent_to_fritter__project":
        MessageLookupByLibrary.simpleMessage(
          "你的報告將傳送至 Squawker 的專案，隱私詳細資訊可以在以下位置找到：",
        ),
  };
}
