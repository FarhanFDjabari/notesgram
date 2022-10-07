import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/model/user/user_model.dart';
import 'package:notesgram/data/sources/local/storage/storage_constants.dart';
import 'package:notesgram/data/sources/local/storage/storage_manager.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class HomeTopUpController extends BaseObjectController<UserModel> {
  final RxString totalCoin = "0".obs;

  void goToTopUp() {
    Get.toNamed(PageName.topUp);
  }

  Future<void> getCurrentUserData() async {
    loadingState();
    try {
      final userData =
          UserModel.fromJson(StorageManager().get(StorageName.USERS));

      totalCoin('${userData.coins}');

      setFinishCallbacks(userData);
    } catch (e) {
      debugPrint(e.toString());
      finishLoadData(errorMessage: e.toString());
    }
  }
}
