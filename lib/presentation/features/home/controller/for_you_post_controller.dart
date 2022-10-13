import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/model/post/post_model.dart';
import 'package:notesgram/data/sources/remote/base/base_list_controller.dart';
import 'package:notesgram/data/sources/remote/errorhandler/error_handler.dart';
import 'package:notesgram/data/sources/remote/services/api/api_services.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class ForYouPostController extends BaseListController<PostModel> {
  final RxInt tabIndex = 0.obs;

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    getForYouPosts();
  }

  void goToPaymentInfo({required String noteId, required PostModel? note}) {
    Get.toNamed(PageName.payment + '/info/$noteId', arguments: note);
  }

  void goToDetail({
    required String username,
    required String postId,
    dynamic arguments,
  }) {
    Get.toNamed(PageName.post + '/$username/$postId', arguments: arguments);
  }

  Future<void> getForYouPosts() async {
    loadingState();
    await client()
        .then((value) => value.fetchAllPosts().validateStatus().then((data) {
              dataList.clear();
              setFinishCallbacks(data.data?.reversed.toList() ?? []);
            }).handleError((onError) {
              debugPrint("On Error $onError");
              finishLoadData(errorMessage: onError.toString());
            }));
  }

  Future<void> followUnfollowUser({required int userId}) async {
    loadingState();
    await client().then((value) {
      value.followUnfollowUser(userId: userId).validateStatus().then((data) {
        getForYouPosts();
      }).handleError((onError) {
        debugPrint("On Error $onError");
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }

  Future<void> savePostToBookmark({required int postId}) async {
    loadingState();
    await client().then((value) {
      value.bookmarkPost(postId: postId).validateStatus().then((data) {
        getForYouPosts();
      }).handleError((onError) {
        debugPrint("On Error $onError");
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }

  Future<void> likeUnlikePost({required int postId}) async {
    loadingState();
    await client().then((value) {
      value.likeDislikePost(postId: postId).validateStatus().then((data) {
        getForYouPosts();
      }).handleError((onError) {
        debugPrint("On Error $onError");
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
