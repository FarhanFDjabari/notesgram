import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/profile/controller/another_user_post_controller.dart';
import 'package:notesgram/presentation/widgets/loading_overlay.dart';
import 'package:notesgram/presentation/widgets/state_handle_widget.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/theme/resources/gen/assets.gen.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:sizer/sizer.dart';

class AnotherUserPostFragment extends GetView<AnotherUserPostController> {
  const AnotherUserPostFragment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnotherUserPostController>(
      init: AnotherUserPostController(),
      initState: (state) {},
      builder: (_) {
        return SizedBox(
          width: SizerUtil.width,
          child: StateHandleWidget(
            shimmerView: LoadingOverlay(),
            loadingEnabled: controller.isLoading,
            onRetryPressed: () {
              // controller.getDashboard("", "");
            },
            errorEnabled: controller.isError,
            errorText: 'txt_error_general'.tr,
            emptyTitle: 'txt_user_post_empty_title'.tr,
            emptyEnabled: controller.isEmptyData,
            emptyImage: AssetImage(
              Assets.lib.theme.resources.images.appLogoMonochrome.path,
            ),
            body: SmartRefresher(
              enablePullDown: true,
              enablePullUp: controller.hasNext,
              controller: controller.refreshController,
              onLoading: controller.loadNextPage,
              onRefresh: controller.refreshPage,
              header: MaterialClassicHeader(
                color: Resources.color.indigo700,
              ),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
                ),
                padding: const EdgeInsets.only(top: 3),
                itemCount: controller.dataList.length,
                itemBuilder: (builderContext, index) {
                  return InkWell(
                    onTap: () {
                      controller.goToDetail(
                        noteId: '${controller.dataList[index].postId}',
                      );
                    },
                    child: Container(
                      width: 118,
                      height: 118,
                      decoration: BoxDecoration(
                        color: Resources.color.indigo300,
                        image: DecorationImage(
                          image: NetworkImage(
                              '${controller.dataList[index].notePictures?.first.pictureUrl}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
