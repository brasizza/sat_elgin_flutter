abstract class LocalStorage {
  Future<LocalStorage> init();
  T getData<T>(String key);
  Future<void> setData<T>(String key, T value);
  bool hasData(String key);
  Future<void> removeData(String key);
  Future<void> clearStorage();
  void listenKey(String key, {required Function action});
}
