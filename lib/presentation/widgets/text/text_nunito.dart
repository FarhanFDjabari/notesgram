import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesgram/utils/helpers/constant.dart';

class TextNunito extends StatelessWidget {
  final double size;
  final Color? color;
  final Weightenum fontWeight;
  final String? text;
  final TextAlign? align;
  final int? maxLines;

  weightSwitch() {
    switch (fontWeight) {
      case Weightenum.THIN:
        return FontWeight.w100;
      case Weightenum.LIGHT:
        return FontWeight.w300;
      case Weightenum.REGULAR:
        return FontWeight.w400;
      case Weightenum.MEDIUM:
        return FontWeight.w500;
      case Weightenum.SEMIBOLD:
        return FontWeight.w600;
      case Weightenum.BOLD:
        return FontWeight.w700;
      default:
        return FontWeight.w400;
    }
  }

  TextNunito({
    required this.size,
    this.color,
    required this.fontWeight,
    this.text,
    this.align,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      textAlign: align ?? TextAlign.start,
      style: GoogleFonts.nunitoSans(
        fontWeight: weightSwitch(),
        fontSize: size,
        color: color,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
    );
  }
}
