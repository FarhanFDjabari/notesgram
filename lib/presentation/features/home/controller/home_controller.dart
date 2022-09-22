import 'package:get/get.dart';
import 'package:notesgram/data/sources/remote/base/base_list_controller.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class HomeController extends BaseListController {
  final RxString totalCoin = "0".obs;

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    // TODO: implement refreshPage
  }

  void goToPaymentInfo() {
    Get.toNamed(PageName.payment + '/info/0');
  }

  void goToTopUp() {
    Get.toNamed(PageName.topUp);
  }

  void goToDetail({
    required String username,
    required String noteId,
    dynamic arguments,
  }) {
    Get.toNamed(PageName.post + '/$username/$noteId', arguments: arguments);
  }
}
