import 'package:get/get.dart';
import 'package:notesgram/presentation/features/home/controller/post_detail_controller.dart';

class PostDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostDetailController());
  }
}
