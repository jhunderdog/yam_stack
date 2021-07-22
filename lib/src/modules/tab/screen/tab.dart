
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yam_stack/shared/enums/main_tabs.dart';
import 'package:yam_stack/src/modules/tab/controller/tab_controller.dart';




class Tab extends GetView<TabsController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async => false,
      child: Obx(() => _buildWidget()),
    );
  }

  Widget _buildWidget() {
    return Scaffold(
      body: Center(
        child: _buildContent(controller.currentTab.value),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _buildNavigationBarItem(
            "Home",
            MainTabs.feed == controller.currentTab.value
                ? "icon_home_activited.svg"
                : "icon_home.svg",
          ),
          _buildNavigationBarItem(
            "Discover",
            MainTabs.list == controller.currentTab.value
                ? "icon_discover_activited.svg"
                : "icon_discover.svg",
          ),
          _buildNavigationBarItem(
            "Inbox",
            MainTabs.profile == controller.currentTab.value
                ? "icon_inbox_activited.svg"
                : "icon_inbox.svg",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        //unselectedItemColor: ColorConstants.black,
        currentIndex: controller.getCurrentIndex(controller.currentTab.value),
        //selectedItemColor: ColorConstants.black,
        selectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        onTap: (index) => controller.switchTab(index),
      ),
    );
  }

  Widget _buildContent(MainTabs tab) {
    switch (tab) {
      case MainTabs.list:
        return controller.list;
      case MainTabs.feed:
        return controller.feed;
      case MainTabs.profile:
        return controller.profile;
      default:
        return controller.list;
    }
  }

  BottomNavigationBarItem _buildNavigationBarItem(String label, String svg) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/svgs/$svg'),
      label: label,
    );
  }
}

