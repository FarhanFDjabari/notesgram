import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/model/note/note_model.dart';
import 'package:notesgram/data/model/note_folder/purchased_notes_folder_model.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/data/sources/remote/errorhandler/error_handler.dart';
import 'package:notesgram/data/sources/remote/services/api/api_services.dart';
import 'package:notesgram/presentation/features/profile/controller/profile_purchased_controller.dart';
import 'package:notesgram/presentation/widgets/bottom_sheet/action_menu_bottomsheet.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:notesgram/utils/routes/page_name.dart';
import 'package:remixicon/remixicon.dart';

class PurchaseAlbumController
    extends BaseObjectController<PurchasedNotesFolderModel> {
  final RxString albumNameArgument = "".obs;
  late int albumId;

  @override
  void onInit() {
    albumNameArgument(Get.arguments['album_name'] as String);
    albumId = int.tryParse('${Get.parameters['albumId']}') ?? 0;
    if (Get.arguments['album_name'] == 'Semua') {
      setFinishCallbacks(Get.arguments['album'] as PurchasedNotesFolderModel);
    } else {
      getBookmarkAlbumDetail(
          albumId: int.tryParse('${Get.parameters['albumId']}') ?? 0);
    }
    super.onInit();
  }

  void goBack() {
    Get.back(closeOverlays: true);
  }

  void goToView(
      {required String username, required String noteId, NoteModel? note}) {
    Get.toNamed(PageName.post + '/$username/$noteId/view', arguments: {
      'note': note,
    });
  }

  void showAlbumMenu() {
    Get.bottomSheet(ActionMenuBottomSheet(
      menuItems: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),
          onTap: () async {},
          title: TextNunito(
            text: 'Edit Folder',
            size: 16,
            fontWeight: Weightenum.BOLD,
            color: Resources.color.neutral900,
          ),
          leading: const Icon(
            Remix.pencil_line,
            size: 24,
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),
          onTap: () async {},
          title: TextNunito(
            text: 'Tambah Catatan',
            size: 16,
            fontWeight: Weightenum.BOLD,
            color: Resources.color.neutral900,
          ),
          leading: const Icon(
            Remix.add_line,
            size: 24,
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),
          onTap: () async {
            deleteFolder(albumId: albumId);
          },
          title: TextNunito(
            text: 'Hapus Folder',
            size: 16,
            fontWeight: Weightenum.BOLD,
            color: Resources.color.stateNegative,
          ),
          leading: Icon(
            Remix.delete_bin_2_line,
            size: 24,
            color: Resources.color.stateNegative,
          ),
        ),
      ],
    ));
  }

  Future<void> getBookmarkAlbumDetail({required int albumId}) async {
    loadingState();
    await client().then((value) {
      value
          .fetchPurchasedNotesFolderDetail(folderId: albumId)
          .validateStatus()
          .then((data) {
        setFinishCallbacks(data.result);
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }

  Future<void> deleteFolder({required int albumId}) async {
    loadingState();
    await client().then((value) {
      value
          .deletePurchasedNoteFolder(folderId: albumId)
          .validateStatus()
          .then((data) async {
        await Get.find<ProfilePurchasedController>()
            .getPurchasedNotes()
            .then((value) {
          finishLoadData();
          goBack();
        });
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
