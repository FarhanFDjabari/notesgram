import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesgram/presentation/features/notes/controller/view_notes_controller.dart';
import 'package:notesgram/presentation/features/notes/widget/note_caption_tile.dart';
import 'package:notesgram/presentation/features/notes/widget/view_note_photo_preview.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/theme/resources/gen/assets.gen.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class ViewNotes extends GetView<ViewNotesController> {
  ViewNotes({Key? key}) : super(key: key);
  final CarouselController _carouselController = CarouselController();

  RichText userNameText(String name, String username) => RichText(
        text: TextSpan(
          // Note: Styles for TextSpans must be explicitly defined.
          // Child text spans will inherit styles from parent
          style: GoogleFonts.nunitoSans(
            fontSize: 15,
            color: Resources.color.neutral900,
          ),
          children: [
            TextSpan(
              text: name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: '  @$username',
              style: TextStyle(
                color: Resources.color.neutral500,
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Resources.color.neutral100,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: Resources.color.gradient600to800,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: TextNunito(
          text: '${controller.mData?.note?.title}',
          size: 15.sp,
          maxLines: 1,
          fontWeight: Weightenum.BOLD,
          color: Resources.color.neutral50,
        ),
        leading: IconButton(
          onPressed: () {
            controller.goBack();
          },
          icon: Icon(
            Remix.arrow_left_s_line,
            color: Resources.color.neutral50,
          ),
          iconSize: 28,
        ),
        actions: [
          Container(
            width: 24,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 450,
                child: ViewNotePhotoPreview(
                    onImageTap: () {
                      controller.goToPreview(
                          noteId: '${controller.mData?.note?.id}');
                    },
                    images: controller.mData?.note?.notePictures,
                    carouselController: _carouselController,
                    currentIndex: controller.imageIndex.value,
                    onPageChanged: (index) {
                      controller.imageIndex(index);
                      controller.photoViewIndex(index);
                    }),
              ),
              Container(
                height: 88,
                color: Resources.color.neutral50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    controller.mData?.note?.notePictures?.length ?? 0,
                    (index) {
                      return InkWell(
                        onTap: () {
                          _carouselController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 150),
                            curve: Curves.decelerate,
                          );
                          controller.imageIndex(index);
                          controller.photoViewIndex(index);
                        },
                        child: GetX<ViewNotesController>(
                          init: ViewNotesController(),
                          initState: (_) {},
                          builder: (_) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 150),
                              margin: EdgeInsets.only(left: index > 0 ? 3 : 0),
                              width: index == controller.imageIndex.value
                                  ? 72
                                  : 64,
                              height: index == controller.imageIndex.value
                                  ? 72
                                  : 64,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                image: DecorationImage(
                                  image: NetworkImage(controller.mData?.note
                                          ?.notePictures?[index].pictureUrl ??
                                      ''),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              NoteCaptionTile(
                post: controller.fromPostDetail.isTrue
                    ? controller.mData?.note?.post
                    : controller.mData,
                isCurrentUser: controller.isCurrentUserData(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
