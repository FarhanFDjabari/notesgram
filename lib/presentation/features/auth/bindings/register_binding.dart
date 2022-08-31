import 'package:get/get.dart';
import 'package:notesgram/presentation/features/auth/controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
