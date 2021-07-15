import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yam_stack/shared/constants/color.dart';
import 'package:yam_stack/shared/utils/size_config.dart';
import 'package:yam_stack/src/components/home_flexible_appbar.dart';
import 'package:yam_stack/src/components/list_filter_dialog.dart';
import 'package:yam_stack/src/components/search_widget.dart';
import 'package:yam_stack/src/controller/list_controller.dart';
import 'package:yam_stack/src/pages/review_write_screen.dart';

import 'list_add_screen.dart';

class ListScreen extends GetView<ListController> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
          SliverAppBar(
          elevation: 0.5,
          expandedHeight: SizeConfig().screenHeight / 2.3,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                      "assets/images/bg2_fixed.jpg",
                      fit: BoxFit.cover,
                    )),
                HomeFlexibleAppBar(),
              ],
            ),
          ),
          pinned: false,
          floating: false,
        ),
        SliverAppBar(
          toolbarHeight: 15,
          primary: false,
          floating: false,
          pinned: true,
          brightness: Brightness.light,
          elevation: 0.0,
          flexibleSpace: Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
        ),
        SliverAppBar(
          toolbarHeight: 50,
          elevation: 0.5,
          pinned: true,
          backgroundColor: Colors.white,
          flexibleSpace: FlexibleSpaceBar(
            title: AppBar(
              title: GestureDetector(
                onTap: () {},
                child: PopupMenuButton(
                  offset: Offset(0, 25),
                  shape: ShapeBorder.lerp(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      1),
                  onSelected: (menu) {

                    // setState(() {
                    //   currentMenu = menu;
                    // });
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      // PopupMenuItem<String>(value: menu[0], child: Text(menu[0])),
                      // PopupMenuItem<String>(value: menu[1], child: Text(menu[1])),
                    ];
                  },
                  child: Row(
                    children: [
                      Text(
                        "",
                        //currentMenu,
                        style: TextStyle(fontSize: 20.0),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset("assets/icons/Dropdown.svg"),
                    ],
                  ),
                ),
              ),
              elevation: 0,
              actions: [
                IconButton(
                  icon: SvgPicture.asset("assets/icons/Filter icon N.svg"),
                  onPressed: () {
                    listFilterDialog(context, {
                      'region1': '서울시',
                      'region2': '동작구',
                      'category': '양식',
                      'tags': '맛있는'
                    }).then((Map<String, dynamic> filters) {
                      // setState(() {
                      //   print(filters['category']);
                      // });
                    });
                  },
                ),
              ],
            ),
            titlePadding: EdgeInsets.all(0.0),
          ),
        ),
        SliverAppBar(
          toolbarHeight: 70,
          primary: true,
          pinned: true,
          brightness: Brightness.light,
          elevation: 0.0,
          flexibleSpace: SearchWidget(
            text: "",
            hintText: "Search",
            onChanged: null,
            searchBarOn: null,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                Divider(
                  height: 1,
                ),
                Container(
                  child: ListTile(
                    onTap: () {
                      Get.to(() => ReviewWriteScreen(id: 0));
                    },
                    title: Text(
                      controller.response.content![index]!.restaurant!.name!,
                      style: TextStyle(
                        fontFamily: "NotoSans-Regular",
                        fontSize: 18,
                        color: color202020,
                      ),
                    ),
                    tileColor: Colors.white,
                    //leading: foodsIconReturn(item.category2depth),
                    subtitle: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "위치",
                              style: TextStyle(
                                fontFamily: "NotoSans-Regular",
                                fontSize: 14,
                                color: colorD9D9D9,
                              ),
                            ),
                            Text(
                              " | ",
                              style: TextStyle(
                                fontFamily: "NotoSans-Regular",
                                fontSize: 14,
                                color: colorD9D9D9,
                              ),
                            ),
                            Text(
                              "3.2km",
                              style: TextStyle(
                                fontFamily: "NotoSans-Regular",
                                fontSize: 14,
                                color: colorD9D9D9,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "#계절과일 ",
                              style: TextStyle(
                                fontFamily: "NotoSans-Regular",
                                fontSize: 14,
                                color: color696969,
                              ),
                            ),
                            Text(
                              "#배달쌉가능 ",
                              style: TextStyle(
                                fontFamily: "NotoSans-Regular",
                                fontSize: 14,
                                color: color696969,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.warning,
                          size: 20,
                          color: colorFFD74A,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  color: colorEEEEEE,
                )
              ]
              ,
            );
          }, childCount: controller.response.content == null ? 0 : controller.response.content!.length),



        )],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorFFD74A,
        child: SvgPicture.asset("assets/icons/FB.svg"),
        onPressed: () {

         // Get.to(() => ListAddScreen());
        },
      ),
    ),);
  }
}
