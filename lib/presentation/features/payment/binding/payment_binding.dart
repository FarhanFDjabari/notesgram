import 'package:get/get.dart';
import 'package:notesgram/presentation/features/payment/controller/payment_controller.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentController>(() => PaymentController());
  }
}
