import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/model/user/user_model.dart';
import 'package:notesgram/data/sources/local/storage/storage_constants.dart';
import 'package:notesgram/data/sources/local/storage/storage_manager.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/presentation/features/payment/widget/transaction_condition_dialog.dart';

class PaymentWithdrawController extends BaseObjectController {
  final withdrawAmountController = TextEditingController();
  final recipientNumberController = TextEditingController();
  final RxString coins = '0'.obs;

  @override
  void onInit() {
    final localUserData =
        UserModel.fromJson(StorageManager().get(StorageName.USERS));
    coins(localUserData.coins.toString());
    super.onInit();
  }

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
