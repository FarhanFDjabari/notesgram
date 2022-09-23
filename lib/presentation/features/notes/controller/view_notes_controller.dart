import 'package:get/get.dart';
import 'package:notesgram/data/sources/remote/base/base_list_controller.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class ViewNotesController extends BaseListController {
  final RxInt imageIndex = 0.obs;

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
