import 'package:get/get.dart';
import 'package:notesgram/presentation/features/profile/controller/another_user_post_controller.dart';
import 'package:notesgram/presentation/features/profile/controller/another_user_profile_controller.dart';
import 'package:notesgram/presentation/features/profile/controller/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(ProfileController(), permanent: true);
    Get.lazyPut(() => AnotherUserProfileController());
    Get.lazyPut(() => AnotherUserPostController());
  }
}
