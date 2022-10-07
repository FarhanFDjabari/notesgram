import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/model/user/user_model.dart';
import 'package:notesgram/data/sources/local/storage/storage_constants.dart';
import 'package:notesgram/data/sources/local/storage/storage_manager.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/data/sources/remote/errorhandler/error_handler.dart';
import 'package:notesgram/data/sources/remote/services/api/api_services.dart';
import 'package:notesgram/utils/helpers/secure_storage_manager.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class ProfileController extends BaseObjectController<UserModel> {
  void goToTopUp() {
    Get.toNamed(PageName.topUp);
  }

  void goToWithdraw() {
    Get.toNamed(PageName.withdraw);
  }

  void goToLogin() {
    Get.offAllNamed(PageName.login);
  }

  Future<void> getProfile() async {
    loadingState();
    final userId = StorageManager().get(StorageName.USERS)['id'];
    await client().then((value) =>
        value.fetchUserProfile(userId: userId.toString()).validateStatus().then(
          (data) {
            print(data.result);
            setFinishCallbacks(data.result);
          },
        ).handleError((onError) {
          debugPrint(onError.toString());
          finishLoadData(errorMessage: onError.toString());
        }));
  }

  Future<void> logout() async {
    try {
      await SecureStorageManager().setToken(value: null);
      goToLogin();
    } catch (e) {
      debugPrint(e.toString());
      finishLoadData(errorMessage: e.toString());
    }
  }
}
