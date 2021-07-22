
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yam_stack/shared/constants/color.dart';
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
            "얌얌리스트",
            MainTabs.list == controller.currentTab.value
                ? "얌얌리스트_select.svg"
                : "얌얌리스트.svg",
          ),
          _buildNavigationBarItem(
            "여기얌",
            MainTabs.feed == controller.currentTab.value
                ? "여기얌_select.svg"
                : "여기얌.svg",
          ),
          _buildNavigationBarItem(
            "나얌",
            MainTabs.profile == controller.currentTab.value
                ? "나얌_select.svg"
                : "나얌.svg",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: color959595,
        currentIndex: controller.getCurrentIndex(controller.currentTab.value),
        selectedItemColor: color202020,
        unselectedLabelStyle: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.bold,
        ),
        selectedLabelStyle: TextStyle(
          fontSize: 9,
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
      icon: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SvgPicture.asset('assets/icons/$svg',width: 20,height: 20,),
      ),
      label: label,
    );
  }
}



