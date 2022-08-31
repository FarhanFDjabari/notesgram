import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class RegisterController extends BaseObjectController {
  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isPasswordObscured = true.obs;
  RxBool isUsernameValid = true.obs;
  RxBool isUserAgree = false.obs;

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> register({
    required String username,
    required String name,
    required String email,
    required String password,
  }) async {}

  Future<void> goToLogin() async {
    Get.back();
  }

  Future<void> goToCreateUsername() async {
    Get.toNamed(PageName.createUsername);
  }

  Future<void> goToTermsAndRequirements() async {}
}
