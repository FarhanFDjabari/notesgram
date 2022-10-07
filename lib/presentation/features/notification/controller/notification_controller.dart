import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/model/notification/notification_model.dart';
import 'package:notesgram/data/sources/remote/base/base_list_controller.dart';
import 'package:notesgram/data/sources/remote/errorhandler/error_handler.dart';
import 'package:notesgram/data/sources/remote/services/api/api_services.dart';
import 'package:notesgram/presentation/features/navigation/controller/navigation_controller.dart';

class NotificationController extends BaseListController<NotificationModel> {
  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    getAllNotification();
  }

  Future<void> getAllNotification() async {
    loadingState();
    await client().then((value) {
      value.fetchAllNotifications().validateStatus().then((data) {
        final navigationController = Get.find<NavigationController>();

        final notificationUnreadCount =
            data.data?.where((element) => element.isRead == false).length;

        navigationController.badgeNumber(notificationUnreadCount);

        setFinishCallbacks(data.data ?? []);
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }

  Future<void> markAsRead({required String notificationId}) async {
    loadingState();
    await client().then((value) {
      value
          .markNotificationAsRead(notificationId: notificationId)
          .validateStatus()
          .then((data) {
        final navigationController = Get.find<NavigationController>();

        final notificationUnreadCount =
            dataList.where((element) => element.isRead == false).length;

        navigationController.badgeNumber(notificationUnreadCount);

        finishLoadData();
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
