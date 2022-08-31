import 'package:flutter/material.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/utils/helpers/constant.dart';

class TextWithSurface extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color surfaceColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  TextWithSurface({
    required this.text,
    required this.textColor,
    required this.surfaceColor,
    this.borderRadius,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 8)),
        color: surfaceColor,
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.fromLTRB(8, 4, 8, 4),
        child: TextNunito(
            size: 12,
            color: textColor,
            fontWeight: Weightenum.REGULAR,
            text: text),
      ),
    );
  }
}
