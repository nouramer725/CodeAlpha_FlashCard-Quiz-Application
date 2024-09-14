import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider with ChangeNotifier {
  static const _key = 'locale';
  Locale _locale = Locale('en');

  LocaleProvider() {
    _loadLocale();
  }

  Locale get locale => _locale;

  void setLocale(Locale locale) async {
    _locale = locale;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, locale.languageCode);
    notifyListeners();
  }

  Future<void> _loadLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString(_key);
    if (languageCode != null) {
      _locale = Locale(languageCode);
    }
    notifyListeners();
  }
}
