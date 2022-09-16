import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';

class PostNotesgramController extends BaseObjectController {
  final titleController = TextEditingController();
  final captionController = TextEditingController();
  final priceController = TextEditingController();

  void goBack() {
    Get.back(closeOverlays: true);
  }
}
