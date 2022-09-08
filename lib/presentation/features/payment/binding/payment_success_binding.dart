import 'package:get/get.dart';
import 'package:notesgram/presentation/features/payment/controller/payment_success_controller.dart';

class PaymentSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentSuccessController>(() => PaymentSuccessController());
  }
}
