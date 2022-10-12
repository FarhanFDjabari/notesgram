import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/model/note/note_model.dart';
import 'package:notesgram/data/model/note_folder/bookmarked_notes_folder_model.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/data/sources/remote/errorhandler/error_handler.dart';
import 'package:notesgram/data/sources/remote/services/api/api_services.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class BookmarkAlbumController
    extends BaseObjectController<BookmarkedNotesFolderModel> {
  final RxString albumNameArgument = "".obs;

  @override
  void onInit() {
    albumNameArgument(Get.arguments['album_name'] as String);
    if (Get.arguments['album_name'] == 'Semua') {
      setFinishCallbacks(Get.arguments['album'] as BookmarkedNotesFolderModel);
    } else {
      getBookmarkAlbumDetail(
          albumId: int.tryParse('${Get.parameters['albumId']}') ?? 0);
    }
    super.onInit();
  }

  void goBack() {
    Get.back();
  }

  void goToView(
      {required String username, required String noteId, NoteModel? note}) {
    if (note?.isPurchased == true) {
      Get.toNamed(PageName.post + '/$username/$noteId/view', arguments: {
        'note': note,
      });
    } else {
      Get.toNamed(PageName.post + '/$username/$noteId');
    }
  }

  Future<void> getBookmarkAlbumDetail({required int albumId}) async {
    loadingState();
    await client().then((value) {
      value
          .fetchBookmarkedNotesFolderDetail(folderId: albumId)
          .validateStatus()
          .then((data) {
        setFinishCallbacks(data.result);
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}