import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/explore/controller/explore_controller.dart';
import 'package:notesgram/presentation/features/explore/widget/search_tile.dart';
import 'package:notesgram/presentation/widgets/search_textfield.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
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
          onChanged: (value) {},
          onSubmitted: (value) {},
          onTap: () {
            controller.isSearching(true);
          },
          height: 40,
        ),
      ),
      body: GetX<ExploreController>(
        init: ExploreController(),
        initState: (_) {},
        builder: (_) {
          if (controller.isSearching.isTrue) {
            return Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextNunito(
                    text: 'Catatan',
                    size: 12.sp,
                    fontWeight: Weightenum.BOLD,
                    color: Resources.color.neutral500,
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 1,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      itemBuilder: (context, index) {
                        return SearchTile(
                          index: index,
                          title: 'Judul notes',
                          subtitle: '@username',
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextNunito(
                    text: 'Pengguna',
                    size: 12.sp,
                    fontWeight: Weightenum.BOLD,
                    color: Resources.color.neutral500,
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 1,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      itemBuilder: (context, index) {
                        return SearchTile(
                          index: index,
                          dataType: 'users',
                          title: 'Nama user',
                          subtitle: '@namauser',
                        );
                      },
                    ),
                  ),
                ],
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
