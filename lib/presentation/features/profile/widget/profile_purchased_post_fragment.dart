import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/profile/controller/profile_purchased_controller.dart';
import 'package:notesgram/presentation/widgets/loading_overlay.dart';
import 'package:notesgram/presentation/widgets/state_handle_widget.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class ProfilePurchasedPostFragment extends GetView<ProfilePurchasedController> {
  const ProfilePurchasedPostFragment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfilePurchasedController>(
      init: ProfilePurchasedController(),
      initState: (_) {
        controller.getPurchasedNotes();
      },
      builder: (_) {
        return SizedBox(
          width: SizerUtil.width,
          child: StateHandleWidget(
            shimmerView: LoadingOverlay(),
            loadingEnabled: controller.isLoading,
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
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 168 / 212,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                itemCount: controller.dataList.length + 1,
                itemBuilder: (builderContext, index) {
                  if (index == controller.dataList.length) {
                    return InkWell(
                      onTap: () {
                        controller.showAddAlbumDialog();
                      },
                      child: Card(
                        elevation: 8,
                        shadowColor:
                            Resources.color.shadowColor.withOpacity(0.16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: SizedBox(
                          height: 168,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Remix.add_line,
                                  size: 38.sp,
                                  color: Resources.color.neutral400,
                                ),
                                TextNunito(
                                  text: 'Tambah Folder',
                                  size: 12.sp,
                                  fontWeight: Weightenum.REGULAR,
                                  color: Resources.color.neutral400,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return InkWell(
                    onTap: () {
                      controller.goToAlbum(
                        username: 'user',
                        type: 'purchased-notes',
                        albumId: controller.dataList[index].id.toString(),
                        albumName: '${controller.dataList[index].name}',
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      elevation: 8,
                      shadowColor:
                          Resources.color.shadowColor.withOpacity(0.16),
                      color: Resources.color.neutral50,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: GridView.count(
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 2,
                                crossAxisSpacing: 2,
                                mainAxisSpacing: 2,
                                children: List.generate(
                                  controller.dataList[index].notes?.length ?? 0,
                                  (childIndex) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: Resources.color.neutral300,
                                        borderRadius: BorderRadius.circular(6),
                                        image: DecorationImage(
                                          image: NetworkImage(controller
                                                  .dataList[index]
                                                  .notes?[childIndex]
                                                  .note
                                                  ?.notePictures
                                                  ?.first
                                                  .pictureUrl ??
                                              ""),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            TextNunito(
                              text: '${controller.dataList[index].name}',
                              size: 16,
                              fontWeight: Weightenum.BOLD,
                            ),
                            TextNunito(
                              text:
                                  '${controller.dataList[index].notes?.length} Catatan',
                              size: 14,
                              fontWeight: Weightenum.REGULAR,
                              color: Resources.color.neutral500,
                            ),
                          ],
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
