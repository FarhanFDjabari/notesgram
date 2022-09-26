import 'package:get/get.dart';
import 'package:notesgram/presentation/features/profile/controller/transaction_history_controller.dart';

class TransactionHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransactionHistoryController());
  }
}
