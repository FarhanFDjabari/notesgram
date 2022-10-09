import 'package:flutter/material.dart';
import 'package:notesgram/presentation/widgets/button/primary_button.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/theme/resources/gen/assets.gen.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:notesgram/utils/helpers/currency_formatter.dart';
import 'package:remixicon/remixicon.dart';

class ProfileCoinTile extends StatelessWidget {
  const ProfileCoinTile({
    this.onTopUp,
    this.onWithdraw,
    this.coins,
    Key? key,
  }) : super(key: key);

  final Function()? onTopUp;
  final Function()? onWithdraw;
  final String? coins;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Resources.color.indigo300,
        borderRadius: BorderRadius.circular(6),
        image: DecorationImage(
          image: AssetImage(
            Assets.lib.theme.resources.images.profileCoinLayoutBg.path,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextNunito(
              text: 'Koin Saya',
              size: 16,
              fontWeight: Weightenum.BOLD,
              color: Resources.color.neutral50,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Remix.coins_fill,
                  size: 24,
                  color: Resources.color.neutral50,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: TextNunito(
                    text: int.parse(coins ?? '0') > 999
                        ? coinFormat.format(int.parse(coins ?? '0'))
                        : coins ?? '0',
                    size: 24,
                    fontWeight: Weightenum.BOLD,
                    color: Resources.color.neutral50,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PrimaryButton(
                  elevation: 0,
                  onPressed: onWithdraw,
                  width: 124,
                  fontSize: 14,
                  height: 40,
                  label: 'PENARIKAN',
                  primaryColor: Resources.color.neutral50,
                  labelColor: Resources.color.indigo700,
                ),
                const SizedBox(width: 8),
                PrimaryButton(
                  elevation: 0,
                  onPressed: onTopUp,
                  width: 90,
                  fontSize: 14,
                  height: 40,
                  label: 'TOP UP',
                  primaryColor: Resources.color.neutral50,
                  labelColor: Resources.color.indigo700,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
