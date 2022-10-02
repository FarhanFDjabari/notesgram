import 'package:get/get.dart';
import 'package:notesgram/presentation/features/profile/controller/help_center_controller.dart';

class HelpCenterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HelpCenterController());
  }
}
