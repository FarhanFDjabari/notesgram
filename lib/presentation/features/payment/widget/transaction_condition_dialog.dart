import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:collection/collection.dart';

class TransactionConditionDialog extends StatelessWidget {
  TransactionConditionDialog({
    this.title,
    this.terms,
    Key? key,
  }) : super(key: key);

  final String? title;
  final List<String>? terms;

  final rulesDialogDescription = RichText(
    text: TextSpan(
      // Note: Styles for TextSpans must be explicitly defined.
      // Child text spans will inherit styles from parent
      style: GoogleFonts.nunitoSans(
        fontSize: 14,
        color: Resources.color.neutral500,
      ),
      children: const [
        TextSpan(text: 'Ketentuan '),
        TextSpan(
          text: 'minimal',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextSpan(
            text: ' harga dinilai dari jumlah foto dari catatan yang diunggah'),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Resources.color.neutral50,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextNunito(
              text: title,
              size: 20,
              fontWeight: Weightenum.BOLD,
              maxLines: 1,
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: terms
                      ?.mapIndexed<Row>(
                        (index, e) => Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextNunito(
                              text: '${index + 1}.',
                              size: 16,
                              fontWeight: Weightenum.REGULAR,
                              maxLines: 10,
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: TextNunito(
                                text: e,
                                size: 16,
                                fontWeight: Weightenum.REGULAR,
                                maxLines: 10,
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList() ??
                  [],
            ),
          ],
        ),
      ),
    );
  }
}
