import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class PaymentSuccessCoupon extends StatelessWidget {
  const PaymentSuccessCoupon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: Resources.color.shadowColor.withOpacity(0.16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      color: Resources.color.neutral50,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(
              Remix.checkbox_circle_fill,
              color: Resources.color.statePositive,
              size: 67.sp,
            ),
            const SizedBox(height: 38),
            TextNunito(
              text: 'Transaksi Berhasil',
              size: 18,
              fontWeight: Weightenum.BOLD,
              color: Resources.color.statePositive,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Remix.coins_fill,
                  color: Resources.color.stateWarning,
                  size: 30,
                ),
                const SizedBox(width: 7),
                TextNunito(
                  text: '10.000',
                  size: 36,
                  fontWeight: Weightenum.BOLD,
                  color: Resources.color.stateWarning,
                ),
              ],
            ),
            const SizedBox(height: 80),
            DottedLine(
              direction: Axis.horizontal,
              dashGapLength: 2.0,
              dashColor: Resources.color.neutral300,
              dashLength: 4.0,
              lineThickness: 1,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextNunito(
                      text: 'Tanggal dan waktu',
                      size: 10.sp,
                      fontWeight: Weightenum.REGULAR,
                      color: Resources.color.neutral500,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 8),
                    TextNunito(
                      text: 'Saldo Anda',
                      size: 10.sp,
                      fontWeight: Weightenum.REGULAR,
                      color: Resources.color.neutral500,
                      maxLines: 1,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextNunito(
                      text: '1 September 2022, 3:21 PM',
                      size: 10.sp,
                      fontWeight: Weightenum.REGULAR,
                      color: Resources.color.neutral700,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 8),
                    TextNunito(
                      text: '90.000',
                      size: 10.sp,
                      fontWeight: Weightenum.BOLD,
                      color: Resources.color.neutral700,
                      align: TextAlign.start,
                      maxLines: 1,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
