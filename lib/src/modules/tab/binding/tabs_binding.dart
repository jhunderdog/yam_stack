import 'package:get/get.dart';
import 'package:yam_stack/src/modules/feed/controller/feed_controller.dart';
import 'package:yam_stack/src/modules/list/controller/list_controller.dart';
import 'package:yam_stack/src/modules/splash/controller/splash_controller.dart';
import 'package:yam_stack/src/modules/profile/controller/profile_controller.dart';
import 'package:yam_stack/src/modules/tab/controller/tab_controller.dart';

class TabBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    // Get.lazyPut<TabsController>(() => TabsController(apiRepository: Get.find()));

    Get.lazyPut<TabsController>(() => TabsController());
    Get.lazyPut<ListController>(
        () => ListController(apiRepository: Get.find()));
    Get.lazyPut<FeedController>(
        () => FeedController(apiRepository: Get.find()));
     // Get.lazyPut<ProfileController>(
     //     () => ProfileController(apiRepository: Get.find()));
    Get.put(FeedController(apiRepository: Get.find()));
    Get.put(ProfileController(apiRepository: Get.find()));
    //Get.put(ListController(apiRepository: Get.find()));
  }
}
