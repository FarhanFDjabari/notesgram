import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/model/note/folder_note_model.dart';
import 'package:notesgram/data/model/note_folder/purchased_notes_folder_model.dart';
import 'package:notesgram/data/sources/remote/base/base_list_controller.dart';
import 'package:notesgram/data/sources/remote/errorhandler/error_handler.dart';
import 'package:notesgram/data/sources/remote/services/api/api_services.dart';
import 'package:notesgram/presentation/features/profile/controller/profile_controller.dart';
import 'package:notesgram/presentation/features/profile/widget/add_album_dialog.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class ProfilePurchasedController
    extends BaseListController<PurchasedNotesFolderModel> {
  final albumNameController = TextEditingController();

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    getPurchasedNotes();
  }

  void goToDetail({required String username, required String noteId}) {
    Get.toNamed(PageName.post + '/$username/$noteId');
  }

  void goToView({required String username, required String noteId}) {
    Get.toNamed(PageName.post + '/$username/$noteId/view');
  }

  void goToAlbum({
    required String type,
    required String albumId,
    required String albumName,
    PurchasedNotesFolderModel? album,
  }) {
    String? username = Get.find<ProfileController>().mData?.username;
    if (albumName == 'Semua') {
      Get.toNamed(
        PageName.profile + '/$username/$type/$albumId',
        arguments: {
          'album_name': albumName,
          'album': album,
        },
      );
    } else {
      Get.toNamed(
        PageName.profile + '/$username/$type/$albumId',
        arguments: {
          'album_name': albumName,
        },
      );
    }
  }

  void showAddAlbumDialog() {
    Get.dialog(
      AddAlbumDialog(
        controller: albumNameController,
        isLoading: isLoading,
        onCancel: () {
          goBack();
        },
        onSuccess: () {
          goBack();
          albumNameController.clear();
        },
      ),
    );
  }

  void goBack() {
    Get.back();
  }

  void createNewAlbum() {}

  Future<void> getPurchasedNotes() async {
    loadingState();
    await client().then((clientValue) {
      clientValue.fetchPurchasedNotes().validateStatus().then((allData) {
        clientValue.fetchPurchasedNotesFolder().validateStatus().then((data) {
          PurchasedNotesFolderModel? allFolder;
          if (allData.data?.isNotEmpty == true) {
            allFolder = PurchasedNotesFolderModel(
              id: 0,
              name: 'Semua',
              createdAt: DateTime.now().toIso8601String(),
              updatedAt: DateTime.now().toIso8601String(),
              userId: allData.data?.first.post?.userId,
              notes: allData.data?.map((e) {
                return FolderNoteModel(
                  id: e.id,
                  groupId: 0,
                  note: e,
                  updatedAt: e.createdAt,
                  createdAt: e.createdAt,
                  noteId: e.id,
                );
              }).toList(),
              noteIds: allData.data?.map((e) => e.id ?? 0).toList(),
            );
          }
          var datalist = <PurchasedNotesFolderModel>[];
          if (allFolder != null) {
            datalist.add(allFolder);
          }
          datalist.addAll(data.data ?? []);
          dataList.clear();
          setFinishCallbacks(datalist);
        }).handleError((onError) {
          debugPrint(onError.toString());
          finishLoadData(errorMessage: onError.toString());
        });
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
