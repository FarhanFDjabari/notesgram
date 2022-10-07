import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/model/user/user_model.dart';
import 'package:notesgram/data/sources/local/storage/storage_constants.dart';
import 'package:notesgram/data/sources/local/storage/storage_manager.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/data/sources/remote/errorhandler/error_handler.dart';
import 'package:notesgram/data/sources/remote/services/api/api_services.dart';
import 'package:notesgram/presentation/widgets/notesgram_snackbar.dart';
import 'package:notesgram/utils/helpers/secure_storage_manager.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class RegisterController extends BaseObjectController<UserModel> {
  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isPasswordObscured = true.obs;
  RxBool isUserAgree = false.obs;
  RxBool isReadTerms = false.obs;
  RxBool isReadPolicy = false.obs;

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    loadingState();

    // final fcmToken = await SecureStorageManager().getDeviceToken();

    // await SecureStorageManager().setToken(value: userToken);

    await client().then(
      (value) {
        value
            .register(
              name: name,
              email: email,
              password: password,
            )
            .validateStatus()
            .then((data) async {
          StorageManager().write(StorageName.USERS, data.result?.toJson());
          setFinishCallbacks(data.result);
          goToLogin();
          Get.showSnackbar(NotesgramSnackbar(snackbarMessage: data.message));
        }).handleError((onError) {
          debugPrint(onError.toString());
          finishLoadData(errorMessage: onError.toString());
        });
      },
    );
  }

  Future<void> goToLogin() async {
    Get.back();
  }

  Future<void> goToCreateUsername() async {
    Get.offNamed(PageName.createUsername);
  }

  Future<void> goToTermsAndRequirements() async {}
}
