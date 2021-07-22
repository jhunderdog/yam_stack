import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yam_stack/routes/app_pages.dart';
import 'package:yam_stack/shared/constants/color.dart';
import 'package:yam_stack/shared/constants/font_style.dart';
import 'package:yam_stack/src/components/rectangle_button.dart';
import 'package:yam_stack/src/modules/auth/controller/auth_controller.dart';


class AuthScreen extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/intro.jpg"),
                fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage("assets/images/logo.png")),
                Text(
                  "나만의 맛집 리스트 , 얌 스택",
                  style: AppTextStyle.notoSansRegular1823(color: Colors.white),
                ),
                RectangleButton(
                  textStyle: TextStyle(fontFamily: "NotoSans-Regular",color: Colors.white,fontSize: 16),
                  width: width,
                  buttonTitle: "로그인",
                  buttonColor: colorFFD74A,
                  pressed: () {
                    print("로그인");
                    Get.toNamed(Routes.AUTH + Routes.LOGIN, arguments: controller);
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                RectangleButton(
                  textStyle: TextStyle(fontFamily: "NotoSans-Regular",color: Colors.white,fontSize: 16),
                  width: width,
                  buttonTitle: "회원가입",
                  buttonColor: Colors.transparent,
                  pressed: () {
                    Get.toNamed(Routes.AUTH + Routes.REGISTER, arguments: controller);
                  },
                ),
                SizedBox(
                  height: 26,
                ),
              ],
            ),
          )),
    );
  }
}
