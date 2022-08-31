import 'package:get/get.dart';
import 'package:notesgram/presentation/features/splash/splash_page.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class AppRoute {
  static final pages = [
    GetPage(name: PageName.splash, page: () => const SplashPage()),
  ];
}
