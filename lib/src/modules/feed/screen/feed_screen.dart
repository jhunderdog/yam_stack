import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yam_stack/routes/app_pages.dart';
import 'package:yam_stack/shared/constants/color.dart';
import 'package:yam_stack/shared/constants/font.dart';
import 'package:yam_stack/src/modules/feed/controller/feed_controller.dart';




class FeedScreen extends GetView<FeedController> {
  @override
  Widget build(BuildContext context) {
    bool _pinned = true;
    bool _snap = false;
    bool _floating = false;
    bool _listPinned = false;
    String message = "여기얌";
    double height2 = 40.0;

    return Scaffold(
      body: Obx(() =>  CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            elevation: 0,
            expandedHeight: 128,
            flexibleSpace: FlexibleSpaceBar(
                title: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 64, left: 16),
                    child: Row(
                      children: [
                        Text(message,style: TextStyle(fontFamily: FontName.notoSansBold,fontSize: 20,color: color202020),),
                      ],
                    ),
                  ),
                )),
          ),
          SliverPersistentHeader(
            pinned: _listPinned,
            floating: _listPinned,
            delegate: _SliverAppBarDelegate(
                child: PreferredSize(
                  preferredSize: Size.fromHeight(40.0),
                  child: GridView.builder(
                    itemCount: 20,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        color: Colors.purple,
                        height: 38,
                        child: Text('$index'),
                      );
                    },
                  ),
                )),
          ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                        color: Colors.white,
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Text(controller.typeList[index],
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black)),
                                  TextButton(
                                      onPressed: () {

                                        controller.getModeName(controller.typeList[index]);

                                        Get.toNamed(Routes.HOME + Routes.FEEDDETAILSCREEN,arguments: [controller,controller.typeList[index]]);
                                      },
                                      child: Text(
                                        "모두 보기 >",
                                        style: TextStyle(
                                            color: Colors.black),
                                      ))
                                ]))),
                    Container(
                      height: 153.0,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.restaurantResponseList[index]
                            .content! != null ? controller.restaurantResponseList[index]
                            .content!.length : 0 ,
                        itemBuilder: (context, index2) {
                          return GestureDetector(
                            child: Container(
                                color: Colors.white,
                                height: 88,
                                width: 100,
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Image.network(controller.restaurantResponseList[index].content![index2]!.reviews!.length != 0 ?
                                    "${controller.restaurantResponseList[index].content![index2]!.reviews![0]!.imagePath}" : ""),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text("${controller.restaurantResponseList[index].content![index2]!.restaurant!.name}"),
                                    SizedBox(
                                      height: 1,
                                    ),
                                    Text(controller
                                        .nearRestaurantListResponse
                                        .value
                                        .content![index]!
                                        .restaurant!
                                        .category1depth!)
                                  ],
                                )),
                            onTap: () {
                              print(123);
                            },
                          );
                        },
                      ),
                    )
                  ],
                );
              },
              childCount: controller.typeList.length !=0 ? controller.typeList.length : 0 ,
            ),
          ),
        ],
      ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final PreferredSize child;

  _SliverAppBarDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return child;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => child.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
}
