import 'package:get/get.dart';
import 'package:yam_stack/src/modules/feed/screen/feed_detail_screen.dart';
import 'package:yam_stack/src/modules/feed/screen/feed_screen.dart';
import 'package:yam_stack/src/modules/list/screen/list_add_screen.dart';
import 'package:yam_stack/src/modules/splash/binding/splash_binding.dart';
import 'package:yam_stack/src/modules/tab/binding/tabs_binding.dart';
import 'package:yam_stack/src/modules/auth/binding/auth_binding.dart';
import 'package:yam_stack/src/modules/auth/screen/auth_screen.dart';
import 'package:yam_stack/src/modules/auth/screen/login_screen.dart';
import 'package:yam_stack/src/modules/auth/screen/register_screen.dart';
import 'package:yam_stack/src/modules/auth/screen/verification_complete_screen.dart';
import 'package:yam_stack/src/modules/auth/screen/verification_screen.dart';
import 'package:yam_stack/src/modules/splash/screen/splash_screen.dart';
import 'package:yam_stack/src/modules/tab/screen/tab.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.AUTH,
      page: () => AuthScreen(),
      binding: AuthBinding(),
      children: [
        GetPage(name: Routes.REGISTER, page: () => RegisterScreen()),
        GetPage(name: Routes.LOGIN, page: () => LoginScreen()),
        GetPage(name: Routes.VERIFICATION, page: () => VerificationScreen()),
        GetPage(
            name: Routes.VERIFICATIONCOMPLETE,
            page: () => VerificationCompleteScreen())
      ],
    ),
    GetPage(
        name: Routes.HOME,
        page: () => Tab(),
        binding: TabBinding(),
        children: [
          GetPage(name: Routes.LISTADDSCREEN, page: () => ListAddScreen()),
          GetPage(name: Routes.FEEDDETAILSCREEN, page: () => FeedDetailScreen())


        ])
  ];
}
