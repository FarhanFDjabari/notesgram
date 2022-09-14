import 'package:floating_draggable_widget/floating_draggable_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/navigation/controller/navigation_controller.dart';
import 'package:notesgram/presentation/features/navigation/widget/notesgram_bottom_navbar.dart';
import 'package:notesgram/utils/routes/app_route.dart';
import 'package:sizer/sizer.dart';

class NavigationPage extends GetView<NavigationController> {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<NavigationController>(
      init: NavigationController(),
      builder: (_) => FloatingDraggableWidget(
        autoAlign: true,
        floatingWidget: controller.pageIndex.value == 0
            ? FloatingActionButton(
                onPressed: () {},
              )
            : Container(),
        floatingWidgetHeight: 56,
        floatingWidgetWidth: 56,
        dy: SizerUtil.height * 0.65,
        dx: SizerUtil.width * 0.85,
        mainScreenWidget: Scaffold(
          body: Builder(
            builder: (_) {
              switch (controller.pageIndex.value) {
                case 0:
                  return AppRoute.pages[0].page();
                case 1:
                  return AppRoute.pages[1].page();
                case 2:
                  return AppRoute.pages[2].page();
                case 3:
                  return AppRoute.pages[3].page();
                case 4:
                  return AppRoute.pages[4].page();
                default:
                  return AppRoute.pages[5].page();
              }
            },
          ),
          bottomNavigationBar: NotesgramBottomNavbar(
            onPressed: (index) {
              if (index == 2) {
                controller.goToPost();
              } else {
                controller.pageIndex(index);
              }
            },
          ),
        ),
      ),
    );
  }
}
