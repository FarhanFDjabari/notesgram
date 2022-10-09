import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/model/challenge/challenge_item_model.dart';
import 'package:notesgram/data/sources/remote/base/base_list_controller.dart';
import 'package:notesgram/data/sources/remote/errorhandler/error_handler.dart';
import 'package:notesgram/data/sources/remote/services/api/api_services.dart';
import 'package:notesgram/presentation/widgets/notesgram_snackbar.dart';

class ChallengeController extends BaseListController<ChallengeItemModel> {
  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    getAllChallenge();
  }

  void goBack() {
    Get.back(closeOverlays: true);
  }

  void showSnackbar(String message) {
    Get.showSnackbar(
      NotesgramSnackbar(
        snackbarMessage: 'Kode voucher berhasil disalin',
      ),
    );
  }

  Future<void> getAllChallenge() async {
    loadingState();
    await client().then((value) {
      value.fetchAllChallenge().validateStatus().then((data) {
        dataList.clear();
        setFinishCallbacks(data.data ?? []);
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
