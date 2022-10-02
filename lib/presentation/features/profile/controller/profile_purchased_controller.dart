import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/model/post/post_model.dart';
import 'package:notesgram/data/sources/remote/base/base_list_controller.dart';
import 'package:notesgram/presentation/features/profile/widget/add_album_dialog.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class ProfilePurchasedController extends BaseListController<PostModel> {
  final RxString albumNameArgument = "".obs;
  final albumNameController = TextEditingController();

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    // TODO: implement refreshPage
  }

  void getAlbumName() {
    albumNameArgument(Get.arguments as String);
  }

  void goToDetail({required String username, required String noteId}) {
    Get.toNamed(PageName.post + '/$username/$noteId');
  }

  void goToView({required String username, required String noteId}) {
    Get.toNamed(PageName.post + '/$username/$noteId/view');
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
