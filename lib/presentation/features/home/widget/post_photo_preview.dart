import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesgram/data/model/user/note_pictures_model.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:remixicon/remixicon.dart';

class PostPhotoPreview extends StatefulWidget {
  const PostPhotoPreview({
    this.images,
    this.isPurchased,
    Key? key,
  }) : super(key: key);

  final List<NotePicturesModel>? images;
  final bool? isPurchased;

  @override
  State<PostPhotoPreview> createState() => _PostPhotoPreviewState();
}

class _PostPhotoPreviewState extends State<PostPhotoPreview> {
  final CarouselController _carouselController = CarouselController();
  int _photoIndex = 0;
  late final List<NotePicturesModel> images;
  late final bool isPurchased;

  @override
  void initState() {
    images = widget.images ?? [];
    isPurchased = widget.isPurchased ?? false;
    super.initState();
  }

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
            if (index > 0 && !isPurchased) {
              return Stack(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Resources.color.neutral600,
                      image: DecorationImage(
                        image: NetworkImage(images[index].pictureUrl ?? ""),
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
                        borderRadius: BorderRadius.circular(10),
                      ),
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
              decoration: BoxDecoration(
                color: Resources.color.indigo700,
                image: DecorationImage(
                  image: NetworkImage(images[index].pictureUrl ?? ""),
                ),
              ),
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
                text: '${_photoIndex + 1}/2',
                maxLines: 1,
                size: 14,
                fontWeight: Weightenum.REGULAR,
                color: Resources.color.neutral50,
              ),
            ),
          ),
        ),
        if (_photoIndex < images.length - 1)
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
