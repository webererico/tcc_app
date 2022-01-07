import 'package:inri/constants/keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _prefs;
  static Future init() async => _prefs = await SharedPreferences.getInstance();

  // static Future<int> get userId async => _prefs.getInt(USER_ID_KEY) ?? -1;
  // static Future<String> get accessToken async => _prefs.getString(ACCESS_TOKEN_KEY) ?? '';
  // static Future<int> get platform async => _prefs.getInt(PLATFORM_KEY) ?? 1;
  static Future<bool> get saveCredentials async => _prefs.getBool(CREDENTIAL_KEY) ?? false;
  // static Future<String> get login async => _prefs.getString(LOGIN_KEY) ?? '';
  static Future<String> get password async => _prefs.getString(PASSWORD_KEY) ?? '';

  // static setUserId(int value) async => await _prefs.setInt(USER_ID_KEY, value);
  // static setAccessToken(String value) async => await _prefs.setString(ACCESS_TOKEN_KEY, value);
  // static setPlatform(int value) async => await _prefs.setInt(PLATFORM_KEY, value);
  static setSaveCredentials(bool value) async => await _prefs.setBool(CREDENTIAL_KEY, value);
  static setLogin(String value) async => await _prefs.setString(LOGIN_KEY, value);
  static setPassword(String value) async => await _prefs.setString(PASSWORD_KEY, value);

  static Future get removeLogin async => _prefs.remove(LOGIN_KEY);
  static Future get removePassword async => _prefs.remove(PASSWORD_KEY);
  static Future get removeSaveCredentials async => _prefs.remove(CREDENTIAL_KEY);
  // static Future get isAuthenticated async => (await accessToken).isNotEmpty;

  static Future<bool> setBool(String key, bool value) async => _prefs.setBool(key, value);
  static Future<bool> setDouble(String key, double value) async => _prefs.setDouble(key, value);
  static Future<bool> setInt(String key, int value) async => _prefs.setInt(key, value);
  static Future<bool> setString(String key, String value) async => _prefs.setString(key, value);
  static Future<bool> setStringList(String key, List<String> value) async => _prefs.setStringList(key, value);
  static bool? getBool(String key) => _prefs.getBool(key);
  static double? getDouble(String key) => _prefs.getDouble(key);
  static int? getInt(String key) => _prefs.getInt(key);
  static String? getString(String key) => _prefs.getString(key);
  static List<String>? getStringList(String key) => _prefs.getStringList(key);
  static Future<bool>? remove(String key) async => _prefs.remove(key);
  static Future<bool>? clear() async => _prefs.clear();
}