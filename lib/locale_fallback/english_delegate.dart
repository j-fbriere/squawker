import 'package:flutter/widgets.dart';
import 'package:squawker/locale_fallback/english.dart';

class EnglishFallbackDelegate<T> extends LocalizationsDelegate<T> {
  const EnglishFallbackDelegate(this.delegate);

  final LocalizationsDelegate<T> delegate;
  static const _english = Locale(englishLanguageCode);

  @override
  bool isSupported(Locale locale) => delegate.isSupported(locale) || allowsEnglishFallback(locale.languageCode);

  @override
  Future<T> load(Locale locale) {
    if (!isSupported(locale)) {
      throw UnsupportedError('Unsupported locale: $locale');
    }

    final resourceLocale = delegate.isSupported(locale) ? locale : _english;
    return delegate.load(resourceLocale);
  }

  @override
  bool shouldReload(covariant EnglishFallbackDelegate<T> old) =>
      delegate != old.delegate || delegate.shouldReload(old.delegate);
}
