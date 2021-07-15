
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:yam_stack/routes/app_pages.dart';
import 'package:yam_stack/routes/routes.dart';
import 'package:yam_stack/shared/constants/storage.dart';



class SplashController extends GetxController {


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    print("Splash Init");
  }

  @override
  void onReady() async {
    super.onReady();


    await Future.delayed(Duration(milliseconds: 2000));
    var storage = Get.find<SharedPreferences>();
    try {
      if (storage.getString(StorageConstants.token) != null) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.offAllNamed(Routes.AUTH);
      }
    } catch (e) {
      Get.offAllNamed(Routes.AUTH);
    }
  }
}
