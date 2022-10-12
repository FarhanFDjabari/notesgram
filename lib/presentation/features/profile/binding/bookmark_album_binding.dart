import 'package:get/get.dart';
import 'package:notesgram/presentation/features/profile/controller/bookmark_album_controller.dart';

class BookmarkAlbumBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookmarkAlbumController());
  }
}
