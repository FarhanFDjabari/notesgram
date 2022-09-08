import 'package:get/get.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';

class PostNotesgramController extends BaseObjectController {
  void goBack() {
    Get.back(closeOverlays: true);
  }
}
