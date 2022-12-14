import 'package:flutter/material.dart';
import 'package:notesgram/presentation/widgets/button/primary_button.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:notesgram/utils/helpers/currency_formatter.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class HomeTopUpTile extends StatelessWidget {
  const HomeTopUpTile({
    Key? key,
    this.onTopUpPressed,
    this.coinAmount,
    this.isLoading,
  }) : super(key: key);

  final Function()? onTopUpPressed;
  final String? coinAmount;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizerUtil.width,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: Resources.color.neutral300,
                    width: 1,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextNunito(
                    text: 'Koin Saya',
                    size: 12.sp,
                    fontWeight: Weightenum.REGULAR,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Remix.coins_fill,
                        color: Resources.color.stateWarning,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: TextNunito(
                          text: int.parse(coinAmount ?? '0') > 999
                              ? coinFormat.format(int.parse(coinAmount ?? '0'))
                              : coinAmount ?? '0',
                          size: 15.sp,
                          maxLines: 2,
                          fontWeight: Weightenum.BOLD,
                          color: Resources.color.stateWarning,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          PrimaryButton(
            width: 70.sp,
            height: 30.sp,
            label: 'TOP UP',
            fontSize: 12.sp,
            elevation: 0,
            isLoading: isLoading ?? false,
            onPressed: onTopUpPressed,
          ),
        ],
      ),
    );
  }
}
