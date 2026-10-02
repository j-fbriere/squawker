// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a vi locale. All the
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
  String get localeName => 'vi';

  static String m0(name) => "Bạn chắc là muốn xoá nhóm Đăng ký ${name} chứ ?";

  static String m1(count) => "";

  static String m2(count) => "";

  static String m3(fileName) => "Xuất dữ liệu đến ${fileName}";

  static String m4(fullPath) => "Xuất dữ liệu đến ${fullPath}";

  static String m5(timeagoFormat) => "Đã kết thúc${timeagoFormat}";

  static String m6(timeagoFormat) => "Kết thúc${timeagoFormat}";

  static String m7(snapshotData) => "Đã kết thúc với ${snapshotData} users";

  static String m8(name) => "";

  static String m9(snapshotData) =>
      "${snapshotData}số người dùng đã nhập cho đến hiện tại";

  static String m10(date) => "Đã tham gia từ ${date}";

  static String m11(nbrGuestAccounts) => "";

  static String m12(num, numFormatted) => "";

  static String m13(errorMessage) => "";

  static String m14(nbrRegularAccounts) => "";

  static String m15(count) => "";

  static String m16(releaseVersion) => "Nhấn để tải${releaseVersion}";

  static String m17(getMediaType) => "";

  static String m18(filePath) =>
      "Các tập tin không tồn tại. Hãy chắc chắn nó nằm ở ${filePath}";

  static String m19(thisTweetUserName, timeAgo) => "";

  static String m20(num, numFormatted) =>
      "{num, rỗng, không{không có tweets} một{một tweet} hai{hai tweets}  \nvài{${numFormatted} tweet} nhiều{${numFormatted} tweet}}khác{${numFormatted} tweets}}";

  static String m21(widgetPlaceName) => "";

  static String m22(responseStatusCode) => "";

  static String m23(releaseVersion) =>
      "Cập nhật${releaseVersion}thông qua F-Droid";

  static String m24(seconds) => "";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage(""),
    "about_download": MessageLookupByLibrary.simpleMessage(""),
    "about_download_description": MessageLookupByLibrary.simpleMessage(""),
    "account": MessageLookupByLibrary.simpleMessage(""),
    "account_suspended": MessageLookupByLibrary.simpleMessage(""),
    "activate_non_confirmation_bias_mode_description":
        MessageLookupByLibrary.simpleMessage(""),
    "activate_non_confirmation_bias_mode_label":
        MessageLookupByLibrary.simpleMessage(
          "Kích hoạt chế độ không xác nhận bias",
        ),
    "add_account": MessageLookupByLibrary.simpleMessage(""),
    "add_account_title": MessageLookupByLibrary.simpleMessage(""),
    "add_subscriptions": MessageLookupByLibrary.simpleMessage(""),
    "add_to_feed": MessageLookupByLibrary.simpleMessage(""),
    "add_to_group": MessageLookupByLibrary.simpleMessage("Thêm vào nhóm"),
    "all": MessageLookupByLibrary.simpleMessage(""),
    "all_the_great_software_used_by_fritter":
        MessageLookupByLibrary.simpleMessage(""),
    "allow_background_play_description": MessageLookupByLibrary.simpleMessage(
      "",
    ),
    "allow_background_play_label": MessageLookupByLibrary.simpleMessage(""),
    "allow_background_play_other_apps_description":
        MessageLookupByLibrary.simpleMessage(""),
    "allow_background_play_other_apps_label":
        MessageLookupByLibrary.simpleMessage(""),
    "an_update_for_fritter_is_available": MessageLookupByLibrary.simpleMessage(
      "Bản cập nhật Squawker đã sẵn sàng! 🚀",
    ),
    "api_key": MessageLookupByLibrary.simpleMessage(""),
    "api_server": MessageLookupByLibrary.simpleMessage(""),
    "api_server_address": MessageLookupByLibrary.simpleMessage(""),
    "app_info": MessageLookupByLibrary.simpleMessage("Thông tin ứng dụng"),
    "are_you_sure": MessageLookupByLibrary.simpleMessage(
      "Bạn chắc chắn chưa ?",
    ),
    "are_you_sure_you_want_to_delete_the_subscription_group_name_of_group": m0,
    "autoplay_videos": MessageLookupByLibrary.simpleMessage(""),
    "autoplay_videos_description": MessageLookupByLibrary.simpleMessage(""),
    "back": MessageLookupByLibrary.simpleMessage(""),
    "bad_guest_token": MessageLookupByLibrary.simpleMessage(""),
    "batch_add_to_group": MessageLookupByLibrary.simpleMessage(""),
    "batch_remove_from_feed": MessageLookupByLibrary.simpleMessage(""),
    "batch_remove_from_feed_confirm": m1,
    "batch_unsubscribe": MessageLookupByLibrary.simpleMessage(""),
    "batch_unsubscribe_confirm": m2,
    "beta": MessageLookupByLibrary.simpleMessage("Thử nghiệm"),
    "blue_theme_based_on_the_twitter_color_scheme":
        MessageLookupByLibrary.simpleMessage(""),
    "cancel": MessageLookupByLibrary.simpleMessage("Hủy"),
    "catastrophic_failure": MessageLookupByLibrary.simpleMessage(""),
    "choose": MessageLookupByLibrary.simpleMessage(""),
    "choose_pages": MessageLookupByLibrary.simpleMessage(""),
    "close": MessageLookupByLibrary.simpleMessage("Đóng"),
    "community_notes_title": MessageLookupByLibrary.simpleMessage(""),
    "confirm": MessageLookupByLibrary.simpleMessage(""),
    "confirm_close_fritter": MessageLookupByLibrary.simpleMessage(""),
    "contribute": MessageLookupByLibrary.simpleMessage(""),
    "copied_address_to_clipboard": MessageLookupByLibrary.simpleMessage(""),
    "copied_version_to_clipboard": MessageLookupByLibrary.simpleMessage(""),
    "could_not_contact_twitter": MessageLookupByLibrary.simpleMessage(""),
    "could_not_find_any_tweets_by_this_user":
        MessageLookupByLibrary.simpleMessage(
          "Không tìm thấy tweet nào của người dùng này!",
        ),
    "could_not_find_any_tweets_from_the_last_7_days":
        MessageLookupByLibrary.simpleMessage(
          "Không tìm thấy bất kỳ tweet nào trong 7 ngày qua!",
        ),
    "country": MessageLookupByLibrary.simpleMessage("Quốc gia"),
    "dark": MessageLookupByLibrary.simpleMessage("Tối"),
    "data": MessageLookupByLibrary.simpleMessage("Dữ liệu"),
    "data_exported_to_fileName": m3,
    "data_exported_to_fullPath": m4,
    "data_imported_successfully": MessageLookupByLibrary.simpleMessage(
      "Nhập dữ liệu thành công",
    ),
    "date_created": MessageLookupByLibrary.simpleMessage(""),
    "date_subscribed": MessageLookupByLibrary.simpleMessage(""),
    "default_subscription_tab": MessageLookupByLibrary.simpleMessage(""),
    "default_tab": MessageLookupByLibrary.simpleMessage("Thẻ mặc định"),
    "delete": MessageLookupByLibrary.simpleMessage("Xoá"),
    "deselect_all": MessageLookupByLibrary.simpleMessage(""),
    "disable_screenshots": MessageLookupByLibrary.simpleMessage(""),
    "disable_screenshots_hint": MessageLookupByLibrary.simpleMessage(""),
    "disabled": MessageLookupByLibrary.simpleMessage("Từ chối"),
    "doesnt_work_without_account": MessageLookupByLibrary.simpleMessage(""),
    "donate": MessageLookupByLibrary.simpleMessage(""),
    "download": MessageLookupByLibrary.simpleMessage(""),
    "download_all_tweets": MessageLookupByLibrary.simpleMessage(""),
    "download_completed": MessageLookupByLibrary.simpleMessage(""),
    "download_failed": MessageLookupByLibrary.simpleMessage(""),
    "download_handling": MessageLookupByLibrary.simpleMessage(""),
    "download_handling_description": MessageLookupByLibrary.simpleMessage(""),
    "download_handling_type_ask": MessageLookupByLibrary.simpleMessage(""),
    "download_handling_type_directory": MessageLookupByLibrary.simpleMessage(
      "",
    ),
    "download_media_no_url": MessageLookupByLibrary.simpleMessage(""),
    "download_mode": MessageLookupByLibrary.simpleMessage(""),
    "download_mode_fast": MessageLookupByLibrary.simpleMessage(""),
    "download_mode_full_scan": MessageLookupByLibrary.simpleMessage(""),
    "download_mode_safe": MessageLookupByLibrary.simpleMessage(""),
    "download_path": MessageLookupByLibrary.simpleMessage(""),
    "download_settings": MessageLookupByLibrary.simpleMessage(""),
    "download_started": MessageLookupByLibrary.simpleMessage(""),
    "download_this_tweet": MessageLookupByLibrary.simpleMessage(""),
    "download_tweet": MessageLookupByLibrary.simpleMessage(""),
    "download_video_best_quality_description":
        MessageLookupByLibrary.simpleMessage(""),
    "download_video_best_quality_label": MessageLookupByLibrary.simpleMessage(
      "",
    ),
    "downloading_media": MessageLookupByLibrary.simpleMessage(""),
    "edit_account_title": MessageLookupByLibrary.simpleMessage(""),
    "email_label": MessageLookupByLibrary.simpleMessage(""),
    "enable_": MessageLookupByLibrary.simpleMessage("Kích hoạt ?"),
    "ended_timeago_format_endsAt_allowFromNow_true": m5,
    "ends_timeago_format_endsAt_allowFromNow_true": m6,
    "enhanced_feeds_description": MessageLookupByLibrary.simpleMessage(""),
    "enhanced_feeds_label": MessageLookupByLibrary.simpleMessage(""),
    "enhanced_profile_description": MessageLookupByLibrary.simpleMessage(""),
    "enhanced_profile_label": MessageLookupByLibrary.simpleMessage(""),
    "enhanced_searches_description": MessageLookupByLibrary.simpleMessage(""),
    "enhanced_searches_label": MessageLookupByLibrary.simpleMessage(""),
    "enter_comma_separated_twitter_usernames":
        MessageLookupByLibrary.simpleMessage(""),
    "enter_your_twitter_username": MessageLookupByLibrary.simpleMessage(
      "Nhập tên người dùng Twitter/X của bạn",
    ),
    "error_from_twitter": MessageLookupByLibrary.simpleMessage(""),
    "exclusions_feed_description": MessageLookupByLibrary.simpleMessage(""),
    "exclusions_feed_label": MessageLookupByLibrary.simpleMessage(""),
    "export": MessageLookupByLibrary.simpleMessage("Xuất"),
    "export_guest_accounts": MessageLookupByLibrary.simpleMessage(
      "Xuất các tài khoản gợi ý?",
    ),
    "export_settings": MessageLookupByLibrary.simpleMessage(
      "Cài đặt xuất dữ liệu?",
    ),
    "export_subscription_group_members": MessageLookupByLibrary.simpleMessage(
      "Xuất thành viên của các nhóm đăng ký?",
    ),
    "export_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "Xuất các nhóm đăng ký?",
    ),
    "export_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Xuất các đăng ký?",
    ),
    "export_tweets": MessageLookupByLibrary.simpleMessage("Xuất các tweet?"),
    "export_twitter_tokens": MessageLookupByLibrary.simpleMessage(""),
    "export_your_data": MessageLookupByLibrary.simpleMessage("Xuất dữ liệu"),
    "failed_to_load_video": MessageLookupByLibrary.simpleMessage(""),
    "feed": MessageLookupByLibrary.simpleMessage("Nguồn tin"),
    "filters": MessageLookupByLibrary.simpleMessage("Bộ lọc"),
    "finish": MessageLookupByLibrary.simpleMessage(""),
    "finished_with_snapshotData_users": m7,
    "followers": MessageLookupByLibrary.simpleMessage("Người theo dõi"),
    "following": MessageLookupByLibrary.simpleMessage("Đang theo dõi"),
    "forbidden": MessageLookupByLibrary.simpleMessage(""),
    "fritter": MessageLookupByLibrary.simpleMessage(""),
    "fritter_blue": MessageLookupByLibrary.simpleMessage(""),
    "functionality_unsupported": MessageLookupByLibrary.simpleMessage(""),
    "general": MessageLookupByLibrary.simpleMessage("Chung"),
    "generic_username": MessageLookupByLibrary.simpleMessage(""),
    "group_name": m8,
    "groups": MessageLookupByLibrary.simpleMessage(""),
    "help_make_fritter_even_better": MessageLookupByLibrary.simpleMessage(""),
    "help_support_fritters_future": MessageLookupByLibrary.simpleMessage(""),
    "hide_sensitive_tweets": MessageLookupByLibrary.simpleMessage(""),
    "home": MessageLookupByLibrary.simpleMessage(""),
    "if_you_have_any_feedback_on_this_feature_please_leave_it_on":
        MessageLookupByLibrary.simpleMessage(
          "Nếu bạn có bất kỳ phản hồi nào về tính năng này, vui lòng để lại ý kiến",
        ),
    "import": MessageLookupByLibrary.simpleMessage("Nhập"),
    "import_data_from_another_device": MessageLookupByLibrary.simpleMessage(
      "Nhập từ thiết bị khác",
    ),
    "import_from_twitter": MessageLookupByLibrary.simpleMessage(""),
    "import_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Nhập các Đăng ký",
    ),
    "imported_snapshot_data_users_so_far": m9,
    "include_replies": MessageLookupByLibrary.simpleMessage(
      "Bao gồm câu trả lời",
    ),
    "include_retweets": MessageLookupByLibrary.simpleMessage(
      "Bao gồm đăng lại",
    ),
    "invert_selection": MessageLookupByLibrary.simpleMessage(""),
    "joined": m10,
    "keep_feed_offset_description": MessageLookupByLibrary.simpleMessage(""),
    "keep_feed_offset_label": MessageLookupByLibrary.simpleMessage(""),
    "language": MessageLookupByLibrary.simpleMessage(""),
    "language_subtitle": MessageLookupByLibrary.simpleMessage(""),
    "large": MessageLookupByLibrary.simpleMessage("Lớn"),
    "leaner_feeds_description": MessageLookupByLibrary.simpleMessage(""),
    "leaner_feeds_label": MessageLookupByLibrary.simpleMessage(""),
    "legacy_android_import": MessageLookupByLibrary.simpleMessage(
      "Nhập Legacy Android",
    ),
    "let_the_developers_know_if_something_is_broken":
        MessageLookupByLibrary.simpleMessage(""),
    "libre_translate_host": MessageLookupByLibrary.simpleMessage(""),
    "licenses": MessageLookupByLibrary.simpleMessage(""),
    "light": MessageLookupByLibrary.simpleMessage("Sáng"),
    "live": MessageLookupByLibrary.simpleMessage(""),
    "logging": MessageLookupByLibrary.simpleMessage("Đang đăng nhập"),
    "login": MessageLookupByLibrary.simpleMessage(""),
    "loop_videos": MessageLookupByLibrary.simpleMessage(""),
    "loop_videos_description": MessageLookupByLibrary.simpleMessage(""),
    "mandatory_label": MessageLookupByLibrary.simpleMessage(""),
    "material_3": MessageLookupByLibrary.simpleMessage("Dùng Material 3?"),
    "media": MessageLookupByLibrary.simpleMessage("Phương tiện"),
    "media_image_quality": MessageLookupByLibrary.simpleMessage(""),
    "media_size": MessageLookupByLibrary.simpleMessage(
      "Kích thước phương tiện",
    ),
    "media_video_quality": MessageLookupByLibrary.simpleMessage(""),
    "medium": MessageLookupByLibrary.simpleMessage("Vừa"),
    "missing_page": MessageLookupByLibrary.simpleMessage(""),
    "mute_video_description": MessageLookupByLibrary.simpleMessage(""),
    "mute_videos": MessageLookupByLibrary.simpleMessage(""),
    "name": MessageLookupByLibrary.simpleMessage("Tên"),
    "name_label": MessageLookupByLibrary.simpleMessage(""),
    "nbr_guest_accounts": m11,
    "newTrans": MessageLookupByLibrary.simpleMessage("Mới"),
    "next": MessageLookupByLibrary.simpleMessage(""),
    "no": MessageLookupByLibrary.simpleMessage("Không"),
    "no_data_was_returned_which_should_never_happen_please_report_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "Không có dữ liệu được trả về, điều này không bao giờ xảy ra. Nếu được vui lòng báo cáo lỗi!",
        ),
    "no_results": MessageLookupByLibrary.simpleMessage("Không có kết quả"),
    "no_results_for": MessageLookupByLibrary.simpleMessage(
      "Không có kết quả cho:",
    ),
    "no_subscriptions_try_searching_or_importing_some":
        MessageLookupByLibrary.simpleMessage(""),
    "not_logged_in": MessageLookupByLibrary.simpleMessage(""),
    "not_set": MessageLookupByLibrary.simpleMessage(""),
    "note_due_to_a_twitter_limitation_not_all_tweets_may_be_included":
        MessageLookupByLibrary.simpleMessage(
          "Lưu ý: Do giới hạn của Twitter/X, không phải tất cả các tweet đều có thể được đưa vào",
        ),
    "numberFormat_format_total_votes": m12,
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "only_public_subscriptions_can_be_imported":
        MessageLookupByLibrary.simpleMessage(""),
    "oops_something_went_wrong": MessageLookupByLibrary.simpleMessage(
      "Ôi! Có chuyện gì đó sai sai ở đây rồi\n🥲",
    ),
    "open_app_settings": MessageLookupByLibrary.simpleMessage(""),
    "open_in_browser": MessageLookupByLibrary.simpleMessage(""),
    "option_confirm_close_description": MessageLookupByLibrary.simpleMessage(
      "",
    ),
    "option_confirm_close_label": MessageLookupByLibrary.simpleMessage(""),
    "option_navigation_animations_description":
        MessageLookupByLibrary.simpleMessage(""),
    "option_navigation_animations_label": MessageLookupByLibrary.simpleMessage(
      "",
    ),
    "option_show_navigation_labels_description":
        MessageLookupByLibrary.simpleMessage(""),
    "option_show_navigation_labels_label": MessageLookupByLibrary.simpleMessage(
      "",
    ),
    "optional_label": MessageLookupByLibrary.simpleMessage(""),
    "page_not_found": MessageLookupByLibrary.simpleMessage(""),
    "password_label": MessageLookupByLibrary.simpleMessage(""),
    "permission_not_granted": MessageLookupByLibrary.simpleMessage(""),
    "phone_label": MessageLookupByLibrary.simpleMessage(""),
    "pick_a_color": MessageLookupByLibrary.simpleMessage("Chọn màu đi!"),
    "pick_an_icon": MessageLookupByLibrary.simpleMessage("Chọn biểu tượng!"),
    "pinned_tweet": MessageLookupByLibrary.simpleMessage(""),
    "playback_speed": MessageLookupByLibrary.simpleMessage(""),
    "please_check_your_internet_connection_error_message": m13,
    "please_enter_a_name": MessageLookupByLibrary.simpleMessage("Hãy nhập tên"),
    "please_make_sure_the_data_you_wish_to_import_is_located_there_then_press_the_import_button_below":
        MessageLookupByLibrary.simpleMessage(
          "Hãy đảm bảo rằng dữ liệu bạn muốn nhập đã tồn tại sẵn, sau đó hãy nhấn nút nhập bên dưới.",
        ),
    "please_note_that_the_method_fritter_uses_to_import_subscriptions_is_heavily_rate_limited_by_twitter_so_this_may_fail_if_you_have_a_lot_of_followed_accounts":
        MessageLookupByLibrary.simpleMessage(
          "Xin lưu ý rằng phương pháp mà Squawker sử dụng để nhập đăng ký bị giới hạn tỷ lệ rất nhiều bởi Twitter/X, vì vậy phương pháp này có thể không thành công nếu bạn có nhiều tài khoản theo dõi.",
        ),
    "possibly_sensitive": MessageLookupByLibrary.simpleMessage(""),
    "possibly_sensitive_profile": MessageLookupByLibrary.simpleMessage(""),
    "possibly_sensitive_tweet": MessageLookupByLibrary.simpleMessage(""),
    "prefix": MessageLookupByLibrary.simpleMessage("tiền tố"),
    "private_profile": MessageLookupByLibrary.simpleMessage(""),
    "proxy_description": MessageLookupByLibrary.simpleMessage(""),
    "proxy_error": MessageLookupByLibrary.simpleMessage(""),
    "proxy_label": MessageLookupByLibrary.simpleMessage(""),
    "quality": MessageLookupByLibrary.simpleMessage(""),
    "regular_accounts": m14,
    "released_under_the_mit_license": MessageLookupByLibrary.simpleMessage(""),
    "remove_from_feed": MessageLookupByLibrary.simpleMessage(""),
    "replying_to": MessageLookupByLibrary.simpleMessage(""),
    "report": MessageLookupByLibrary.simpleMessage("Báo cáo"),
    "report_a_bug": MessageLookupByLibrary.simpleMessage(""),
    "reporting_an_error": MessageLookupByLibrary.simpleMessage("Báo lỗi"),
    "reset_home_pages": MessageLookupByLibrary.simpleMessage(""),
    "restart_video_player": MessageLookupByLibrary.simpleMessage(""),
    "retry": MessageLookupByLibrary.simpleMessage(""),
    "save": MessageLookupByLibrary.simpleMessage(""),
    "save_bandwidth_using_smaller_images": MessageLookupByLibrary.simpleMessage(
      "Tiết kiệm lưu lượng mạng với kích thước nhỏ hơn",
    ),
    "save_bandwidth_using_smaller_videos": MessageLookupByLibrary.simpleMessage(
      "",
    ),
    "saved": MessageLookupByLibrary.simpleMessage("Đã lưu"),
    "saved_tweet_too_large": MessageLookupByLibrary.simpleMessage(""),
    "search": MessageLookupByLibrary.simpleMessage("Tìm kiếm"),
    "search_term": MessageLookupByLibrary.simpleMessage(""),
    "select": MessageLookupByLibrary.simpleMessage("Chọn"),
    "select_all": MessageLookupByLibrary.simpleMessage(""),
    "select_groups": MessageLookupByLibrary.simpleMessage(""),
    "selected_count": m15,
    "selecting_individual_accounts_to_import_and_assigning_groups_are_both_planned_for_the_future_already":
        MessageLookupByLibrary.simpleMessage(
          "Việc chọn tài khoản cá nhân để nhập và phân nhóm đều đã được lên kế hoạch cho tương lai!",
        ),
    "send": MessageLookupByLibrary.simpleMessage("Gửi"),
    "settings": MessageLookupByLibrary.simpleMessage("Cài đặt"),
    "settings_saved": MessageLookupByLibrary.simpleMessage(""),
    "share_base_url": MessageLookupByLibrary.simpleMessage(""),
    "share_base_url_description": MessageLookupByLibrary.simpleMessage(""),
    "share_tweet_as_image": MessageLookupByLibrary.simpleMessage(""),
    "share_tweet_content": MessageLookupByLibrary.simpleMessage(""),
    "share_tweet_content_and_link": MessageLookupByLibrary.simpleMessage(""),
    "share_tweet_link": MessageLookupByLibrary.simpleMessage(""),
    "should_check_for_updates_description":
        MessageLookupByLibrary.simpleMessage(""),
    "should_check_for_updates_label": MessageLookupByLibrary.simpleMessage(""),
    "small": MessageLookupByLibrary.simpleMessage("Nhỏ"),
    "something_broke_in_fritter": MessageLookupByLibrary.simpleMessage(""),
    "something_just_went_wrong_in_fritter_and_an_error_report_has_been_generated":
        MessageLookupByLibrary.simpleMessage(
          "Đã xảy ra lỗi trên Squawker và đã tạo báo cáo lỗi . Báo cáo có thể được gửi đến các nhà phát triển Squawker để khắc phục sự cố.",
        ),
    "sorry_the_replied_tweet_could_not_be_found":
        MessageLookupByLibrary.simpleMessage(""),
    "subscribe": MessageLookupByLibrary.simpleMessage("Dịch"),
    "subscriptions": MessageLookupByLibrary.simpleMessage("Đăng ký"),
    "subtitles": MessageLookupByLibrary.simpleMessage(""),
    "successfully_saved_the_media": MessageLookupByLibrary.simpleMessage(""),
    "system": MessageLookupByLibrary.simpleMessage("Hệ thống"),
    "tap_to_download_release_version": m16,
    "tap_to_show_getMediaType_item_type": m17,
    "thanks_for_helping_fritter": MessageLookupByLibrary.simpleMessage(
      "Cảm ơn vì đã giúp đỡ Squawker! 💖",
    ),
    "the_file_does_not_exist_please_ensure_it_is_located_at_file_path": m18,
    "the_github_issue": MessageLookupByLibrary.simpleMessage(
      "vấn đề GitHub (#143)",
    ),
    "the_tweet_did_not_contain_any_text_this_is_unexpected":
        MessageLookupByLibrary.simpleMessage(""),
    "theme": MessageLookupByLibrary.simpleMessage("Chủ đề"),
    "theme_mode": MessageLookupByLibrary.simpleMessage("Giao diện chủ đề"),
    "there_were_no_trends_returned_this_is_unexpected_please_report_as_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(""),
    "this_group_contains_no_subscriptions":
        MessageLookupByLibrary.simpleMessage(
          "Nhóm này không có mục đăng ký nào!",
        ),
    "this_took_too_long_to_load_please_check_your_network_connection":
        MessageLookupByLibrary.simpleMessage(
          "Đã tốn nhiều thời gian để tải. Hãy kiểm tra kết nối mạng của bạn!",
        ),
    "this_tweet_is_unavailable": MessageLookupByLibrary.simpleMessage(""),
    "this_tweet_user_name_retweeted": m19,
    "this_user_does_not_follow_anyone": MessageLookupByLibrary.simpleMessage(
      "Người dùng không theo dõi ai!",
    ),
    "this_user_does_not_have_anyone_following_them":
        MessageLookupByLibrary.simpleMessage(
          "Người dùng này không có ai theo dõi!",
        ),
    "thread": MessageLookupByLibrary.simpleMessage(""),
    "thumbnail": MessageLookupByLibrary.simpleMessage("Hình thu nhỏ"),
    "thumbnail_not_available": MessageLookupByLibrary.simpleMessage(""),
    "timed_out": MessageLookupByLibrary.simpleMessage("Hết giờ"),
    "to_import_specific_subscriptions_enter_your_comma_separated_usernames_below":
        MessageLookupByLibrary.simpleMessage(""),
    "to_import_subscriptions_from_an_existing_twitter_account_enter_your_username_below":
        MessageLookupByLibrary.simpleMessage(
          "Để nhập đăng ký từ tài khoản Twitter/X hiện có, hãy nhập tên người dùng của bạn bên dưới.",
        ),
    "toggle_all": MessageLookupByLibrary.simpleMessage("Chuyển đổi tất cả"),
    "translator_label": MessageLookupByLibrary.simpleMessage(""),
    "translators_description": MessageLookupByLibrary.simpleMessage(""),
    "translators_label": MessageLookupByLibrary.simpleMessage(""),
    "trending": MessageLookupByLibrary.simpleMessage("Xu hướng"),
    "trends": MessageLookupByLibrary.simpleMessage("Xu hướng"),
    "true_black": MessageLookupByLibrary.simpleMessage("Đen?"),
    "tweet_font_size_description": MessageLookupByLibrary.simpleMessage(""),
    "tweet_font_size_label": MessageLookupByLibrary.simpleMessage(""),
    "tweets": MessageLookupByLibrary.simpleMessage("Tweets"),
    "tweets_and_replies": MessageLookupByLibrary.simpleMessage(
      "Tweets & Trả lời",
    ),
    "tweets_number": m20,
    "twitter_account_types_both": MessageLookupByLibrary.simpleMessage(""),
    "twitter_account_types_description": MessageLookupByLibrary.simpleMessage(
      "",
    ),
    "twitter_account_types_label": MessageLookupByLibrary.simpleMessage(""),
    "twitter_account_types_only_regular": MessageLookupByLibrary.simpleMessage(
      "",
    ),
    "twitter_account_types_priority_to_regular":
        MessageLookupByLibrary.simpleMessage(""),
    "two_home_pages_required": MessageLookupByLibrary.simpleMessage(""),
    "unable_to_find_the_available_trend_locations":
        MessageLookupByLibrary.simpleMessage(
          "Không thể tìm thấy xu hướng cho vị trí này.",
        ),
    "unable_to_find_your_saved_tweets": MessageLookupByLibrary.simpleMessage(
      "Không tìm thấy các tweet đã lưu",
    ),
    "unable_to_import": MessageLookupByLibrary.simpleMessage("Không thể nhập"),
    "unable_to_load_home_pages": MessageLookupByLibrary.simpleMessage(""),
    "unable_to_load_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "Không thể tải nhóm đăng ký",
    ),
    "unable_to_load_the_group": MessageLookupByLibrary.simpleMessage(
      "Không thể tải nhóm",
    ),
    "unable_to_load_the_group_settings": MessageLookupByLibrary.simpleMessage(
      "Không thể tải cài đặt nhóm",
    ),
    "unable_to_load_the_list_of_follows": MessageLookupByLibrary.simpleMessage(
      "Không thể tải danh sách theo dõi",
    ),
    "unable_to_load_the_next_page_of_follows":
        MessageLookupByLibrary.simpleMessage(
          "Không thể tải danh sách theo dõi kế tiếp",
        ),
    "unable_to_load_the_next_page_of_replies":
        MessageLookupByLibrary.simpleMessage(
          "Không thể tải trang trả lời kế tiếp",
        ),
    "unable_to_load_the_next_page_of_tweets":
        MessageLookupByLibrary.simpleMessage("Không thể tải tweet tiếp theo"),
    "unable_to_load_the_profile": MessageLookupByLibrary.simpleMessage(
      "Không thể tải hồ sơ",
    ),
    "unable_to_load_the_search_results": MessageLookupByLibrary.simpleMessage(
      "Không thể tải kết quả tìm kiếm",
    ),
    "unable_to_load_the_trends_for_widget_place_name": m21,
    "unable_to_load_the_tweet": MessageLookupByLibrary.simpleMessage(
      "Không thể tải tweet",
    ),
    "unable_to_load_the_tweets": MessageLookupByLibrary.simpleMessage(
      "Không thể tải các tweet",
    ),
    "unable_to_load_the_tweets_for_the_feed":
        MessageLookupByLibrary.simpleMessage(
          "Không thể tải tweet cho nguồn tin",
        ),
    "unable_to_refresh_the_subscriptions": MessageLookupByLibrary.simpleMessage(
      "",
    ),
    "unable_to_run_the_database_migrations":
        MessageLookupByLibrary.simpleMessage(""),
    "unable_to_save_the_media_twitter_returned_a_status_of_response_statusCode":
        m22,
    "unable_to_stream_the_trend_location_preference":
        MessageLookupByLibrary.simpleMessage(
          "Không thể phát trực tuyến xu hướng theo vị trí ưa thích",
        ),
    "unknown": MessageLookupByLibrary.simpleMessage(""),
    "unsave": MessageLookupByLibrary.simpleMessage(""),
    "unsubscribe": MessageLookupByLibrary.simpleMessage("Hủy đăng ký"),
    "unsupported_url": MessageLookupByLibrary.simpleMessage(""),
    "update_to_release_version_through_your_fdroid_client": m23,
    "updates": MessageLookupByLibrary.simpleMessage("Cập nhật"),
    "use_true_black_for_the_dark_mode_theme":
        MessageLookupByLibrary.simpleMessage(
          "Ở chế độ tối, dùng màu đen thay vì màu xám",
        ),
    "user_not_found": MessageLookupByLibrary.simpleMessage(""),
    "username": MessageLookupByLibrary.simpleMessage("Tên người dùng"),
    "username_exclude": MessageLookupByLibrary.simpleMessage(""),
    "username_label": MessageLookupByLibrary.simpleMessage(""),
    "usernames": MessageLookupByLibrary.simpleMessage(""),
    "version": MessageLookupByLibrary.simpleMessage(""),
    "video_prefetch": MessageLookupByLibrary.simpleMessage(""),
    "video_prefetch_description": MessageLookupByLibrary.simpleMessage(""),
    "video_prefetch_seconds": m24,
    "video_prefetch_unlimited": MessageLookupByLibrary.simpleMessage(""),
    "warning_regular_account_unauthenticated_access_description":
        MessageLookupByLibrary.simpleMessage(""),
    "warning_regular_account_unauthenticated_access_title":
        MessageLookupByLibrary.simpleMessage(""),
    "when_a_new_app_update_is_available": MessageLookupByLibrary.simpleMessage(
      "Khi ứng dụng mới có sẵn",
    ),
    "whether_errors_should_be_reported_to_":
        MessageLookupByLibrary.simpleMessage(""),
    "whether_to_hide_tweets_marked_as_sensitive":
        MessageLookupByLibrary.simpleMessage(""),
    "which_tab_is_shown_when_the_app_opens":
        MessageLookupByLibrary.simpleMessage(
          "Thẻ nào sẽ hiển thị ra khi mở ứng dụng",
        ),
    "which_tab_is_shown_when_the_subscription_opens":
        MessageLookupByLibrary.simpleMessage(""),
    "would_you_like_to_enable_automatic_error_reporting":
        MessageLookupByLibrary.simpleMessage(
          "Bạn có muốn bật tự động báo lỗi không?",
        ),
    "x_api": MessageLookupByLibrary.simpleMessage(""),
    "x_client_transaction_id_provider": MessageLookupByLibrary.simpleMessage(
      "",
    ),
    "x_client_transaction_id_provider_description":
        MessageLookupByLibrary.simpleMessage(""),
    "yes": MessageLookupByLibrary.simpleMessage("Có"),
    "yes_please": MessageLookupByLibrary.simpleMessage("Vâng, đồng ý"),
    "you_have_not_saved_any_tweets_yet": MessageLookupByLibrary.simpleMessage(
      "Bạn chưa lưu bất kỳ tweet nào!",
    ),
    "you_must_have_at_least_2_home_screen_pages":
        MessageLookupByLibrary.simpleMessage(""),
    "your_profile_must_be_public_otherwise_the_import_will_not_work":
        MessageLookupByLibrary.simpleMessage(
          "Hồ sơ của bạn phải ở chế độ công khai, nếu không quá trình nhập sẽ không hoạt động",
        ),
    "your_report_will_be_sent_to_fritter__project":
        MessageLookupByLibrary.simpleMessage(
          "Báo cáo của bạn sẽ được gửi đến Squawker và bạn có thể tìm thấy chi tiết về quyền riêng tư tại:",
        ),
  };
}
