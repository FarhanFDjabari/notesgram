import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesgram/data/model/user/note_pictures_model.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:remixicon/remixicon.dart';

class ViewNotePhotoPreview extends StatefulWidget {
  const ViewNotePhotoPreview({
    required this.carouselController,
    this.currentIndex = 0,
    this.onImageTap,
    this.onPageChanged,
    this.images,
    Key? key,
  }) : super(key: key);

  final CarouselController carouselController;
  final int currentIndex;
  final Function()? onImageTap;
  final Function(int)? onPageChanged;
  final List<NotePicturesModel>? images;

  @override
  State<ViewNotePhotoPreview> createState() => _ViewNotePhotoPreviewState();
}

class _ViewNotePhotoPreviewState extends State<ViewNotePhotoPreview> {
  int _photoIndex = 0;

  List<NotePicturesModel> items = [];

  @override
  void initState() {
    _photoIndex = widget.currentIndex;
    items = widget.images ?? [];
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
          itemCount: items.length,
          itemBuilder: (context, index, realIndex) {
            return GestureDetector(
              onTap: widget.onImageTap,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      items[index].pictureUrl ?? '',
                    ),
                  ),
                ),
              ),
            );
          },
          carouselController: widget.carouselController,
          options: CarouselOptions(
            height: 450,
            aspectRatio: 4 / 3,
            viewportFraction: 1,
            initialPage: widget.currentIndex,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              if (widget.onPageChanged != null) {
                widget.onPageChanged!(index);
              }
              setState(() {
                _photoIndex = index;
              });
            },
          ),
        ),
        Positioned(
          top: 24,
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
                widget.carouselController.nextPage(
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
                widget.carouselController.previousPage(
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
