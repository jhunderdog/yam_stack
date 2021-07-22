import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yam_stack/src/modules/profile/screen/dropout_screen.dart';
import 'package:yam_stack/src/modules/profile/screen/nickname_change_screen.dart';
import 'package:yam_stack/src/modules/profile/screen/password_change_screen.dart';

class AccountScreen extends StatelessWidget {
  final controller = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("회원 정보 수정"),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              print("닉네임 변경");
              Get.to(() => NicknameChangeScreen(), arguments: controller);
            },
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                "닉네임 변경",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print("비밀번호 변경");
              Get.to(() => PasswordChangeScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                "비밀번호 변경",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print("회원탈퇴");
              Get.to(() => DropoutScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                "회원탈퇴",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
