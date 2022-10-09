import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/challenge/controller/challenge_controller.dart';
import 'package:notesgram/presentation/features/challenge/widget/challenge_tile.dart';
import 'package:notesgram/presentation/widgets/loading_overlay.dart';
import 'package:notesgram/presentation/widgets/state_handle_widget.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/theme/resources/gen/assets.gen.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class ChallengePage extends GetView<ChallengeController> {
  const ChallengePage({Key? key}) : super(key: key);

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
          text: 'Tantangan',
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
      body: StateHandleWidget(
        shimmerView: LoadingOverlay(),
        loadingEnabled: controller.isLoading,
        onRetryPressed: () {
          // controller.getDashboard("", "");
        },
        errorEnabled: controller.isError,
        errorText: 'txt_error_general'.tr,
        emptyTitle: 'txt_challenge_empty_title'.tr,
        emptySubtitle: 'txt_challenge_empty_description'.tr,
        emptyImage: AssetImage(
          Assets.lib.theme.resources.images.appLogoMonochrome.path,
        ),
        emptyEnabled: controller.isEmptyData,
        body: GetBuilder<ChallengeController>(
          init: ChallengeController(),
          initState: (_) {
            controller.getAllChallenge();
          },
          builder: (_) {
            final dailyChallenge = controller.dataList
                .where((element) => element.period == "DAILY")
                .toList();
            final weeklyChallenge = controller.dataList
                .where((element) => element.period == "WEEKLY")
                .toList();
            final monthlyChallenge = controller.dataList
                .where((element) => element.period == "MONTHLY")
                .toList();
            return SmartRefresher(
              enablePullDown: true,
              enablePullUp: false,
              controller: controller.refreshController,
              onRefresh: controller.refreshPage,
              onLoading: controller.loadNextPage,
              header: MaterialClassicHeader(
                color: Resources.color.indigo700,
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (dailyChallenge.isNotEmpty)
                      TextNunito(
                        text: 'Harian',
                        size: 18,
                        fontWeight: Weightenum.BOLD,
                        color: Resources.color.neutral500,
                      ),
                    if (dailyChallenge.isNotEmpty) const SizedBox(height: 8),
                    ListView.separated(
                      itemCount: dailyChallenge.length,
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        return ChallengeTile(
                          title: '${dailyChallenge[index].title}',
                          description: '${dailyChallenge[index].description}',
                          duration: '8 Jam',
                          challengeIcon: Remix.heart_fill,
                          challengeIconColor: Resources.color.stateNegative,
                          totalProgress: dailyChallenge[index].count ?? 0,
                          currentProgress:
                              dailyChallenge[index].currentProgress ?? 0,
                          onClaimTap: () {
                            controller
                                .showSnackbar('Kode voucher berhasil disalin');
                          },
                          onTermsAndConditionTap: () {},
                        );
                      },
                      separatorBuilder: (_, __) {
                        return const SizedBox(width: 5);
                      },
                    ),
                    if (dailyChallenge.isNotEmpty) const SizedBox(height: 24),
                    if (weeklyChallenge.isNotEmpty)
                      TextNunito(
                        text: 'Mingguan',
                        size: 18,
                        fontWeight: Weightenum.BOLD,
                        color: Resources.color.neutral500,
                      ),
                    if (weeklyChallenge.isNotEmpty) const SizedBox(height: 8),
                    ListView.separated(
                      itemCount: weeklyChallenge.length,
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        return ChallengeTile(
                          title: '${dailyChallenge[index].title}',
                          description: '${dailyChallenge[index].description}',
                          duration: '3 Hari',
                          challengeIcon: Remix.group_fill,
                          challengeIconColor: Resources.color.statePositive,
                          totalProgress: dailyChallenge[index].count ?? 0,
                          currentProgress:
                              dailyChallenge[index].currentProgress ?? 0,
                          onClaimTap: () {
                            controller
                                .showSnackbar('Kode voucher berhasil disalin');
                          },
                          onTermsAndConditionTap: () {},
                        );
                      },
                      separatorBuilder: (_, __) {
                        return const SizedBox(width: 5);
                      },
                    ),
                    if (weeklyChallenge.isNotEmpty) const SizedBox(height: 24),
                    if (monthlyChallenge.isNotEmpty)
                      TextNunito(
                        text: 'Bulanan',
                        size: 18,
                        fontWeight: Weightenum.BOLD,
                        color: Resources.color.neutral500,
                      ),
                    if (monthlyChallenge.isNotEmpty) const SizedBox(height: 8),
                    ListView.separated(
                      itemCount: dailyChallenge.length,
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        return ChallengeTile(
                          title: '${dailyChallenge[index].title}',
                          description: '${dailyChallenge[index].description}',
                          duration: '16 Hari',
                          challengeIcon: Remix.coins_fill,
                          challengeIconColor: Resources.color.stateWarning,
                          totalProgress: dailyChallenge[index].count ?? 0,
                          currentProgress:
                              dailyChallenge[index].currentProgress ?? 0,
                          onClaimTap: () {
                            controller
                                .showSnackbar('Kode voucher berhasil disalin');
                          },
                          onTermsAndConditionTap: () {},
                        );
                      },
                      separatorBuilder: (_, __) {
                        return const SizedBox(width: 5);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
