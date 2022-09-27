import 'package:get/get.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class HomeTopUpController extends BaseObjectController {
  final RxString totalCoin = "0".obs;

  void goToTopUp() {
    Get.toNamed(PageName.topUp);
  }
}
