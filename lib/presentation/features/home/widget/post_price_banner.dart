import 'package:flutter/material.dart';
import 'package:notesgram/presentation/widgets/button/primary_button.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:notesgram/utils/helpers/currency_formatter.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class PostPriceBanner extends StatelessWidget {
  const PostPriceBanner({
    Key? key,
    this.productTitle,
    this.price,
    this.onBuyPressed,
  }) : super(key: key);

  final String? productTitle;
  final String? price;
  final Function()? onBuyPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82,
      color: Resources.color.indigo50,
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextNunito(
                  text: productTitle,
                  size: 14,
                  maxLines: 2,
                  fontWeight: Weightenum.BOLD,
                ),
                Row(
                  children: [
                    Icon(
                      Remix.coins_fill,
                      color: Resources.color.stateWarning,
                    ),
                    const SizedBox(width: 6),
                    TextNunito(
                      text: int.parse(price ?? '0') > 999
                          ? coinFormat.format(int.parse(price ?? '0'))
                          : price ?? '0',
                      size: 20,
                      fontWeight: Weightenum.BOLD,
                      color: Resources.color.stateWarning,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          PrimaryButton(
            width: 75.sp,
            height: 40.sp,
            label: 'BELI',
            fontSize: 11.sp,
            isPrefixIcon: true,
            icon: Container(
              margin: const EdgeInsets.only(right: 9),
              child: Icon(
                Remix.shopping_cart_line,
                color: Resources.color.neutral50,
                size: 20,
              ),
            ),
            elevation: 0,
            onPressed: onBuyPressed,
          ),
        ],
      ),
    );
  }
}
