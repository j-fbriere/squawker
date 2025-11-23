// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a id locale. All the
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
  String get localeName => 'id';

  static String m0(name) =>
      "Apakah Anda yakin Anda ingin menghapus grup langganan ${name}?";

  static String m1(fileName) => "Data diekspor ke ${fileName}";

  static String m2(fullPath) => "Data diekspor ke ${fullPath}";

  static String m3(timeagoFormat) => "Selesai ${timeagoFormat}";

  static String m4(timeagoFormat) => "Selesai ${timeagoFormat}";

  static String m5(snapshotData) => "Selesai dengan ${snapshotData} pengguna";

  static String m6(name) => "Grup: ${name}";

  static String m7(snapshotData) =>
      "${snapshotData} pengguna terimpor sejauh ini";

  static String m8(date) => "Bergabung ${date}";

  static String m10(num, numFormatted) =>
      "${Intl.plural(num, zero: 'Tidak ada pemilihan', one: 'Satu pemilihan', two: 'Dua pemilihan', few: '${numFormatted} pemilihan', many: '${numFormatted} pemilihan', other: '${numFormatted} pemilihan')}";

  static String m11(errorMessage) =>
      "Mohon periksa koneksi Internet Anda.\n\n${errorMessage}";

  static String m13(releaseVersion) =>
      "Ketuk untuk mengunduh ${releaseVersion}";

  static String m14(getMediaType) => "Ketuk untuk menampilkan ${getMediaType}";

  static String m15(filePath) =>
      "Berkas tidak ada. Pastikan bahwa itu terletak di ${filePath}";

  static String m16(thisTweetUserName, timeAgo) =>
      "${thisTweetUserName} mencuit ulang ${timeAgo}";

  static String m17(num, numFormatted) =>
      "${Intl.plural(num, zero: 'tidak ada cuitan', one: '1 cuitan', two: '2 cuitan', few: '${numFormatted} cuitan', many: '${numFormatted} cuitan', other: '${numFormatted} cuitan')}";

  static String m18(widgetPlaceName) =>
      "Tidak bisa memuat tren untuk ${widgetPlaceName}";

  static String m19(responseStatusCode) =>
      "Tidak dapat menyimpan media. Twitter/X mengembalikan status ${responseStatusCode}";

  static String m20(releaseVersion) =>
      "Perbarui ke ${releaseVersion} lewat klien F-Droid Anda";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("Tentang"),
    "account_suspended": MessageLookupByLibrary.simpleMessage(
      "Akun ditangguhkan",
    ),
    "activate_non_confirmation_bias_mode_description":
        MessageLookupByLibrary.simpleMessage(
          "Sembunyikan pembuat cuitan. Hindari bias konfirmasi berdasarkan argumen otoritatif.",
        ),
    "activate_non_confirmation_bias_mode_label":
        MessageLookupByLibrary.simpleMessage(
          "Aktifkan mode bias non-konfirmasi",
        ),
    "add_to_group": MessageLookupByLibrary.simpleMessage("Tambah ke grup"),
    "all": MessageLookupByLibrary.simpleMessage("Semua"),
    "all_the_great_software_used_by_fritter":
        MessageLookupByLibrary.simpleMessage(
          "Semua perangkat lunak hebat yang digunakan oleh Squawker",
        ),
    "an_update_for_fritter_is_available": MessageLookupByLibrary.simpleMessage(
      "Pembaruan untuk Squawker tersedia! 🚀",
    ),
    "are_you_sure": MessageLookupByLibrary.simpleMessage("Apakah Anda yakin?"),
    "are_you_sure_you_want_to_delete_the_subscription_group_name_of_group": m0,
    "back": MessageLookupByLibrary.simpleMessage("Kembali"),
    "bad_guest_token": MessageLookupByLibrary.simpleMessage(
      "Twitter/X telah membatalkan token akses kami. Coba buka ulang Squawker!",
    ),
    "blue_theme_based_on_the_twitter_color_scheme":
        MessageLookupByLibrary.simpleMessage(
          "Tema biru berdasarkan pada skema warna Twitter/X",
        ),
    "cancel": MessageLookupByLibrary.simpleMessage("Batal"),
    "catastrophic_failure": MessageLookupByLibrary.simpleMessage(
      "Kegagalan serius",
    ),
    "choose": MessageLookupByLibrary.simpleMessage("Pilih"),
    "choose_pages": MessageLookupByLibrary.simpleMessage("Pilih halaman"),
    "close": MessageLookupByLibrary.simpleMessage("Tutup"),
    "confirm_close_fritter": MessageLookupByLibrary.simpleMessage(
      "Apakah Anda yakin ingin menutup Squawker?",
    ),
    "contribute": MessageLookupByLibrary.simpleMessage("Kontribusi"),
    "copied_address_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "Alamat disalin ke papan klip",
    ),
    "copied_version_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "Salin versi ke papan klip",
    ),
    "could_not_contact_twitter": MessageLookupByLibrary.simpleMessage(
      "Tidak bisa menghubungi Twitter/X",
    ),
    "could_not_find_any_tweets_by_this_user":
        MessageLookupByLibrary.simpleMessage(
          "Tidak bisa mencari cuitan apa pun dari pengguna ini!",
        ),
    "could_not_find_any_tweets_from_the_last_7_days":
        MessageLookupByLibrary.simpleMessage(
          "Tidak bisa menemukan cuitan apa pun dari 7 hari terakhir!",
        ),
    "country": MessageLookupByLibrary.simpleMessage("Negara"),
    "dark": MessageLookupByLibrary.simpleMessage("Gelap"),
    "data": MessageLookupByLibrary.simpleMessage("Data"),
    "data_exported_to_fileName": m1,
    "data_exported_to_fullPath": m2,
    "data_imported_successfully": MessageLookupByLibrary.simpleMessage(
      "Data berhasil diimpor",
    ),
    "date_created": MessageLookupByLibrary.simpleMessage("Tanggal Dibuat"),
    "date_subscribed": MessageLookupByLibrary.simpleMessage(
      "Tanggal Berlangganan",
    ),
    "default_tab": MessageLookupByLibrary.simpleMessage("Bilah baku"),
    "delete": MessageLookupByLibrary.simpleMessage("Hapus"),
    "disable_screenshots": MessageLookupByLibrary.simpleMessage(
      "Nonaktifkan tangkap layar",
    ),
    "disable_screenshots_hint": MessageLookupByLibrary.simpleMessage(
      "Cegah tangkapan layar untuk diambil. Ini mungkin tidak bekerja pada semua perangkat.",
    ),
    "disabled": MessageLookupByLibrary.simpleMessage("Dinonaktifkan"),
    "donate": MessageLookupByLibrary.simpleMessage("Donasi"),
    "download": MessageLookupByLibrary.simpleMessage("Unduh"),
    "download_handling": MessageLookupByLibrary.simpleMessage(
      "Penanganan unduhan",
    ),
    "download_handling_description": MessageLookupByLibrary.simpleMessage(
      "Bagaimana unduhan seharusnya bekerja",
    ),
    "download_handling_type_ask": MessageLookupByLibrary.simpleMessage(
      "Selalu tanya",
    ),
    "download_handling_type_directory": MessageLookupByLibrary.simpleMessage(
      "Simpan ke direktori",
    ),
    "download_media_no_url": MessageLookupByLibrary.simpleMessage(
      "Tidak bisa mengunduh. Media ini hanya tersedia sebagai siaran, yang Squawker belum bisa mengunduhnya.",
    ),
    "download_path": MessageLookupByLibrary.simpleMessage("Jalur unduhan"),
    "downloading_media": MessageLookupByLibrary.simpleMessage(
      "Mengunduh media...",
    ),
    "enable_": MessageLookupByLibrary.simpleMessage("Aktifkan ?"),
    "ended_timeago_format_endsAt_allowFromNow_true": m3,
    "ends_timeago_format_endsAt_allowFromNow_true": m4,
    "enter_your_twitter_username": MessageLookupByLibrary.simpleMessage(
      "Masukkan nama pengguna Twitter/X Anda",
    ),
    "export": MessageLookupByLibrary.simpleMessage("Ekspor"),
    "export_settings": MessageLookupByLibrary.simpleMessage(
      "Ekspor pengaturan?",
    ),
    "export_subscription_group_members": MessageLookupByLibrary.simpleMessage(
      "Ekspor anggota grup langganan?",
    ),
    "export_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "Ekspor grup langganan?",
    ),
    "export_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Ekspor langganan?",
    ),
    "export_tweets": MessageLookupByLibrary.simpleMessage("Ekspor cuitan?"),
    "export_your_data": MessageLookupByLibrary.simpleMessage(
      "Ekspor data Anda",
    ),
    "feed": MessageLookupByLibrary.simpleMessage("Umpan"),
    "filters": MessageLookupByLibrary.simpleMessage("Filter"),
    "finished_with_snapshotData_users": m5,
    "followers": MessageLookupByLibrary.simpleMessage("Pengikut"),
    "following": MessageLookupByLibrary.simpleMessage("Mengikuti"),
    "forbidden": MessageLookupByLibrary.simpleMessage(
      "Twitter/X mengatakan bahwa akses ke sini terlarang",
    ),
    "fritter": MessageLookupByLibrary.simpleMessage("Squawker"),
    "fritter_blue": MessageLookupByLibrary.simpleMessage("Squawker biru"),
    "general": MessageLookupByLibrary.simpleMessage("Umum"),
    "group_name": m6,
    "groups": MessageLookupByLibrary.simpleMessage("Grup"),
    "help_make_fritter_even_better": MessageLookupByLibrary.simpleMessage(
      "Bantu Squawker menjadi lebih baik",
    ),
    "help_support_fritters_future": MessageLookupByLibrary.simpleMessage(
      "Bantu dukung masa depan Squawker",
    ),
    "hide_sensitive_tweets": MessageLookupByLibrary.simpleMessage(
      "Sembunyikan cuitan sensitif",
    ),
    "home": MessageLookupByLibrary.simpleMessage("Beranda"),
    "if_you_have_any_feedback_on_this_feature_please_leave_it_on":
        MessageLookupByLibrary.simpleMessage(
          "Jika Anda punya umpan balik terhadap fitur ini, mohon tinggalkan di",
        ),
    "import": MessageLookupByLibrary.simpleMessage("Impor"),
    "import_data_from_another_device": MessageLookupByLibrary.simpleMessage(
      "Impor data dari perangkat lain",
    ),
    "import_from_twitter": MessageLookupByLibrary.simpleMessage(
      "Impor dari Twitter/X",
    ),
    "import_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Impor langganan",
    ),
    "imported_snapshot_data_users_so_far": m7,
    "include_replies": MessageLookupByLibrary.simpleMessage("Sertakan balasan"),
    "include_retweets": MessageLookupByLibrary.simpleMessage(
      "Sertakan cuit ulang",
    ),
    "joined": m8,
    "language": MessageLookupByLibrary.simpleMessage("Bahasa"),
    "language_subtitle": MessageLookupByLibrary.simpleMessage(
      "Memerlukan pemulaian ulang",
    ),
    "large": MessageLookupByLibrary.simpleMessage("Besar"),
    "legacy_android_import": MessageLookupByLibrary.simpleMessage(
      "Impor Android Lawas",
    ),
    "let_the_developers_know_if_something_is_broken":
        MessageLookupByLibrary.simpleMessage(
          "Biarkan pengembang tahu jika ada sesuatu yang rusak",
        ),
    "licenses": MessageLookupByLibrary.simpleMessage("Lisensi"),
    "light": MessageLookupByLibrary.simpleMessage("Terang"),
    "live": MessageLookupByLibrary.simpleMessage("LANGSUNG"),
    "logging": MessageLookupByLibrary.simpleMessage("Log"),
    "media": MessageLookupByLibrary.simpleMessage("Media"),
    "media_size": MessageLookupByLibrary.simpleMessage("Ukuran media"),
    "medium": MessageLookupByLibrary.simpleMessage("Sedang"),
    "missing_page": MessageLookupByLibrary.simpleMessage("Halaman hilang"),
    "name": MessageLookupByLibrary.simpleMessage("Nama"),
    "newTrans": MessageLookupByLibrary.simpleMessage("Baru"),
    "no": MessageLookupByLibrary.simpleMessage("Tidak"),
    "no_data_was_returned_which_should_never_happen_please_report_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "Tidak ada data yang dikembalikan, yang seharusnya tidak pernah terjadi. Silakan laporkan masalah, jika mungkin!",
        ),
    "no_results": MessageLookupByLibrary.simpleMessage("Tidak ada hasil"),
    "no_results_for": MessageLookupByLibrary.simpleMessage(
      "Tidak ada hasil untuk:",
    ),
    "no_subscriptions_try_searching_or_importing_some":
        MessageLookupByLibrary.simpleMessage(
          "Tidak ada langganan. Coba mencari atau mengimpor beberapa!",
        ),
    "not_set": MessageLookupByLibrary.simpleMessage("Tidak diatur"),
    "note_due_to_a_twitter_limitation_not_all_tweets_may_be_included":
        MessageLookupByLibrary.simpleMessage(
          "Catatan: Karena batasan Twitter/X, tidak semua cuitan akan disertakan",
        ),
    "numberFormat_format_total_votes": m10,
    "ok": MessageLookupByLibrary.simpleMessage("Oke"),
    "only_public_subscriptions_can_be_imported":
        MessageLookupByLibrary.simpleMessage(
          "Subskripsi hanya bisa terimpor dari profil publik",
        ),
    "oops_something_went_wrong": MessageLookupByLibrary.simpleMessage(
      "Aduh! Ada yang tidak beres 🥲",
    ),
    "open_app_settings": MessageLookupByLibrary.simpleMessage(
      "Buka pengaturan aplikasi",
    ),
    "page_not_found": MessageLookupByLibrary.simpleMessage(
      "Twitter/X mengatakan halaman ini tidak ada, tetapi mungkin itu tidak benar",
    ),
    "permission_not_granted": MessageLookupByLibrary.simpleMessage(
      "Izin tidak diberikan. Coba lagi setelah memberikannya!",
    ),
    "pick_a_color": MessageLookupByLibrary.simpleMessage("Pilih sebuah warna!"),
    "pick_an_icon": MessageLookupByLibrary.simpleMessage("Pilih ikon!"),
    "pinned_tweet": MessageLookupByLibrary.simpleMessage(
      "Cuitan yang disematkan",
    ),
    "playback_speed": MessageLookupByLibrary.simpleMessage(
      "Kecepatan pemutaran",
    ),
    "please_check_your_internet_connection_error_message": m11,
    "please_enter_a_name": MessageLookupByLibrary.simpleMessage(
      "Mohon masukkan nama",
    ),
    "please_make_sure_the_data_you_wish_to_import_is_located_there_then_press_the_import_button_below":
        MessageLookupByLibrary.simpleMessage(
          "Mohon pastikan data yang ingin Anda impor terletak di sana, kemudian tekan tombol impor di bawah.",
        ),
    "please_note_that_the_method_fritter_uses_to_import_subscriptions_is_heavily_rate_limited_by_twitter_so_this_may_fail_if_you_have_a_lot_of_followed_accounts":
        MessageLookupByLibrary.simpleMessage(
          "Mohon dicatat bahwa metode yang Squawker gunakan untuk mengimpor langganan sangat dibatasi oleh Twitter/X, jadi ini mungkin akan gagal jika Anda mengikuti banyak akun.",
        ),
    "possibly_sensitive": MessageLookupByLibrary.simpleMessage(
      "Kemungkinan sensitif",
    ),
    "possibly_sensitive_profile": MessageLookupByLibrary.simpleMessage(
      "Profil ini mungkin mengandung gambar, bahasa, atau konten lain yang kemungkinan sensitif. Apakah Anda masih ingin melihatnya?",
    ),
    "possibly_sensitive_tweet": MessageLookupByLibrary.simpleMessage(
      "Cuitan ini mengandung konten yang kemungkinan sensitif. Apakah Anda ingin melihatnya?",
    ),
    "prefix": MessageLookupByLibrary.simpleMessage("awalan"),
    "private_profile": MessageLookupByLibrary.simpleMessage("Profil privat"),
    "released_under_the_mit_license": MessageLookupByLibrary.simpleMessage(
      "Dirilis di bawah Lisensi MIT",
    ),
    "replying_to": MessageLookupByLibrary.simpleMessage("Membalas ke"),
    "report": MessageLookupByLibrary.simpleMessage("Lapor"),
    "report_a_bug": MessageLookupByLibrary.simpleMessage("Laporkan masalah"),
    "reporting_an_error": MessageLookupByLibrary.simpleMessage(
      "Melaporkan galat",
    ),
    "reset_home_pages": MessageLookupByLibrary.simpleMessage(
      "Atur ulang halaman ke yang baku",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Ulang"),
    "save": MessageLookupByLibrary.simpleMessage("Simpan"),
    "save_bandwidth_using_smaller_images": MessageLookupByLibrary.simpleMessage(
      "Hemat bandwidth menggunakan gambar yang lebih kecil",
    ),
    "saved": MessageLookupByLibrary.simpleMessage("Disimpan"),
    "saved_tweet_too_large": MessageLookupByLibrary.simpleMessage(
      "Tweet yang disimpan ini tidak bisa ditampilkan, karna terlalu besar. Silahkan laporkan ke developer.",
    ),
    "search": MessageLookupByLibrary.simpleMessage("Cari"),
    "search_term": MessageLookupByLibrary.simpleMessage("Kata pencarian"),
    "select": MessageLookupByLibrary.simpleMessage("Pilih"),
    "selecting_individual_accounts_to_import_and_assigning_groups_are_both_planned_for_the_future_already":
        MessageLookupByLibrary.simpleMessage(
          "Memilih akun individu untuk diimpor, dan menetapkan grup sudah direncanakan untuk masa mendatang!",
        ),
    "send": MessageLookupByLibrary.simpleMessage("Kirim"),
    "share_tweet_content": MessageLookupByLibrary.simpleMessage(
      "Bagi konten cuitan",
    ),
    "share_tweet_content_and_link": MessageLookupByLibrary.simpleMessage(
      "Bagi konten dan tautan cuitan",
    ),
    "share_tweet_link": MessageLookupByLibrary.simpleMessage(
      "Bagi tautan cuitan",
    ),
    "should_check_for_updates_description":
        MessageLookupByLibrary.simpleMessage(
          "Periksa pembaruan ketika Squawker dimulai",
        ),
    "should_check_for_updates_label": MessageLookupByLibrary.simpleMessage(
      "Periksa pembaruan",
    ),
    "small": MessageLookupByLibrary.simpleMessage("Kecil"),
    "something_broke_in_fritter": MessageLookupByLibrary.simpleMessage(
      "Sesuatu rusak di Squawker.",
    ),
    "something_just_went_wrong_in_fritter_and_an_error_report_has_been_generated":
        MessageLookupByLibrary.simpleMessage(
          "Ada sesuatu yang salah di Squawker, dan laporan galat telah dibuat. Laporan bisa dikirim ke pengembang Squawker untuk membantu memperbaiki masalah.",
        ),
    "sorry_the_replied_tweet_could_not_be_found":
        MessageLookupByLibrary.simpleMessage(
          "Maaf, cuitan yang dibalas tidak dapat ditemukan!",
        ),
    "subscribe": MessageLookupByLibrary.simpleMessage("Langgan"),
    "subscriptions": MessageLookupByLibrary.simpleMessage("Langganan"),
    "subtitles": MessageLookupByLibrary.simpleMessage("Takarir"),
    "successfully_saved_the_media": MessageLookupByLibrary.simpleMessage(
      "Media disimpan!",
    ),
    "system": MessageLookupByLibrary.simpleMessage("Sistem"),
    "tap_to_download_release_version": m13,
    "tap_to_show_getMediaType_item_type": m14,
    "thanks_for_helping_fritter": MessageLookupByLibrary.simpleMessage(
      "Terima kasih telah membantu Squawker! 💖",
    ),
    "the_file_does_not_exist_please_ensure_it_is_located_at_file_path": m15,
    "the_github_issue": MessageLookupByLibrary.simpleMessage(
      "isu GitHub (#143)",
    ),
    "the_tweet_did_not_contain_any_text_this_is_unexpected":
        MessageLookupByLibrary.simpleMessage(
          "Cuitan tidak mengandung teks apa pun. Ini tidak diduga",
        ),
    "theme": MessageLookupByLibrary.simpleMessage("Tema"),
    "theme_mode": MessageLookupByLibrary.simpleMessage("Mode Tema"),
    "there_were_no_trends_returned_this_is_unexpected_please_report_as_a_bug_if_possible":
        MessageLookupByLibrary.simpleMessage(
          "Tidak ada tren yang dikembalikan. Ini tidak terduga! Mohon laporkan sebagai masalah, jika mungkin.",
        ),
    "this_group_contains_no_subscriptions":
        MessageLookupByLibrary.simpleMessage(
          "Grup ini tidak berisi langganan!",
        ),
    "this_took_too_long_to_load_please_check_your_network_connection":
        MessageLookupByLibrary.simpleMessage(
          "Ini perlu waktu lama untuk memuat. Mohon periksa koneksi jaringan Anda!",
        ),
    "this_tweet_is_unavailable": MessageLookupByLibrary.simpleMessage(
      "Cuitan ini tidak tersedia. Mungkin sudah dihapus.",
    ),
    "this_tweet_user_name_retweeted": m16,
    "this_user_does_not_follow_anyone": MessageLookupByLibrary.simpleMessage(
      "Pengguna ini tidak mengikuti siapa pun!",
    ),
    "this_user_does_not_have_anyone_following_them":
        MessageLookupByLibrary.simpleMessage(
          "Pengguna ini tidak punya seseorang yang mengikuti mereka!",
        ),
    "thread": MessageLookupByLibrary.simpleMessage("Utas"),
    "thumbnail": MessageLookupByLibrary.simpleMessage("Keluku"),
    "timed_out": MessageLookupByLibrary.simpleMessage("Waktu habis"),
    "to_import_subscriptions_from_an_existing_twitter_account_enter_your_username_below":
        MessageLookupByLibrary.simpleMessage(
          "Untuk mengimpor langganan dari akun Twitter/X yang ada, masukkan nama pengguna Anda di bawah ini.",
        ),
    "toggle_all": MessageLookupByLibrary.simpleMessage("Alih Semua"),
    "trending": MessageLookupByLibrary.simpleMessage("Tren"),
    "trends": MessageLookupByLibrary.simpleMessage("Tren"),
    "true_black": MessageLookupByLibrary.simpleMessage("Hitam Pekat?"),
    "tweets": MessageLookupByLibrary.simpleMessage("Cuitan"),
    "tweets_and_replies": MessageLookupByLibrary.simpleMessage(
      "Cuitan & Balasan",
    ),
    "tweets_number": m17,
    "two_home_pages_required": MessageLookupByLibrary.simpleMessage(
      "Kamu perlu setidaknya 2 halaman beranda.",
    ),
    "unable_to_find_the_available_trend_locations":
        MessageLookupByLibrary.simpleMessage(
          "Tidak bisa menemukan lokasi tren yang tersedia.",
        ),
    "unable_to_find_your_saved_tweets": MessageLookupByLibrary.simpleMessage(
      "Tidak bisa menemukan cuitan tersimpan Anda.",
    ),
    "unable_to_import": MessageLookupByLibrary.simpleMessage(
      "Tidak bisa mengimpor",
    ),
    "unable_to_load_home_pages": MessageLookupByLibrary.simpleMessage(
      "Tidak bisa memuat beranda Anda",
    ),
    "unable_to_load_subscription_groups": MessageLookupByLibrary.simpleMessage(
      "Tidak bisa memuat grup langganan",
    ),
    "unable_to_load_the_group": MessageLookupByLibrary.simpleMessage(
      "Tidak bisa memuat grup",
    ),
    "unable_to_load_the_group_settings": MessageLookupByLibrary.simpleMessage(
      "Tidak bisa memuat pengaturan grup",
    ),
    "unable_to_load_the_list_of_follows": MessageLookupByLibrary.simpleMessage(
      "Tidak bisa memuat daftar pengikut",
    ),
    "unable_to_load_the_next_page_of_follows":
        MessageLookupByLibrary.simpleMessage(
          "Tidak bisa memuat halaman pengikut selanjutnya",
        ),
    "unable_to_load_the_next_page_of_replies":
        MessageLookupByLibrary.simpleMessage(
          "Tidak bisa memuat halaman balasan selanjutnya",
        ),
    "unable_to_load_the_next_page_of_tweets":
        MessageLookupByLibrary.simpleMessage(
          "Tidak dapat memuat halaman cuitan selanjutnya",
        ),
    "unable_to_load_the_profile": MessageLookupByLibrary.simpleMessage(
      "Tidak bisa memuat profil",
    ),
    "unable_to_load_the_search_results": MessageLookupByLibrary.simpleMessage(
      "Tidak bisa memuat hasil pencarian.",
    ),
    "unable_to_load_the_trends_for_widget_place_name": m18,
    "unable_to_load_the_tweet": MessageLookupByLibrary.simpleMessage(
      "Tidak bisa memuat cuitan",
    ),
    "unable_to_load_the_tweets": MessageLookupByLibrary.simpleMessage(
      "Tidak bisa memuat cuitan",
    ),
    "unable_to_load_the_tweets_for_the_feed":
        MessageLookupByLibrary.simpleMessage(
          "Tidak bisa memuat cuitan untuk umpan",
        ),
    "unable_to_refresh_the_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Tidak bisa menyegarkan langganan",
    ),
    "unable_to_run_the_database_migrations":
        MessageLookupByLibrary.simpleMessage(
          "Tidak bisa menjalankan migrasi basis data",
        ),
    "unable_to_save_the_media_twitter_returned_a_status_of_response_statusCode":
        m19,
    "unable_to_stream_the_trend_location_preference":
        MessageLookupByLibrary.simpleMessage(
          "Tidak bisa mengalirkan preferensi lokasi tren",
        ),
    "unknown": MessageLookupByLibrary.simpleMessage("Tidak diketahui"),
    "unsave": MessageLookupByLibrary.simpleMessage("Batal simpan"),
    "unsubscribe": MessageLookupByLibrary.simpleMessage("Batal langganan"),
    "unsupported_url": MessageLookupByLibrary.simpleMessage(
      "URL tidak didukung",
    ),
    "update_to_release_version_through_your_fdroid_client": m20,
    "updates": MessageLookupByLibrary.simpleMessage("Pembaruan"),
    "use_true_black_for_the_dark_mode_theme":
        MessageLookupByLibrary.simpleMessage(
          "Gunakan hitam pekat untuk tema mode gelap",
        ),
    "user_not_found": MessageLookupByLibrary.simpleMessage(
      "Pengguna tidak ditemukan",
    ),
    "username": MessageLookupByLibrary.simpleMessage("Nama pengguna"),
    "version": MessageLookupByLibrary.simpleMessage("Versi"),
    "when_a_new_app_update_is_available": MessageLookupByLibrary.simpleMessage(
      "Ketika pembaruan aplikasi baru tersedia",
    ),
    "whether_errors_should_be_reported_to_":
        MessageLookupByLibrary.simpleMessage(
          "Apakah galat harus dilaporkan ke ",
        ),
    "whether_to_hide_tweets_marked_as_sensitive":
        MessageLookupByLibrary.simpleMessage(
          "Untuk menyembunyikan cuitan yang ditandai sebagai sensitif",
        ),
    "which_tab_is_shown_when_the_app_opens":
        MessageLookupByLibrary.simpleMessage(
          "Bilah mana yang ditampilkan ketika aplikasi dibuka",
        ),
    "would_you_like_to_enable_automatic_error_reporting":
        MessageLookupByLibrary.simpleMessage(
          "Apakah Anda ingin mengaktifkan pelaporan galat otomatis?",
        ),
    "yes": MessageLookupByLibrary.simpleMessage("Ya"),
    "yes_please": MessageLookupByLibrary.simpleMessage("Ya, silakan"),
    "you_have_not_saved_any_tweets_yet": MessageLookupByLibrary.simpleMessage(
      "Anda belum menyimpan cuitan apa pun!",
    ),
    "you_must_have_at_least_2_home_screen_pages":
        MessageLookupByLibrary.simpleMessage(
          "Anda harus paling tidak memiliki dua halaman beranda",
        ),
    "your_profile_must_be_public_otherwise_the_import_will_not_work":
        MessageLookupByLibrary.simpleMessage(
          "Profil Anda harus publik, jika tidak impor tidak akan bekerja",
        ),
    "your_report_will_be_sent_to_fritter__project":
        MessageLookupByLibrary.simpleMessage(
          "Laporan Anda akan dikirim ke proyek  Squawker, dan detail privasi bisa ditemukan pada:",
        ),
  };
}
