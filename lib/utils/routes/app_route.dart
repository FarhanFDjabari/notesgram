import 'package:get/get.dart';
import 'package:notesgram/presentation/features/auth/bindings/create_username_binding.dart';
import 'package:notesgram/presentation/features/auth/bindings/forgot_password_binding.dart';
import 'package:notesgram/presentation/features/auth/bindings/login_binding.dart';
import 'package:notesgram/presentation/features/auth/bindings/register_binding.dart';
import 'package:notesgram/presentation/features/auth/create_username_page.dart';
import 'package:notesgram/presentation/features/auth/forgot_password_page.dart';
import 'package:notesgram/presentation/features/auth/login_page.dart';
import 'package:notesgram/presentation/features/auth/register_page.dart';
import 'package:notesgram/presentation/features/splash/bindings/splash_binding.dart';
import 'package:notesgram/presentation/features/splash/splash_page.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class AppRoute {
  static final pages = [
    GetPage(
      name: PageName.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: PageName.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: PageName.signUp,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: PageName.createUsername,
      page: () => CreateUsernamePage(),
      binding: CreateUsernameBinding(),
    ),
    GetPage(
      name: PageName.forgotPassword,
      page: () => ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
  ];
}
