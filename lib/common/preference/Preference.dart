import 'package:get_storage/get_storage.dart';

/**
 * Copyright (C), 2015-2021, suntront
 * FileName: Preference
 * Author: Jeek
 * Date: 2021/4/9
 * Description:
 */
class Preference {
  static GetStorage? _getStorage;

  static Future<bool> init() {
    return GetStorage.init("flutter_gionchat");
  }


  static GetStorage? getInstance() {
    if (_getStorage == null) {
      _getStorage = GetStorage('flutter_gionchat');
    }
    return _getStorage;
  }


  static Future<void> write(String key, dynamic value) async {
    getInstance()?.write(key, value);
  }


  static T? read<T>(String key) {
    return getInstance()?.read(key);
  }

}