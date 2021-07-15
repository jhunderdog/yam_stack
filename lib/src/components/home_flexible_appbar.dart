import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:yam_stack/shared/constants/color.dart';
import 'package:yam_stack/shared/utils/size_config.dart';

class HomeFlexibleAppBar extends StatelessWidget {
  final double appBarHeight = 66.0;
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: statusBarHeight),
        // height: statusBarHeight + appBarHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "이 구역 맛집을 좀 아는",
                      style: TextStyle(
                        fontSize: 22.0,
                        color: color202020,
                        fontFamily: "NotoSans-Regular",
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "얌얌박사 😎 ",
                      style: TextStyle(
                        fontFamily: "NotoSans-Bold",
                        fontSize: 28.0,
                        color: color202020,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '달성률 64%',
                          style: TextStyle(
                            fontFamily: "NotoSans-Medium",
                            fontSize: 16.0,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          width: SizeConfig().screenWidth * 0.8,
                          height: 14,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            child: LinearProgressIndicator(
                              color: colorFFD74A,
                              value: 0.5,
                              backgroundColor: Colors.grey[200],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
