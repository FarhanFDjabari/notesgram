import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/model/note_folder/bookmarked_notes_folder_model.dart';
import 'package:notesgram/data/sources/remote/base/base_list_controller.dart';
import 'package:notesgram/data/sources/remote/errorhandler/error_handler.dart';
import 'package:notesgram/data/sources/remote/services/api/api_services.dart';
import 'package:notesgram/presentation/features/profile/widget/add_album_dialog.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class ProfileBookmarkController
    extends BaseListController<BookmarkedNotesFolderModel> {
  final RxString albumNameArgument = "".obs;
  final albumNameController = TextEditingController();

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    getBookmarkedNotes();
  }

  void getAlbumName() {
    albumNameArgument(Get.arguments as String);
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

  Future<void> getBookmarkedNotes() async {
    loadingState();
    await client().then((value) {
      value.fetchBookmarkedNotesFolder().validateStatus().then((data) {
        setFinishCallbacks(data.data ?? []);
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
