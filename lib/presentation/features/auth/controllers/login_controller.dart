import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/model/auth/login_info_model.dart';
import 'package:notesgram/data/sources/local/storage/storage_constants.dart';
import 'package:notesgram/data/sources/local/storage/storage_manager.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/data/sources/remote/errorhandler/error_handler.dart';
import 'package:notesgram/data/sources/remote/services/api/api_services.dart';
import 'package:notesgram/utils/helpers/secure_storage_manager.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class LoginController extends BaseObjectController<LoginInfoModel> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isPasswordObscured = true.obs;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Future<void> loginWithGoogle() async {
  //   loadingState();
  //   try {
  //     final loginRequest = await GoogleSignIn().signIn();

  //     final userCredential = await loginRequest?.authentication;

  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: userCredential?.accessToken,
  //       idToken: userCredential?.idToken,
  //     );

  //     await FirebaseAuth.instance.signInWithCredential(credential);

  //     await SecureStorageManager().setToken(value: userCredential?.idToken);

  //     await client().then((value) {
  //       value.login(emailOrUsername: us).validateStatus().then((data) {
  //         StorageManager().write(StorageName.USERS, data.result);
  //         setFinishCallbacks(data.result);
  //         if (data.result?.username?.isNotEmpty == true) {
  //           goToHome();
  //         } else {
  //           goToCreateUsername();
  //         }
  //       });
  //     }).handleError((onError) {
  //       debugPrint(onError.toString());
  //       finishLoadData(errorMessage: onError.toString());
  //     });
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     finishLoadData(errorMessage: e.toString());
  //   }
  // }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    loadingState();
    final fcmToken = await SecureStorageManager().getDeviceToken();

    await client().then((value) {
      value
          .login(
            emailOrUsername: username,
            password: password,
            fcmToken: fcmToken,
          )
          .validateStatus()
          .then((data) async {
        await SecureStorageManager().setToken(value: data.result?.token);
        StorageManager()
            .write(StorageName.USERS, data.result?.userData?.toJson());
        setFinishCallbacks(data.result);
        if (data.result?.userData?.username?.isNotEmpty == true) {
          goToHome();
        } else {
          goToCreateUsername();
        }
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }

  Future<void> goToRegister() async {
    await Get.toNamed(PageName.signUp);
  }

  Future<void> goToCreateUsername() async {
    await Get.toNamed(PageName.createUsername);
  }

  Future<void> goToHome() async {
    await Get.offNamed(PageName.navigation);
  }

  Future<void> goToResetPassword() async {
    await Get.toNamed(PageName.forgotPassword);
  }
}
