import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/theme/resources/gen/assets.gen.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:remixicon/remixicon.dart';

class PostPhotoPreview extends StatefulWidget {
  const PostPhotoPreview({
    Key? key,
  }) : super(key: key);

  @override
  State<PostPhotoPreview> createState() => _PostPhotoPreviewState();
}

class _PostPhotoPreviewState extends State<PostPhotoPreview> {
  final CarouselController _carouselController = CarouselController();
  int _photoIndex = 0;

  List<Widget> items = [
    Container(
      color: Resources.color.indigo200,
    ),
    Container(
      color: Resources.color.indigo600,
    ),
  ];

  final limitedAccessText = RichText(
    text: TextSpan(
      // Note: Styles for TextSpans must be explicitly defined.
      // Child text spans will inherit styles from parent
      style: GoogleFonts.nunitoSans(
        fontSize: 14,
        color: Resources.color.neutral900,
      ),
      children: const [
        TextSpan(text: 'Silakan '),
        TextSpan(
          text: 'beli',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextSpan(text: ' catatan ini untuk mengaksesnya secara penuh'),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 2,
          itemBuilder: (context, index, realIndex) {
            if (index > 0) {
              return Stack(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Resources.color.neutral600,
                      image: DecorationImage(
                        image: AssetImage(
                            Assets.lib.theme.resources.images.appLogo.path),
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                      child: Container(
                        decoration:
                            BoxDecoration(color: Colors.white.withOpacity(0.0)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 240,
                      height: 106,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Resources.color.neutral50,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextNunito(
                              text: 'Akses dibatasi',
                              size: 20,
                              fontWeight: Weightenum.BOLD),
                          const SizedBox(height: 8),
                          limitedAccessText,
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return Container(
              color: index > 0
                  ? Resources.color.indigo200
                  : Resources.color.indigo700,
            );
          },
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 368,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: _photoIndex,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              setState(() {
                _photoIndex = index;
              });
            },
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(46),
              color: Resources.color.neutral900.withOpacity(0.72),
            ),
            child: Center(
              child: TextNunito(
                text: '${_photoIndex + 1}/${items.length}',
                maxLines: 1,
                size: 14,
                fontWeight: Weightenum.REGULAR,
                color: Resources.color.neutral50,
              ),
            ),
          ),
        ),
        if (_photoIndex < items.length - 1)
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                _carouselController.nextPage(
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.decelerate,
                );
              },
              radius: 24,
              child: Container(
                width: 24,
                height: 24,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Resources.color.neutral900.withOpacity(0.72),
                ),
                child: Center(
                  child: Icon(
                    Remix.arrow_right_s_line,
                    color: Resources.color.neutral50,
                    size: 18,
                  ),
                ),
              ),
            ),
          ),
        if (_photoIndex > 0)
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {
                _carouselController.previousPage(
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.decelerate,
                );
              },
              radius: 24,
              child: Container(
                width: 24,
                height: 24,
                margin: const EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Resources.color.neutral900.withOpacity(0.72),
                ),
                child: Center(
                  child: Icon(
                    Remix.arrow_left_s_line,
                    color: Resources.color.neutral50,
                    size: 18,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}