import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yam_stack/shared/constants/color.dart';
import 'package:yam_stack/shared/utils/regex.dart';
import 'package:yam_stack/src/components/rectangle_button.dart';
import 'package:yam_stack/src/components/underline_button.dart';
import 'package:yam_stack/src/controller/auth_controller.dart';
import 'package:yam_stack/src/pages/feed_screen.dart';


class LoginScreen extends StatelessWidget {
  final AuthController controller = Get.arguments;
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("로그인"),
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
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      labelText: '이메일',
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (!Regex.isEmail(value!)) {
                        return 'Email format error.';
                      }

                      if (value.isEmpty) {
                        return 'Email is required.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 44,
                  ),
                  TextFormField(
                    controller: controller.loginPasswordController,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      labelText: '비밀 번호',
                    ),

                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required.';
                      }

                      if (value.length < 6 || value.length > 15) {
                        return 'Password should be 6~15 characters';
                      }

                      return null;
                    },
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 54,
                  ),
                  RectangleButton(
                      width: width,
                      buttonTitle: "로그인",
                      buttonColor: colorD9D9D9, pressed: () {
                        controller.login(context);
                  },),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: () {

                      }, child: Text("회원가입")),
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
