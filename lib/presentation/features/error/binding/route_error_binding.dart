import 'package:get/get.dart';
import 'package:notesgram/presentation/features/error/controller/route_error_controller.dart';

class RouteErrorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RouteErrorController());
  }
}
