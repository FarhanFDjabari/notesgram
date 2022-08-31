import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleHelper {
  final List<Map<String, dynamic>> locales = [
    {'name': 'English', 'locale': const Locale('en')},
    {'name': 'Indonesia', 'locale': const Locale('id')}
  ];

  final fallbackLocale = const Locale('en');

  updateLocale(BuildContext context, Locale locale, String name) {
    saveLanguagesToCache(name);
    Navigator.of(context).pop();
    Get.updateLocale(locale);
  }

  saveLanguagesToCache(String name) {
    if (name == "English") {
      // StorageManager().write(StorageName.CURRENT_LOCALE, "en");
    } else {
      // StorageManager().write(StorageName.CURRENT_LOCALE, "in");
    }
  }

  Locale getCurrentLocale() {
    var currentLocale;
    if (currentLocale != null) {
      if (currentLocale == "en") {
        return const Locale('en');
      } else {
        return const Locale('id');
      }
    } else {
      return const Locale('en');
    }
  }
}
