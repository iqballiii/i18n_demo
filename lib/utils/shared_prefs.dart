import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static const String DARKTHEME = "dark_theme";
  static const String LANGUAGE = "language";

  static late SharedPreferences _prefs;
  static Map<String, dynamic> memoryPrefs = <String, dynamic>{};

  Future<SharedPreferences> load() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  static void setString(String key, String value) {
    _prefs.setString(key, value);
    memoryPrefs[key] = value;
  }

  static void setInt(String key, int value) {
    _prefs.setInt(key, value);
    memoryPrefs[key] = value;
  }

  static void setDouble(String key, double value) {
    _prefs.setDouble(key, value);
    memoryPrefs[key] = value;
  }

  static void setBool(String key, bool value) {
    _prefs.setBool(key, value);
    memoryPrefs[key] = value;
  }

  static String getString(String key, {String def = 'en'}) {
    return _prefs.getString(key) ?? def;
  }

  static int getInt(String key, {int def = 0}) {
    return _prefs.getInt(key) ?? def;
  }

  static double getDouble(String key, {double def = 0}) {
    return _prefs.getDouble(key) ?? def;
  }

  static bool getBool(String key, {bool def = false}) {
    return _prefs.getBool(key) ?? def;
  }

  static bool isDark() {
    return getBool(DARKTHEME, def: false);
  }

  static void clear() {
    _prefs.clear();
  }
}
