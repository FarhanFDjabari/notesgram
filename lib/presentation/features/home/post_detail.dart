import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesgram/presentation/features/home/controller/post_detail_controller.dart';
import 'package:notesgram/presentation/features/home/widget/comment_text_field.dart';
import 'package:notesgram/presentation/features/home/widget/detail_post_tile.dart';
import 'package:notesgram/presentation/widgets/loading_overlay.dart';
import 'package:notesgram/presentation/widgets/state_handle_widget.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/theme/resources/gen/assets.gen.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:notesgram/utils/helpers/date_time_extension.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class PostDetailPage extends GetView<PostDetailController> {
  PostDetailPage({Key? key}) : super(key: key);
  final _scrollController = ScrollController();

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

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (controller.isAutoScrollComment.isTrue &&
          controller.isLoading == false) {
        controller.isAutoScrollComment(false);
        _scrollToBottom();
      }
    });
    return GetBuilder<PostDetailController>(
      init: PostDetailController(),
      initState: (_) {},
      builder: (_) {
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
              text: controller.appBarTitle.value,
              size: 15.sp,
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
          ),
          body: StateHandleWidget(
            shimmerView: LoadingOverlay(),
            loadingEnabled: controller.isLoading,
            onRetryPressed: () {
              // controller.getDashboard("", "");
            },
            errorEnabled: controller.isError,
            errorText: 'txt_error_general'.tr,
            emptyTitle: 'txt_note_empty_title'.tr,
            emptySubtitle: 'txt_note_empty_description'.tr,
            emptyImage: AssetImage(
              Assets.lib.theme.resources.images.appLogoMonochrome.path,
            ),
            emptyEnabled: controller.isEmptyData,
            body: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!controller.isLoading)
                    DetailPostTile(
                      onCommentPressed: () {
                        _scrollToBottom();
                      },
                    ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 32),
                      itemBuilder: (builderContext, index) {
                        return Container(
                          height: 110,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Resources.color.neutral200,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 22,
                                backgroundColor: Resources.color.indigo400,
                                backgroundImage: NetworkImage(
                                  controller.mData?.post?.comments?[index]
                                          .commenter?.avatarUrl ??
                                      '',
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    userNameText(
                                        '${controller.mData?.post?.comments?[index].commenter?.name}',
                                        '${controller.mData?.post?.comments?[index].commenter?.username}'),
                                    TextNunito(
                                      text:
                                          '${controller.mData?.post?.comments?[index].comment}',
                                      size: 14,
                                      fontWeight: Weightenum.REGULAR,
                                    ),
                                    const SizedBox(height: 16),
                                    TextNunito(
                                      text: DateTimeExtension(DateTime.tryParse(
                                                  '${controller.mData?.post?.comments?[index].createdAt}') ??
                                              DateTime.now())
                                          .dayShortMonthYearHourMinute,
                                      size: 14,
                                      fontWeight: Weightenum.REGULAR,
                                      color: Resources.color.neutral500,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: controller.mData?.post?.comments?.length ?? 0,
                    ),
                  ),
                  CommentTextField(
                    userAvatar: controller.getCurrentUserAvatar(),
                    onSendPressed: (value) {
                      controller.sendComment(
                        postId: controller.mData?.post?.id ?? 0,
                        comment: value,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
