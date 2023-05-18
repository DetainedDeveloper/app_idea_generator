//ignore: unused_import
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? _sharedPreferences;

  static final PrefUtils? _instance = PrefUtils._internal();

  factory PrefUtils() {
    return _instance!;
  }

  PrefUtils._internal();

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  static Future<void> setOpenAIToken(String token) async {
    _sharedPreferences!.setString('openai_token', token);
  }

  static Future<String?> getOpenAIToken() async {
    return _sharedPreferences!.getString('openai_token');
  }

  static Future<void> deleteOpenAIToken() async {
    _sharedPreferences!.remove('openai_token');
  }
}
