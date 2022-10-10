import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/model/profile/profile_response_model.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/data/sources/remote/errorhandler/error_handler.dart';
import 'package:notesgram/data/sources/remote/services/api/api_services.dart';

class AnotherUserProfileController
    extends BaseObjectController<ProfileResponseModel> {
  int? userId;

  @override
  void onInit() async {
    userId = (Get.arguments as Map<String, dynamic>)['id'] as int;
    await getProfile(
        userId: (Get.arguments as Map<String, dynamic>)['id'] as int);
    super.onInit();
  }

  Future<void> getProfile({required int userId}) async {
    loadingState();
    await client().then(
        (value) => value.fetchUserProfile(userId: userId).validateStatus().then(
              (data) {
                setFinishCallbacks(data.result);
              },
            ).handleError((onError) {
              debugPrint(onError.toString());
              finishLoadData(errorMessage: onError.toString());
            }));
  }

  void goBack() {
    Get.back();
  }
}
