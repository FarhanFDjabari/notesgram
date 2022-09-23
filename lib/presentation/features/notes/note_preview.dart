import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/notes/controller/view_notes_controller.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/theme/resources/gen/assets.gen.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class NotePreview extends GetView<ViewNotesController> {
  const NotePreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Resources.color.neutral900,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: TextNunito(
          text: '1/3',
          size: 15.sp,
          fontWeight: Weightenum.BOLD,
          color: Resources.color.neutral50,
        ),
        leading: IconButton(
          onPressed: () {
            controller.goBack();
          },
          icon: Icon(
            Remix.close_line,
            color: Resources.color.neutral50,
          ),
          iconSize: 28,
        ),
      ),
      body: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: AssetImage(
                Assets.lib.theme.resources.images.appLogoMonochrome.path),
            initialScale: PhotoViewComputedScale.contained * 0.8,
            // heroAttributes: PhotoViewHeroAttributes(tag: galleryItems[index].id),
          );
        },
        itemCount: 3,
        loadingBuilder: (context, event) => Center(
          child: SizedBox(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(
              value: event == null
                  ? 0
                  : event.cumulativeBytesLoaded /
                      (event.expectedTotalBytes ?? 1),
            ),
          ),
        ),
        // backgroundDecoration: widget.backgroundDecoration,
        // pageController: widget.pageController,
        // onPageChanged: onPageChanged,
      ),
    );
  }
}
