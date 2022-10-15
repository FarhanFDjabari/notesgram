import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesgram/presentation/features/profile/controller/bookmark_album_controller.dart';
import 'package:notesgram/presentation/widgets/loading_overlay.dart';
import 'package:notesgram/presentation/widgets/state_handle_widget.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/theme/resources/gen/assets.gen.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class SavedAlbumPage extends GetView<BookmarkAlbumController> {
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
        title: GetX<BookmarkAlbumController>(
          initState: (_) {},
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
          if (controller.albumNameArgument.value != 'Semua')
            IconButton(
              onPressed: () {
                controller.showAlbumMenu();
              },
              icon: Icon(
                Remix.more_line,
                color: Resources.color.neutral50,
              ),
              iconSize: 28,
            ),
        ],
      ),
      body: GetBuilder<BookmarkAlbumController>(
        init: BookmarkAlbumController(),
        builder: (_) => StateHandleWidget(
          shimmerView: LoadingOverlay(),
          loadingEnabled: controller.isLoading,
          onRetryPressed: () {
            // controller.getDashboard("", "");
          },
          errorEnabled: controller.isError,
          errorText: 'txt_error_general'.tr,
          emptyTitle: 'txt_album_empty_title'.tr,
          emptySubtitle: 'txt_album_empty_description'.tr,
          emptyEnabled: controller.isEmptyData,
          emptyImage: AssetImage(
            Assets.lib.theme.resources.images.appLogoMonochrome.path,
          ),
          body: ListView.separated(
            itemCount: controller.mData?.notes?.length ?? 0,
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            itemBuilder: (builderContext, index) {
              return InkWell(
                onTap: () {
                  controller.goToView(
                    username:
                        '${controller.mData?.notes?[index].note?.post?.user?.username}',
                    noteId: '${controller.mData?.notes?[index].noteId}',
                    note: controller.mData?.notes?[index].note,
                  );
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
                          image: DecorationImage(
                            image: NetworkImage(
                                '${controller.mData?.notes?[index].note?.notePictures?.first.pictureUrl}'),
                            fit: BoxFit.cover,
                          ),
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
                                    text:
                                        '${controller.mData?.notes?[index].note?.title}',
                                    maxLines: 2,
                                    size: 15,
                                    fontWeight: Weightenum.BOLD,
                                  ),
                                  userNameText(
                                      '${controller.mData?.notes?[index].note?.post?.user?.name}',
                                      '${controller.mData?.notes?[index].note?.post?.user?.username}'),
                                  TextNunito(
                                    text:
                                        '${controller.mData?.notes?[index].note?.notePictures?.length} Halaman',
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
        ),
      ),
    );
  }
}
