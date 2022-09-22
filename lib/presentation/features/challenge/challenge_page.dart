import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/challenge/controller/challenge_controller.dart';
import 'package:notesgram/presentation/features/challenge/widget/challenge_tile.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextNunito(
              text: 'Harian',
              size: 18,
              fontWeight: Weightenum.BOLD,
              color: Resources.color.neutral500,
            ),
            const SizedBox(height: 8),
            ChallengeTile(
              title: 'Hadiah 5.000 Koin',
              description: 'Kumpulkan like sebanyak 100',
              duration: '8 Jam',
              challengeIcon: Remix.heart_fill,
              challengeIconColor: Resources.color.stateNegative,
              totalProgress: 100,
              currentProgress: 46,
              onClaimTap: () {
                controller.showSnackbar('Kode voucher berhasil disalin');
              },
              onTermsAndConditionTap: () {},
            ),
            const SizedBox(height: 24),
            TextNunito(
              text: 'Mingguan',
              size: 18,
              fontWeight: Weightenum.BOLD,
              color: Resources.color.neutral500,
            ),
            const SizedBox(height: 8),
            ChallengeTile(
              title: 'Hadiah 15.000 Koin',
              description: 'Ajak 3 teman kamu bergabung',
              duration: '3 Hari',
              challengeIcon: Remix.group_fill,
              challengeIconColor: Resources.color.statePositive,
              totalProgress: 3,
              currentProgress: 3,
              onClaimTap: () {},
              onTermsAndConditionTap: () {},
            ),
            const SizedBox(height: 24),
            TextNunito(
              text: 'Bulanan',
              size: 18,
              fontWeight: Weightenum.BOLD,
              color: Resources.color.neutral500,
            ),
            const SizedBox(height: 8),
            ChallengeTile(
              title: 'Hadiah 30.000 Koin',
              description: 'Capai 200 total penjualan',
              duration: '16 Hari',
              challengeIcon: Remix.coins_fill,
              challengeIconColor: Resources.color.stateWarning,
              totalProgress: 200,
              currentProgress: 80,
              onClaimTap: () {},
              onTermsAndConditionTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
