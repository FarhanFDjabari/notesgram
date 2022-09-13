import 'package:flutter/material.dart';
import 'package:notesgram/presentation/widgets/button/primary_button.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class PaymentTotalPriceTile extends StatelessWidget {
  const PaymentTotalPriceTile({
    Key? key,
    this.onSelectPaymentPressed,
  }) : super(key: key);

  final Function()? onSelectPaymentPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.sp,
      padding: const EdgeInsets.all(16),
      color: Resources.color.neutral50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextNunito(
                  text: 'Total Harga',
                  size: 12.sp,
                  fontWeight: Weightenum.BOLD,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Remix.coins_fill,
                      color: Resources.color.stateWarning,
                    ),
                    const SizedBox(width: 6),
                    TextNunito(
                      text: '10.000',
                      size: 15.sp,
                      fontWeight: Weightenum.BOLD,
                      color: Resources.color.stateWarning,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          PrimaryButton(
            width: 100.sp,
            height: 35.sp,
            label: 'BAYAR',
            fontSize: 12.sp,
            elevation: 0,
            onPressed: onSelectPaymentPressed,
          ),
        ],
      ),
    );
  }
}
