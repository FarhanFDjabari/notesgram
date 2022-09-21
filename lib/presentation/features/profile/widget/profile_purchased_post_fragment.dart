import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/profile/controller/profile_controller.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class ProfilePurchasedPostFragment extends GetView<ProfileController> {
  const ProfilePurchasedPostFragment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizerUtil.width,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 168 / 212,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        itemCount: 2 + 1,
        itemBuilder: (builderContext, index) {
          if (index == 2) {
            return InkWell(
              onTap: () {},
              child: Card(
                elevation: 8,
                shadowColor: Resources.color.shadowColor.withOpacity(0.16),
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
                username: 'username1',
                type: 'purchased-notes',
                albumId: index.toString(),
                albumName: 'Semua',
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              elevation: 8,
              shadowColor: Resources.color.shadowColor.withOpacity(0.16),
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
                          4,
                          (index) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Resources.color.neutral300,
                                borderRadius: BorderRadius.circular(6),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    TextNunito(
                      text: 'Semua',
                      size: 16,
                      fontWeight: Weightenum.BOLD,
                    ),
                    TextNunito(
                      text: '3 Catatan',
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
    );
  }
}
