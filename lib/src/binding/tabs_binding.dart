import 'package:get/get.dart';
import 'package:yam_stack/src/controller/list_controller.dart';
import 'package:yam_stack/src/controller/splash_controller.dart';
import 'package:yam_stack/src/controller/tab_controller.dart';

class TabBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

   // Get.lazyPut<TabsController>(() => TabsController(apiRepository: Get.find()));

    Get.lazyPut<TabsController>(() => TabsController());
    Get.lazyPut<ListController>(() => ListController(apiRepository: Get.find()));
    //Get.put(ListController(apiRepository: Get.find()));

  }
}
