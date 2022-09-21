import 'package:get/get.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class ProfileController extends GetxController {
  final RxString albumNameArgument = "".obs;

  void getAlbumName() {
    albumNameArgument(Get.arguments as String);
  }

  void goToAlbum({
    required String type,
    required String username,
    required String albumId,
    required String albumName,
  }) {
    Get.toNamed(
      PageName.profile + '/$username/$type/$albumId',
      arguments: albumName,
    );
  }

  void goBack() {
    Get.back();
  }
}
