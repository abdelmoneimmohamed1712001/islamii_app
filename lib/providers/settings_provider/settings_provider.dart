import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  Locale locale = Locale("ar");

  void changeThemeMode(ThemeMode theme) {
    themeMode = theme;
    saveTheme(theme);
    notifyListeners();
  }

  void saveTheme(ThemeMode themeMode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (themeMode == ThemeMode.light) {
      await prefs.setString("theme", "light");
    } else {
      await prefs.setString("theme", "dark");
    }
  }

  void changeLanguage(String newLanguage) {
    if (locale == newLanguage) return;
    locale = Locale(newLanguage);
    saveLanguage(newLanguage);
    notifyListeners();
  }

  void saveLanguage(String lang) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("lang", lang);
  }

  void getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String theme = prefs.getString("theme") ?? "light";
    if (theme == "light") {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
    notifyListeners();
  }

  void getLang() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString("lang") ?? "ar";
    locale = Locale(lang);
    notifyListeners();
  }
}
