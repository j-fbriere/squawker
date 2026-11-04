import 'package:intl/intl.dart';

const englishLanguageCode = 'en';

/// Check if the locale supports fallback to English
///
/// Only these app locales can use English data when framework/intl data is missing
bool allowsEnglishFallback(String languageCode) => const {'eo', 'ia'}.contains(languageCode);

String _formatLocale(String requested, bool Function(String) localeExists) {
  final name = Intl.canonicalizedLocale(requested);
  final language = Intl.shortLocale(name);

  // The fallback does not occur for supported locales
  if (!allowsEnglishFallback(language) || localeExists(name) || localeExists(language)) {
    return requested;
  }
  return englishLanguageCode;
}

String dateLocaleFor(String requested) => _formatLocale(requested, DateFormat.localeExists);

String numberLocaleFor(String requested) => _formatLocale(requested, NumberFormat.localeExists);
