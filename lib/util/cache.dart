class AppGenericCache {
  AppGenericCache();

  static AppGenericCache? _instance;
  final Map _cache = {};

  static AppGenericCache get instance {
    if (_instance == null) {
      throw StateError("Cache not initialized, call #create first.");
    }
    return _instance!;
  }

  factory AppGenericCache.create() {
    _instance = AppGenericCache._internal();
    return _instance!;
  }

  AppGenericCache._internal();

  bool exists(String key) {
    return _cache.containsKey(key);
  }

  putInCache(String key, dynamic value) {
    _cache[key] = value;
  }

  getFromCache(String key) {
    return _cache[key];
  }

  removeFromCache(String key) {
    _cache.remove(key);
  }
}
