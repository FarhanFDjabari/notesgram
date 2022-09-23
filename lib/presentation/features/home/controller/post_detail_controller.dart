import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/sources/remote/base/base_list_controller.dart';

class PostDetailController extends BaseListController {
  final RxString appBarTitle = "".obs;
  final RxBool isAutoScrollComment = false.obs;

  @override
  void onInit() {
    appBarTitle(Get.parameters['username']);
    isAutoScrollComment(Get.arguments as bool?);
    super.onInit();
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
