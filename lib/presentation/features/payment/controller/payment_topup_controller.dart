import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/model/payment/top_up_response_model.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/data/sources/remote/errorhandler/error_handler.dart';
import 'package:notesgram/data/sources/remote/services/api/api_services.dart';
import 'package:notesgram/presentation/features/payment/payment_gateway_process_page.dart';
import 'package:notesgram/presentation/features/payment/widget/transaction_condition_dialog.dart';

class PaymentTopupController extends BaseObjectController<TopUpResponseModel> {
  final topUpAmountController = TextEditingController();

  void goBack() {
    Get.back(closeOverlays: true);
  }

  void goToPaymentGateway(String? initialUrl) {
    if (initialUrl != null) {
      Get.to(PaymentGatewayProcessPage(initialUrl: initialUrl));
    }
  }

  void showTermsDialog({required title, required List<String> terms}) {
    Get.dialog(TransactionConditionDialog(
      title: title,
      terms: terms,
    ));
  }

  Future<void> topUpCoin() async {
    loadingState();
    await client().then((value) {
      value
          .topUpCoins(
            amount: topUpAmountController.text,
          )
          .validateStatus()
          .then((data) {
        setFinishCallbacks(data.result);
        goToPaymentGateway(mData?.payment?.url);
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
