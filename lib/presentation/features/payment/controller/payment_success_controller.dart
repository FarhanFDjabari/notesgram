import 'package:get/get.dart';
import 'package:notesgram/data/model/post/post_model.dart';
import 'package:notesgram/data/sources/local/storage/storage_constants.dart';
import 'package:notesgram/data/sources/local/storage/storage_manager.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/presentation/features/profile/controller/profile_controller.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class PaymentSuccessController extends BaseObjectController<PostModel> {
  @override
  void onInit() async {
    initPaymentSuccess();
    super.onInit();
  }

  int getCurrentCoins() {
    final localUserDataCoins =
        StorageManager().get(StorageName.USERS)['coins'] as int;
    return localUserDataCoins;
  }

  Future<void> updateProfileData() async {
    final profileController = Get.find<ProfileController>();
    await profileController.getProfile(
        userId: StorageManager().get(StorageName.USERS)['id']);
  }

  void initPaymentSuccess() async {
    loadingState();
    await updateProfileData().then((value) {
      setFinishCallbacks(Get.arguments as PostModel?);
    });
  }

  void goToHome() {
    Get.back(closeOverlays: true);
    Get.back();
  }

  void goToPreviewNote({
    required String username,
    required String noteId,
    PostModel? note,
  }) {
    Get.toNamed(PageName.post + '/$username/$noteId/view', arguments: {
      'post': note,
    });
  }
}
