import 'package:flutter/material.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:notesgram/utils/helpers/currency_formatter.dart';
import 'package:remixicon/remixicon.dart';

class NoteSubtotalInfo extends StatelessWidget {
  const NoteSubtotalInfo({
    Key? key,
    this.isPaymentSuccess = false,
  }) : super(key: key);

  final bool? isPaymentSuccess;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: Resources.color.shadowColor.withOpacity(0.16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      color: Resources.color.neutral50,
      margin: const EdgeInsets.fromLTRB(0, 16, 0, 8),
      child: SizedBox(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Resources.color.indigo100,
                    radius: 16,
                  ),
                  const SizedBox(width: 8),
                  TextNunito(
                    text: 'Nama user',
                    size: 14,
                    fontWeight: Weightenum.BOLD,
                    color: isPaymentSuccess == true
                        ? Resources.color.indigo800
                        : Resources.color.neutral900,
                  ),
                  const SizedBox(width: 8),
                  TextNunito(
                    text: '@username1',
                    size: 14,
                    fontWeight: Weightenum.REGULAR,
                    color: isPaymentSuccess == true
                        ? Resources.color.indigo800
                        : Resources.color.neutral500,
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              height: 1,
              color: Resources.color.neutral300,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 51,
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: Resources.color.gradient500to700,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextNunito(
                      text: 'Teks Argumentasi Materi UTBK Tahun 2020',
                      size: 16,
                      maxLines: 2,
                      fontWeight: Weightenum.BOLD,
                      color: isPaymentSuccess == true
                          ? Resources.color.indigo800
                          : Resources.color.neutral900,
                    ),
                  ),
                ],
              ),
            ),
            if (isPaymentSuccess != true)
              Divider(
                thickness: 1,
                height: 1,
                color: Resources.color.neutral300,
              ),
            if (isPaymentSuccess != true)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextNunito(
                      text: 'Subtotal',
                      size: 14,
                      fontWeight: Weightenum.BOLD,
                      color: Resources.color.neutral900,
                    ),
                    Row(
                      children: [
                        Icon(
                          Remix.coins_fill,
                          color: Resources.color.stateWarning,
                        ),
                        const SizedBox(width: 6),
                        TextNunito(
                          text: int.parse('10000') > 999
                              ? coinFormat.format(int.parse('10000'))
                              : '0',
                          size: 20,
                          fontWeight: Weightenum.BOLD,
                          color: Resources.color.stateWarning,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
