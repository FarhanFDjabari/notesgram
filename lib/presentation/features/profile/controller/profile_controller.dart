import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/model/user/user_model.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/data/sources/remote/errorhandler/error_handler.dart';
import 'package:notesgram/data/sources/remote/services/api/api_services.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class ProfileController extends BaseObjectController<UserModel> {
  void goToTopUp() {
    Get.toNamed(PageName.topUp);
  }

  void goToWithdraw() {
    Get.toNamed(PageName.withdraw);
  }

  Future<void> getProfile() async {
    loadingState();
    await client()
        .then((value) => value.fetchMyProfile().validateStatus().then(
              (data) {
                setFinishCallbacks(data.result);
              },
            ))
        .handleError((onError) {
      debugPrint(onError.toString());
      finishLoadData(errorMessage: onError.toString());
    });
  }
}
