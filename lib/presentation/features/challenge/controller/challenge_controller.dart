import 'package:get/get.dart';
import 'package:notesgram/data/sources/remote/base/base_list_controller.dart';
import 'package:notesgram/presentation/widgets/notesgram_snackbar.dart';

class ChallengeController extends BaseListController {
  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    // TODO: implement refreshPage
  }

  void goBack() {
    Get.back();
  }

  void showSnackbar(String message) {
    Get.showSnackbar(
      NotesgramSnackbar(
        message: 'Kode voucher berhasil disalin',
      ),
    );
  }
}
