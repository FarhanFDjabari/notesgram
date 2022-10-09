import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/payment/widget/note_subtotal_info.dart';
import 'package:notesgram/presentation/features/profile/controller/transaction_history_controller.dart';
import 'package:notesgram/presentation/features/profile/widget/transaction_history_tile.dart';
import 'package:notesgram/presentation/widgets/loading_overlay.dart';
import 'package:notesgram/presentation/widgets/state_handle_widget.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/theme/resources/gen/assets.gen.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:notesgram/utils/helpers/date_time_extension.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class TransactionHistoryPage extends GetView<TransactionHistoryController> {
  const TransactionHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Resources.color.neutral100,
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
          text: 'Riwayat Transaksi',
          size: 15.sp,
          fontWeight: Weightenum.BOLD,
          color: Resources.color.neutral50,
        ),
        leading: IconButton(
          onPressed: () {
            controller.goBack();
          },
          icon: Icon(
            Remix.arrow_left_s_line,
            color: Resources.color.neutral50,
          ),
          iconSize: 28,
        ),
      ),
      body: GetBuilder<TransactionHistoryController>(
        init: TransactionHistoryController(),
        initState: (_) {
          controller.getAllTransactionHistory();
        },
        builder: (_) {
          return StateHandleWidget(
            shimmerView: LoadingOverlay(),
            loadingEnabled: controller.isLoading,
            onRetryPressed: () {
              // controller.getDashboard("", "");
            },
            errorEnabled: controller.isError,
            errorText: 'txt_error_general'.tr,
            emptyTitle: 'txt_transaction_empty_title'.tr,
            emptySubtitle: 'txt_transaction_empty_description'.tr,
            emptyImage: AssetImage(
              Assets.lib.theme.resources.images.appLogoMonochrome.path,
            ),
            body: SmartRefresher(
              controller: controller.refreshController,
              enablePullDown: true,
              enablePullUp: false,
              onRefresh: controller.refreshPage,
              onLoading: controller.loadNextPage,
              header: MaterialClassicHeader(
                color: Resources.color.indigo700,
              ),
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 16,
                ),
                itemBuilder: (builderContext, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (index == 0)
                        TextNunito(
                          text: DateTimeExtension(DateTime.parse(
                                  '${controller.dataList[index].info?.createdAt}'))
                              .dayFullMonthYear
                              .toUpperCase(),
                          size: 14,
                          fontWeight: Weightenum.REGULAR,
                          color: Resources.color.neutral500,
                        ),
                      if (index > 0 &&
                          DateTime.parse(
                                      '${controller.dataList[index].info?.createdAt}')
                                  .difference(DateTime.parse(
                                      '${controller.dataList[index - 1].info?.createdAt}'))
                                  .inDays >
                              0)
                        TextNunito(
                          text: DateTimeExtension(DateTime.parse(
                                  '${controller.dataList[index].info?.createdAt}'))
                              .dayFullMonthYear
                              .toUpperCase(),
                          size: 14,
                          fontWeight: Weightenum.REGULAR,
                          color: Resources.color.neutral500,
                        ),
                      if (index > 0 &&
                          DateTime.parse(
                                      '${controller.dataList[index].info?.createdAt}')
                                  .difference(DateTime.parse(
                                      '${controller.dataList[index - 1].info?.createdAt}'))
                                  .inDays >
                              0)
                        const SizedBox(height: 8),
                      if (controller.dataList[index].category ==
                              'NOTE_PURCHASED' ||
                          controller.dataList[index].category == 'NOTE_SOLD')
                        NoteSubtotalInfo(
                          noteTitle:
                              controller.dataList[index].info?.note?.title,
                          notePrice: controller
                              .dataList[index].info?.note?.price
                              .toString(),
                          isTransaction: true,
                          postUser: controller
                              .dataList[index].info?.note?.post?.user?.name,
                          postUsername: controller
                              .dataList[index].info?.note?.post?.user?.username,
                          noteImageUrl: controller.dataList[index].info?.note
                              ?.notePictures?.first.pictureUrl,
                          userProfileUrl: controller.dataList[index].info?.note
                              ?.post?.user?.avatarUrl,
                        )
                      else
                        TransactionHistoryTile(
                          claimedPrize: controller.dataList[index].category ==
                                      'TOPUP' ||
                                  controller.dataList[index].category ==
                                      'WITHDRAW'
                              ? '${controller.dataList[index].info?.amount}'
                              : '${controller.dataList[index].info?.challenge?.reward}',
                          icon: controller.dataList[index].category == 'TOPUP'
                              ? Remix.add_line
                              : controller.dataList[index].category ==
                                      'WITHDRAW'
                                  ? Remix.hand_coin_line
                                  : Remix.gift_line,
                          subtitle:
                              controller.dataList[index].category == 'TOPUP'
                                  ? 'Top Up'
                                  : controller.dataList[index].category ==
                                          'WITHDRAW'
                                      ? 'Penarikan'
                                      : 'Hadiah diklaim',
                          title: controller.dataList[index].category ==
                                      'TOPUP' ||
                                  controller.dataList[index].category ==
                                      'WITHDRAW'
                              ? controller.dataList[index].info?.paymentMethod
                              : '${controller.dataList[index].info?.challenge?.title}',
                          category: controller.dataList[index].category,
                        ),
                    ],
                  );
                },
                separatorBuilder: (_, index) {
                  return Container(
                    height: 16,
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
