import 'package:shared_preferences/shared_preferences.dart';

import './local_storage.dart';

class LocalSharedPrefs extends LocalStorage {
  static LocalSharedPrefs? _instance;
  static SharedPreferences? prefs;

  // Avoid self isntance
  LocalSharedPrefs._();
  static LocalSharedPrefs get instance {
    _instance ??= LocalSharedPrefs._();
    return _instance!;
  }

  @override
  Future<void> clearStorage() async {
    await prefs?.clear();
  }

  @override
  T getData<T>(String key) {
    return prefs?.get(key) as T;
  }

  @override
  bool hasData(String key) {
    return prefs?.containsKey(key) ?? false;
  }

  @override
  Future<LocalStorage> init() async {
    prefs ??= await SharedPreferences.getInstance();
    return this;
  }

  @override
  void listenKey(String key, {required Function action}) {
    throw UnimplementedError();
  }

  @override
  Future<void> removeData(String key) async {
    prefs?.remove(key);
  }

  @override
  Future<void> setData<T>(String key, T value) async {
    prefs?.setString(key, value as String);
  }
}
