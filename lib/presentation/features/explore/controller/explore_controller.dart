import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/model/explore/explore_post_model.dart';
import 'package:notesgram/data/model/user/user_model.dart';
import 'package:notesgram/data/sources/local/storage/storage_constants.dart';
import 'package:notesgram/data/sources/local/storage/storage_manager.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/data/sources/remote/errorhandler/error_handler.dart';
import 'package:notesgram/data/sources/remote/services/api/api_services.dart';
import 'package:notesgram/presentation/features/navigation/controller/navigation_controller.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class ExploreController extends BaseObjectController<ExplorePostModel> {
  final keywordController = TextEditingController();
  final RxBool isSearching = false.obs;
  Timer? _debounce;

  @override
  void dispose() {
    keywordController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  Future<void> searchPost() async {
    loadingState();
    await client().then((value) {
      value
          .explorePost(
            noteTitle: keywordController.text,
            authorName: keywordController.text,
            username: keywordController.text,
          )
          .validateStatus()
          .then((data) {
        setFinishCallbacks(data.result);
      }).handleError((onError) {
        isSearching(false);
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }

  onSearchChange(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 2), () {
      if (value.isNotEmpty) {
        searchPost();
      }
    });
  }

  void goToDetailNote({
    required String username,
    required String postId,
    dynamic arguments,
  }) {
    Get.toNamed(PageName.post + '/$username/$postId', arguments: arguments);
  }

  void goToAnotherUserProfile({required int userId}) {
    Get.toNamed(PageName.profile, arguments: {'another_user_id': userId});
  }

  void goToExploreDetail({required String type, UserModel? user, int? postId}) {
    if (type == 'users') {
      if (isCurrentUserData(user)) {
        Get.find<NavigationController>().pageIndex(4);
      } else {
        goToAnotherUserProfile(userId: user?.id ?? 0);
      }
    } else {
      goToDetailNote(username: 'Detail', postId: postId.toString());
    }
  }

  bool isCurrentUserData(UserModel? data) {
    final userData = StorageManager().get(StorageName.USERS);
    if (data?.id == userData['id']) return true;
    return false;
  }
}
