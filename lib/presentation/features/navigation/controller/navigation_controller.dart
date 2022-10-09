import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/presentation/features/notification/controller/notification_controller.dart';
import 'package:notesgram/presentation/widgets/bottom_sheet/image_pick_bottomsheet.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class NavigationController extends BaseObjectController {
  final RxInt pageIndex = 0.obs;
  final RxInt badgeNumber = 0.obs;

  @override
  void onReady() {
    Get.find<NotificationController>().getAllNotification();
    super.onReady();
  }

  void goToPost(List<File> images) {
    Get.toNamed(PageName.post, arguments: images);
  }

  void goToChallenge() {
    Get.toNamed(PageName.challenge);
  }

  void showPostBottomSheet() {
    Get.bottomSheet(
      ImagePickBottomSheet(
        multiFile: true,
        pickCallback: (image) {
          if (image != null) {
            Get.back();
            goToPost([image]);
          }
        },
        pickCallbackMultiple: (images) async {
          if (images != null) {
            Get.back();
            goToPost(images);
          }
        },
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
    );
  }
}
