import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  final _prefs = EncryptedSharedPreferences();

  static const _keyCounter = 'counterEncrypted';

  int _count = 0;

  Future<String> readItem() async {
    var item = await _prefs.getString(_keyCounter);
    return item.isEmpty ? '0' : item;
  }

  Future<void> increment() async {
    _count++;
    await _prefs.setString(_keyCounter, _count.toString());
    _debugProvider();
    notifyListeners();
  }

  Future<void> decrement() async {
    _count > 0 ? _count-- : 0;
    await _prefs.setString(_keyCounter, _count.toString());
    _debugProvider();
    notifyListeners();
  }

  Future<void> removeAll() async {
    _count = 0;
    await _prefs.setString(_keyCounter, _count.toString());
    _debugProvider();
    notifyListeners();
  }

  void _debugProvider() {
    print('Count: $_count');
  }
}
