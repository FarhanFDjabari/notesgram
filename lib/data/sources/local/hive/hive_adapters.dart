import 'package:hive/hive.dart';
import 'package:notesgram/data/model/user/user_count_model.dart';
import 'package:notesgram/data/model/user/user_model.dart';

class HiveAdapters {
  void registerAdapter() {
    Hive.registerAdapter<UserModel>(UserModelAdapter());
    Hive.registerAdapter<UserCountModel>(UserCountModelAdapter());
  }
}
