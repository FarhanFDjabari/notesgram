import 'package:get/get.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class NavigationController extends BaseObjectController {
  final RxInt pageIndex = 0.obs;
  final RxInt badgeNumber = 0.obs;

  void goToPost() {
    Get.toNamed(PageName.post);
  }
}
