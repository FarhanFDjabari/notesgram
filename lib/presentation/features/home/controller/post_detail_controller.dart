import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/model/note/note_model.dart';
import 'package:notesgram/data/model/post/post_model.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/data/sources/remote/errorhandler/error_handler.dart';
import 'package:notesgram/data/sources/remote/services/api/api_services.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class PostDetailController extends BaseObjectController<NoteModel> {
  final RxString appBarTitle = "".obs;
  final RxBool isAutoScrollComment = false.obs;

  @override
  void onInit() {
    appBarTitle(Get.parameters['username']);
    isAutoScrollComment(Get.arguments as bool?);
    super.onInit();
  }

  Future<void> getNoteById({required String noteId}) async {
    loadingState();
    await client().then(
      (value) =>
          value.fetchNoteById(noteId: noteId).validateStatus().then((data) {
        setFinishCallbacks(data.result);
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError);
      }),
    );
  }

  void goToPreviewNote({
    required String username,
    required String noteId,
    PostModel? note,
  }) {
    Get.toNamed(PageName.post + '/$username/$noteId/view', arguments: note);
  }

  void goBack() {
    Get.back();
  }
}
