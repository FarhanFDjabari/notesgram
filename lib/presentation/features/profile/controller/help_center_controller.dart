import 'package:get/get.dart';
import 'package:notesgram/data/model/user/user_model.dart';
import 'package:notesgram/data/sources/local/storage/storage_constants.dart';
import 'package:notesgram/data/sources/local/storage/storage_manager.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';

class HelpCenterController extends BaseObjectController<UserModel> {
  @override
  void onInit() {
    final userData =
        UserModel.fromJson(StorageManager().get(StorageName.USERS));
    setFinishCallbacks(userData);
    super.onInit();
  }

  void goBack() {
    Get.back();
  }
}
