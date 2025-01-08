import 'package:shared_preferences/shared_preferences.dart';

class StorageKeys {
  static const String loggedIn = "LOGGED_IN";
}

class StorageHelper {
  static late SharedPreferences _prefs;

  Future<dynamic> _getInstance() async =>
      _prefs = await SharedPreferences.getInstance();

  Future<String?> get(String key) async {
    await _getInstance();
    return _prefs.getString(key);
  }

  Future<bool?> getBool(String key) async {
    await _getInstance();
    return _prefs.getBool(key);
  }

  void set(String key, dynamic value) async {
    await _getInstance();
    _prefs.setString(key, value);
  }

  void setBool(String key, dynamic value) async {
    await _getInstance();
    _prefs.setBool(key, value);
  }

  void remove(String key) async {
    await _getInstance();
    _prefs.remove(key);
  }

  void clear() async {
    await _getInstance();
    _prefs.clear();
  }
}
