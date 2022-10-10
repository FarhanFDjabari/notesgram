import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/model/note/note_model.dart';
import 'package:notesgram/data/sources/remote/base/base_list_controller.dart';
import 'package:notesgram/data/sources/remote/errorhandler/error_handler.dart';
import 'package:notesgram/data/sources/remote/services/api/api_services.dart';
import 'package:notesgram/presentation/features/profile/controller/another_user_profile_controller.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class AnotherUserPostController extends BaseListController<NoteModel> {
  int? userId;

  @override
  void onInit() {
    userId = Get.find<AnotherUserProfileController>().userId;
    refreshPage();
    super.onInit();
  }

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    getProfilePosts(userId: userId ?? 0);
  }

  void goToDetail({required String noteId}) {
    Get.toNamed(PageName.post + '/${Get.parameters['username']}/$noteId');
  }

  Future<void> getProfilePosts({required int userId}) async {
    loadingState();
    await client().then((value) {
      value.fetchUserNote(userId: userId).validateStatus().then((data) {
        setFinishCallbacks(data.data ?? []);
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
