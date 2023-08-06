import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static Preferences? _instance;
  SharedPreferences _client;

  static Preferences get instance {
    if (_instance == null) {
      throw StateError("Config not initialized, call #create first.");
    }
    return _instance!;
  }

  factory Preferences.create(SharedPreferences client) {
    if (_instance != null) {
      debugPrint("Preferences already initialized");
      return _instance!;
    }

    _instance = Preferences(client);
    return _instance!;
  }

  Preferences(SharedPreferences client) : _client = client;

  String? getString(key) {
    return _client.getString(key);
  }

  void setString(key, value) {
    _client.setString(key, value);
  }

  bool? getBool(key){
    return _client.getBool(key);
  }

  void setBool(key,value){
    _client.setBool(key, value);
  }

  void removeString(key){
    _client.remove(key);
  }
}
