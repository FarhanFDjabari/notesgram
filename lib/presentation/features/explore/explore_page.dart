import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/explore/controller/explore_controller.dart';
import 'package:notesgram/presentation/features/explore/widget/search_tile.dart';
import 'package:notesgram/presentation/widgets/loading_overlay.dart';
import 'package:notesgram/presentation/widgets/search_textfield.dart';
import 'package:notesgram/presentation/widgets/state_handle_widget.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/theme/resources/gen/assets.gen.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class ExplorePage extends GetView<ExploreController> {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: Resources.color.gradient600to800,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        toolbarHeight: 56,
        title: SearchTextField(
          controller: controller.keywordController,
          onChanged: controller.onSearchChange,
          onSubmitted: (value) {
            controller.searchPost();
          },
          onTap: () {
            controller.isSearching(true);
            controller.update();
          },
          height: 40,
        ),
      ),
      body: GetBuilder<ExploreController>(
        init: ExploreController(),
        initState: (_) {},
        builder: (_) {
          if (controller.isSearching.isTrue) {
            return Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: StateHandleWidget(
                shimmerView: LoadingOverlay(),
                loadingEnabled: controller.isLoading,
                onRetryPressed: () {
                  // controller.getDashboard("", "");
                },
                errorEnabled: controller.isError,
                errorText: 'txt_error_general'.tr,
                emptyImage: AssetImage(
                  Assets.lib.theme.resources.images.appLogoMonochrome.path,
                ),
                emptyEnabled: controller.isEmptyData,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (controller.mData?.notes?.isNotEmpty == true)
                      TextNunito(
                        text: 'Catatan',
                        size: 12.sp,
                        fontWeight: Weightenum.BOLD,
                        color: Resources.color.neutral500,
                      ),
                    if ((controller.mData?.notes?.length ?? 0) <= 0 == true &&
                        (controller.mData?.users?.length ?? 0) <= 0 == true)
                      TextNunito(
                        text: 'Keyword not found',
                        size: 12.sp,
                        fontWeight: Weightenum.BOLD,
                      ),
                    const SizedBox(height: 8),
                    if ((controller.mData?.notes?.length ?? 0) <= 0 == true &&
                        (controller.mData?.users?.length ?? 0) <= 0 == true)
                      TextNunito(
                        text: 'Search another keyword',
                        size: 11.sp,
                        fontWeight: Weightenum.REGULAR,
                      ),
                    if (controller.mData?.notes?.isNotEmpty == true)
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.mData?.notes?.length,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          itemBuilder: (context, index) {
                            return SearchTile(
                              index: index,
                              title: '${controller.mData?.notes?[index].title}',
                              subtitle: '@username',
                              dataType: 'notes',
                              thumbnailUrl:
                                  '${controller.mData?.notes?[index].notePictures?.first.pictureUrl}',
                              onTap: () {
                                controller.goToExploreDetail(
                                  type: 'notes',
                                  postId:
                                      controller.mData?.notes?[index].postId,
                                );
                              },
                            );
                          },
                        ),
                      ),
                    if ((controller.mData?.notes?.length ?? 0) > 0 == true)
                      const SizedBox(height: 16),
                    if ((controller.mData?.users?.length ?? 0) > 0 == true)
                      TextNunito(
                        text: 'Pengguna',
                        size: 12.sp,
                        fontWeight: Weightenum.BOLD,
                        color: Resources.color.neutral500,
                      ),
                    if ((controller.mData?.users?.length ?? 0) > 0 == true)
                      const SizedBox(height: 8),
                    if ((controller.mData?.users?.length ?? 0) > 0 == true)
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.mData?.users?.length,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          itemBuilder: (context, index) {
                            return SearchTile(
                              index: index,
                              dataType: 'users',
                              title: '${controller.mData?.users?[index].name}',
                              subtitle:
                                  '@${controller.mData?.users?[index].username}',
                              thumbnailUrl:
                                  controller.mData?.users?[index].avatarUrl,
                              onTap: () {
                                controller.goToExploreDetail(
                                    type: 'users',
                                    user: controller.mData?.users?[index]);
                              },
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            );
          }
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Remix.search_2_line,
                    size: 30.sp,
                    color: Resources.color.neutral400,
                  ),
                  const SizedBox(height: 5),
                  TextNunito(
                    text: 'Lakukan pencarian pada \nkolom diatas',
                    size: 16.sp,
                    align: TextAlign.center,
                    maxLines: 5,
                    fontWeight: Weightenum.MEDIUM,
                    color: Resources.color.neutral400,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
