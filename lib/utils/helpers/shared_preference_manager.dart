import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:notesgram/data/sources/local/storage/storage_constants.dart';

class SharedPreferenceManager {
  final _preference = Get.find<GetStorage>();

  // Is First Install
  //
  bool getIsFirstInstall() {
    final data = _preference.read<bool>(StorageName.FIRST_INSTALL);
    return data ?? true;
  }

  Future setIsFirstInstall({required bool value}) async {
    return await _preference.write(StorageName.FIRST_INSTALL, value);
  }

  // Is First Onboard
  //
  bool getIsFirstOnboarding() {
    final data = _preference.read<bool>(StorageName.FIRST_ONBOARDING);
    return data ?? true;
  }

  Future setIsFirstOnboarding({required bool value}) async {
    return await _preference.write(StorageName.FIRST_ONBOARDING, value);
  }

  // app locale
  String getAppLocale() {
    return _preference.read<String>(StorageName.CURRENT_LOCALE) ?? "en";
  }

  Future setAppLocale({required String locale}) async {
    return await _preference.write(StorageName.CURRENT_LOCALE, locale);
  }

  clearData() async {}
}
