import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:sizer/sizer.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.onPressed,
    this.isPrefixIcon = false,
    this.isSuffixIcon = false,
    this.icon,
    this.label,
    this.width,
    this.height,
    this.isEnabled = true,
    this.isLoading = false,
  }) : super(key: key);

  final void Function()? onPressed;
  final bool isPrefixIcon;
  final bool isSuffixIcon;
  final Widget? icon;
  final String? label;
  final double? width;
  final double? height;
  final bool isEnabled;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 40.sp,
      decoration: BoxDecoration(
        gradient: isEnabled
            ? Resources.color.gradient500to700
            : Resources.color.gradientNeutral200to300,
        borderRadius: BorderRadius.circular(6),
      ),
      child: ElevatedButton(
        onPressed: isEnabled && !isLoading ? onPressed : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isPrefixIcon == true) icon!,
            if (!isLoading)
              TextNunito(
                text: label,
                size: 14.sp,
                fontWeight: Weightenum.BOLD,
                color: Resources.color.neutral50,
              ),
            if (isLoading)
              SizedBox(
                width: 15.sp,
                height: 15.sp,
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Resources.color.neutral50,
                    color: Resources.color.indigo500,
                    strokeWidth: 2,
                  ),
                ),
              ),
            if (isSuffixIcon == true) icon!,
          ],
        ),
        autofocus: false,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          textStyle: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.w700,
            fontSize: 14.sp,
            color: Resources.color.neutral50,
          ),
          onPrimary: Resources.color.indigo500,
          elevation: 1,
        ),
      ),
    );
  }
}
