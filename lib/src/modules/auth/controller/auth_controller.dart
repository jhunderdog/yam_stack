import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yam_stack/api/api_repository.dart';

import 'package:yam_stack/routes/app_pages.dart';
import 'package:yam_stack/shared/constants/color.dart';
import 'package:yam_stack/shared/constants/storage.dart';
import 'package:yam_stack/shared/utils/common_widget.dart';
import 'package:yam_stack/shared/utils/focus.dart';
import 'package:yam_stack/shared/utils/regex.dart';
import 'package:yam_stack/src/models/request/login_request.dart';
import 'package:yam_stack/src/models/request/re_verifiation_request.dart';
import 'package:yam_stack/src/models/request/register_request.dart';
import 'package:yam_stack/src/models/request/verification_request.dart';


class AuthController extends GetxController {
  final ApiRepository apiRepository;

  AuthController({required this.apiRepository});

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final registerConfirmPasswordController = TextEditingController();
  final registerNicknameController = TextEditingController();




  bool registerTermsChecked = true;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  RxString loginEmail = "".obs;
  final loginPassword = "".obs;
  final loginBtnColor = colorD9D9D9.obs;
  RxBool isValidLoginButton = false.obs;

  String nameStatus = "false";

  final GlobalKey<FormState> verificationFormKey = GlobalKey<FormState>();
  final verificationController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    // debounce(loginEmail, validateEmail,time: Duration(microseconds: 500));
    debounce(loginEmail,formLoginIsValid , time: Duration(microseconds: 500));
    debounce(loginPassword,formLoginIsValid , time: Duration(microseconds: 500));


  }

  @override
  void onReady() {
    super.onReady();



  }





  /* 회원가입 */

  void register(BuildContext context) async {
    AppFocus.unfocus(context);
    if (registerFormKey.currentState!.validate()) {
      if (!registerTermsChecked) {
        CommonWidget.toast('Please check the terms first.');
        return;
      }

      final res = await apiRepository.register(
        RegisterRequest(
            email: registerEmailController.text,
            password: registerPasswordController.text,
            name: registerNicknameController.text),
      );

      print("$res 결과는?");
      if (res!.status == 200) {
        Get.offAndToNamed(Routes.AUTH + Routes.VERIFICATION, arguments: [
          AuthController(apiRepository: Get.find()),
          registerEmailController.text
        ]);
      }
    }
  }

  /* 로그인 */

  void login(BuildContext context) async {
    AppFocus.unfocus(context);
    if (loginFormKey.currentState!.validate()) {
      final res = await apiRepository.login(
        LoginRequest(
          email: loginEmailController.text,
          password: loginPasswordController.text,
        ),
      );

      print("$res 결과는?");

      final prefs = Get.find<SharedPreferences>();
      if (res!.message.isNotEmpty) {
        prefs.setString(StorageConstants.accessToken, res.accessToken);
        prefs.setString(StorageConstants.refreshToken, res.refreshToken);
        Get.offAndToNamed(Routes.HOME);
      }
    }
  }

  String? validateEmail(String value) {
    if(!Regex.isEmail(value)) {
      isValidLoginButton.value = false;
      return "Provide valid email";
    } else {
      isValidLoginButton.value = true;
    }
    return null;
  }

  String? validatePassword(String value) {
    if(!Regex.isPassword(value) ) {
      return "Provide valid password";
    } else {
      update();
    }
    return null;
  }


  formLoginIsValid(String value)  {


    if (Regex.isEmail(loginEmail.value) && Regex.isPassword(loginPassword.value)) {
      print("true");
      loginBtnColor.value = colorFFD74A;
    } else {
      print("false");
      loginBtnColor.value = colorD9D9D9;
    }
  }

  /* 닉네임 중복 체크 */

  Future<void> nameCheck() async {
    final res = await apiRepository.checkName(registerNicknameController.text);

    var text = registerNicknameController.text;
    print(text);

    if (res!.message == "false") {
      Get.defaultDialog(title: "사용 불가능한 닉네임입니다.");
    } else {
      Get.defaultDialog(title: "사용가능한 닉네임입니다.");
    }
  }


  /* 인증 번호 재 전송 */

  Future<void> reVerification(String email) async {
    final res =
    await apiRepository.reVerification(ReVerificationRequest(email: email));

    if (res!.status == 200) {
      Get.defaultDialog(title: "인증 번호가 재 전송 되었습니다.");
    }
  }

  void verification(BuildContext context, String email) async {
    AppFocus.unfocus(context);
    if (verificationFormKey.currentState!.validate()) {
      final res = await apiRepository.verification(
        VerificationRequest(
          email: email,
          authCode: verificationController.text,
        ),
      );

      print("$res 결과는?");

      final prefs = Get.find<SharedPreferences>();
      if (res!.message.isNotEmpty) {
        prefs.setString(StorageConstants.accessToken, res.accessToken);
        prefs.setString(StorageConstants.refreshToken, res.refreshToken);
        Get.offAndToNamed(Routes.AUTH + Routes.VERIFICATIONCOMPLETE, arguments:
        AuthController(apiRepository: Get.find()));
      }
    }
  }

  @override
  void onClose() {
    super.onClose();

    registerEmailController.dispose();
    registerPasswordController.dispose();
    registerConfirmPasswordController.dispose();
    registerNicknameController.dispose();

    loginEmailController.dispose();
    loginPasswordController.dispose();
  }
}
