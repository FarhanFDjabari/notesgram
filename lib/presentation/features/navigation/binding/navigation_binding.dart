import 'package:get/get.dart';
import 'package:notesgram/presentation/features/explore/controller/explore_controller.dart';
import 'package:notesgram/presentation/features/home/controller/following_post_controller.dart';
import 'package:notesgram/presentation/features/home/controller/for_you_post_controller.dart';
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
    Get.put<NavigationController>(NavigationController());
    Get.put<HomeController>(HomeController());
    Get.put<ExploreController>(ExploreController());
    Get.put<NotificationController>(NotificationController());
    Get.put<ProfileController>(ProfileController());
    Get.lazyPut(() => FollowingPostController());
    Get.lazyPut(() => ForYouPostController());
    Get.lazyPut(() => ProfilePostController());
    Get.lazyPut(() => ProfilePurchasedController());
    Get.lazyPut(() => ProfileBookmarkController());
  }
}
