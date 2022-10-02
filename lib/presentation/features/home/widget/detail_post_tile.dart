import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/home/controller/post_detail_controller.dart';
import 'package:notesgram/presentation/features/home/widget/description_text_widget.dart';
import 'package:notesgram/presentation/features/home/widget/post_photo_preview.dart';
import 'package:notesgram/presentation/features/home/widget/post_price_banner.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:notesgram/utils/helpers/currency_formatter.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class DetailPostTile extends GetView<PostDetailController> {
  const DetailPostTile({
    this.onLikePressed,
    this.onCommentPressed,
    this.onSavePressed,
    this.onSharePressed,
    Key? key,
  }) : super(key: key);

  final Function()? onLikePressed;
  final Function()? onCommentPressed;
  final Function()? onSharePressed;
  final Function()? onSavePressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  backgroundImage: NetworkImage(
                    controller.mData?.post?.user?.avatarUrl ?? '',
                  ),
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
                            text: '${controller.mData?.post?.user?.name}',
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
                                  text: controller
                                              .mData?.post?.user?.isFollowed ==
                                          true
                                      ? 'Followed'
                                      : '+Follow',
                                  size: 14,
                                  fontWeight: Weightenum.BOLD,
                                  color: controller
                                              .mData?.post?.user?.isFollowed ==
                                          true
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
                            text: '@${controller.mData?.post?.user?.username}',
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
                            text: '${controller.mData?.post?.user?.createdAt}',
                            size: 12.sp,
                            fontWeight: Weightenum.REGULAR,
                            color: Resources.color.neutral500,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      DescriptionTextWidget(
                        text: '${controller.mData?.post?.caption}',
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
              images: controller.mData?.post?.note?.notePictures,
              isPurchased: controller.mData?.isPurchased,
            ),
          ),
          PostPriceBanner(
            productTitle: '${controller.mData?.post?.note?.title}',
            price: '${oCcy.parse(controller.mData?.post?.note?.title ?? '0')}',
            isPurchased: controller.mData?.isPurchased,
            onBuyPressed: () {
              // controller.goToPaymentInfo();
            },
            onViewPressed: () {
              // controller.goToPreviewNote();
            },
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
                            onPressed: onLikePressed,
                            icon: Icon(
                              Remix.heart_line,
                              color: Resources.color.neutral400,
                              size: 24,
                            ),
                            visualDensity: VisualDensity.compact,
                          ),
                          TextNunito(
                            text: coinFormat
                                .parse(
                                    '${controller.mData?.post?.likes?.length}')
                                .toString(),
                            size: 14,
                            fontWeight: Weightenum.REGULAR,
                            color: Resources.color.neutral400,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: onCommentPressed,
                            icon: Icon(
                              Remix.chat_1_line,
                              color: Resources.color.neutral400,
                              size: 24,
                            ),
                            visualDensity: VisualDensity.compact,
                          ),
                          TextNunito(
                            text: '${controller.mData?.post?.comments?.length}',
                            size: 14,
                            fontWeight: Weightenum.REGULAR,
                            color: Resources.color.neutral400,
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: onSharePressed,
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
                  onPressed: onSavePressed,
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
