import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/profile/controller/profile_post_controller.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:sizer/sizer.dart';

class ProfilePostFragment extends GetView<ProfilePostController> {
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
            ),
          );
        },
      ),
    );
  }
}
