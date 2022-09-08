import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/sources/remote/base/base_list_controller.dart';

class ExploreController extends BaseListController {
  final keywordController = TextEditingController();
  final RxBool isSearching = false.obs;

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    // TODO: implement refreshPage
  }
}
