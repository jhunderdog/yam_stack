import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yam_stack/routes/app_pages.dart';
import 'package:yam_stack/shared/constants/color.dart';
import 'package:yam_stack/shared/constants/font.dart';
import 'package:yam_stack/shared/utils/size_config.dart';
import 'package:yam_stack/src/components/back_button_app_bar.dart';
import 'package:yam_stack/src/components/rectangle_button.dart';
import 'package:yam_stack/src/modules/auth/controller/auth_controller.dart';

class VerificationCompleteScreen extends StatelessWidget {
  final AuthController controller = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
              appBar: AppBar(
                shadowColor: Colors.transparent,
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                title: BackButtonAppBar(backButtonNavTitle: "회원가입",),
              ),
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,

                  // crossAxisAlignment: ,
                  children: [
                    Text(
                      "🤗",
                      style: TextStyle(fontSize: 34),
                    ),
                    Text(
                      "완료되었습니다",
                      style: TextStyle(
                          fontFamily: FontName.notoSansRegular,
                          fontSize: 28,
                          color: color202020),
                    ),
                    Text(
                      "나만의 맛집 리스트를 작성해보세요",
                      style: TextStyle(
                          fontFamily: FontName.notoSansRegular,
                          fontSize: 14,
                          color: colorD9D9D9),
                    ),
                  ],
                ),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: RectangleButton(
                textStyle: TextStyle(
                    fontFamily: "NotoSans-Regular",
                    color: Colors.black,
                    fontSize: 16),
                height: 55,
                width: SizeConfig().screenWidth,
                buttonTitle: "첫 리스트 작성하러 가기",
                elevationWidth: 0,
                buttonColor: colorFFD74A,
                pressed: () {
                  Get.offAndToNamed(Routes.HOME);
                }),
          )
        ],
      ),
    );
  }
}
