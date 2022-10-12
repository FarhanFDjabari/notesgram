import 'package:flutter/material.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:get/get.dart';

class DescriptionTextWidget extends StatefulWidget {
  final String text;
  final double size;
  final Color color;
  final Weightenum fontWeight;

  DescriptionTextWidget({
    required this.text,
    required this.size,
    required this.color,
    required this.fontWeight,
  });

  @override
  State<StatefulWidget> createState() {
    return DescriptionTextWidgetState();
  }
}

class DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  String firstHalf = "";
  String secondHalf = "";

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 125) {
      firstHalf = widget.text.substring(0, 125);
      secondHalf = widget.text.substring(125, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? TextNunito(
              size: widget.size,
              color: widget.color,
              fontWeight: widget.fontWeight,
              text: firstHalf,
              maxLines: 5,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextNunito(
                  size: widget.size,
                  color: widget.color,
                  fontWeight: widget.fontWeight,
                  maxLines: 100,
                  text: flag ? (firstHalf + "...") : (firstHalf + secondHalf),
                ),
                const SizedBox(height: 8),
                InkWell(
                  child: TextNunito(
                    size: widget.size,
                    color: Resources.color.indigo700,
                    fontWeight: Weightenum.MEDIUM,
                    text: flag ? 'Lihat selengkapnya' : 'Lihat lebih sedikit',
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}
