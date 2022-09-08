import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/validator.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.height,
  }) : super(key: key);

  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String?)? onSubmitted;
  final Function()? onTap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: TextFormField(
        controller: controller,
        autocorrect: true,
        autofocus: false,
        keyboardType: TextInputType.text,
        maxLines: 1,
        textInputAction: TextInputAction.search,
        style: GoogleFonts.nunitoSans(
          fontWeight: FontWeight.w400,
          fontSize: 13.sp,
          color: Resources.color.neutral900,
        ),
        validator: Validator().keyword,
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        onTap: onTap,
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
          hintText: 'Cari notes, akun, dan lainnya',
          hintMaxLines: 1,
          hintStyle: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
            color: Resources.color.neutral400,
          ),
          prefixIcon: Icon(Remix.search_2_line, size: 14.sp),
          contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          filled: true,
          fillColor: Resources.color.neutral50,
        ),
      ),
    );
  }
}
