import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:sizer/sizer.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    Key? key,
    this.onPressed,
    this.isPrefixIcon = false,
    this.icon,
    this.label,
    this.width,
    this.height,
    this.isLoading = false,
  }) : super(key: key);

  final void Function()? onPressed;
  final bool isPrefixIcon;
  final Widget? icon;
  final String? label;
  final double? width;
  final double? height;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      child: SizedBox(
        width: width ?? double.infinity,
        height: height ?? 40.sp,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isPrefixIcon && !isLoading) icon!,
            if (isPrefixIcon && !isLoading) SizedBox(width: 16.sp),
            if (!isLoading)
              TextNunito(
                text: label,
                size: 14.sp,
                fontWeight: Weightenum.BOLD,
                color: Resources.color.indigo700,
                maxLines: 1,
              ),
            if (isLoading)
              SizedBox(
                width: 15.sp,
                height: 15.sp,
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Resources.color.indigo700,
                    color: Resources.color.indigo100,
                    strokeWidth: 2,
                  ),
                ),
              ),
          ],
        ),
      ),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        side: BorderSide(color: Resources.color.indigo700, width: 1.5),
        primary: Resources.color.indigo100,
        textStyle: GoogleFonts.nunitoSans(
          fontWeight: FontWeight.w700,
          fontSize: 14.sp,
          color: Resources.color.indigo700,
        ),
      ),
    );
  }
}
