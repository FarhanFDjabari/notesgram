import 'package:get/get.dart';
import 'package:notesgram/presentation/features/payment/controller/payment_topup_controller.dart';

class PaymentTopupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentTopupController());
  }
}
