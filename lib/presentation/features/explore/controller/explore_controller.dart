import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/model/explore/explore_post_model.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/data/sources/remote/errorhandler/error_handler.dart';
import 'package:notesgram/data/sources/remote/services/api/api_services.dart';

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

  void goToExploreDetail({required String type}) {
    if (type == 'users') {
    } else {}
  }
}
