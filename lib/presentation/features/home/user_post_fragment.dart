import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/home/controller/home_controller.dart';
import 'package:notesgram/presentation/features/home/widget/home_post_tile.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:sizer/sizer.dart';

class UserPostFragment extends GetView<HomeController> {
  const UserPostFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizerUtil.width,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return HomePostTile();
        },
        separatorBuilder: (context, index) {
          return Container(
            height: 8,
            color: Resources.color.indigo50,
          );
        },
        itemCount: 2,
      ),
    );
  }
}
