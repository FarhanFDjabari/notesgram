import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/navigation/controller/navigation_controller.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
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
        buildNavBarItem(
          icon: Remix.home_line,
          label: 'Home',
          activeIcon: Remix.home_fill,
          index: 0,
        ),
        buildNavBarItem(
          icon: Remix.search_2_line,
          label: 'Explore',
          activeIcon: Remix.search_2_fill,
          index: 1,
        ),
        buildNavBarItem(
          icon: Remix.add_circle_line,
          label: 'Post',
          activeIcon: Remix.add_circle_fill,
          index: 2,
        ),
        GetX<NavigationController>(
          initState: (_) {},
          builder: (_) {
            return buildNavBarItem(
              icon: Remix.notification_line,
              label: 'Notification',
              activeIcon: Remix.notification_fill,
              index: 3,
              badgeEnable: true,
              badgeNumber: controller.badgeNumber.value,
            );
          },
        ),
        buildNavBarItem(
          icon: Remix.user_3_line,
          label: 'Profile',
          activeIcon: Remix.user_3_fill,
          index: 4,
        ),
      ],
    );
  }

  Widget buildNavBarItem({
    required IconData icon,
    required String label,
    required IconData activeIcon,
    required int index,
    bool badgeEnable = false,
    int badgeNumber = 0,
  }) {
    return GestureDetector(
      onTap: () => onPressed(index),
      child: Obx(
        () => SizedBox(
          height: 56,
          width: SizerUtil.width / 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (!badgeEnable || badgeNumber < 1)
                Icon(
                  controller.pageIndex.value == index ? activeIcon : icon,
                  color: controller.pageIndex.value == index
                      ? Resources.color.indigo600
                      : Resources.color.neutral400,
                ),
              if (badgeEnable && badgeNumber > 0)
                Badge(
                  badgeContent: TextNunito(
                    text: '$badgeNumber',
                    size: 9,
                    fontWeight: Weightenum.REGULAR,
                    maxLines: 1,
                    align: TextAlign.center,
                    color: Resources.color.neutral50,
                  ),
                  elevation: 0,
                  badgeColor: Resources.color.stateNegative,
                  shape: BadgeShape.circle,
                  animationType: BadgeAnimationType.scale,
                  animationDuration: const Duration(milliseconds: 500),
                  child: Icon(
                    controller.pageIndex.value == index ? activeIcon : icon,
                    color: controller.pageIndex.value == index
                        ? Resources.color.indigo600
                        : Resources.color.neutral400,
                  ),
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
