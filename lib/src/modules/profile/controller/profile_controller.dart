import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yam_stack/api/api_repository.dart';
import 'package:yam_stack/shared/constants/storage.dart';
import 'package:yam_stack/shared/utils/focus.dart';
import 'package:yam_stack/src/models/request/edit_account_request.dart';
import 'package:yam_stack/src/models/request/passwd_check_request.dart';
import 'package:yam_stack/src/models/request/yam_list_request.dart';
import 'package:yam_stack/src/models/response/account_response.dart';
import 'package:yam_stack/src/models/response/passwd_check_response.dart';
import 'package:yam_stack/src/models/response/yam_list_response.dart';

class ProfileController extends GetxController {
  final ApiRepository apiRepository;
  ProfileController({required this.apiRepository});

  var response = AccountResponse().obs;
  var currentPasswordResponse = PasswdCheckResponse().obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    print("init!");
    getAccount();
    //editAccount();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  //----------------------------------------------
  /* 2. 사용자 계정
  * 2.2 사용자 계정 가져오기
  * 2.3 사용자 계정 수정하기
  * 2.4 사용자 계정 삭제하기
  * */
  //----------------------------------------------

// 로그아웃

  void logout() async {
    var storage = Get.find<SharedPreferences>();
    if (storage.getString(StorageConstants.accessToken) != null) {
      await storage.clear();
      // 바로 스플래시 화면을 갈것인가 ? //
      getAccount();
    }
  }
  /* 유저 정보 가져오기 */

  Future<void> getAccount() async {
    final res = await apiRepository.getAccount();

    response.value = res!;

    print("$response 응답은?");
  }

  /* 유저 현재 비밀번호 확인하기 */
  Future<void> passwdCheck(password) async {
    final res =
        await apiRepository.passwdCheck(PasswdCheckRequest(password: password));
    currentPasswordResponse.value = res!;
    print("$currentPasswordResponse 응답은?");
  }
  /* 유저 정보 수정하기 */

  Future<void> editAccount(newPassword, newName) async {
    final res = await apiRepository.editAccount(
        EditAccountRequest(newPassword: newPassword, newName: newName));

    response.value = res!;

    print("$response 응답은?");
  }

  /* 유저 정보 삭제하기 */

  Future<void> deleteAccount() async {
    final res = await apiRepository.delAccount();

    response.value = res!;

    print("$response 응답은?");
  }
}
