// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ja locale. All the
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
  String get localeName => 'ja';

  static String m0(name) => "登録グループ${name}を削除してもよろしいですか？";

  static String m1(fileName) => "データが${fileName}にエクスポートされました";

  static String m2(fullPath) => "データが${fullPath}にエクスポートされました";

  static String m3(timeagoFormat) => "${timeagoFormat}に終了";

  static String m4(timeagoFormat) => "${timeagoFormat}に終了";

  static String m5(snapshotData) => "${snapshotData}ユーザのインポートが完了しました";

  static String m6(name) => "グループ: ${name}";

  static String m7(snapshotData) => "${snapshotData}ユーザがインポートされました";

  static String m8(date) => "${date}に登録";

  static String m10(num, numFormatted) =>
      "${Intl.plural(num, zero: '0 票', one: '1 票', two: '2 票', few: '${numFormatted} 票', many: '${numFormatted} 票', other: '${numFormatted} 票')}";

  static String m11(errorMessage) => "インターネット接続を確認してください。\n\n${errorMessage}";

  static String m13(releaseVersion) => "タップしてダウンロード：${releaseVersion}";

  static String m14(getMediaType) => "タップして${getMediaType}を表示";

  static String m15(filePath) => "ファイルが存在しません。${filePath}に存在することを確認してください";

  static String m16(thisTweetUserName, timeAgo) =>
      "${thisTweetUserName}がリツイート ${timeAgo}";

  static String m17(num, numFormatted) =>
      "${Intl.plural(num, zero: '0 ツイート', one: '1 ツイート', two: '2 ツイート', few: '${numFormatted} ツイート', many: '${numFormatted} ツイート', other: '${numFormatted} ツイート')}";

  static String m18(widgetPlaceName) => "${widgetPlaceName}のトレンドを読み込めませんでした";

  static String m19(responseStatusCode) =>
      "メディアを保存できませんでした。Twitter/Xから返されたステータス：${responseStatusCode}";

  static String m20(releaseVersion) => "F-Droidクライアントから${releaseVersion}に更新";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("Squawkerについて"),
    "account_suspended": MessageLookupByLibrary.simpleMessage("凍結済みアカウント"),
    "activate_non_confirmation_bias_mode_description":
        MessageLookupByLibrary.simpleMessage(
          "ツイート発信者を非表示にして、権威に基づく確証バイアスに陥るのを避けます。",
        ),
    "activate_non_confirmation_bias_mode_label":
        MessageLookupByLibrary.simpleMessage("対確証バイアスモードを有効化"),
    "add_to_group": MessageLookupByLibrary.simpleMessage("グループに追加"),
    "all": MessageLookupByLibrary.simpleMessage("すべて"),
    "all_the_great_software_used_by_fritter":
        MessageLookupByLibrary.simpleMessage("Squawkerで使用する偉大なソフトウェア"),
    "an_update_for_fritter_is_available": MessageLookupByLibrary.simpleMessage(
      "Squawkerの更新が利用可能です！🚀",
    ),
    "are_you_sure": MessageLookupByLibrary.simpleMessage("確認"),
    "are_you_sure_you_want_to_delete_the_subscription_group_name_of_group": m0,
    "back": MessageLookupByLibrary.simpleMessage("戻る"),
    "blue_theme_based_on_the_twitter_color_scheme":
        MessageLookupByLibrary.simpleMessage("Twitter/Xの配色に基づいたブルーのテーマ"),
    "cancel": MessageLookupByLibrary.simpleMessage("キャンセル"),
    "catastrophic_failure": MessageLookupByLibrary.simpleMessage("致命的なエラー"),
    "choose": MessageLookupByLibrary.simpleMessage("選択"),
    "close": MessageLookupByLibrary.simpleMessage("閉じる"),
    "confirm_close_fritter": MessageLookupByLibrary.simpleMessage(
      "Squawker を閉じますか？",
    ),
    "contribute": MessageLookupByLibrary.simpleMessage("貢献する"),
    "copied_address_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "アドレスをクリップボードにコピーしました",
    ),
    "copied_version_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "バージョンをクリップボードにコピーしました",
    ),
    "could_not_contact_twitter": MessageLookupByLibrary.simpleMessage(
      "Twitter/Xにアクセスできませんでした",
    ),
    "could_not_find_any_tweets_by_this_user":
        MessageLookupByLibrary.simpleMessage("このユーザのツイートが見つかりません！"),
    "could_not_find_any_tweets_from_the_last_7_days":
        MessageLookupByLibrary.simpleMessage("過去7日間にツイートが見つかりませんでした！"),
    "country": MessageLookupByLibrary.simpleMessage("国"),
    "dark": MessageLookupByLibrary.simpleMessage("ダーク"),
    "data": MessageLookupByLibrary.simpleMessage("データ"),
    "data_exported_to_fileName": m1,
    "data_exported_to_fullPath": m2,
    "data_imported_successfully": MessageLookupByLibrary.simpleMessage(
      "データのインポートに成功しました",
    ),
    "date_created": MessageLookupByLibrary.simpleMessage("作成日"),
    "date_subscribed": MessageLookupByLibrary.simpleMessage("登録日"),
    "default_tab": MessageLookupByLibrary.simpleMessage("デフォルトのタブ"),
    "delete": MessageLookupByLibrary.simpleMessage("削除"),
    "disable_screenshots": MessageLookupByLibrary.simpleMessage(
      "スクリーンショットを無効化",
    ),
    "disable_screenshots_hint": MessageLookupByLibrary.simpleMessage(
      "スクリーンショットの撮影を防止する。すべての端末で動作しない可能性があります。",
    ),
    "disabled": MessageLookupByLibrary.simpleMessage("無効"),
    "donate": MessageLookupByLibrary.simpleMessage("寄付"),
    "download": MessageLookupByLibrary.simpleMessage("ダウンロード"),
    "download_handling": MessageLookupByLibrary.simpleMessage("ダウンロード制御"),
    "download_handling_description": MessageLookupByLibrary.simpleMessage(
      "どのようにダウンロードするか",
    ),
    "download_handling_type_ask": MessageLookupByLibrary.simpleMessage(
      "毎回確認する",
    ),
    "download_handling_type_directory": MessageLookupByLibrary.simpleMessage(
      "ディレクトリに保存",
    ),
    "download_media_no_url": MessageLookupByLibrary.simpleMessage(
      "ダウンロードできません。このメディアはストリーム限定の可能性があり、今のSquawkerではダウンロードできません。",
    ),
    "download_path": MessageLookupByLibrary.simpleMessage("ダウンロード先"),
    "downloading_media": MessageLookupByLibrary.simpleMessage(
      "メディアをダウンロード中...",
    ),
    "enable_": MessageLookupByLibrary.simpleMessage("を有効化？"),
    "ended_timeago_format_endsAt_allowFromNow_true": m3,
    "ends_timeago_format_endsAt_allowFromNow_true": m4,
    "enter_your_twitter_username": MessageLookupByLibrary.simpleMessage(
      "Twitter/Xユーザ名を入力",
    ),
    "export": MessageLookupByLibrary.simpleMessage("エクスポート"),
    "export_settings": MessageLookupByLibrary.simpleMessage("設定をエクスポート？"),
    "export_subscription_group_members": MessageLookupByLibrary.simpleMessage(
      "登録グループのアカウントをエクスポート？",
    ),
    "export_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "登録グループをエクスポート？",
    ),
    "export_subscriptions": MessageLookupByLibrary.simpleMessage(
      "登録アカウントをエクスポート？",
    ),
    "export_tweets": MessageLookupByLibrary.simpleMessage("ツイートをエクスポート？"),
    "export_your_data": MessageLookupByLibrary.simpleMessage("データのエクスポート"),
    "feed": MessageLookupByLibrary.simpleMessage("フィード"),
    "filters": MessageLookupByLibrary.simpleMessage("フィルタ"),
    "finished_with_snapshotData_users": m5,
    "followers": MessageLookupByLibrary.simpleMessage("フォロワー"),
    "following": MessageLookupByLibrary.simpleMessage("フォロー"),
    "forbidden": MessageLookupByLibrary.simpleMessage("Twitter/Xによればアクセス禁止"),
    "fritter": MessageLookupByLibrary.simpleMessage("Squawker"),
    "fritter_blue": MessageLookupByLibrary.simpleMessage("Squawkerブルー"),
    "general": MessageLookupByLibrary.simpleMessage("一般"),
    "group_name": m6,
    "groups": MessageLookupByLibrary.simpleMessage("グループ"),
    "help_make_fritter_even_better": MessageLookupByLibrary.simpleMessage(
      "Squawkerを改善するために協力する",
    ),
    "help_support_fritters_future": MessageLookupByLibrary.simpleMessage(
      "Squawkerの将来を支援する",
    ),
    "hide_sensitive_tweets": MessageLookupByLibrary.simpleMessage(
      "センシティブな内容のツイートを隠す",
    ),
    "home": MessageLookupByLibrary.simpleMessage("ホーム"),
    "if_you_have_any_feedback_on_this_feature_please_leave_it_on":
        MessageLookupByLibrary.simpleMessage("この機能にフィードバックがありましたら、こちらにお願いします。"),
    "import": MessageLookupByLibrary.simpleMessage("インポート"),
    "import_data_from_another_device": MessageLookupByLibrary.simpleMessage(
      "他の端末からデータをインポートする",
    ),
    "import_from_twitter": MessageLookupByLibrary.simpleMessage(
      "Twitter/Xからインポート",
    ),
    "import_subscriptions": MessageLookupByLibrary.simpleMessage(
      "登録アカウントをインポートする",
    ),
    "imported_snapshot_data_users_so_far": m7,
    "include_replies": MessageLookupByLibrary.simpleMessage("返信を含める"),
    "include_retweets": MessageLookupByLibrary.simpleMessage("リツイートを含める"),
    "joined": m8,
    "language": MessageLookupByLibrary.simpleMessage("言語"),
    "language_subtitle": MessageLookupByLibrary.simpleMessage("再起動が必要"),
    "large": MessageLookupByLibrary.simpleMessage("大"),
    "legacy_android_import": MessageLookupByLibrary.simpleMessage(
      "インポート(レガシー端末)",
    ),
    "let_the_developers_know_if_something_is_broken":
        MessageLookupByLibrary.simpleMessage("不都合を開発者に知らせる"),
    "licenses": MessageLookupByLibrary.simpleMessage("ライセンス"),
    "light": MessageLookupByLibrary.simpleMessage("ライト"),
    "live": MessageLookupByLibrary.simpleMessage("ライブ"),
    "logging": MessageLookupByLibrary.simpleMessage("ログ"),
    "media": MessageLookupByLibrary.simpleMessage("メディア"),
    "media_size": MessageLookupByLibrary.simpleMessage("メディアの大きさ"),
    "medium": MessageLookupByLibrary.simpleMessage("中"),
    "name": MessageLookupByLibrary.simpleMessage("グループ名"),
    "newTrans": MessageLookupByLibrary.simpleMessage("新着"),
    "next": MessageLookupByLibrary.simpleMessage("次"),
    "no": MessageLookupByLibrary.simpleMessage("いいえ"),
    "no_data_was_returned_which_should_never_happen_please_report_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "データが返されませんでした。これは起こりえないことです。可能でしたらバグとして報告ください！",
        ),
    "no_results": MessageLookupByLibrary.simpleMessage("結果なし"),
    "no_results_for": MessageLookupByLibrary.simpleMessage("結果なし:"),
    "no_subscriptions_try_searching_or_importing_some":
        MessageLookupByLibrary.simpleMessage(
          "登録アカウントがありません。検索するか、インポートしてみてください！",
        ),
    "not_set": MessageLookupByLibrary.simpleMessage("設定しない"),
    "note_due_to_a_twitter_limitation_not_all_tweets_may_be_included":
        MessageLookupByLibrary.simpleMessage(
          "注意：Twitter/Xの制限により全てのツイートが含まれない可能性があります",
        ),
    "numberFormat_format_total_votes": m10,
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "oops_something_went_wrong": MessageLookupByLibrary.simpleMessage(
      "問題が発生しました🥲",
    ),
    "open_app_settings": MessageLookupByLibrary.simpleMessage("アプリで開く設定"),
    "page_not_found": MessageLookupByLibrary.simpleMessage(
      "Twitter/Xはページがないと表示しているが、本当ではないかもしれない",
    ),
    "permission_not_granted": MessageLookupByLibrary.simpleMessage(
      "権限がありません。許可後に再度試してみてください！",
    ),
    "pick_a_color": MessageLookupByLibrary.simpleMessage("色を選択！"),
    "pick_an_icon": MessageLookupByLibrary.simpleMessage("アイコンを選択！"),
    "pinned_tweet": MessageLookupByLibrary.simpleMessage("固定ツイート"),
    "playback_speed": MessageLookupByLibrary.simpleMessage("再生速度"),
    "please_check_your_internet_connection_error_message": m11,
    "please_enter_a_name": MessageLookupByLibrary.simpleMessage(
      "グループ名を入力してください",
    ),
    "please_make_sure_the_data_you_wish_to_import_is_located_there_then_press_the_import_button_below":
        MessageLookupByLibrary.simpleMessage(
          "インポートしたいデータが存在することを確認し、下のインポートボタンを押してください。",
        ),
    "please_note_that_the_method_fritter_uses_to_import_subscriptions_is_heavily_rate_limited_by_twitter_so_this_may_fail_if_you_have_a_lot_of_followed_accounts":
        MessageLookupByLibrary.simpleMessage(
          "Squawkerが登録アカウントをインポートする際に使うメソッドはTwitter/Xが厳しくレート制限しているため、フォローアカウントが多い場合は失敗する可能性があります。",
        ),
    "possibly_sensitive_profile": MessageLookupByLibrary.simpleMessage(
      "プロフィールにセンシティブな画像、言語、その他のコンテンツが含まれる可能性があります。表示しますか？",
    ),
    "possibly_sensitive_tweet": MessageLookupByLibrary.simpleMessage(
      "ツイートにセンシティブな内容が含まれる可能性があります。表示しますか？",
    ),
    "prefix": MessageLookupByLibrary.simpleMessage("プレフィックス"),
    "private_profile": MessageLookupByLibrary.simpleMessage("非公開プロフィール"),
    "released_under_the_mit_license": MessageLookupByLibrary.simpleMessage(
      "MITライセンスで公開",
    ),
    "replying_to": MessageLookupByLibrary.simpleMessage("返信："),
    "report": MessageLookupByLibrary.simpleMessage("レポート"),
    "report_a_bug": MessageLookupByLibrary.simpleMessage("バグのレポート"),
    "reporting_an_error": MessageLookupByLibrary.simpleMessage("エラーの報告"),
    "retry": MessageLookupByLibrary.simpleMessage("再試行"),
    "save": MessageLookupByLibrary.simpleMessage("保存"),
    "save_bandwidth_using_smaller_images": MessageLookupByLibrary.simpleMessage(
      "小さい画像にすると通信容量を削減できます",
    ),
    "saved": MessageLookupByLibrary.simpleMessage("保存ツイート"),
    "search": MessageLookupByLibrary.simpleMessage("検索"),
    "select": MessageLookupByLibrary.simpleMessage("選択"),
    "selecting_individual_accounts_to_import_and_assigning_groups_are_both_planned_for_the_future_already":
        MessageLookupByLibrary.simpleMessage(
          "インポートするアカウントの選択やグループへの割り当ては今後対応予定です！",
        ),
    "send": MessageLookupByLibrary.simpleMessage("送信"),
    "share_tweet_content": MessageLookupByLibrary.simpleMessage("ツイート内容を共有"),
    "share_tweet_content_and_link": MessageLookupByLibrary.simpleMessage(
      "ツイート内容とリンクを共有",
    ),
    "share_tweet_link": MessageLookupByLibrary.simpleMessage("ツイートリンクを共有"),
    "should_check_for_updates_description":
        MessageLookupByLibrary.simpleMessage("Squawker開始時に更新を確認する"),
    "should_check_for_updates_label": MessageLookupByLibrary.simpleMessage(
      "更新を確認",
    ),
    "small": MessageLookupByLibrary.simpleMessage("小"),
    "something_broke_in_fritter": MessageLookupByLibrary.simpleMessage(
      "Squawkerに異常が発生しました。",
    ),
    "something_just_went_wrong_in_fritter_and_an_error_report_has_been_generated":
        MessageLookupByLibrary.simpleMessage(
          "Squawkerに問題が発生し、エラーレポートが作成されました。問題修正のため、このレポートを開発者に送信できます。",
        ),
    "sorry_the_replied_tweet_could_not_be_found":
        MessageLookupByLibrary.simpleMessage("返信ツイートが見つかりませんでした！"),
    "subscribe": MessageLookupByLibrary.simpleMessage("登録する"),
    "subscriptions": MessageLookupByLibrary.simpleMessage("登録アカウント"),
    "subtitles": MessageLookupByLibrary.simpleMessage("字幕"),
    "successfully_saved_the_media": MessageLookupByLibrary.simpleMessage(
      "メディアを保存しました！",
    ),
    "system": MessageLookupByLibrary.simpleMessage("システム"),
    "tap_to_download_release_version": m13,
    "tap_to_show_getMediaType_item_type": m14,
    "thanks_for_helping_fritter": MessageLookupByLibrary.simpleMessage(
      "Squawkerを支援いただきありがとうございます！💖",
    ),
    "the_file_does_not_exist_please_ensure_it_is_located_at_file_path": m15,
    "the_github_issue": MessageLookupByLibrary.simpleMessage(
      "GitHub issue (#143)",
    ),
    "the_tweet_did_not_contain_any_text_this_is_unexpected":
        MessageLookupByLibrary.simpleMessage("ツイートのテキストがありません。予期せぬ結果です"),
    "theme": MessageLookupByLibrary.simpleMessage("テーマ"),
    "theme_mode": MessageLookupByLibrary.simpleMessage("テーマのモード"),
    "there_were_no_trends_returned_this_is_unexpected_please_report_as_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "トレンドが返されませんでした。予期せぬ動作です！可能でしたらバグとして報告ください。",
        ),
    "this_group_contains_no_subscriptions":
        MessageLookupByLibrary.simpleMessage("このグループは空です！"),
    "this_took_too_long_to_load_please_check_your_network_connection":
        MessageLookupByLibrary.simpleMessage(
          "読み込みに時間がかかり過ぎています。ネットワーク接続を確認してください！",
        ),
    "this_tweet_is_unavailable": MessageLookupByLibrary.simpleMessage(
      "このツイートはありません。削除されたかもしれません。",
    ),
    "this_tweet_user_name_retweeted": m16,
    "this_user_does_not_follow_anyone": MessageLookupByLibrary.simpleMessage(
      "このユーザは誰もフォローしていません！",
    ),
    "this_user_does_not_have_anyone_following_them":
        MessageLookupByLibrary.simpleMessage("このユーザをフォローしている人はいません！"),
    "thread": MessageLookupByLibrary.simpleMessage("スレッド"),
    "thumbnail": MessageLookupByLibrary.simpleMessage("サムネイル"),
    "timed_out": MessageLookupByLibrary.simpleMessage("タイムアウト"),
    "to_import_subscriptions_from_an_existing_twitter_account_enter_your_username_below":
        MessageLookupByLibrary.simpleMessage(
          "Twitter/Xアカウントから登録アカウントをインポートするには、以下にユーザ名を入力してください。",
        ),
    "toggle_all": MessageLookupByLibrary.simpleMessage("すべて選択"),
    "trending": MessageLookupByLibrary.simpleMessage("トレンド"),
    "trends": MessageLookupByLibrary.simpleMessage("トレンド"),
    "true_black": MessageLookupByLibrary.simpleMessage("トゥルーブラック？"),
    "tweets": MessageLookupByLibrary.simpleMessage("ツイート"),
    "tweets_and_replies": MessageLookupByLibrary.simpleMessage("ツイートと返信"),
    "tweets_number": m17,
    "unable_to_find_the_available_trend_locations":
        MessageLookupByLibrary.simpleMessage("利用可能なトレンドの地域が見つかりませんでした。"),
    "unable_to_find_your_saved_tweets": MessageLookupByLibrary.simpleMessage(
      "保存したツイートが見つかりませんでした。",
    ),
    "unable_to_import": MessageLookupByLibrary.simpleMessage("インポートできませんでした"),
    "unable_to_load_home_pages": MessageLookupByLibrary.simpleMessage(
      "ホームを読み込めません",
    ),
    "unable_to_load_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "登録グループの読み込みに失敗しました",
    ),
    "unable_to_load_the_group": MessageLookupByLibrary.simpleMessage(
      "グループの読み込みに失敗しました",
    ),
    "unable_to_load_the_group_settings": MessageLookupByLibrary.simpleMessage(
      "グループ設定の読み込みに失敗しました",
    ),
    "unable_to_load_the_list_of_follows": MessageLookupByLibrary.simpleMessage(
      "フォローリストを読み込めませんでした",
    ),
    "unable_to_load_the_next_page_of_follows":
        MessageLookupByLibrary.simpleMessage("フォローの次のページを読み込めませんでした"),
    "unable_to_load_the_next_page_of_replies":
        MessageLookupByLibrary.simpleMessage("返信の次のページ読み込みに失敗しました"),
    "unable_to_load_the_next_page_of_tweets":
        MessageLookupByLibrary.simpleMessage("ツイートの次のページ読み込みに失敗しました"),
    "unable_to_load_the_profile": MessageLookupByLibrary.simpleMessage(
      "プロフィールを読み込めませんでした",
    ),
    "unable_to_load_the_search_results": MessageLookupByLibrary.simpleMessage(
      "検索結果の読み込みに失敗しました。",
    ),
    "unable_to_load_the_trends_for_widget_place_name": m18,
    "unable_to_load_the_tweet": MessageLookupByLibrary.simpleMessage(
      "ツイートの読み込みに失敗しました",
    ),
    "unable_to_load_the_tweets": MessageLookupByLibrary.simpleMessage(
      "ツイートを読み込めませんでした",
    ),
    "unable_to_load_the_tweets_for_the_feed":
        MessageLookupByLibrary.simpleMessage("フィードにツイートを読み込めませんでした"),
    "unable_to_run_the_database_migrations":
        MessageLookupByLibrary.simpleMessage("データベース移行ができませんでした"),
    "unable_to_save_the_media_twitter_returned_a_status_of_response_statusCode":
        m19,
    "unable_to_stream_the_trend_location_preference":
        MessageLookupByLibrary.simpleMessage("トレンドの地域設定をストリームできませんでした"),
    "unknown": MessageLookupByLibrary.simpleMessage("不明"),
    "unsave": MessageLookupByLibrary.simpleMessage("保存取り消し"),
    "unsubscribe": MessageLookupByLibrary.simpleMessage("登録解除"),
    "unsupported_url": MessageLookupByLibrary.simpleMessage("未対応のURL"),
    "update_to_release_version_through_your_fdroid_client": m20,
    "updates": MessageLookupByLibrary.simpleMessage("更新"),
    "use_true_black_for_the_dark_mode_theme":
        MessageLookupByLibrary.simpleMessage("ダークテーマで完全な黒を使用する"),
    "user_not_found": MessageLookupByLibrary.simpleMessage("ユーザが見つかりません"),
    "username": MessageLookupByLibrary.simpleMessage("ユーザ名"),
    "version": MessageLookupByLibrary.simpleMessage("バージョン"),
    "when_a_new_app_update_is_available": MessageLookupByLibrary.simpleMessage(
      "新しいアプリの更新が利用可能なとき",
    ),
    "whether_errors_should_be_reported_to_":
        MessageLookupByLibrary.simpleMessage("エラーをに送信する"),
    "whether_to_hide_tweets_marked_as_sensitive":
        MessageLookupByLibrary.simpleMessage("センシティブとされたツイートを隠すかどうか"),
    "which_tab_is_shown_when_the_app_opens":
        MessageLookupByLibrary.simpleMessage("アプリの起動時に表示するタブ"),
    "would_you_like_to_enable_automatic_error_reporting":
        MessageLookupByLibrary.simpleMessage("自動エラー報告を有効にしますか？"),
    "yes": MessageLookupByLibrary.simpleMessage("はい"),
    "yes_please": MessageLookupByLibrary.simpleMessage("はいどうぞ"),
    "you_have_not_saved_any_tweets_yet": MessageLookupByLibrary.simpleMessage(
      "まだツイートを保存していません！",
    ),
    "your_profile_must_be_public_otherwise_the_import_will_not_work":
        MessageLookupByLibrary.simpleMessage("公開アカウントである必要があります"),
    "your_report_will_be_sent_to_fritter__project":
        MessageLookupByLibrary.simpleMessage(
          "レポートはSquawkerのプロジェクトに送信されます。プライバシーの詳細は以下の通りです：",
        ),
  };
}
