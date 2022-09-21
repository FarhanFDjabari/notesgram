import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/sources/remote/base/base_list_controller.dart';

class PostDetailController extends BaseListController {
  final RxString appBarTitle = "".obs;
  final commentController = TextEditingController();
  final RxBool isFieldNotEmpty = false.obs;

  @override
  void onInit() {
    appBarTitle(Get.parameters['username']);
    super.onInit();
  }

  void checkField() {
    isFieldNotEmpty(commentController.text.isNotEmpty);
  }

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    // TODO: implement refreshPage
  }

  void goBack() {
    Get.back();
  }
}
