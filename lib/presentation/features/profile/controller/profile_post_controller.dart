import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/model/note/note_model.dart';
import 'package:notesgram/data/sources/remote/base/base_list_controller.dart';
import 'package:notesgram/data/sources/remote/errorhandler/error_handler.dart';
import 'package:notesgram/data/sources/remote/services/api/api_services.dart';
import 'package:notesgram/presentation/features/profile/controller/profile_controller.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class ProfilePostController extends BaseListController<NoteModel> {
  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    getProfilePosts();
  }

  void goToDetail({required String username, required String noteId}) {
    Get.toNamed(PageName.post + '/$username/$noteId');
  }

  Future<void> getProfilePosts() async {
    loadingState();
    await client().then((value) {
      final profileController = Get.find<ProfileController>();
      value
          .fetchUserNote(userId: "${profileController.mData?.id}")
          .validateStatus()
          .then((data) {
        setFinishCallbacks(data.data ?? []);
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
