import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/profile/controller/profile_controller.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class ProfilePostFragment extends GetView<ProfileController> {
  const ProfilePostFragment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizerUtil.width,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
        ),
        padding: const EdgeInsets.only(top: 3),
        itemCount: 6,
        itemBuilder: (builderContext, index) {
          return InkWell(
            onTap: () {
              controller.goToDetail(
                username: 'username1',
                noteId: index.toString(),
              );
            },
            child: Container(
              width: 118,
              height: 118,
              decoration: BoxDecoration(
                color: Resources.color.indigo300,
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 26,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  margin: const EdgeInsets.only(right: 53),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                    ),
                    color: Resources.color.neutral50,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Remix.heart_line,
                          size: 14,
                          color: Resources.color.neutral400,
                        ),
                      ),
                      const SizedBox(width: 6),
                      TextNunito(
                        text: '1.234',
                        size: 14,
                        fontWeight: Weightenum.REGULAR,
                        color: Resources.color.neutral400,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
