import 'package:get/get.dart';
import 'package:yam_stack/src/modules/auth/controller/auth_controller.dart';


class AuthBinding implements Bindings {
  @override
  void dependencies() {

    Get.lazyPut<AuthController>(
            () => AuthController(apiRepository: Get.find()));
  }
}

