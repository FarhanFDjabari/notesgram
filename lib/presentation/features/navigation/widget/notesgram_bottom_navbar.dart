import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/navigation/controller/navigation_controller.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/theme/resources/gen/assets.gen.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class NotesgramBottomNavbar extends GetView<NavigationController> {
  const NotesgramBottomNavbar({Key? key, required this.onPressed})
      : super(key: key);

  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildNavBarItem(Remix.home_line, 'Home', Remix.home_fill, 0),
        buildNavBarItem(Remix.search_2_line, 'Explore', Remix.search_2_fill, 1),
        buildNavBarItem(
            Remix.add_circle_line, 'Post', Remix.add_circle_fill, 2),
        buildNavBarItem(Remix.notification_line, 'Notification',
            Remix.notification_fill, 3),
        buildNavBarItem(Remix.user_3_line, 'Profile', Remix.user_3_fill, 4),
      ],
    );
  }

  Widget buildNavBarItem(
      IconData icon, String label, IconData activeIcon, int index) {
    return GestureDetector(
      onTap: () => onPressed(index),
      child: Obx(
        () => SizedBox(
          height: 56,
          width: SizerUtil.width / 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                controller.pageIndex.value == index ? activeIcon : icon,
                color: controller.pageIndex.value == index
                    ? Resources.color.indigo600
                    : Resources.color.neutral400,
              ),
              const SizedBox(height: 3),
              TextNunito(
                text: label,
                size: 9.sp,
                fontWeight: Weightenum.REGULAR,
                color: controller.pageIndex.value == index
                    ? Resources.color.indigo600
                    : Resources.color.neutral400,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: controller.pageIndex.value == index
                      ? Resources.color.gradient500to700
                      : null,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(2),
                    topRight: Radius.circular(2),
                  ),
                ),
                height: 2,
                margin: const EdgeInsets.only(top: 5.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
