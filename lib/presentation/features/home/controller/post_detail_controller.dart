import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/model/note/note_model.dart';
import 'package:notesgram/data/model/post/post_model.dart';
import 'package:notesgram/data/sources/local/storage/storage_constants.dart';
import 'package:notesgram/data/sources/local/storage/storage_manager.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/data/sources/remote/errorhandler/error_handler.dart';
import 'package:notesgram/data/sources/remote/services/api/api_services.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class PostDetailController extends BaseObjectController<NoteModel> {
  final RxString appBarTitle = "".obs;
  final RxBool isAutoScrollComment = false.obs;

  @override
  void onInit() async {
    appBarTitle(Get.parameters['username']);
    await getNoteById(noteId: Get.parameters['noteId'].toString());
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

  Future<void> sendComment(
      {required int postId, required String comment}) async {
    loadingState();
    await client().then((value) {
      value
          .createComment(
            postId: postId,
            comment: comment,
          )
          .validateStatus()
          .then((data) {
        if (data.result != null) {
          mData?.post?.comments?.insert(0, data.result!);
        }
        finishLoadData();
      }).handleError((onError) {
        debugPrint("On Error $onError");
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }

  void goToPreviewNote({
    required String username,
    required String noteId,
    NoteModel? note,
  }) {
    Get.toNamed(PageName.post + '/$username/$noteId/view', arguments: {
      'note': note,
    });
  }

  void goToPaymentInfo({required String noteId, required PostModel? note}) {
    Get.toNamed(PageName.payment + '/info/$noteId', arguments: note);
  }

  void goBack() {
    Get.back();
  }

  bool isCurrentUserData(PostModel? data) {
    final userData = StorageManager().get(StorageName.USERS);
    if (data?.userId == userData['id']) return true;
    return false;
  }

  String getCurrentUserAvatar() {
    final userData = StorageManager().get(StorageName.USERS);
    return userData['avatar_url'];
  }
}
