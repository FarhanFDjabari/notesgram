import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/presentation/features/profile/widget/add_album_dialog.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class ProfileController extends BaseObjectController {
  final RxString albumNameArgument = "".obs;
  final albumNameController = TextEditingController();

  void getAlbumName() {
    albumNameArgument(Get.arguments as String);
  }

  void goToAlbum({
    required String type,
    required String username,
    required String albumId,
    required String albumName,
  }) {
    Get.toNamed(
      PageName.profile + '/$username/$type/$albumId',
      arguments: albumName,
    );
  }

  void goToDetail({required String username, required String noteId}) {
    Get.toNamed(PageName.post + '/$username/$noteId');
  }

  void goToTopUp() {
    Get.toNamed(PageName.topUp);
  }

  void goToView({required String username, required String noteId}) {
    Get.toNamed(PageName.post + '/$username/$noteId/view');
  }

  void goToWithdraw() {
    Get.toNamed(PageName.withdraw);
  }

  void showAddAlbumDialog() {
    Get.dialog(
      AddAlbumDialog(
        controller: albumNameController,
        isLoading: isLoading,
        onCancel: () {
          goBack();
        },
        onSuccess: () {
          goBack();
          albumNameController.clear();
        },
      ),
    );
  }

  void goBack() {
    Get.back();
  }

  void createNewAlbum() {}
}
