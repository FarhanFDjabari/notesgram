import 'package:get/get.dart';
import 'package:notesgram/presentation/features/explore/controller/explore_controller.dart';
import 'package:notesgram/presentation/features/home/controller/home_controller.dart';
import 'package:notesgram/presentation/features/navigation/controller/navigation_controller.dart';
import 'package:notesgram/presentation/features/notification/controller/notification_controller.dart';
import 'package:notesgram/presentation/features/profile/controller/profile_bookmark_controller.dart';
import 'package:notesgram/presentation/features/profile/controller/profile_controller.dart';
import 'package:notesgram/presentation/features/profile/controller/profile_post_controller.dart';
import 'package:notesgram/presentation/features/profile/controller/profile_purchased_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NavigationController>(NavigationController(), permanent: true);
    Get.put<HomeController>(HomeController(), permanent: true);
    Get.put<ExploreController>(ExploreController(), permanent: true);
    Get.put<NotificationController>(NotificationController(), permanent: true);
    Get.put<ProfileController>(ProfileController(), permanent: true);
    Get.lazyPut(() => ProfilePostController());
    Get.lazyPut(() => ProfilePurchasedController());
    Get.lazyPut(() => ProfileBookmarkController());
  }
}
