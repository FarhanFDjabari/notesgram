import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';

class CreateUsernameController extends BaseObjectController {
  final usernameController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  Future<void> createUsername({required String username}) async {}

  void goBack() {
    Get.back();
  }
}
