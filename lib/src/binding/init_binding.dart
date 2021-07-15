


import 'package:get/get.dart';
import 'package:yam_stack/api/api_provider.dart';
import 'package:yam_stack/api/api_repository.dart';


class InitBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ApiProvider(), permanent: true);
    Get.put(ApiRepository(apiProvider: Get.find()), permanent: true);
  }
}