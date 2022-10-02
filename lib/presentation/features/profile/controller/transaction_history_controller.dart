import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/model/user/transaction_model.dart';
import 'package:notesgram/data/sources/remote/base/base_list_controller.dart';
import 'package:notesgram/data/sources/remote/errorhandler/error_handler.dart';
import 'package:notesgram/data/sources/remote/services/api/api_services.dart';

class TransactionHistoryController
    extends BaseListController<TransactionModel> {
  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    getAllTransactionHistory();
  }

  Future<void> getAllTransactionHistory() async {
    loadingState();
    await client()
        .then(
      (value) => value.fetchTransactionHistory().validateStatus().then((data) {
        setFinishCallbacks(data.data ?? []);
      }),
    )
        .handleError((onError) {
      debugPrint("On Error $onError");
      finishLoadData(errorMessage: onError.toString());
    });
  }

  void goBack() {
    Get.back();
  }
}
