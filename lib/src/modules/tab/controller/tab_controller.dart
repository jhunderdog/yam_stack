import 'package:get/get.dart';
import 'package:yam_stack/api/api_repository.dart';
import 'package:yam_stack/shared/enums/main_tabs.dart';
import 'package:yam_stack/src/models/request/yam_list_request.dart';
import 'package:yam_stack/src/modules/feed/screen/feed_screen.dart';
import 'package:yam_stack/src/modules/list/screen/list_screen.dart';
import 'package:yam_stack/src/modules/profile/screen/profile_screen.dart';


import '../screen/tab.dart';

class TabsController extends GetxController {




  var currentTab = MainTabs.list.obs;

  late ListScreen list;
  late FeedScreen feed;
  late ProfileScreen profile;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("tabs init");
    list = ListScreen();
    feed = FeedScreen();
    profile = ProfileScreen();


  }




  void switchTab(index) {
    var tab = _getCurrentTab(index);
    currentTab.value = tab;
    update();

  }

  int getCurrentIndex(MainTabs tab) {
    switch (tab) {
      case MainTabs.list:
        return 0;
      case MainTabs.feed:
        return 1;
      case MainTabs.profile:
        return 2;
      default:
        return 0;
    }
  }

  MainTabs _getCurrentTab(int index) {
    switch (index) {
      case 0:
        return MainTabs.list;
      case 1:
        return MainTabs.feed;
      case 2:
        return MainTabs.profile;
      default:
        return MainTabs.list;
    }
  }


}