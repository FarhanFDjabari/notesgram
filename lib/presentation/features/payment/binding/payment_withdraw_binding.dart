import 'package:get/get.dart';
import 'package:notesgram/presentation/features/payment/controller/payment_withdraw_controller.dart';

class PaymentWithdrawBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentWithdrawController());
  }
}
