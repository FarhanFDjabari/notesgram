import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/model/post/post_model.dart';
import 'package:notesgram/presentation/features/home/controller/home_controller.dart';
import 'package:notesgram/presentation/features/home/widget/description_text_widget.dart';
import 'package:notesgram/presentation/features/home/widget/post_photo_preview.dart';
import 'package:notesgram/presentation/features/home/widget/post_price_banner.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:notesgram/utils/helpers/date_time_extension.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class HomePostTile extends GetView<HomeController> {
  const HomePostTile({
    this.post,
    Key? key,
  }) : super(key: key);

  final PostModel? post;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.goToDetail(
          username: '${post?.user?.username}',
          postId: '${post?.id}',
        );
      },
      child: SizedBox(
        height: 680,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Resources.color.indigo400,
                    radius: 25,
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
                                DateTime.tryParse(post?.createdAt ?? "") ??
                                    DateTime.now(),
                              ).postTime,
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
            ),
            Expanded(
              child: PostPhotoPreview(
                images: post?.note?.notePictures,
                isPurchased: post?.note?.isPurchased,
              ),
            ),
            PostPriceBanner(
              productTitle: '${post?.note?.title}',
              price: '${post?.note?.price}',
              isPurchased: post?.note?.isPurchased,
              onBuyPressed: () {
                controller.goToPaymentInfo(
                  noteId: '${post?.note?.id}',
                  note: post,
                );
              },
              onViewPressed: () {},
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                post?.isLiked == true
                                    ? Remix.heart_fill
                                    : Remix.heart_line,
                                color: post?.isLiked == true
                                    ? Resources.color.indigo700
                                    : Resources.color.neutral400,
                                size: 24,
                              ),
                              visualDensity: VisualDensity.compact,
                            ),
                            TextNunito(
                              text: '${post?.likes?.length}',
                              size: 14,
                              fontWeight: Weightenum.REGULAR,
                              color: Resources.color.neutral400,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                controller.goToDetail(
                                    username: '${post?.user?.username}',
                                    postId: '${post?.id}',
                                    arguments: true);
                              },
                              icon: Icon(
                                Remix.chat_1_line,
                                color: Resources.color.neutral400,
                                size: 24,
                              ),
                              visualDensity: VisualDensity.compact,
                            ),
                            TextNunito(
                              text: '${post?.comments?.length}',
                              size: 14,
                              fontWeight: Weightenum.REGULAR,
                              color: Resources.color.neutral400,
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Remix.share_forward_line,
                            color: Resources.color.neutral400,
                            size: 24,
                          ),
                          visualDensity: VisualDensity.compact,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      post?.isBookmarked == true
                          ? Remix.bookmark_fill
                          : Remix.bookmark_line,
                      color: post?.isBookmarked == true
                          ? Resources.color.indigo700
                          : Resources.color.neutral400,
                      size: 24,
                    ),
                    visualDensity: VisualDensity.compact,
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
