import 'package:get/get.dart';
import 'package:notesgram/data/model/post/post_model.dart';
import 'package:notesgram/data/sources/local/storage/storage_constants.dart';
import 'package:notesgram/data/sources/local/storage/storage_manager.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/presentation/features/navigation/controller/navigation_controller.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class HomeController extends BaseObjectController<PostModel> {
  final RxInt tabIndex = 1.obs;

  void goToPaymentInfo({required String noteId, required PostModel? note}) {
    Get.toNamed(PageName.payment + '/info/$noteId', arguments: note);
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

  void goToDetail({
    required String username,
    required String postId,
    dynamic arguments,
  }) {
    Get.toNamed(PageName.post + '/$username/$postId', arguments: arguments);
  }

  void changeToCurrentUserProfile() {
    Get.find<NavigationController>().pageIndex(4);
  }

  void goToAnotherUserProfile({required int userId}) {
    Get.toNamed(PageName.profile, arguments: {'another_user_id': userId});
  }

  bool isCurrentUserData(PostModel? data) {
    final userData = StorageManager().get(StorageName.USERS);
    if (data?.userId == userData['id']) return true;
    return false;
  }
}
