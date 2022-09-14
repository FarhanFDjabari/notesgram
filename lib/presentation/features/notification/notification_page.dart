import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/notification/controller/notification_controller.dart';
import 'package:notesgram/presentation/features/notification/widget/notification_tile.dart';
import 'package:notesgram/presentation/widgets/state_handle_widget.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:remixicon/remixicon.dart';
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Remix.menu_line,
              color: Resources.color.neutral50,
            ),
            iconSize: 20,
          ),
        ],
      ),
      body: GetBuilder<NotificationController>(
        builder: (_) {
          return StateHandleWidget(
            body: SmartRefresher(
              enablePullDown: true,
              enablePullUp: controller.hasNext,
              controller: controller.refreshController,
              onLoading: controller.loadNextPage,
              header: MaterialClassicHeader(
                color: Resources.color.indigo700,
              ),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return NotificationTile(
                    title: 'Notifikasi Keamanan',
                    content:
                        'Kami menemukan adanya login baru ke akun Anda di perangkat lain. Jika ini memang Anda, Anda tidak perlu melakukan apa-apa. Jika bukan, kami akan membantu untuk mengamankan akun Anda.',
                    date: '31-08-2022 08:18',
                    onTap: () {},
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 2,
                    color: Resources.color.neutral100,
                  );
                },
                itemCount: 1,
              ),
            ),
          );
        },
      ),
    );
  }
}
