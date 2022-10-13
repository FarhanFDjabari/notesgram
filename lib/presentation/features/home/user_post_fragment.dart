import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/home/controller/for_you_post_controller.dart';
import 'package:notesgram/presentation/features/home/widget/home_post_tile.dart';
import 'package:notesgram/presentation/widgets/loading_overlay.dart';
import 'package:notesgram/presentation/widgets/state_handle_widget.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/theme/resources/gen/assets.gen.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:sizer/sizer.dart';

class UserPostFragment extends GetView<ForYouPostController> {
  const UserPostFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizerUtil.width,
      child: GetBuilder<ForYouPostController>(
        initState: (_) {
          controller.getForYouPosts();
        },
        builder: (_) {
          return StateHandleWidget(
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
            body: SmartRefresher(
              enablePullDown: true,
              enablePullUp: false,
              controller: controller.refreshController,
              onRefresh: controller.refreshPage,
              onLoading: controller.loadNextPage,
              header: MaterialClassicHeader(
                color: Resources.color.indigo700,
              ),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return HomePostTile(
                    post: controller.dataList[index],
                    onFollowTap: () {
                      controller.followUnfollowUser(
                          userId: controller.dataList[index].userId ?? 0);
                    },
                    onBookmarkTap: () {
                      controller.savePostToBookmark(
                          postId: controller.dataList[index].id ?? 0);
                    },
                    onLikeTap: () {
                      controller.likeUnlikePost(
                          postId: controller.dataList[index].id ?? 0);
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 8,
                    color: Resources.color.neutral100,
                  );
                },
                itemCount: controller.dataList.length,
              ),
            ),
          );
        },
      ),
    );
  }
}
