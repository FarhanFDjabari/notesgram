import 'package:get/get.dart';
import 'package:notesgram/presentation/features/challenge/controller/challenge_controller.dart';

class ChallengeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChallengeController());
  }
}
