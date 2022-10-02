import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/presentation/features/payment/widget/transaction_condition_dialog.dart';

class PaymentTopupController extends BaseObjectController {
  final topUpAmountController = TextEditingController();

  void goBack() {
    Get.back(closeOverlays: true);
  }

  void showTermsDialog({required title, required List<String> terms}) {
    Get.dialog(TransactionConditionDialog(
      title: title,
      terms: terms,
    ));
  }
}
