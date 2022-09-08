import 'package:flutter/material.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';

class PaymentSummaryTile extends StatelessWidget {
  const PaymentSummaryTile({
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
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextNunito(
              text: 'Ringkasan',
              size: 16,
              fontWeight: Weightenum.BOLD,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextNunito(
                  text: 'Potongan Harga',
                  size: 14,
                  fontWeight: Weightenum.REGULAR,
                ),
                TextNunito(
                  text: '0',
                  size: 14,
                  fontWeight: Weightenum.REGULAR,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextNunito(
                  text: 'Harga',
                  size: 14,
                  fontWeight: Weightenum.REGULAR,
                ),
                TextNunito(
                  text: '10.000',
                  size: 14,
                  fontWeight: Weightenum.REGULAR,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
