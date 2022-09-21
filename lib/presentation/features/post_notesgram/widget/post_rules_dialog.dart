import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class PostRulesDialog extends StatelessWidget {
  PostRulesDialog({
    Key? key,
  }) : super(key: key);

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
        height: 160.sp,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Resources.color.neutral50,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            TextNunito(
              text: 'Ketentuan harga',
              size: 20,
              fontWeight: Weightenum.BOLD,
              maxLines: 1,
            ),
            const SizedBox(height: 4),
            rulesDialogDescription,
            const SizedBox(height: 16),
            TextNunito(
              text: '2-3 Foto: minimal 0 Koin',
              size: 16,
              fontWeight: Weightenum.REGULAR,
              maxLines: 1,
            ),
            const SizedBox(height: 8),
            TextNunito(
              text: '4-10 Foto: minimal 10.000 Koin',
              size: 16,
              fontWeight: Weightenum.REGULAR,
              maxLines: 1,
            ),
            const SizedBox(height: 8),
            TextNunito(
              text: '>10 Foto: minimal 15.000 Koin',
              size: 16,
              fontWeight: Weightenum.REGULAR,
              maxLines: 1,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
