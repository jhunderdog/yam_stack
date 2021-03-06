import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yam_stack/shared/constants/color.dart';
import 'package:yam_stack/shared/constants/font.dart';
import 'package:yam_stack/shared/utils/size_config.dart';
import 'package:yam_stack/src/components/back_button_app_bar.dart';
import 'package:yam_stack/src/models/response/restaurant_response.dart';
import 'package:yam_stack/src/modules/feed/controller/feed_controller.dart';


class FeedDetailScreen extends StatelessWidget {

  final FeedController controller = Get.arguments[0];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 77,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: BackButtonAppBar(
              backButtonNavTitle: Get.arguments[1],
            ),
          ),
          Obx(() => SliverList(
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                color: Colors.white,
                height: 96,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 54.0,
                        height: 54.0,
                        child: SvgPicture.asset("assets/icons/디저트.svg")),
                    SizedBox(
                      width: 13,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.restaurantListResponse.value
                              .content![index]!.restaurant!.name!,
                          style: TextStyle(
                              fontFamily: FontName.notoSansRegular,
                              fontSize: 16,
                              color: color202020),
                        ),
                        Row(
                          children: [
                            Text(
                              controller.restaurantListResponse.value
                                  .content![index]!.restaurant!.category2depth!,
                              style: TextStyle(
                                  fontFamily: FontName.notoSansRegular,
                                  fontSize: 16,
                                  color: colorD9D9D9),
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            Container(
                              height: 14,
                              width: 1,
                              color: colorD9D9D9,
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            Text(
                              "${controller.restaurantListResponse.value
                                  .content![index]!.dist}km",
                              style: TextStyle(
                                  fontFamily: FontName.notoSansRegular,
                                  fontSize: 16,
                                  color: color545454),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "얌얌픽 1382",
                              style: TextStyle(
                                  fontFamily: FontName.notoSansRegular,
                                  fontSize: 14,
                                  color: color696969),
                            ),
                            SizedBox(
                              width: 13,
                            ),
                            Text(
                              "리뷰 321",
                              style: TextStyle(
                                  fontFamily: FontName.notoSansRegular,
                                  fontSize: 14,
                                  color: color696969),
                            ),
                          ],
                        ),
                        Container(
                          height: 1,
                          width: SizeConfig().screenWidth - 100,
                          color: colorEEEEEE,
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
                  childCount: controller.restaurantListResponse.value.content != null ?
                              controller.restaurantListResponse.value.content!.length : 0))
          )],
      ),
    );
  }
}
