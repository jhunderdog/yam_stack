import 'package:get/get.dart';
import 'package:yam_stack/src/binding/list_binding.dart';
import 'package:yam_stack/src/binding/tabs_binding.dart';
import 'package:yam_stack/src/pages/list_screen.dart';
import 'package:yam_stack/tab.dart';

import 'package:yam_stack/src/binding/auth_binding.dart';
import 'package:yam_stack/src/binding/splash_binding.dart';
import 'package:yam_stack/src/pages/auth_screen.dart';
import 'package:yam_stack/src/pages/login_screen.dart';
import 'package:yam_stack/src/pages/register_screen.dart';
import 'package:yam_stack/src/pages/splash_screen.dart';

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
      ],
    ),
    GetPage(name: Routes.HOME, page: () => Tab(), binding: TabBinding())
  ];
}
