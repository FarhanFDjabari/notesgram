import 'package:get/get.dart';
import 'package:notesgram/presentation/features/notes/controller/view_notes_controller.dart';

class ViewNotesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewNotesController());
  }
}
