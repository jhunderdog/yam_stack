import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yam_stack/shared/constants/color.dart';
import 'package:yam_stack/shared/utils/regex.dart';
import 'package:yam_stack/shared/utils/size_config.dart';
import 'package:yam_stack/src/components/back_button_app_bar.dart';
import 'package:yam_stack/src/components/rectangle_button.dart';
import 'package:yam_stack/src/components/underline_button.dart';
import 'package:yam_stack/src/modules/auth/controller/auth_controller.dart';


import '../../feed/screen/feed_screen.dart';


class LoginScreen extends StatelessWidget {
  final AuthController controller = Get.arguments;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: BackButtonAppBar(
          backButtonNavTitle: "로그인",
        ),
      ),
      body: Form(
        key: controller.loginFormKey,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  SizedBox(
                    height: 28,
                  ),
                  TextFormField(
                    controller: controller.loginEmailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      labelText: '이메일',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    // onSaved: (value) {
                    //   controller.loginEmail.value = value!;
                    // },
                    onChanged: (value) {
                      controller.loginEmail.value = value;
                    },
                    keyboardType: TextInputType.text,
                    // validator: (value) {
                    //   return controller.validateEmail(value!);
                    // }),
                  ),
                  SizedBox(
                    height: 44,
                  ),
                  TextFormField(
                    controller: controller.loginPasswordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      labelText: '비밀 번호',
                    ),
                    onChanged: (value) {
                      controller.loginPassword.value = value;
                    },
                    validator: (value) {
                      return controller.validatePassword(value!);
                    },
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 54,
                  ),
                  Obx(() => RectangleButton(
                    textStyle: TextStyle(
                        fontFamily: "NotoSans-Regular",
                        color: color202020.withOpacity(0.2),
                        fontSize: 16),
                    width: SizeConfig().screenWidth,
                    buttonTitle: "로그인",
                    buttonColor: controller.loginBtnColor.value,
                    elevationWidth: 0,
                    pressed: () {
                      controller.login(context);
                    },
                  )),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: () {}, child: Text("회원가입")),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 10,
                        width: 1,
                        color: colorD9D9D9,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TextButton(onPressed: () {}, child: Text("비밀번호 찾기")),
                    ],
                  ),
                  UnderLineButton(
                    buttonTitle: "둘러보기",
                    buttonColor: colorD9D9D9,
                    pressed: () {
                      Get.to(FeedScreen());
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
