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

  void goToSelectPayment() {
    Get.toNamed(PageName.selectPayment);
  }

  void goToDetail({required String username, required String noteId}) {
    Get.toNamed(PageName.post + '/$username/$noteId');
  }
}
