import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/model/user/user_model.dart';
import 'package:notesgram/data/sources/local/storage/storage_constants.dart';
import 'package:notesgram/data/sources/local/storage/storage_manager.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/data/sources/remote/errorhandler/error_handler.dart';
import 'package:notesgram/data/sources/remote/services/api/api_services.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class CreateUsernameController extends BaseObjectController<UserModel> {
  final usernameController = TextEditingController();
  RxBool isUsernameValid = false.obs;
  Timer? _debounce;

  @override
  void dispose() {
    usernameController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  Future<void> createUsername({required String username}) async {
    loadingState();
    await client().then(
      (value) {
        value
            .editProfile(
              username: username,
            )
            .validateStatus()
            .then((data) {
          StorageManager().write(StorageName.USERS, data.result?.toJson());
          setFinishCallbacks(data.result);
          goToHome();
        }).handleError((onError) {
          debugPrint(onError.toString());
          finishLoadData(errorMessage: onError.toString());
        });
      },
    );
  }

  Future<void> checkUsernameValidity() async {
    await client().then((value) {
      value
          .checkUsernameAvailable(username: usernameController.text)
          .validateStatus()
          .then((data) {
        isUsernameValid(data.result?.isAvailable);
        finishLoadData();
      }).handleError((onError) {
        debugPrint(onError.toString());
        isUsernameValid(false);
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }

  onUsernameChange(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 2), () {
      if (value.isNotEmpty) {
        checkUsernameValidity();
      }
    });
  }

  void goToHome() {
    Get.offAllNamed(PageName.navigation);
  }

  void goToLogin() {
    Get.offAllNamed(
      PageName.login,
      predicate: (route) => Get.currentRoute == PageName.login,
    );
  }

  void goBack() {
    Get.back();
  }
}
