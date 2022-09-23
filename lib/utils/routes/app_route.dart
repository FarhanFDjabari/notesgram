import 'package:get/get.dart';
import 'package:notesgram/presentation/features/auth/bindings/create_username_binding.dart';
import 'package:notesgram/presentation/features/auth/bindings/forgot_password_binding.dart';
import 'package:notesgram/presentation/features/auth/bindings/login_binding.dart';
import 'package:notesgram/presentation/features/auth/bindings/register_binding.dart';
import 'package:notesgram/presentation/features/auth/create_username_page.dart';
import 'package:notesgram/presentation/features/auth/forgot_password_page.dart';
import 'package:notesgram/presentation/features/auth/login_page.dart';
import 'package:notesgram/presentation/features/auth/register_page.dart';
import 'package:notesgram/presentation/features/challenge/binding/challenge_binding.dart';
import 'package:notesgram/presentation/features/challenge/challenge_page.dart';
import 'package:notesgram/presentation/features/error/binding/route_error_binding.dart';
import 'package:notesgram/presentation/features/error/route_error_page.dart';
import 'package:notesgram/presentation/features/explore/binding/explore_binding.dart';
import 'package:notesgram/presentation/features/explore/explore_page.dart';
import 'package:notesgram/presentation/features/home/binding/home_binding.dart';
import 'package:notesgram/presentation/features/home/binding/post_detail_binding.dart';
import 'package:notesgram/presentation/features/home/home_page.dart';
import 'package:notesgram/presentation/features/home/post_detail.dart';
import 'package:notesgram/presentation/features/navigation/binding/navigation_binding.dart';
import 'package:notesgram/presentation/features/navigation/navigation_page.dart';
import 'package:notesgram/presentation/features/notes/binding/view_notes_binding.dart';
import 'package:notesgram/presentation/features/notes/note_preview.dart';
import 'package:notesgram/presentation/features/notes/view_notes.dart';
import 'package:notesgram/presentation/features/notification/binding/notification_binding.dart';
import 'package:notesgram/presentation/features/notification/notification_page.dart';
import 'package:notesgram/presentation/features/payment/binding/payment_binding.dart';
import 'package:notesgram/presentation/features/payment/binding/payment_success_binding.dart';
import 'package:notesgram/presentation/features/payment/payment_page.dart';
import 'package:notesgram/presentation/features/payment/payment_processing_page.dart';
import 'package:notesgram/presentation/features/payment/payment_success_page.dart';
import 'package:notesgram/presentation/features/payment/payment_withdraw_page.dart';
import 'package:notesgram/presentation/features/payment/select_payment_page.dart';
import 'package:notesgram/presentation/features/payment/top_up_page.dart';
import 'package:notesgram/presentation/features/post_notesgram/binding/post_notesgram_binding.dart';
import 'package:notesgram/presentation/features/post_notesgram/post_notesgram_page.dart';
import 'package:notesgram/presentation/features/profile/binding/profile_binding.dart';
import 'package:notesgram/presentation/features/profile/private_album_page.dart';
import 'package:notesgram/presentation/features/profile/profile_page.dart';
import 'package:notesgram/presentation/features/profile/saved_album_page.dart';
import 'package:notesgram/presentation/features/splash/bindings/splash_binding.dart';
import 'package:notesgram/presentation/features/splash/splash_page.dart';
import 'package:notesgram/utils/routes/page_name.dart';

class AppRoute {
  static final pages = [
    // DO NOT EDIT THIS SECTION
    GetPage(
      name: PageName.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: PageName.explore,
      page: () => const ExplorePage(),
      binding: ExploreBinding(),
    ),
    GetPage(
      name: PageName.post,
      page: () => PostNotesgramPage(),
      binding: PostNotesgramBinding(),
    ),
    GetPage(
      name: PageName.notification,
      page: () => const NotificationPage(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: PageName.profile,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: PageName.routeError,
      page: () => const RouteErrorPage(),
      binding: RouteErrorBinding(),
    ),

    // THIS SECTION CAN EDITED
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
    GetPage(
      name: PageName.navigation,
      page: () => NavigationPage(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: PageName.paymentInfo,
      page: () => PaymentPage(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: PageName.selectPayment,
      page: () => SelectPaymentPage(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: PageName.paymentProcessing,
      page: () => PaymentProcessingPage(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: PageName.paymentSuccess,
      page: () => PaymentSuccessPage(),
      binding: PaymentSuccessBinding(),
    ),
    GetPage(
      name: PageName.privateAlbum,
      page: () => PrivateAlbumPage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: PageName.savedAlbum,
      page: () => SavedAlbumPage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: PageName.noteDetail,
      page: () => PostDetailPage(),
      binding: PostDetailBinding(),
    ),
    GetPage(
      name: PageName.challenge,
      page: () => ChallengePage(),
      binding: ChallengeBinding(),
    ),
    GetPage(
      name: PageName.topUp,
      page: () => TopUpPage(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: PageName.withdraw,
      page: () => WithdrawPage(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: PageName.viewNote,
      page: () => ViewNotes(),
      binding: ViewNotesBinding(),
    ),
    GetPage(
      name: PageName.notePreview,
      page: () => NotePreview(),
      binding: ViewNotesBinding(),
    ),
  ];
}
