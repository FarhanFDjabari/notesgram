import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/notification/controller/notification_controller.dart';
import 'package:notesgram/presentation/features/notification/widget/notification_tile.dart';
import 'package:notesgram/presentation/widgets/loading_overlay.dart';
import 'package:notesgram/presentation/widgets/state_handle_widget.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/theme/resources/gen/assets.gen.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:notesgram/utils/helpers/date_time_extension.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:sizer/sizer.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: Resources.color.gradient600to800,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: TextNunito(
          text: 'Notifikasi',
          size: 15.sp,
          fontWeight: Weightenum.BOLD,
          color: Resources.color.neutral50,
        ),
      ),
      body: GetBuilder<NotificationController>(
        builder: (_) {
          return StateHandleWidget(
            shimmerView: LoadingOverlay(),
            loadingEnabled: controller.isLoading,
            onRetryPressed: () {
              // controller.getDashboard("", "");
            },
            errorEnabled: controller.isError,
            errorText: 'txt_error_general'.tr,
            emptyTitle: 'txt_note_empty_title'.tr,
            emptySubtitle: 'txt_note_empty_description'.tr,
            emptyImage: AssetImage(
              Assets.lib.theme.resources.images.appLogoMonochrome.path,
            ),
            emptyEnabled: controller.isEmptyData,
            body: SmartRefresher(
              enablePullDown: true,
              enablePullUp: controller.hasNext,
              controller: controller.refreshController,
              onLoading: controller.loadNextPage,
              onRefresh: controller.refreshPage,
              header: MaterialClassicHeader(
                color: Resources.color.indigo700,
              ),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return NotificationTile(
                    title: '${controller.dataList[index].title}',
                    content: '${controller.dataList[index].body}',
                    isRead: controller.dataList[index].isRead,
                    date: DateTimeExtension(DateTime.tryParse(
                                controller.dataList[index].createdAt ?? '0') ??
                            DateTime.now())
                        .dayMonthYearHourMinute,
                    onTap: () {
                      if (controller.dataList[index].isRead == false) {
                        controller.markAsRead(
                          notificationId:
                              controller.dataList[index].id.toString(),
                        );
                      }
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 2,
                    color: Resources.color.neutral100,
                  );
                },
                itemCount: controller.dataList.length,
              ),
            ),
          );
        },
      ),
    );
  }
}
