import 'package:flutter/material.dart';
import 'package:yam_stack/shared/constants/color.dart';
import 'package:yam_stack/src/components/underline_button.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //이메일 , 닉네임 , 비밀번호, 비밀번호 확

    final minHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: AppBar(
        title: Text("회원가입"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: minHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 29,),
                  Text(
                    "필수정보",
                    style: TextStyle(fontSize: 18),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: '이메일을 입력해주세요',
                      labelText: '이메일',
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: '닉네임을 입력해주세요',
                      labelText: '닉네임',
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: '8~16자 영문,숫자,특수문자 사용',
                      labelText: '비밀번호',
                    ),
                    obscureText: true,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: '입력한 비밀번호와 동일',
                      labelText: '비밀번호 재확인',
                    ),
                    obscureText: true,
                  ),
                  Container(
                    height: 17,
                    color: colorD9D9D9,
                  ),
                  Text(
                    "약관 동의",
                    style: TextStyle(fontSize: 18),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UnderLineButton(
                        buttonTitle: "서비스 이용약관(필수)",
                        buttonColor: colorD9D9D9,
                        pressed: () {},
                      ),
                      UnderLineButton(
                        buttonTitle: "(필수)",
                        buttonColor: colorD9D9D9,
                        pressed: () {},
                      ),
                    ],
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                        onPressed: () {},
                        child: const Text('Bottom Button!',
                            style: TextStyle(fontSize: 20)),
                        color: Colors.blue,
                        textColor: Colors.white,
                        elevation: 5,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
