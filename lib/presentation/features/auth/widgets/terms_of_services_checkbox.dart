import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:sizer/sizer.dart';

class TermsOfServiceCheckbox extends StatelessWidget {
  const TermsOfServiceCheckbox({
    Key? key,
    this.onChanged,
    this.onTermsAndConditionTap,
    this.onAppPolicyTap,
    this.isAgree = false,
  }) : super(key: key);

  final void Function(bool?)? onChanged;
  final void Function(String)? onTermsAndConditionTap;
  final void Function(String)? onAppPolicyTap;
  final bool isAgree;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: isAgree,
          onChanged: onChanged,
          activeColor: Resources.color.indigo700,
          visualDensity: VisualDensity.compact,
        ),
        Expanded(
          child: ParsedText(
            text:
                'Saya setuju dengan syarat dan ketentuan dan sudah membaca kebijakan aplikasi ini',
            style: GoogleFonts.nunitoSans(
              fontSize: 11.sp,
              color: Resources.color.neutral900,
              fontWeight: FontWeight.normal,
            ),
            parse: [
              MatchText(
                type: ParsedType.CUSTOM,
                pattern: 'syarat dan ketentuan',
                style: GoogleFonts.nunitoSans(
                  fontSize: 11.sp,
                  color: Resources.color.indigo700,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.normal,
                ),
                onTap: onTermsAndConditionTap,
              ),
              MatchText(
                type: ParsedType.CUSTOM,
                pattern: 'kebijakan',
                style: GoogleFonts.nunitoSans(
                  fontSize: 11.sp,
                  color: Resources.color.indigo700,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.normal,
                ),
                onTap: onAppPolicyTap,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
