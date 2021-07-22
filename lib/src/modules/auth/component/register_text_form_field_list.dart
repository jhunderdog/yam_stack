import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yam_stack/shared/constants/color.dart';
import 'package:yam_stack/shared/constants/font.dart';
import 'package:yam_stack/shared/constants/font_style.dart';
import 'package:yam_stack/shared/utils/regex.dart';
import 'package:yam_stack/src/components/rectangle_button.dart';
import 'package:yam_stack/src/modules/auth/controller/auth_controller.dart';

class register_text_form_field_list extends StatelessWidget {
  const register_text_form_field_list({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "필수정보",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 35,
            ),
            TextFormField(
              controller: controller.registerEmailController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                hintText: '이메일을 입력해주세요',
                labelText: '이메일',
              ),
              keyboardType: TextInputType.text,
              validator: (value) {
                if (!Regex.isEmail(value!)) {
                  return '* 이메일 형식이 올바르지 않습니다';
                }

                if (value.isEmpty) {
                  return '* 이메일 형식이 올바르지 않습니다';
                }
                return null;
              },
            ),
            SizedBox(
              height: 32,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextFormField(
                    controller: controller.registerNicknameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      hintText: '닉네임을 입력해주세요.',
                      hintStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: "NotoSans-Regular",
                          color: colorD9D9D9),
                      labelText: '닉네임',
                    ),
                    validator: (value) {
                      if (!Regex.isNickname(value!)) {
                        return '* 닉네임은 한글, 영어, 숫자만 가능합니다';
                      }

                      if (value.isEmpty) {
                        return '* 닉네임은 한글, 영어, 숫자만 가능합니다';
                      }


                      return null;
                    },
                  ),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        controller.nameCheck();


                      },
                      child: Container(
                        height: 28,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.black),
                        child: Center(
                            child: Text(
                          "중복 확인",
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
            SizedBox(
              height: 32,
            ),
            TextFormField(
              controller: controller.registerPasswordController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                hintText: '8~16자 영문, 숫자, 특수문자 사용',
                labelText: '비밀 번호',
              ),
              validator: (value) {
                if (!Regex.isPassword(value!)) {
                  return '8~16자 영문, 숫자, 특수문자 사용';
                }

                if (value.isEmpty) {
                  return '8~16자 영문, 숫자, 특수문자 사용';
                }
                return null;
              },
              obscureText: true,
            ),
            SizedBox(
              height: 32,
            ),
            TextFormField(
              controller: controller.registerConfirmPasswordController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                hintText: '입력한 비밀번호와 동일',
                labelText: '비밀 번호 재확인',
              ),
              validator: (value) {
                if (value != controller.registerPasswordController.text) {
                  return '* 비밀번호 정보가 일치하지 않습니다';
                }
                return null;
              },
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}
