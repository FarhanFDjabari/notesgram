import 'package:get/get.dart';
import 'package:notesgram/data/model/note/note_model.dart';
import 'package:notesgram/data/model/post/post_model.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class ViewNotesController extends BaseObjectController<PostModel> {
  final RxInt imageIndex = 0.obs;

  @override
  void onInit() {
    final noteData = Get.arguments as PostModel?;
    setFinishCallbacks(noteData);
    super.onInit();
  }

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    // TODO: implement refreshPage
  }

  void goToPreview({required String noteId}) {
    Get.toNamed('/preview/$noteId');
  }

  void goBack() {
    Get.back();
  }
}
