import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/model/payment/top_up_response_model.dart';
import 'package:notesgram/data/model/user/user_model.dart';
import 'package:notesgram/data/sources/local/storage/storage_constants.dart';
import 'package:notesgram/data/sources/local/storage/storage_manager.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/data/sources/remote/errorhandler/error_handler.dart';
import 'package:notesgram/data/sources/remote/services/api/api_services.dart';
import 'package:notesgram/presentation/features/notification/controller/notification_controller.dart';
import 'package:notesgram/presentation/features/payment/payment_gateway_process_page.dart';
import 'package:notesgram/presentation/features/payment/widget/transaction_condition_dialog.dart';
import 'package:notesgram/presentation/features/profile/controller/profile_controller.dart';

class PaymentTopupController extends BaseObjectController<TopUpResponseModel> {
  final topUpAmountController = TextEditingController();
  final RxString coins = '0'.obs;

  @override
  void onInit() {
    final localUserData =
        UserModel.fromJson(StorageManager().get(StorageName.USERS));
    coins(localUserData.coins.toString());
    paymentNotificationListener();
    super.onInit();
  }

  void paymentNotificationListener() {
    FirebaseMessaging.onMessage.listen((message) async {
      if (message.notification?.body?.contains('berhasil') == true) {
        goBack();
        loadingState();
        final profileController = Get.find<ProfileController>();
        final notificationController = Get.find<NotificationController>();
        await profileController.getProfile(
            userId: StorageManager().get(StorageName.USERS)['id']);
        await notificationController.getAllNotification().then((value) {
          coins(StorageManager().get(StorageName.USERS)['coins'].toString());
          finishLoadData();
        });
      }
    });
  }

  void goBack() {
    Get.back(closeOverlays: true);
  }

  void goToPaymentGateway(String? initialUrl) {
    if (initialUrl != null) {
      Get.to(() => PaymentGatewayProcessPage(initialUrl: initialUrl));
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
            amount: int.tryParse(topUpAmountController.text),
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
