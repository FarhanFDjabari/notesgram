import 'package:flutter/material.dart';
import 'package:notesgram/data/model/post/post_model.dart';
import 'package:notesgram/presentation/features/home/widget/description_text_widget.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:notesgram/utils/helpers/date_time_extension.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class NoteCaptionTile extends StatelessWidget {
  const NoteCaptionTile({
    this.post,
    this.isCurrentUser = true,
    Key? key,
  }) : super(key: key);

  final PostModel? post;
  final bool? isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Resources.color.indigo400,
                radius: 25,
                backgroundImage: NetworkImage(post?.user?.avatarUrl ?? ''),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextNunito(
                          text: '${post?.user?.name}',
                          size: 12.sp,
                          fontWeight: Weightenum.BOLD,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (isCurrentUser == false)
                              InkWell(
                                onTap: () {
                                  // controller.goToResetPassword();
                                },
                                child: TextNunito(
                                  text: post?.user?.isFollowed == true
                                      ? 'Followed'
                                      : '+Follow',
                                  size: 14,
                                  fontWeight: Weightenum.BOLD,
                                  color: post?.user?.isFollowed == true
                                      ? Resources.color.neutral500
                                      : Resources.color.indigo700,
                                ),
                              ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                margin: const EdgeInsets.only(
                                  left: 8.0,
                                ),
                                child: Icon(
                                  Remix.more_line,
                                  color: Resources.color.neutral400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextNunito(
                          text: '@${post?.user?.username}',
                          size: 12.sp,
                          fontWeight: Weightenum.REGULAR,
                          color: Resources.color.neutral500,
                        ),
                        Container(
                          width: 2.sp,
                          height: 2.sp,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Resources.color.neutral500,
                          ),
                        ),
                        TextNunito(
                          text: DateTimeExtension(
                                  DateTime.parse('${post?.createdAt}'))
                              .postTime,
                          size: 12.sp,
                          fontWeight: Weightenum.REGULAR,
                          color: Resources.color.neutral500,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    DescriptionTextWidget(
                      text: '${post?.caption}',
                      fontWeight: Weightenum.REGULAR,
                      size: 12.sp,
                      color: Resources.color.neutral900,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Remix.bookmark_line,
                    color: Resources.color.neutral400,
                    size: 24,
                  ),
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
