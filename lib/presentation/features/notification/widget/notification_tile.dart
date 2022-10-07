import 'package:flutter/material.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    Key? key,
    this.title,
    this.content,
    this.date,
    this.isRead,
    this.onTap,
  }) : super(key: key);

  final String? title;
  final String? content;
  final String? date;
  final bool? isRead;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: isRead == true
            ? Resources.color.neutral50
            : Resources.color.indigo50,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 16.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Remix.information_line,
                color: Resources.color.indigo700,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextNunito(
                      text: 'Info',
                      size: 11.sp,
                      fontWeight: Weightenum.REGULAR,
                    ),
                    const SizedBox(height: 3),
                    TextNunito(
                      text: title,
                      size: 12.sp,
                      fontWeight: Weightenum.BOLD,
                    ),
                    TextNunito(
                      text: content,
                      size: 11.sp,
                      fontWeight: Weightenum.REGULAR,
                      maxLines: 100,
                    ),
                    const SizedBox(height: 3),
                    TextNunito(
                      text: date,
                      size: 11.sp,
                      fontWeight: Weightenum.REGULAR,
                      color: Resources.color.neutral500,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
