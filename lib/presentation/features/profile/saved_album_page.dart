import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesgram/presentation/features/profile/controller/profile_bookmark_controller.dart';
import 'package:notesgram/presentation/features/profile/controller/profile_controller.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class SavedAlbumPage extends GetView<ProfileBookmarkController> {
  const SavedAlbumPage({Key? key}) : super(key: key);

  RichText userNameText(String name, String username) => RichText(
        text: TextSpan(
          // Note: Styles for TextSpans must be explicitly defined.
          // Child text spans will inherit styles from parent
          style: GoogleFonts.nunitoSans(
            fontSize: 13,
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
              text: '   @$username',
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
        title: GetX<ProfileController>(
          init: ProfileController(),
          initState: (_) {
            controller.getAlbumName();
          },
          builder: (_) {
            return TextNunito(
              text: controller.albumNameArgument.value,
              size: 15.sp,
              fontWeight: Weightenum.BOLD,
              color: Resources.color.neutral50,
            );
          },
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
          IconButton(
            onPressed: () {},
            icon: Icon(
              Remix.more_line,
              color: Resources.color.neutral50,
            ),
            iconSize: 28,
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: 2,
        padding: const EdgeInsets.all(16),
        itemBuilder: (builderContext, index) {
          return InkWell(
            onTap: () {
              controller.goToView(username: 'username1', noteId: 0.toString());
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Resources.color.neutral50,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: Resources.color.gradient500to700,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextNunito(
                                text: 'Logika Dasar Penalaran Umum UTBK 2020',
                                maxLines: 2,
                                size: 15,
                                fontWeight: Weightenum.BOLD,
                              ),
                              userNameText('Nama user', 'username1'),
                              TextNunito(
                                text: '3 Catatan',
                                maxLines: 1,
                                size: 13,
                                fontWeight: Weightenum.REGULAR,
                                color: Resources.color.neutral500,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          child: Icon(
                            Remix.arrow_right_s_line,
                            color: Resources.color.indigo700,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (_, index) {
          return const SizedBox(height: 8);
        },
      ),
    );
  }
}
