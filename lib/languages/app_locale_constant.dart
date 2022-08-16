import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
/*Chinnadurai Viswanathan*/

const String prefSelectedLanguageCode = 'SelectedLanguageCode';

Future<Locale> setLocale(String languageCode) async {
  final SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(prefSelectedLanguageCode, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  final SharedPreferences _prefs = await SharedPreferences.getInstance();
  final String languageCode =
      _prefs.getString(prefSelectedLanguageCode) ?? 'en';
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  return languageCode.isNotEmpty
      ? Locale(languageCode, '')
      : const Locale('en', '');
}

void changeLanguage(BuildContext context, String selectedLanguageCode) async {
  final _locale = await setLocale(selectedLanguageCode);
  // MyApp.setLocale(context, _locale);
}
