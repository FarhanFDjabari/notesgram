import 'package:flutter/material.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:remixicon/remixicon.dart';

class PaymentMethodTile extends StatelessWidget {
  const PaymentMethodTile({
    Key? key,
    this.onTap,
    this.border,
  }) : super(key: key);

  final Function()? onTap;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: border,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 105,
              height: 40,
              color: Resources.color.indigo400,
            ),
            Icon(
              Remix.arrow_right_s_line,
              color: Resources.color.neutral400,
            ),
          ],
        ),
      ),
    );
  }
}
