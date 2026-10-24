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

  static String m1(fileName) => "Xuất dữ liệu đến ${fileName}";

  static String m2(fullPath) => "Xuất dữ liệu đến ${fullPath}";

  static String m3(timeagoFormat) => "Đã kết thúc${timeagoFormat}";

  static String m4(timeagoFormat) => "Kết thúc${timeagoFormat}";

  static String m5(snapshotData) => "Đã kết thúc với ${snapshotData} users";

  static String m7(snapshotData) =>
      "${snapshotData}số người dùng đã nhập cho đến hiện tại";

  static String m8(date) => "Đã tham gia từ ${date}";

  static String m13(releaseVersion) => "Nhấn để tải${releaseVersion}";

  static String m15(filePath) =>
      "Các tập tin không tồn tại. Hãy chắc chắn nó nằm ở ${filePath}";

  static String m17(num, numFormatted) =>
      "{num, rỗng, không{không có tweets} một{một tweet} hai{hai tweets}  \nvài{${numFormatted} tweet} nhiều{${numFormatted} tweet}}khác{${numFormatted} tweets}}";

  static String m20(releaseVersion) =>
      "Cập nhật${releaseVersion}thông qua F-Droid";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "activate_non_confirmation_bias_mode_label":
        MessageLookupByLibrary.simpleMessage(
          "Kích hoạt chế độ không xác nhận bias",
        ),
    "add_to_group": MessageLookupByLibrary.simpleMessage("Thêm vào nhóm"),
    "an_update_for_fritter_is_available": MessageLookupByLibrary.simpleMessage(
      "Bản cập nhật Squawker đã sẵn sàng! 🚀",
    ),
    "app_info": MessageLookupByLibrary.simpleMessage("Thông tin ứng dụng"),
    "are_you_sure": MessageLookupByLibrary.simpleMessage(
      "Bạn chắc chắn chưa ?",
    ),
    "are_you_sure_you_want_to_delete_the_subscription_group_name_of_group": m0,
    "beta": MessageLookupByLibrary.simpleMessage("Thử nghiệm"),
    "cancel": MessageLookupByLibrary.simpleMessage("Hủy"),
    "close": MessageLookupByLibrary.simpleMessage("Đóng"),
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
    "data_exported_to_fileName": m1,
    "data_exported_to_fullPath": m2,
    "data_imported_successfully": MessageLookupByLibrary.simpleMessage(
      "Nhập dữ liệu thành công",
    ),
    "default_tab": MessageLookupByLibrary.simpleMessage("Thẻ mặc định"),
    "delete": MessageLookupByLibrary.simpleMessage("Xoá"),
    "disabled": MessageLookupByLibrary.simpleMessage("Từ chối"),
    "enable_": MessageLookupByLibrary.simpleMessage("Kích hoạt ?"),
    "ended_timeago_format_endsAt_allowFromNow_true": m3,
    "ends_timeago_format_endsAt_allowFromNow_true": m4,
    "enter_your_twitter_username": MessageLookupByLibrary.simpleMessage(
      "Nhập tên người dùng Twitter/X của bạn",
    ),
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
    "export_your_data": MessageLookupByLibrary.simpleMessage("Xuất dữ liệu"),
    "feed": MessageLookupByLibrary.simpleMessage("Nguồn tin"),
    "filters": MessageLookupByLibrary.simpleMessage("Bộ lọc"),
    "finished_with_snapshotData_users": m5,
    "followers": MessageLookupByLibrary.simpleMessage("Người theo dõi"),
    "following": MessageLookupByLibrary.simpleMessage("Đang theo dõi"),
    "general": MessageLookupByLibrary.simpleMessage("Chung"),
    "if_you_have_any_feedback_on_this_feature_please_leave_it_on":
        MessageLookupByLibrary.simpleMessage(
          "Nếu bạn có bất kỳ phản hồi nào về tính năng này, vui lòng để lại ý kiến",
        ),
    "import": MessageLookupByLibrary.simpleMessage("Nhập"),
    "import_data_from_another_device": MessageLookupByLibrary.simpleMessage(
      "Nhập từ thiết bị khác",
    ),
    "import_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Nhập các Đăng ký",
    ),
    "imported_snapshot_data_users_so_far": m7,
    "include_replies": MessageLookupByLibrary.simpleMessage(
      "Bao gồm câu trả lời",
    ),
    "include_retweets": MessageLookupByLibrary.simpleMessage(
      "Bao gồm đăng lại",
    ),
    "joined": m8,
    "large": MessageLookupByLibrary.simpleMessage("Lớn"),
    "legacy_android_import": MessageLookupByLibrary.simpleMessage(
      "Nhập Legacy Android",
    ),
    "light": MessageLookupByLibrary.simpleMessage("Sáng"),
    "logging": MessageLookupByLibrary.simpleMessage("Đang đăng nhập"),
    "material_3": MessageLookupByLibrary.simpleMessage("Dùng Material 3?"),
    "media": MessageLookupByLibrary.simpleMessage("Phương tiện"),
    "media_size": MessageLookupByLibrary.simpleMessage(
      "Kích thước phương tiện",
    ),
    "medium": MessageLookupByLibrary.simpleMessage("Vừa"),
    "name": MessageLookupByLibrary.simpleMessage("Tên"),
    "newTrans": MessageLookupByLibrary.simpleMessage("Mới"),
    "no": MessageLookupByLibrary.simpleMessage("Không"),
    "no_data_was_returned_which_should_never_happen_please_report_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "Không có dữ liệu được trả về, điều này không bao giờ xảy ra. Nếu được vui lòng báo cáo lỗi!",
        ),
    "no_results": MessageLookupByLibrary.simpleMessage("Không có kết quả"),
    "no_results_for": MessageLookupByLibrary.simpleMessage(
      "Không có kết quả cho:",
    ),
    "note_due_to_a_twitter_limitation_not_all_tweets_may_be_included":
        MessageLookupByLibrary.simpleMessage(
          "Lưu ý: Do giới hạn của Twitter/X, không phải tất cả các tweet đều có thể được đưa vào",
        ),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "oops_something_went_wrong": MessageLookupByLibrary.simpleMessage(
      "Ôi! Có chuyện gì đó sai sai ở đây rồi\n🥲",
    ),
    "pick_a_color": MessageLookupByLibrary.simpleMessage("Chọn màu đi!"),
    "pick_an_icon": MessageLookupByLibrary.simpleMessage("Chọn biểu tượng!"),
    "please_enter_a_name": MessageLookupByLibrary.simpleMessage("Hãy nhập tên"),
    "please_make_sure_the_data_you_wish_to_import_is_located_there_then_press_the_import_button_below":
        MessageLookupByLibrary.simpleMessage(
          "Hãy đảm bảo rằng dữ liệu bạn muốn nhập đã tồn tại sẵn, sau đó hãy nhấn nút nhập bên dưới.",
        ),
    "please_note_that_the_method_fritter_uses_to_import_subscriptions_is_heavily_rate_limited_by_twitter_so_this_may_fail_if_you_have_a_lot_of_followed_accounts":
        MessageLookupByLibrary.simpleMessage(
          "Xin lưu ý rằng phương pháp mà Squawker sử dụng để nhập đăng ký bị giới hạn tỷ lệ rất nhiều bởi Twitter/X, vì vậy phương pháp này có thể không thành công nếu bạn có nhiều tài khoản theo dõi.",
        ),
    "prefix": MessageLookupByLibrary.simpleMessage("tiền tố"),
    "report": MessageLookupByLibrary.simpleMessage("Báo cáo"),
    "reporting_an_error": MessageLookupByLibrary.simpleMessage("Báo lỗi"),
    "save_bandwidth_using_smaller_images": MessageLookupByLibrary.simpleMessage(
      "Tiết kiệm lưu lượng mạng với kích thước nhỏ hơn",
    ),
    "saved": MessageLookupByLibrary.simpleMessage("Đã lưu"),
    "search": MessageLookupByLibrary.simpleMessage("Tìm kiếm"),
    "select": MessageLookupByLibrary.simpleMessage("Chọn"),
    "selecting_individual_accounts_to_import_and_assigning_groups_are_both_planned_for_the_future_already":
        MessageLookupByLibrary.simpleMessage(
          "Việc chọn tài khoản cá nhân để nhập và phân nhóm đều đã được lên kế hoạch cho tương lai!",
        ),
    "send": MessageLookupByLibrary.simpleMessage("Gửi"),
    "settings": MessageLookupByLibrary.simpleMessage("Cài đặt"),
    "small": MessageLookupByLibrary.simpleMessage("Nhỏ"),
    "something_just_went_wrong_in_fritter_and_an_error_report_has_been_generated":
        MessageLookupByLibrary.simpleMessage(
          "Đã xảy ra lỗi trên Squawker và đã tạo báo cáo lỗi . Báo cáo có thể được gửi đến các nhà phát triển Squawker để khắc phục sự cố.",
        ),
    "subscribe": MessageLookupByLibrary.simpleMessage("Dịch"),
    "subscriptions": MessageLookupByLibrary.simpleMessage("Đăng ký"),
    "system": MessageLookupByLibrary.simpleMessage("Hệ thống"),
    "tap_to_download_release_version": m13,
    "thanks_for_helping_fritter": MessageLookupByLibrary.simpleMessage(
      "Cảm ơn vì đã giúp đỡ Squawker! 💖",
    ),
    "the_file_does_not_exist_please_ensure_it_is_located_at_file_path": m15,
    "the_github_issue": MessageLookupByLibrary.simpleMessage(
      "vấn đề GitHub (#143)",
    ),
    "theme": MessageLookupByLibrary.simpleMessage("Chủ đề"),
    "theme_mode": MessageLookupByLibrary.simpleMessage("Giao diện chủ đề"),
    "this_group_contains_no_subscriptions":
        MessageLookupByLibrary.simpleMessage(
          "Nhóm này không có mục đăng ký nào!",
        ),
    "this_took_too_long_to_load_please_check_your_network_connection":
        MessageLookupByLibrary.simpleMessage(
          "Đã tốn nhiều thời gian để tải. Hãy kiểm tra kết nối mạng của bạn!",
        ),
    "this_user_does_not_follow_anyone": MessageLookupByLibrary.simpleMessage(
      "Người dùng không theo dõi ai!",
    ),
    "this_user_does_not_have_anyone_following_them":
        MessageLookupByLibrary.simpleMessage(
          "Người dùng này không có ai theo dõi!",
        ),
    "thumbnail": MessageLookupByLibrary.simpleMessage("Hình thu nhỏ"),
    "timed_out": MessageLookupByLibrary.simpleMessage("Hết giờ"),
    "to_import_subscriptions_from_an_existing_twitter_account_enter_your_username_below":
        MessageLookupByLibrary.simpleMessage(
          "Để nhập đăng ký từ tài khoản Twitter/X hiện có, hãy nhập tên người dùng của bạn bên dưới.",
        ),
    "toggle_all": MessageLookupByLibrary.simpleMessage("Chuyển đổi tất cả"),
    "trending": MessageLookupByLibrary.simpleMessage("Xu hướng"),
    "trends": MessageLookupByLibrary.simpleMessage("Xu hướng"),
    "true_black": MessageLookupByLibrary.simpleMessage("Đen?"),
    "tweets": MessageLookupByLibrary.simpleMessage("Tweets"),
    "tweets_and_replies": MessageLookupByLibrary.simpleMessage(
      "Tweets & Trả lời",
    ),
    "tweets_number": m17,
    "unable_to_find_the_available_trend_locations":
        MessageLookupByLibrary.simpleMessage(
          "Không thể tìm thấy xu hướng cho vị trí này.",
        ),
    "unable_to_find_your_saved_tweets": MessageLookupByLibrary.simpleMessage(
      "Không tìm thấy các tweet đã lưu",
    ),
    "unable_to_import": MessageLookupByLibrary.simpleMessage("Không thể nhập"),
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
    "unable_to_stream_the_trend_location_preference":
        MessageLookupByLibrary.simpleMessage(
          "Không thể phát trực tuyến xu hướng theo vị trí ưa thích",
        ),
    "unsubscribe": MessageLookupByLibrary.simpleMessage("Hủy đăng ký"),
    "update_to_release_version_through_your_fdroid_client": m20,
    "updates": MessageLookupByLibrary.simpleMessage("Cập nhật"),
    "use_true_black_for_the_dark_mode_theme":
        MessageLookupByLibrary.simpleMessage(
          "Ở chế độ tối, dùng màu đen thay vì màu xám",
        ),
    "username": MessageLookupByLibrary.simpleMessage("Tên người dùng"),
    "when_a_new_app_update_is_available": MessageLookupByLibrary.simpleMessage(
      "Khi ứng dụng mới có sẵn",
    ),
    "which_tab_is_shown_when_the_app_opens":
        MessageLookupByLibrary.simpleMessage(
          "Thẻ nào sẽ hiển thị ra khi mở ứng dụng",
        ),
    "would_you_like_to_enable_automatic_error_reporting":
        MessageLookupByLibrary.simpleMessage(
          "Bạn có muốn bật tự động báo lỗi không?",
        ),
    "yes": MessageLookupByLibrary.simpleMessage("Có"),
    "yes_please": MessageLookupByLibrary.simpleMessage("Vâng, đồng ý"),
    "you_have_not_saved_any_tweets_yet": MessageLookupByLibrary.simpleMessage(
      "Bạn chưa lưu bất kỳ tweet nào!",
    ),
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
