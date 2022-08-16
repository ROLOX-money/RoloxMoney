import 'package:flutter/material.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/languages/language_english.dart';
/*Chinnadurai Viswanathan*/

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        'en' /*, 'ar', 'hi'*/
      ].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return LanguageEn();
      /*  case 'ar':
        return LanguageAr();
      case 'hi':
        return LanguageHi();*/
      default:
        return LanguageEn();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;
}
