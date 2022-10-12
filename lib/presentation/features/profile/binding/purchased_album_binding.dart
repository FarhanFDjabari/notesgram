import 'package:get/get.dart';
import 'package:notesgram/presentation/features/profile/controller/purchased_album_controller.dart';

class PurchaseAlbumBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PurchaseAlbumController());
  }
}
