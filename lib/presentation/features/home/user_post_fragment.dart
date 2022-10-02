import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/home/controller/home_controller.dart';
import 'package:notesgram/presentation/features/home/widget/home_post_tile.dart';
import 'package:notesgram/presentation/widgets/loading_overlay.dart';
import 'package:notesgram/presentation/widgets/state_handle_widget.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/theme/resources/gen/assets.gen.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:sizer/sizer.dart';

class UserPostFragment extends GetView<HomeController> {
  const UserPostFragment({required this.dataType, Key? key}) : super(key: key);

  final String dataType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizerUtil.width,
      child: GetBuilder<HomeController>(
        initState: (_) {
          if (dataType == 'following') {
            controller.getFollowingPosts();
          } else {
            controller.getForYouPosts();
          }
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
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return HomePostTile(
                    post: controller.dataList[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 8,
                    color: Resources.color.indigo50,
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
