import 'package:flutter/material.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:sizer/sizer.dart';

class SearchTile extends StatelessWidget {
  const SearchTile({
    Key? key,
    this.index = 0,
    this.title,
    this.subtitle,
    this.thumbnailUrl,
    this.dataType,
  }) : super(key: key);

  final int? index;
  final String? title;
  final String? subtitle;
  final String? thumbnailUrl;
  final String? dataType;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: (index != 0)
            ? const EdgeInsets.symmetric(vertical: 16.0)
            : const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (thumbnailUrl == null)
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: Resources.color.gradient500to700,
                  borderRadius:
                      dataType == 'users' ? null : BorderRadius.circular(6),
                  shape: dataType == 'users'
                      ? BoxShape.circle
                      : BoxShape.rectangle,
                ),
              ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextNunito(
                    text: title,
                    size: 12.sp,
                    fontWeight: Weightenum.BOLD,
                    maxLines: 2,
                  ),
                  TextNunito(
                    text: subtitle,
                    size: 10.sp,
                    fontWeight: Weightenum.REGULAR,
                    maxLines: 1,
                    color: Resources.color.neutral500,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
