import 'package:get/get.dart';
import 'package:yam_stack/src/controller/auth_controller.dart';
import 'package:yam_stack/src/controller/list_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {

    Get.lazyPut<AuthController>(
            () => AuthController(apiRepository: Get.find()));
  }
}

