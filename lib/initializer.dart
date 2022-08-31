import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart' as Foundation;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class Initializer {
  static Future<void> init() async {
    try {
      _initScreenPreference();
      await globalLocalData();
      globalController();
    } catch (err) {
      rethrow;
    }
  }

  static globalController() {
    // var _sp = SharedPreferenceManager();
    // final firstOnboard = _sp.getIsFirstOnboarding();
    // if (firstOnboard) {
    //   Get.put<OnboardingController>(OnboardingController());
    // } else {
    //   Get.put<AuthController>(AuthController());
    // }
  }

  static globalLocalData() async {
    // Global Local Database
    // await Get.putAsync<GetStorage>(() async {
    //   return GetStorage(StorageName.STORAGE_NAME);
    // });
  }

  static Future<void> initHive() async {
    Directory dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);
    // HiveAdapters().registerAdapter();
    // await Hive.openBox<User>(HiveConstants.USERS_BOX);
  }

  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
