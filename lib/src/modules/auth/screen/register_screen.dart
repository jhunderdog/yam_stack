import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yam_stack/shared/constants/color.dart';
import 'package:yam_stack/shared/constants/font.dart';
import 'package:yam_stack/shared/utils/regex.dart';
import 'package:yam_stack/shared/utils/size_config.dart';
import 'package:yam_stack/src/components/back_button_app_bar.dart';
import 'package:yam_stack/src/components/rectangle_button.dart';
import 'package:yam_stack/src/components/underline_button.dart';
import 'package:yam_stack/src/modules/auth/component/register_text_form_field_list.dart';
import 'package:yam_stack/src/modules/auth/component/terms_list_container.dart';
import 'package:yam_stack/src/modules/auth/controller/auth_controller.dart';

class RegisterScreen extends StatelessWidget {
  final AuthController controller = Get.arguments;

  @override
  Widget build(BuildContext context) {
    //이메일 , 닉네임 , 비밀번호, 비밀번호 확

    final minHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top;

    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                title:BackButtonAppBar(backButtonNavTitle: "회원가입",)
            ),
            body: Form(
              key: controller.registerFormKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 29,
                    ),
                    register_text_form_field_list(controller: controller),
                    SizedBox(
                      height: 39,
                    ),
                    Container(
                      height: 17,
                      color: colorD9D9D9,
                    ),
                    TermsListContainer(),

                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: RectangleButton(
                textStyle: TextStyle(
                    fontFamily: FontName.notoSansRegular,
                    color: Colors.black,
                    fontSize: 18),
                width: SizeConfig().screenWidth,
                elevationWidth: 0,
                height: 55,
                buttonTitle: "회원가입",
                buttonColor: colorFFD74A,
                pressed: () {
                  controller.register(context);
                }),
          )
        ],
      ),
    );
  }
}
