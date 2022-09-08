import 'package:get/get.dart';
import 'package:notesgram/presentation/features/post_notesgram/controller/post_notesgram_controller.dart';

class PostNotesgramBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostNotesgramController());
  }
}
