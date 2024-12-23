import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorageKey {
  const LocalStorageKey._();
  static const languageCode = 'languageCode';
}

abstract class LocalStorage {
  Future<void> init();

  Locale get locale;

  set locale(Locale locale);
}

class LocalStorageImpl implements LocalStorage {
  late GetStorage _storage;

  LocalStorageImpl() {
    _storage = GetStorage('test');
  }

  @override
  init() async {
    await _storage.initStorage;
  }

  @override
  Locale get locale {
    String languageCode = _storage.read(LocalStorageKey.languageCode) ?? 'vi';
    return Locale(languageCode);
  }

  @override
  set locale(Locale locale) {
    _storage.write(LocalStorageKey.languageCode, locale.languageCode);
  }
}

// class LocalStorageImpl implements LocalStorage {
//   late final Map<String, dynamic> _storage;

//   LocalStorageImpl();

//   @override
//   Future<void> init() async {
//     _storage = {}; // hoặc lấy từ lưu trữ nếu cần
//     // Simulate async storage initialization
//     await Future.delayed(Duration(milliseconds: 100));
//   }

//   @override
//   Locale get locale {
//     final languageCode = _storage['languageCode'] ?? 'vi';
//     return Locale(languageCode);
//   }

//   @override
//   set locale(Locale locale) {
//     _storage['languageCode'] = locale.languageCode;
//   }
// }
