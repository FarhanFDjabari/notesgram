import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:sizer/sizer.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    this.onPressed,
    this.label,
    this.isPrefixIcon = false,
    this.labelSize,
    this.labelWeight,
    this.icon,
    this.width,
    this.height,
  }) : super(key: key);

  final void Function()? onPressed;
  final bool isPrefixIcon;
  final Widget? icon;
  final String? label;
  final double? labelSize;
  final Weightenum? labelWeight;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      autofocus: false,
      child: SizedBox(
        width: width ?? double.infinity,
        height: height ?? 40.sp,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isPrefixIcon) icon!,
            TextNunito(
              text: label,
              size: labelSize ?? 14.sp,
              fontWeight: labelWeight ?? Weightenum.BOLD,
              color: Resources.color.indigo700,
              maxLines: 1,
            ),
          ],
        ),
      ),
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        primary: Resources.color.indigo100,
        backgroundColor: Colors.transparent,
        textStyle: GoogleFonts.nunitoSans(
          fontWeight: FontWeight.w700,
          fontSize: 14.sp,
          color: Resources.color.indigo700,
        ),
      ),
    );
  }
}
