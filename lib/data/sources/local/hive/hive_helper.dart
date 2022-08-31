import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper<T> {
  var box = Hive.box('db');

  void saveObject(String key, T data) {
    box.put(key, data);
  }

  void saveList(String key, List<T> data) {
    box.put(key, data);
  }

  List<T>? getList(String key) {
    List<T> myList = box.get('key', defaultValue: <T>[]).cast<T>();
    return myList;
  }
}
