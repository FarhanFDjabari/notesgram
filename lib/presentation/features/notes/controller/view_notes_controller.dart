import 'package:get/get.dart';
import 'package:notesgram/data/model/note/note_model.dart';
import 'package:notesgram/data/model/post/post_model.dart';
import 'package:notesgram/data/sources/local/storage/storage_constants.dart';
import 'package:notesgram/data/sources/local/storage/storage_manager.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';

class ViewNotesController extends BaseObjectController<PostModel> {
  final RxInt imageIndex = 0.obs;
  final RxInt photoViewIndex = 0.obs;
  final RxBool fromPostDetail = false.obs;

  @override
  void onInit() {
    if (Get.arguments['post'] != null) {
      final noteData = Get.arguments['post'] as PostModel?;
      setFinishCallbacks(noteData);
    } else {
      fromPostDetail(true);
      final noteData = Get.arguments['note'] as NoteModel?;
      setFinishCallbacks(PostModel(
        note: noteData,
      ));
    }
    super.onInit();
  }

  void goToPreview({required String noteId}) {
    Get.toNamed('/preview/$noteId');
  }

  void goBack() {
    Get.back();
  }

  bool isCurrentUserData() {
    final userData = StorageManager().get(StorageName.USERS);
    if (fromPostDetail.isTrue) {
      if (mData?.note?.post?.userId == userData['id']) return true;
    } else {
      if (mData?.userId == userData['id']) return true;
    }
    return false;
  }
}
