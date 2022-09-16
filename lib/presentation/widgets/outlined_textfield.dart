import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:sizer/sizer.dart';

class OutlinedTextfield extends StatelessWidget {
  const OutlinedTextfield({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.textInputAction,
    this.isObscured = false,
    this.validator,
    this.onChanged,
    this.hintText,
    required this.label,
    this.suffixIcon,
    this.maxLines,
    this.maxLength,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool isObscured;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String? hintText;
  final TextNunito label;
  final IconButton? suffixIcon;
  final int? maxLines;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label,
        SizedBox(height: 4.sp),
        TextFormField(
          controller: controller,
          autocorrect: true,
          autofocus: false,
          keyboardType: keyboardType,
          maxLines: maxLines,
          maxLength: maxLength,
          textInputAction: textInputAction,
          obscureText: isObscured,
          style: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            color: Resources.color.neutral900,
          ),
          validator: validator,
          obscuringCharacter: '•',
          onChanged: onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide:
                  BorderSide(color: Resources.color.neutral400, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: Resources.color.stateNegative,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: Resources.color.indigo600,
                width: 1.5,
              ),
            ),
            hintText: hintText,
            hintMaxLines: 1,
            hintStyle: GoogleFonts.nunitoSans(
              fontWeight: FontWeight.w400,
              fontSize: 13.sp,
              color: Resources.color.neutral400,
            ),
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            counterText: "",
          ),
        ),
      ],
    );
  }
}
