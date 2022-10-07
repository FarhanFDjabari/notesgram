import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/model/post/post_model.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/data/sources/remote/errorhandler/error_handler.dart';
import 'package:notesgram/data/sources/remote/services/api/api_services.dart';
import 'package:notesgram/presentation/widgets/bottom_sheet/image_pick_bottomsheet.dart';

class PostNotesgramController extends BaseObjectController<PostModel> {
  final titleController = TextEditingController();
  final captionController = TextEditingController();
  final priceController = TextEditingController();
  late RxList<File> images;

  @override
  void onInit() {
    images = (Get.arguments as List<File>).obs;
    super.onInit();
  }

  void goBack() {
    Get.back();
  }

  void removeItemFromList(File image) {
    images.remove(image);
  }

  void showPostBottomSheet() {
    Get.bottomSheet(
      ImagePickBottomSheet(
        multiFile: true,
        pickCallback: (image) {
          if (image != null) {
            images.add(image);
          }
          Get.back();
        },
        pickCallbackMultiple: (imagesData) async {
          if (imagesData != null) {
            images.addAll(imagesData);
          }
          Get.back();
        },
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
    );
  }

  Future<void> postNote() async {
    loadingState();
    await client().then((value) {
      value
          .createNewPost(
            title: titleController.text,
            caption: captionController.text,
            files: images,
            price: priceController.text,
          )
          .validateStatus()
          .then((data) {
        setFinishCallbacks(data.result);
        goBack();
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
