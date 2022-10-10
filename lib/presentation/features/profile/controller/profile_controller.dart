import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/model/user/user_model.dart';
import 'package:notesgram/data/sources/local/storage/storage_constants.dart';
import 'package:notesgram/data/sources/local/storage/storage_manager.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/data/sources/remote/errorhandler/error_handler.dart';
import 'package:notesgram/data/sources/remote/services/api/api_services.dart';
import 'package:notesgram/presentation/widgets/bottom_sheet/image_pick_bottomsheet.dart';
import 'package:notesgram/utils/helpers/secure_storage_manager.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class ProfileController extends BaseObjectController<UserModel> {
  void goToTopUp() {
    Get.toNamed(PageName.topUp);
  }

  void goToWithdraw() {
    Get.toNamed(PageName.withdraw);
  }

  void goToLogin() {
    Get.offAllNamed(PageName.login);
  }

  @override
  void onInit() async {
    await setInitialData();
    super.onInit();
  }

  Future<void> setInitialData() async {
    final localUserData =
        UserModel.fromJson(StorageManager().get(StorageName.USERS));
    if (localUserData.cCount?.followers == null) {
      getProfile(userId: StorageManager().get(StorageName.USERS)['id']);
    } else {
      setFinishCallbacks(localUserData);
    }
  }

  Future<void> getProfile({required int userId}) async {
    loadingState();
    await client().then(
        (value) => value.fetchUserProfile(userId: userId).validateStatus().then(
              (data) {
                StorageManager()
                    .write(StorageName.USERS, data.result?.userModel?.toJson());
                setFinishCallbacks(data.result?.userModel);
              },
            ).handleError((onError) {
              debugPrint(onError.toString());
              finishLoadData(errorMessage: onError.toString());
            }));
  }

  Future<void> editProfile({File? image}) async {
    loadingState();
    await client().then((value) {
      value
          .editProfile(
            file: image,
          )
          .validateStatus()
          .then((data) {
        var localUser = StorageManager().get(StorageName.USERS);
        localUser['avatar_url'] = data.result?.avatarUrl;
        StorageManager().write(StorageName.USERS, localUser);
        setFinishCallbacks(
            UserModel.fromJson(StorageManager().get(StorageName.USERS)));
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }

  void showPostBottomSheet() {
    Get.bottomSheet(
      ImagePickBottomSheet(
        multiFile: false,
        pickCallback: (image) {
          if (image != null) {
            editProfile(image: image);
          }
          Get.back();
        },
        pickCallbackMultiple: (_) {},
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
    );
  }

  Future<void> logout() async {
    loadingState();
    await client().then((value) {
      value.logout().validateStatus().then((data) async {
        await SecureStorageManager().setToken(value: null);
        StorageManager().write(StorageName.USERS, null);
        finishLoadData();
        goToLogin();
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
