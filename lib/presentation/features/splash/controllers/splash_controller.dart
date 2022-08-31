import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:notesgram/data/sources/remote/base/base_object_controller.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:notesgram/utils/routes/page_name.dart';
import 'package:sizer/sizer.dart';

class SplashController extends BaseObjectController {
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> initSplash() async {
    loadingState();
    await checkInternetCon();
    await checkUserData();
  }

  Future<void> checkInternetCon() async {
    try {
      await InternetAddress.lookup(
        'google.com',
        type: InternetAddressType.IPv4,
      );
    } on SocketException catch (_) {
      Get.defaultDialog(
        title: 'Connection Error',
        content: TextNunito(
          text: 'Perangkat kamu tidak terkoneksi dengan internet',
          size: 12.sp,
          fontWeight: Weightenum.REGULAR,
        ),
        textConfirm: 'Aktifkan Koneksi Internet',
        onConfirm: () async {
          await AppSettings.openDeviceSettings(
            asAnotherTask: true,
          );
        },
      );
    }
  }

  Future<void> checkUserData() async {
    if (await GetStorage().read('user_id') == null) {
      Get.offNamed(PageName.login);
    } else {
      Get.offNamed(PageName.home);
    }
  }
}
