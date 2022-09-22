import 'package:flutter/material.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:notesgram/utils/helpers/currency_formatter.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class PaymentCoinInfoTile extends StatelessWidget {
  const PaymentCoinInfoTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Resources.color.indigo50,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextNunito(
            text: 'Koin Saya',
            size: 14,
            fontWeight: Weightenum.REGULAR,
            color: Resources.color.neutral500,
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
                  text: int.parse('0') > 999
                      ? coinFormat.format(int.parse('0'))
                      : '0',
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
    );
  }
}
