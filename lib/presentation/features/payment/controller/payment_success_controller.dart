import 'package:get/get.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class PaymentSuccessController extends BaseObjectController {
  void goToHome() {
    Get.back(closeOverlays: true);
    Get.back();
  }
}
