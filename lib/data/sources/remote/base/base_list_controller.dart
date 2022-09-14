import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'base_refresher_status.dart';

abstract class BaseListController<T> extends GetxController {
  Box<T>? box;
  List<T> dataList = [];
  int page = 1;
  bool hasNext = false;
  int perPage = 10;
  String message = "";
  RefresherStatus status = RefresherStatus.loading;

  bool get isInitial => status == RefresherStatus.initial;
  bool get isLoading => status == RefresherStatus.loading;
  bool get isShimmering => isLoading && isEmptyData;
  bool get isEmptyData => dataList.isEmpty;
  bool get isSuccess => status == RefresherStatus.success;
  bool get isError => status == RefresherStatus.failed;

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  /// **NOTE:**
  /// make sure you call this method at initial state, before you call saveCache()
  Future<void> getCacheBox(String _cacheBoxName) async {
    box = Hive.box<T>(_cacheBoxName);
    loadingState();
    List<T> list = [];
    list.addAll(box?.values ?? []);
    setFinishCallbacks(list);
  }

  void saveCache(List<T>? datas, {required Iterable<String>? idList}) {
    if (datas != null && datas.isNotEmpty && box != null) {
      box!.clear();
      datas.asMap().forEach((index, value) {
        box!.put(idList?.toList()[index], value);
      });
    }
  }

  void refreshPage();
  void loadNextPage();

  loadingState() {
    status = RefresherStatus.loading;
    update();
  }

  void addData(List<T> data) {
    if (data.isNotEmpty) {
      this.dataList.addAll(data);
    }
  }

  void setFinishCallbacks(List<T> list) {
    addData(list);
    status = RefresherStatus.success;
    finishRefresh();
    update();
  }

  void setErrorStatus(String message) {
    status = RefresherStatus.failed;
    message = (message.isNotEmpty) ? message : "Something when wrong..";
    Get.snackbar('txt_error_title'.tr, message.toString());
  }

  void finishLoadData({String errorMessage = ""}) {
    finishRefresh();
    if (errorMessage.isNotEmpty) {
      setErrorStatus(errorMessage);
    } else {
      status = RefresherStatus.success;
    }
    update();
  }

  void finishRefresh() {
    if (refreshController.isRefresh) {
      refreshController.refreshCompleted();
    }
    if (refreshController.isLoading) {
      refreshController.loadComplete();
    }
  }
}
