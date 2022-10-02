import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/profile/controller/transaction_history_controller.dart';
import 'package:notesgram/presentation/features/profile/widget/transaction_history_tile.dart';
import 'package:notesgram/presentation/widgets/loading_overlay.dart';
import 'package:notesgram/presentation/widgets/state_handle_widget.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/theme/resources/gen/assets.gen.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:notesgram/utils/helpers/currency_formatter.dart';
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
          // controller.getAllTransactionHistory();
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
                      TextNunito(
                        text: '26 september 2022'.toUpperCase(),
                        size: 14,
                        fontWeight: Weightenum.REGULAR,
                        color: Resources.color.neutral500,
                      ),
                      const SizedBox(height: 8),
                      const TransactionHistoryTile(
                        claimedPrize: '10000',
                        icon: Remix.gift_line,
                        subtitle: 'Hadiah diklaim',
                        title: 'Berikan komentar sebanyak 3 kali',
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
