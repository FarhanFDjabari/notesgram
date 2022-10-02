import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/model/post/post_model.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class PaymentController extends BaseObjectController<PostModel> {
  final promoCodeController = TextEditingController();

  @override
  void onInit() {
    setFinishCallbacks(Get.arguments as PostModel?);
    super.onInit();
  }

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
