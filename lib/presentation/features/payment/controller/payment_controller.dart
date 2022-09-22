import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class PaymentController extends BaseObjectController {
  final promoCodeController = TextEditingController();
  final topUpAmountController = TextEditingController();
  final withdrawAmountController = TextEditingController();
  final recipientNumberController = TextEditingController();

  void goBack() {
    Get.back(closeOverlays: true);
  }

  void goToTopUp() {
    Get.toNamed(PageName.topUp);
  }

  void goToProcessingPayment() {
    Get.offNamed(PageName.paymentProcessing);
  }

  void processPayment() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(PageName.paymentSuccess);
    });
  }
}
