import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/home/controller/home_controller.dart';
import 'package:notesgram/presentation/features/home/widget/description_text_widget.dart';
import 'package:notesgram/presentation/features/home/widget/post_photo_preview.dart';
import 'package:notesgram/presentation/features/home/widget/post_price_banner.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class HomePostTile extends GetView<HomeController> {
  const HomePostTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToDetail(username: 'username1', noteId: 0.toString());
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
                              text: 'Nama User',
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
                                    text: '+Follow',
                                    size: 14,
                                    fontWeight: Weightenum.BOLD,
                                    color: Resources.color.indigo700,
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
                              text: '@username1',
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
                              text: '2 jam',
                              size: 12.sp,
                              fontWeight: Weightenum.REGULAR,
                              color: Resources.color.neutral500,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        DescriptionTextWidget(
                          text:
                              'Hai haaii, selamat soreee semuanyaaa \nHappy Monday yakss🤗 \n\nKali ini aku upload notes lagi, yey. Materi yang aku catat mengenai "Teks Argumentasi" yaa buat kalian yang nyari materi ini. Bagi ada yang nanya ini untuk kelas berapa aku kurang tau ya teman-teman, jadi yang tau komen aja ya di bawah 😉👍✨\n\nSemangat terusss semuanyaaaa💗💜✨',
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
              child: PostPhotoPreview(),
            ),
            PostPriceBanner(
              productTitle: 'Teks Argumentasi Materi UTBK Tahun 2020',
              price: '10000',
              onBuyPressed: () {
                controller.goToPaymentInfo();
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
                              onPressed: () {},
                              icon: Icon(
                                Remix.heart_line,
                                color: Resources.color.neutral400,
                                size: 24,
                              ),
                              visualDensity: VisualDensity.compact,
                            ),
                            TextNunito(
                              text: '1.234',
                              size: 14,
                              fontWeight: Weightenum.REGULAR,
                              color: Resources.color.neutral400,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Remix.chat_1_line,
                                color: Resources.color.neutral400,
                                size: 24,
                              ),
                              visualDensity: VisualDensity.compact,
                            ),
                            TextNunito(
                              text: '987',
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
      ),
    );
  }
}
