import 'package:get/get.dart';
import 'package:notesgram/data/model/post/post_model.dart';
import 'package:notesgram/data/sources/local/storage/storage_constants.dart';
import 'package:notesgram/data/sources/local/storage/storage_manager.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';

class PaymentSuccessController extends BaseObjectController<PostModel> {
  @override
  void onInit() {
    setFinishCallbacks(Get.arguments as PostModel?);
    super.onInit();
  }

  int getCurrentCoins() {
    final localUserDataCoins =
        StorageManager().get(StorageName.USERS)['coins'] as int;
    return localUserDataCoins - (mData?.note?.price ?? 0);
  }

  void goToHome() {
    Get.back(closeOverlays: true);
    Get.back();
  }
}
