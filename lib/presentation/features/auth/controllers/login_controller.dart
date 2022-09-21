import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class LoginController extends BaseObjectController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isPasswordObscured = true.obs;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {}

  Future<void> goToRegister() async {
    await Get.toNamed(PageName.signUp);
  }

  Future<void> goToHome() async {
    await Get.offNamed(PageName.navigation);
  }

  Future<void> goToResetPassword() async {
    await Get.toNamed(PageName.forgotPassword);
  }
}
