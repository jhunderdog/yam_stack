import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yam_stack/shared/constants/color.dart';
import 'package:yam_stack/shared/constants/font.dart';
import 'package:yam_stack/shared/utils/regex.dart';
import 'package:yam_stack/shared/utils/size_config.dart';
import 'package:yam_stack/src/components/back_button_app_bar.dart';
import 'package:yam_stack/src/components/rectangle_button.dart';

class VerificationScreen extends StatelessWidget {
  var arguments  = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                title: BackButtonAppBar(backButtonNavTitle: "회원가입",)
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: SizeConfig().screenWidth / 5,
                        ),
                        Text(
                          "${arguments[1]}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: FontName.notoSansRegular,
                              fontSize: 18,
                              color: color696969),
                        ),
                        SizedBox(
                          height: 28,
                        ),
                        Text(
                          "등록된 이메일로 인증번호가 발송되었습니다\n 인증번호를 확인해 주세요",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: FontName.notoSansRegular,
                              fontSize: 16,
                              color: color202020),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "등록된 이메일로 발송된 인증번호 6자리를 입력해주세요",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: FontName.notoSansRegular,
                              fontSize: 16,
                              color: colorD9D9D9),
                        ),
                        SizedBox(
                          height: SizeConfig().screenWidth / 5,
                        ),
                        Container(
                          height: 17,
                          color: colorD9D9D9,
                        ),
                      ],
                    )),

                Form(
                  key: arguments[0].verificationFormKey,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 34,),
                          Text(
                            "인증번호 입력",

                            style: TextStyle(

                                fontSize: 16,
                                color: color696969,
                                fontFamily: FontName.notoSansRegular),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: TextFormField(
                                  controller: arguments[0].verificationController,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  decoration: const InputDecoration(
                                      hintText: '인증번호를 입력해주세요.',
                                      hintStyle: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "NotoSans-Regular",
                                          color: colorD9D9D9)
                                  ),
                                ),
                              ),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      arguments[0].reVerification(arguments[1]);

                                    },
                                    child: Container(
                                      height: 28,
                                      width: 96,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color: Colors.black),
                                      child: Center(
                                          child: Text(
                                            "인증 번호 재전송",
                                            style: TextStyle(
                                              fontFamily: FontName.notoSansRegular,
                                              fontSize: 12,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          )),
                                    ),
                                  ))
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                )


              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: RectangleButton(
                textStyle: TextStyle(
                    fontFamily: FontName.notoSansRegular,
                    color: Colors.black,
                    fontSize: 18),
                height: 55,
                width: SizeConfig().screenWidth,
                buttonTitle: "확인",
                elevationWidth: 0,
                buttonColor: colorFFD74A,
                pressed: () {
                  arguments[0].verification(context,arguments[1]);
                }),
          )
        ],
      ),
    );
  }
}
