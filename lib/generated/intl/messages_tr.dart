// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a tr locale. All the
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
  String get localeName => 'tr';

  static String m0(name) =>
      "${name} abonelik grubunu silmek istediğinizden emin misiniz?";

  static String m1(fileName) => "Veriler ${fileName}\'a aktarıldı";

  static String m2(fullPath) => "Veriler ${fullPath} konumuna aktarıldı";

  static String m3(timeagoFormat) => "${timeagoFormat} sona erdi";

  static String m4(timeagoFormat) => "Bitiş ${timeagoFormat}";

  static String m5(snapshotData) => "${snapshotData} kullanıcı ile tamamlandı";

  static String m6(name) => "Grup: ${name}";

  static String m7(snapshotData) =>
      "Şimdiye kadar ${snapshotData} kullanıcı içe aktarıldı";

  static String m8(date) => "${date} tarihinde katıldı";

  static String m9(num, numFormatted) =>
      "${Intl.plural(num, zero: 'Oy yok', one: 'Bir oy', two: 'İki oy', few: '${numFormatted} oy', many: '${numFormatted} oy', other: '${numFormatted} oy')}";

  static String m10(errorMessage) =>
      "Lütfen internet bağlantınızı kontrol edin.\n\n${errorMessage}";

  static String m11(releaseVersion) =>
      "${releaseVersion} sürümünü indirmek için dokunun";

  static String m12(getMediaType) => "${getMediaType} göstermek için dokunun";

  static String m13(filePath) =>
      "Dosya yok. Lütfen ${filePath} konumunda olduğundan emin olun";

  static String m14(thisTweetUserName, timeAgo) =>
      "${thisTweetUserName} ${timeAgo} retweet\'ledi";

  static String m15(num, numFormatted) =>
      "${Intl.plural(num, zero: 'tweet yok', one: 'bir tweet', two: 'iki tweet', few: '${numFormatted} tweet', many: '${numFormatted} tweet', other: '${numFormatted} tweet')}";

  static String m16(widgetPlaceName) =>
      "${widgetPlaceName} için trendler yüklenemiyor";

  static String m17(responseStatusCode) =>
      "Medya kaydedilemiyor. Twitter/X ${responseStatusCode} durumuyla döndü";

  static String m18(releaseVersion) =>
      "F-Droid istemciniz aracılığıyla ${releaseVersion} sürümüne güncelleyin";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("Hakkında"),
        "account_suspended":
            MessageLookupByLibrary.simpleMessage("Hesap askıya alındı"),
        "activate_non_confirmation_bias_mode_description":
            MessageLookupByLibrary.simpleMessage(
                "Tweet yazarlarını gizleyin. Yazarın argümanlara dayalı doğrulama yanlılığından kaçının."),
        "activate_non_confirmation_bias_mode_label":
            MessageLookupByLibrary.simpleMessage(
                "Doğrulama yanlılığı kapalı modunu etkinleştir"),
        "add_subscriptions":
            MessageLookupByLibrary.simpleMessage("Abonelik ekle"),
        "add_to_group": MessageLookupByLibrary.simpleMessage("Gruba ekle"),
        "all": MessageLookupByLibrary.simpleMessage("Hepsi"),
        "all_the_great_software_used_by_fritter":
            MessageLookupByLibrary.simpleMessage(
                "Squawker tarafından kullanılan tüm harika yazılımlar"),
        "an_update_for_fritter_is_available":
            MessageLookupByLibrary.simpleMessage(
                "Squawker için bir güncelleme mevcut! 🚀"),
        "app_info": MessageLookupByLibrary.simpleMessage("Uygulama Bilgisi"),
        "are_you_sure": MessageLookupByLibrary.simpleMessage("Emin misiniz?"),
        "are_you_sure_you_want_to_delete_the_subscription_group_name_of_group":
            m0,
        "back": MessageLookupByLibrary.simpleMessage("Geri"),
        "bad_guest_token": MessageLookupByLibrary.simpleMessage(
            "Twitter/X erişim belirtecimizi geçersiz kıldı. Lütfen Squawker\'ı yeniden açmayı deneyin!"),
        "blue_theme_based_on_the_twitter_color_scheme":
            MessageLookupByLibrary.simpleMessage(
                "Twitter/X renk şemasına dayalı mavi tema"),
        "cancel": MessageLookupByLibrary.simpleMessage("İptal et"),
        "catastrophic_failure":
            MessageLookupByLibrary.simpleMessage("Feci arıza"),
        "choose": MessageLookupByLibrary.simpleMessage("Seç"),
        "choose_pages": MessageLookupByLibrary.simpleMessage("Sayfaları seçin"),
        "close": MessageLookupByLibrary.simpleMessage("Kapat"),
        "confirm_close_fritter": MessageLookupByLibrary.simpleMessage(
            "Squawker\'ı kapatmak istediğinizden emin misiniz?"),
        "contribute": MessageLookupByLibrary.simpleMessage("Katkıda bulunun"),
        "copied_address_to_clipboard":
            MessageLookupByLibrary.simpleMessage("Adres panoya kopyalandı"),
        "copied_version_to_clipboard":
            MessageLookupByLibrary.simpleMessage("Sürüm panoya kopyalandı"),
        "could_not_contact_twitter": MessageLookupByLibrary.simpleMessage(
            "Twitter/X ile iletişim kurulamadı"),
        "could_not_find_any_tweets_by_this_user":
            MessageLookupByLibrary.simpleMessage(
                "Bu kullanıcının herhangi bir tweeti bulunamadı!"),
        "could_not_find_any_tweets_from_the_last_7_days":
            MessageLookupByLibrary.simpleMessage(
                "Son 7 güne ait herhangi bir tweet bulunamadı!"),
        "country": MessageLookupByLibrary.simpleMessage("Ülke"),
        "dark": MessageLookupByLibrary.simpleMessage("Koyu"),
        "data": MessageLookupByLibrary.simpleMessage("Veriler"),
        "data_exported_to_fileName": m1,
        "data_exported_to_fullPath": m2,
        "data_imported_successfully": MessageLookupByLibrary.simpleMessage(
            "Veriler başarıyla içe aktarıldı"),
        "date_created":
            MessageLookupByLibrary.simpleMessage("Oluşturulma Tarihi"),
        "date_subscribed":
            MessageLookupByLibrary.simpleMessage("Abone Olunan Tarih"),
        "default_tab": MessageLookupByLibrary.simpleMessage("Varsayılan sekme"),
        "delete": MessageLookupByLibrary.simpleMessage("Sil"),
        "disable_screenshots": MessageLookupByLibrary.simpleMessage(
            "Ekran görüntülerini devre dışı bırak"),
        "disable_screenshots_hint": MessageLookupByLibrary.simpleMessage(
            "Ekran görüntülerinin alınmasını engelleyin. Bu, tüm aygıtlarda çalışmayabilir."),
        "disabled": MessageLookupByLibrary.simpleMessage("Devre dışı"),
        "donate": MessageLookupByLibrary.simpleMessage("Bağış yapın"),
        "download": MessageLookupByLibrary.simpleMessage("İndir"),
        "download_handling":
            MessageLookupByLibrary.simpleMessage("İndirmelerin ele alınması"),
        "download_handling_description": MessageLookupByLibrary.simpleMessage(
            "İndirmeler nasıl ele alınmalı"),
        "download_handling_type_ask":
            MessageLookupByLibrary.simpleMessage("Her zaman sor"),
        "download_handling_type_directory":
            MessageLookupByLibrary.simpleMessage("Dizine kaydet"),
        "download_media_no_url": MessageLookupByLibrary.simpleMessage(
            "İndirilemiyor. Bu medya yalnızca Squawker\'ın henüz indiremediği bir akış olarak mevcut olabilir."),
        "download_path": MessageLookupByLibrary.simpleMessage("İndirme yolu"),
        "downloading_media":
            MessageLookupByLibrary.simpleMessage("Medya indiriliyor..."),
        "enable_":
            MessageLookupByLibrary.simpleMessage(" etkinleştirilsin mi?"),
        "ended_timeago_format_endsAt_allowFromNow_true": m3,
        "ends_timeago_format_endsAt_allowFromNow_true": m4,
        "enter_your_twitter_username": MessageLookupByLibrary.simpleMessage(
            "Twitter/X kullanıcı adınızı girin"),
        "export": MessageLookupByLibrary.simpleMessage("Dışa aktar"),
        "export_guest_accounts": MessageLookupByLibrary.simpleMessage(
            "Konuk hesapları dışa aktarılsın mı?"),
        "export_settings":
            MessageLookupByLibrary.simpleMessage("Ayarlar aktarılsın mı?"),
        "export_subscription_group_members":
            MessageLookupByLibrary.simpleMessage(
                "Abonelik grubu üyeleri aktarılsın mı?"),
        "export_subscription_groups": MessageLookupByLibrary.simpleMessage(
            "Abonelik grupları aktarılsın mı?"),
        "export_subscriptions":
            MessageLookupByLibrary.simpleMessage("Abonelikler aktarılsın mı?"),
        "export_tweets":
            MessageLookupByLibrary.simpleMessage("Tweet\'ler aktarılsın mı?"),
        "export_your_data":
            MessageLookupByLibrary.simpleMessage("Verilerinizi dışa aktarın"),
        "feed": MessageLookupByLibrary.simpleMessage("Akış"),
        "filters": MessageLookupByLibrary.simpleMessage("Filtreler"),
        "finish": MessageLookupByLibrary.simpleMessage("Bitir"),
        "finished_with_snapshotData_users": m5,
        "followers": MessageLookupByLibrary.simpleMessage("Takipçi"),
        "following": MessageLookupByLibrary.simpleMessage("Takip ediyor"),
        "forbidden": MessageLookupByLibrary.simpleMessage(
            "Twitter/X buna erişimin yasak olduğunu söylüyor"),
        "fritter": MessageLookupByLibrary.simpleMessage("Squawker"),
        "fritter_blue": MessageLookupByLibrary.simpleMessage("Squawker mavisi"),
        "functionality_unsupported": MessageLookupByLibrary.simpleMessage(
            "Bu işlev artık Twitter/X tarafından desteklenmiyor!"),
        "general": MessageLookupByLibrary.simpleMessage("Genel"),
        "group_name": m6,
        "groups": MessageLookupByLibrary.simpleMessage("Gruplar"),
        "help_make_fritter_even_better": MessageLookupByLibrary.simpleMessage(
            "Squawker\'ın daha da iyi olmasına yardımcı olun"),
        "help_support_fritters_future": MessageLookupByLibrary.simpleMessage(
            "Squawker\'ın geleceğini desteklemeye yardımcı olun"),
        "hide_sensitive_tweets":
            MessageLookupByLibrary.simpleMessage("Hassas tweetleri gizle"),
        "home": MessageLookupByLibrary.simpleMessage("Ana sayfa"),
        "if_you_have_any_feedback_on_this_feature_please_leave_it_on":
            MessageLookupByLibrary.simpleMessage(
                "Bu özellikle ilgili herhangi bir görüşünüz varsa lütfen geri bildirim yapın"),
        "import": MessageLookupByLibrary.simpleMessage("İçe aktar"),
        "import_data_from_another_device": MessageLookupByLibrary.simpleMessage(
            "Verileri başka bir cihazdan aktarın"),
        "import_from_twitter":
            MessageLookupByLibrary.simpleMessage("Twitter/X\'dan içe aktar"),
        "import_subscriptions":
            MessageLookupByLibrary.simpleMessage("Abonelikleri içe aktar"),
        "imported_snapshot_data_users_so_far": m7,
        "include_replies":
            MessageLookupByLibrary.simpleMessage("Yanıtları dahil et"),
        "include_retweets":
            MessageLookupByLibrary.simpleMessage("Retweet\'leri dahil et"),
        "joined": m8,
        "language": MessageLookupByLibrary.simpleMessage("Dil"),
        "language_subtitle":
            MessageLookupByLibrary.simpleMessage("Yeniden başlatma gerektirir"),
        "large": MessageLookupByLibrary.simpleMessage("Büyük"),
        "legacy_android_import": MessageLookupByLibrary.simpleMessage(
            "Eski Android için İçe Aktarma"),
        "let_the_developers_know_if_something_is_broken":
            MessageLookupByLibrary.simpleMessage(
                "Yanlış giden şeyler varsa geliştiricilere bildirin"),
        "licenses": MessageLookupByLibrary.simpleMessage("Lisanslar"),
        "light": MessageLookupByLibrary.simpleMessage("Açık"),
        "live": MessageLookupByLibrary.simpleMessage("CANLI"),
        "logging": MessageLookupByLibrary.simpleMessage("Günlük tutma"),
        "material_3": MessageLookupByLibrary.simpleMessage("Material 3?"),
        "media": MessageLookupByLibrary.simpleMessage("Medya"),
        "media_size": MessageLookupByLibrary.simpleMessage("Medya boyutu"),
        "medium": MessageLookupByLibrary.simpleMessage("Orta"),
        "missing_page": MessageLookupByLibrary.simpleMessage("Eksik sayfa"),
        "mute_video_description": MessageLookupByLibrary.simpleMessage(
            "Videoların öntanımlı olarak sesinin kapatılıp kapatılmayacağı"),
        "mute_videos":
            MessageLookupByLibrary.simpleMessage("Videoların sesini kapat"),
        "name": MessageLookupByLibrary.simpleMessage("Ad"),
        "newTrans": MessageLookupByLibrary.simpleMessage("Yeni"),
        "next": MessageLookupByLibrary.simpleMessage("İleri"),
        "no": MessageLookupByLibrary.simpleMessage("Hayır"),
        "no_data_was_returned_which_should_never_happen_please_report_a_bug_if_possible":
            MessageLookupByLibrary.simpleMessage(
                "Hiçbir veri dönmedi, bu asla olmamalıydı. Mümkünse lütfen bir hata bildirin!"),
        "no_results": MessageLookupByLibrary.simpleMessage("Sonuç yok"),
        "no_results_for":
            MessageLookupByLibrary.simpleMessage("Sonuç bulunamadı:"),
        "no_subscriptions_try_searching_or_importing_some":
            MessageLookupByLibrary.simpleMessage(
                "Abonelik yok. Bazılarını aramayı veya içe aktarmayı deneyin!"),
        "not_set": MessageLookupByLibrary.simpleMessage("Ayarlanmadı"),
        "note_due_to_a_twitter_limitation_not_all_tweets_may_be_included":
            MessageLookupByLibrary.simpleMessage(
                "Not: Twitter/X sınırlaması nedeniyle, tüm tweet\'ler dahil edilmeyebilir"),
        "numberFormat_format_total_votes": m9,
        "ok": MessageLookupByLibrary.simpleMessage("TAMAM"),
        "only_public_subscriptions_can_be_imported":
            MessageLookupByLibrary.simpleMessage(
                "Abonelikler yalnızca herkese açık profillerden içe aktarılabilir"),
        "oops_something_went_wrong": MessageLookupByLibrary.simpleMessage(
            "Hop! Bir şeyler ters gitti 🥲"),
        "open_app_settings":
            MessageLookupByLibrary.simpleMessage("Uygulama ayarlarını aç"),
        "page_not_found": MessageLookupByLibrary.simpleMessage(
            "Twitter/X sayfanın mevcut olmadığını söylüyor, ancak bu doğru olmayabilir"),
        "permission_not_granted": MessageLookupByLibrary.simpleMessage(
            "İzin verilmedi. Lütfen verdikten sonra tekrar deneyin!"),
        "pick_a_color": MessageLookupByLibrary.simpleMessage("Bir renk seçin!"),
        "pick_an_icon":
            MessageLookupByLibrary.simpleMessage("Bir simge seçin!"),
        "pinned_tweet":
            MessageLookupByLibrary.simpleMessage("Sabitlenmiş tweet"),
        "playback_speed": MessageLookupByLibrary.simpleMessage("Oynatma hızı"),
        "please_check_your_internet_connection_error_message": m10,
        "please_enter_a_name":
            MessageLookupByLibrary.simpleMessage("Lütfen bir ad girin"),
        "please_make_sure_the_data_you_wish_to_import_is_located_there_then_press_the_import_button_below":
            MessageLookupByLibrary.simpleMessage(
                "Lütfen içe aktarmak istediğiniz verilerin orada olduğundan emin olun, ardından aşağıdaki içe aktar düğmesine basın."),
        "please_note_that_the_method_fritter_uses_to_import_subscriptions_is_heavily_rate_limited_by_twitter_so_this_may_fail_if_you_have_a_lot_of_followed_accounts":
            MessageLookupByLibrary.simpleMessage(
                "Squawker\'ın abonelikleri içe aktarmak için kullandığı yöntemin Twitter/X tarafından yüksek oranda sınırlandırıldığını, bu nedenle çok sayıda takip ettiğiniz hesap varsa bunun başarısız olabileceğini lütfen unutmayın."),
        "possibly_sensitive":
            MessageLookupByLibrary.simpleMessage("Hassas olabilir"),
        "possibly_sensitive_profile": MessageLookupByLibrary.simpleMessage(
            "Bu profil hassas olabilecek görüntüler, dil veya başka içerikler içerebilir. Yine de görüntülemek istiyor musunuz?"),
        "possibly_sensitive_tweet": MessageLookupByLibrary.simpleMessage(
            "Bu tweet olası hassas içerik barındırmaktadır. Görüntülemek ister misiniz?"),
        "prefix": MessageLookupByLibrary.simpleMessage("ön ek"),
        "private_profile": MessageLookupByLibrary.simpleMessage("Gizli profil"),
        "released_under_the_mit_license": MessageLookupByLibrary.simpleMessage(
            "MIT Lisansı altında yayınlandı"),
        "replying_to": MessageLookupByLibrary.simpleMessage("Yanıtlıyor"),
        "report": MessageLookupByLibrary.simpleMessage("Bildir"),
        "report_a_bug": MessageLookupByLibrary.simpleMessage("Hata bildir"),
        "reporting_an_error":
            MessageLookupByLibrary.simpleMessage("Hata bildirme"),
        "reset_home_pages": MessageLookupByLibrary.simpleMessage(
            "Sayfaları öntanımlı olana sıfırla"),
        "retry": MessageLookupByLibrary.simpleMessage("Yeniden dene"),
        "save": MessageLookupByLibrary.simpleMessage("Kaydet"),
        "save_bandwidth_using_smaller_images":
            MessageLookupByLibrary.simpleMessage(
                "Daha küçük görüntülerle bant genişliğinden tasarruf edin"),
        "saved": MessageLookupByLibrary.simpleMessage("Kaydedilmiş"),
        "saved_tweet_too_large": MessageLookupByLibrary.simpleMessage(
            "Kaydedilen bu tweet, yüklenemeyecek kadar büyük olduğu için görüntülenemedi. Lütfen bunu geliştiricilere bildirin."),
        "search": MessageLookupByLibrary.simpleMessage("Ara"),
        "search_term": MessageLookupByLibrary.simpleMessage("Arama terimi"),
        "select": MessageLookupByLibrary.simpleMessage("Seç"),
        "selecting_individual_accounts_to_import_and_assigning_groups_are_both_planned_for_the_future_already":
            MessageLookupByLibrary.simpleMessage(
                "İçe aktarılacak bireysel hesapların seçilmesi ve grupların atanması şimdiden gelecek için planlanmıştır!"),
        "send": MessageLookupByLibrary.simpleMessage("Gönder"),
        "settings": MessageLookupByLibrary.simpleMessage("Ayarlar"),
        "share_base_url":
            MessageLookupByLibrary.simpleMessage("Özel paylaşım URL\'si"),
        "share_base_url_description": MessageLookupByLibrary.simpleMessage(
            "Paylaşırken özel bir temel URL kullanın"),
        "share_tweet_content":
            MessageLookupByLibrary.simpleMessage("Tweet içeriğini paylaş"),
        "share_tweet_content_and_link": MessageLookupByLibrary.simpleMessage(
            "Tweet içeriğini ve bağlantısını paylaş"),
        "share_tweet_link":
            MessageLookupByLibrary.simpleMessage("Tweet bağlantısını paylaş"),
        "should_check_for_updates_description":
            MessageLookupByLibrary.simpleMessage(
                "Squawker başladığında güncellemeleri denetle"),
        "should_check_for_updates_label":
            MessageLookupByLibrary.simpleMessage("Güncellemeleri denetle"),
        "small": MessageLookupByLibrary.simpleMessage("Küçük"),
        "something_broke_in_fritter": MessageLookupByLibrary.simpleMessage(
            "Squawker\'da bir şey bozuldu."),
        "something_just_went_wrong_in_fritter_and_an_error_report_has_been_generated":
            MessageLookupByLibrary.simpleMessage(
                "Squawker\'da bir şeyler ters gitti ve bir hata raporu oluşturuldu. Rapor, sorunun çözülmesine yardımcı olmaları için Squawker geliştiricilerine gönderilebilir."),
        "sorry_the_replied_tweet_could_not_be_found":
            MessageLookupByLibrary.simpleMessage(
                "Üzgünüz, yanıtlanan tweet bulunamadı!"),
        "subscribe": MessageLookupByLibrary.simpleMessage("Abone ol"),
        "subscriptions": MessageLookupByLibrary.simpleMessage("Abonelikler"),
        "subtitles": MessageLookupByLibrary.simpleMessage("Altyazılar"),
        "successfully_saved_the_media":
            MessageLookupByLibrary.simpleMessage("Medya kaydedildi!"),
        "system": MessageLookupByLibrary.simpleMessage("Sistem"),
        "tap_to_download_release_version": m11,
        "tap_to_show_getMediaType_item_type": m12,
        "thanks_for_helping_fritter": MessageLookupByLibrary.simpleMessage(
            "Squawker\'a yardım ettiğin için teşekkürler! 💖"),
        "the_file_does_not_exist_please_ensure_it_is_located_at_file_path": m13,
        "the_github_issue":
            MessageLookupByLibrary.simpleMessage("GitHub sorunu (#143)"),
        "the_tweet_did_not_contain_any_text_this_is_unexpected":
            MessageLookupByLibrary.simpleMessage(
                "Tweet\'te herhangi bir metin yoktu. Bu beklenmedik bir şey"),
        "theme": MessageLookupByLibrary.simpleMessage("Tema"),
        "theme_mode": MessageLookupByLibrary.simpleMessage("Tema Modu"),
        "there_were_no_trends_returned_this_is_unexpected_please_report_as_a_bug_if_possible":
            MessageLookupByLibrary.simpleMessage(
                "Geri dönen trend yoktu. Bu beklenmedik! Mümkünse lütfen bir hata olarak bildirin."),
        "this_group_contains_no_subscriptions":
            MessageLookupByLibrary.simpleMessage(
                "Bu grup hiçbir abonelik içermiyor!"),
        "this_took_too_long_to_load_please_check_your_network_connection":
            MessageLookupByLibrary.simpleMessage(
                "Bunun yüklenmesi çok uzun sürdü. Lütfen internet bağlantınızı kontrol edin!"),
        "this_tweet_is_unavailable": MessageLookupByLibrary.simpleMessage(
            "Bu tweete ulaşılamıyor. Muhtemelen silindi."),
        "this_tweet_user_name_retweeted": m14,
        "this_user_does_not_follow_anyone":
            MessageLookupByLibrary.simpleMessage(
                "Bu kullanıcı kimseyi takip etmiyor!"),
        "this_user_does_not_have_anyone_following_them":
            MessageLookupByLibrary.simpleMessage(
                "Bu kullanıcıyı takip eden kimse yok!"),
        "thread": MessageLookupByLibrary.simpleMessage("Başlık"),
        "thumbnail": MessageLookupByLibrary.simpleMessage("Küçük resim"),
        "timed_out":
            MessageLookupByLibrary.simpleMessage("Zaman aşımına uğradı"),
        "to_import_subscriptions_from_an_existing_twitter_account_enter_your_username_below":
            MessageLookupByLibrary.simpleMessage(
                "Mevcut bir Twitter/X hesabından abonelikleri içe aktarmak için aşağıya kullanıcı adınızı girin."),
        "toggle_all": MessageLookupByLibrary.simpleMessage("Tümünü Aç/Kapat"),
        "trending": MessageLookupByLibrary.simpleMessage("Trendler"),
        "trends": MessageLookupByLibrary.simpleMessage("Trendler"),
        "true_black":
            MessageLookupByLibrary.simpleMessage("Gerçek siyah olsun mu?"),
        "tweets": MessageLookupByLibrary.simpleMessage("Tweet\'ler"),
        "tweets_and_replies":
            MessageLookupByLibrary.simpleMessage("Tweet\'ler & Yanıtlar"),
        "tweets_number": m15,
        "two_home_pages_required": MessageLookupByLibrary.simpleMessage(
            "En az 2 ana ekran sayfanızın olması gerekir."),
        "unable_to_find_the_available_trend_locations":
            MessageLookupByLibrary.simpleMessage(
                "Mevcut trend konumları bulunamadı."),
        "unable_to_find_your_saved_tweets":
            MessageLookupByLibrary.simpleMessage(
                "Kayıtlı tweet\'leriniz bulunamıyor."),
        "unable_to_import":
            MessageLookupByLibrary.simpleMessage("İçe aktarılamıyor"),
        "unable_to_load_home_pages": MessageLookupByLibrary.simpleMessage(
            "Ana sayfalarınız yüklenemiyor"),
        "unable_to_load_subscription_groups":
            MessageLookupByLibrary.simpleMessage(
                "Abonelik grupları yüklenemiyor"),
        "unable_to_load_the_group":
            MessageLookupByLibrary.simpleMessage("Grup yüklenemedi"),
        "unable_to_load_the_group_settings":
            MessageLookupByLibrary.simpleMessage("Grup ayarları yüklenemedi"),
        "unable_to_load_the_list_of_follows":
            MessageLookupByLibrary.simpleMessage(
                "Aşağıdakilerin listesi yüklenemiyor"),
        "unable_to_load_the_next_page_of_follows":
            MessageLookupByLibrary.simpleMessage(
                "Takip edenlerin sonraki sayfası yüklenemiyor"),
        "unable_to_load_the_next_page_of_replies":
            MessageLookupByLibrary.simpleMessage(
                "Yanıtların bir sonraki sayfası yüklenemedi"),
        "unable_to_load_the_next_page_of_tweets":
            MessageLookupByLibrary.simpleMessage(
                "Tweet\'lerin sonraki sayfası yüklenemiyor"),
        "unable_to_load_the_profile":
            MessageLookupByLibrary.simpleMessage("Profil yüklenemiyor"),
        "unable_to_load_the_search_results":
            MessageLookupByLibrary.simpleMessage(
                "Arama sonuçları yüklenemiyor."),
        "unable_to_load_the_trends_for_widget_place_name": m16,
        "unable_to_load_the_tweet":
            MessageLookupByLibrary.simpleMessage("Tweet yüklenemedi"),
        "unable_to_load_the_tweets":
            MessageLookupByLibrary.simpleMessage("Tweet\'ler yüklenemedi"),
        "unable_to_load_the_tweets_for_the_feed":
            MessageLookupByLibrary.simpleMessage(
                "Akış için tweet\'ler yüklenemiyor"),
        "unable_to_refresh_the_subscriptions":
            MessageLookupByLibrary.simpleMessage("Abonelikler yenilenemiyor"),
        "unable_to_run_the_database_migrations":
            MessageLookupByLibrary.simpleMessage(
                "Veritabanı geçişleri çalıştırılamıyor"),
        "unable_to_save_the_media_twitter_returned_a_status_of_response_statusCode":
            m17,
        "unable_to_stream_the_trend_location_preference":
            MessageLookupByLibrary.simpleMessage(
                "Trend konumu tercihi aktarılamıyor"),
        "unknown": MessageLookupByLibrary.simpleMessage("Bilinmeyen"),
        "unsave": MessageLookupByLibrary.simpleMessage("Kaydetmeyi iptal et"),
        "unsubscribe": MessageLookupByLibrary.simpleMessage("Abonelikten çık"),
        "unsupported_url":
            MessageLookupByLibrary.simpleMessage("Desteklenmeyen URL"),
        "update_to_release_version_through_your_fdroid_client": m18,
        "updates": MessageLookupByLibrary.simpleMessage("Güncellemeler"),
        "use_true_black_for_the_dark_mode_theme":
            MessageLookupByLibrary.simpleMessage(
                "Koyu tema için gerçek siyahı kullanın"),
        "user_not_found":
            MessageLookupByLibrary.simpleMessage("Kullanıcı bulunamadı"),
        "username": MessageLookupByLibrary.simpleMessage("Kullanıcı adı"),
        "version": MessageLookupByLibrary.simpleMessage("Sürüm"),
        "when_a_new_app_update_is_available":
            MessageLookupByLibrary.simpleMessage(
                "Yeni bir uygulama güncellemesi mevcut olduğunda"),
        "whether_errors_should_be_reported_to_":
            MessageLookupByLibrary.simpleMessage(
                "Hataların \'ye bildirilip bildirilmeyeceği"),
        "whether_to_hide_tweets_marked_as_sensitive":
            MessageLookupByLibrary.simpleMessage(
                "Hassas olarak işaretlenen tweetlerin gizlenip gizlenmeyeceği"),
        "which_tab_is_shown_when_the_app_opens":
            MessageLookupByLibrary.simpleMessage(
                "Uygulama açıldığında hangi sekmenin gösterileceğini belirler"),
        "would_you_like_to_enable_automatic_error_reporting":
            MessageLookupByLibrary.simpleMessage(
                "Otomatik hata bildirimini etkinleştirmek ister misiniz?"),
        "yes": MessageLookupByLibrary.simpleMessage("Evet"),
        "yes_please": MessageLookupByLibrary.simpleMessage("Evet, lütfen"),
        "you_have_not_saved_any_tweets_yet":
            MessageLookupByLibrary.simpleMessage("Henüz tweet kaydetmediniz!"),
        "you_must_have_at_least_2_home_screen_pages":
            MessageLookupByLibrary.simpleMessage(
                "En az 2 ana ekran sayfanız olmalıdır"),
        "your_profile_must_be_public_otherwise_the_import_will_not_work":
            MessageLookupByLibrary.simpleMessage(
                "Profiliniz herkese açık olmalıdır, aksi takdirde alma işlemi çalışmaz"),
        "your_report_will_be_sent_to_fritter__project":
            MessageLookupByLibrary.simpleMessage(
                "Raporunuz Squawker\'ın  projesine gönderilecektir ve gizlilik detaylarını şu adreste bulabilirsiniz:")
      };
}
