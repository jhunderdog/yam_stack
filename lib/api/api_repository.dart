import 'dart:async';
import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:yam_stack/src/models/request/add_restaurant_list_request.dart';
import 'package:yam_stack/src/models/request/edit_account_request.dart';
import 'package:yam_stack/src/models/request/passwd_check_request.dart';
import 'package:yam_stack/src/models/request/refresh_token_request.dart';
import 'package:yam_stack/src/models/request/review_delete_request.dart';
import 'package:yam_stack/src/models/request/visit_yam_request.dart';
import 'package:yam_stack/src/models/request/yam_edit_request.dart';
import 'package:yam_stack/src/models/response/get_restaurant_info_request.dart';
import 'package:yam_stack/src/models/request/login_request.dart';
import 'package:yam_stack/src/models/request/re_verifiation_request.dart';
import 'package:yam_stack/src/models/request/register_request.dart';
import 'package:yam_stack/src/models/request/restaurant_request.dart';
import 'package:yam_stack/src/models/request/verification_request.dart';
import 'package:yam_stack/src/models/request/yam_list_request.dart';
import 'package:yam_stack/src/models/response/account_response.dart';
import 'package:yam_stack/src/models/response/add_restaurant_list_response.dart';
import 'package:yam_stack/src/models/response/login_response.dart';
import 'package:yam_stack/src/models/response/meta_info_response.dart';
import 'package:yam_stack/src/models/response/normal_response.dart';
import 'package:yam_stack/src/models/response/passwd_check_response.dart';
import 'package:yam_stack/src/models/response/register_response.dart';
import 'package:yam_stack/src/models/response/restaurant_response.dart';
import 'package:yam_stack/src/models/response/review_response.dart';
import 'package:yam_stack/src/models/response/users_response.dart';
import 'package:yam_stack/src/models/response/yam_edit_response.dart';
import 'package:yam_stack/src/models/response/yam_list_response.dart';
import 'package:yam_stack/src/models/response/yam_normal_response.dart';

import 'api.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  //----------------------------------------------
  /* 1. 회원
  * 로그인
  * 리프레시 토큰
  * 회원가입
  * 본인 인증
  * 닉네임 중복 체크
  * 인증 번호 재 전송
  * 비밀 번호 찾기
  *  */
  //----------------------------------------------

  /*1.1 로그인 */

  Future<LoginResponse?> login(LoginRequest data) async {
    final res = await apiProvider.login('/login/sign', data);

    print("====🚀로그인  ${res.body} ${res.statusCode} ====");

    if (res.statusCode == 200) {
      EasyLoading.show(status: 'loading...');
      return LoginResponse.fromJson(res.body);
    }
  }

  /*1.2 리프레시 토큰 */

  Future<LoginResponse?> refreshToken(RefreshTokenRequest data) async {
    final res = await apiProvider.refreshToken('/login/refreshToken', data);

    print("====🚀리프레시 토큰  ${res.body} ${res.statusCode} ====");

    if (res.statusCode == 200) {
      EasyLoading.show(status: 'loading...');
      return LoginResponse.fromJson(res.body);
    }
  }

  /*1.3 회원가입  */

  Future<RegisterResponse?> register(RegisterRequest data) async {
    final res = await apiProvider.register('/login/join', data);

    print("====🚀회원가입  ${res.body} ${res.statusCode} ====");

    if (res.statusCode == 200) {
      return RegisterResponse.fromJson(res.body);
    }
  }

  /*1.4 인증 번호 */

  Future<LoginResponse?> verification(VerificationRequest data) async {
    final res = await apiProvider.verification('/login/identify', data);

    print("====🚀인증 번호  ${res.body} ${res.statusCode} ====");

    if (res.statusCode == 200) {
      var response = res.body;
      print(response);
      return LoginResponse.fromJson(res.body);
    }
  }

  /*1.6 닉네임 중복 체크 */

  Future<normalResponse?> checkName(String name) async {
    final res = await apiProvider.get('/login/nameCheck/$name');

    print("====🚀닉네임 중복 체크  ${res.body} ${res.statusCode} ====");

    if (res.statusCode == 200) {
      var response = res.body;
      print(response);
      return normalResponse.fromJson(res.body);
    }
  }

  /*1.7 인증 번호 재 전송 */
  Future<normalResponse?> reVerification(ReVerificationRequest data) async {
    final res = await apiProvider.reVerification('/login/authCode', data);

    print("====🚀인증 번호 재 전송  ${res.body} ${res.statusCode} ====");

    if (res.statusCode == 200) {
      var response = res.body;
      print(response);
      return normalResponse.fromJson(res.body);
    }
  }

  /*1.8 비밀번호 찾기*/

  //----------------------------------------------
  /* 2. 사용자 계정
  * 2.2 사용자 계정 가져오기
  * 2.3 사용자 계정 수정하기
  * 2.4 사용자 계정 삭제하기
  * */
  //----------------------------------------------

  /*2.2 사용자 게정 가져오기*/

  Future<AccountResponse?> getAccount() async {
    final res = await apiProvider.getAccount('/api/v1/account');

    print("====🚀사용자 계정 가져오기  ${res.statusCode} ${res.body} ====");

    if (res.statusCode == 200) {
      var response = res.body;
      print(response);
      return AccountResponse.fromJson(res.body);
    }
  }

  /*2.3.0 사용자 현재 비밀번호 확인*/
  Future<PasswdCheckResponse?> passwdCheck(PasswdCheckRequest data) async {
    final res =
        await apiProvider.passwdCheck('/api/v1/account/passwdCheck', data);
    print("====🚀사용자 현재 비밀번호 확인하기 ${res.statusCode} ${res.body} ====");
    if (res.statusCode == 200) {
      var response = res.body;
      return PasswdCheckResponse.fromJson(res.body);
    }
  }

  /*2.3 사용자 게정 수정하기*/

  Future<AccountResponse?> editAccount(EditAccountRequest data) async {
    final res = await apiProvider.editAccount('/api/v1/account', data);

    print("====🚀사용자 계정 수정하기 ${res.statusCode} ${res.body} ====");

    if (res.statusCode == 200) {
      var response = res.body;

      return AccountResponse.fromJson(res.body);
    }
  }

  /*2.4 사용자 게정 삭제하기*/

  Future<AccountResponse?> delAccount() async {
    final res = await apiProvider.delAccount('/api/v1/account');

    print("====🚀사용자 계정 삭제하기 ${res.statusCode} ${res.body} ====");

    if (res.statusCode == 200) {
      var response = res.body;

      return AccountResponse.fromJson(res.body);
    }
  }

  //----------------------------------------------
  /* 3. 식당
  * 3.1 식당 리스트 추가
  * 3.2 식당 정보 가져오기
  * 3.3 식당 리스트 가져오기 (여기얌)
  * */
  //----------------------------------------------

  /*3.1 식당 리스트 가져오기 */

  Future<AddRestaurantListResponse?> postAddRestaurantList(
      AddRestaurantListRequest data) async {
    final res =
        await apiProvider.postAddRestaurantList('/api/v1/restaurant', data);

    print("====🚀식당 리스트 가져오기 : 여기얌 ${res.statusCode} ${res.body} ====");

    if (res.statusCode == 200) {
      var response = res.body;

      return AddRestaurantListResponse.fromJson(res.body);
    }
  }

  /*3.2 식당 정보 가져오기 */

  Future<GetRestaurantInfoResponse?> getRestaurantInfo(int restaurantId) async {
    final res =
        await apiProvider.getRestaurantInfo('/api/v1/restaurant/$restaurantId');

    print("====🚀식당 정보 가져오기${res.statusCode} ${res.body} ====");

    if (res.statusCode == 200) {
      var response = res.body;

      return GetRestaurantInfoResponse.fromJson(res.body);
    }
  }

  /*3.3 식당 리스트 가져오기 : 여기얌*/

  Future<RestaurantResponse?> postRestaurantList(
      int page, int size, RestaurantListRequest data) async {
    final res = await apiProvider.postRestaurantList(
        '/api/v1/restaurant/list?page=$page&size=$size', data);

    print("====🚀식당 리스트 가져오기 : 여기얌 ${res.statusCode} ${res.body} ====");

    if (res.statusCode == 200) {
      var response = res.body;

      return RestaurantResponse.fromJson(res.body);
    }
  }

  //----------------------------------------------
  /* 4. 얌 리스트
  * 4.1 필터 및 달성률 정보를 위한 metaInfo 가져오기
  * 4.2 얌 리스트 가져오기
  * 4.3 식당 정보에서 내 얌으로 가져오기
  * 4.4 얌 수정하기
  * 4.5 얌 완료 (후기 작성 안함)
  * 4.6 얌 삭제
  * */
  //----------------------------------------------

  /*4.1 필터 및 달성률 정보를 위한 metaInfo 가져오기 */

  // Future<MetaInfoResponse?> getYamMetaInfo() async {
  //   final res = await apiProvider.getYamMetaInfo('/api/v1/yam/metaInfo');
  //
  //
  //   if (res.statusCode == 200) {
  //     var response =  res.body;
  //     print(response);
  //     return MetaInfoResponse.fromJson(res.body);
  //   }
  // }

  /*4.2 얌 리스트 가져오기 */
  Future<YamListResponse?> postYamList(
      int page, int size, String direction, YamListRequest data) async {
    final res = await apiProvider.postYamList(
        '/api/v1/yam/?page=$page&size=$size&direction=DESC', data);

    print("====🚀얌 리스트 가져오기? ${res.statusCode} ${res.body} ====");

    if (res.statusCode == 200) {
      var response = res.body;

      return YamListResponse.fromJson(res.body);
    }
  }

  /* 4.3 식당 정보에서 내 얌으로 가져오기 */
  Future<YamNormalResponse?> addYam(int restaurantId) async {
    final res =
        await apiProvider.getAddYamList('/api/v1/yam/restaurant/$restaurantId');

    print("====🚀식당 정보에서 내 얌으로 가져오기는? ${res.statusCode} ${res.body} ====");

    if (res.statusCode == 200) {
      var response = res.body;

      return YamNormalResponse.fromJson(res.body);
    }
  }

  /*4.4 얌 수정하기 */
  Future<YamEditReponse?> editYam(YamEditRequest data) async {
    final res = await apiProvider.editYam('/api/v1/yam', data);

    print("====🚀얌 수정하기는? ${res.statusCode} ${res.body} ====");

    if (res.statusCode == 200) {
      var response = res.body;

      return YamEditReponse.fromJson(res.body);
    }
  }

  /*4.5 얌 완료 (후기 작성 안함) */

  Future<YamNormalResponse?> visitYam(VisitYamRequest data) async {
    final res = await apiProvider.visitYam('/api/v1/yam/visit', data);

    print("====🚀얌 완료는? ${res.statusCode} ${res.body} ====");

    if (res.statusCode == 200) {
      var response = res.body;

      return YamNormalResponse.fromJson(res.body);
    }
  }

  /*4.6 얌 삭제 */

  Future<YamNormalResponse?> deleteYam(String isClosed, int yamId) async {
    final res =
        await apiProvider.deleteYam('/api/v1/yam/$yamId?isClosed=$isClosed');

    print("====🚀얌 삭제는? ${res.statusCode} ${res.body} ====");

    if (res.statusCode == 200) {
      var response = res.body;

      return YamNormalResponse.fromJson(res.body);
    }
  }

  //----------------------------------------------
  /* 5. 리뷰
    * 5.1 리뷰 등록하기
    * 5.2 리뷰 조회하기
    * 5.3 리뷰 삭제하기
    * */
  //-----------------------------------------------

  /* 5.1 리뷰 등록하기 */

  /* 5.2 리뷰 조회하기*/
  Future<ReviewResponse?> reviewInfo(int reviewId) async {
    final res = await apiProvider.reviewInfo('/api/v1/review/$reviewId');

    print("====🚀리뷰 조회하기 ${res.statusCode} ${res.body} ====");

    if (res.statusCode == 200) {
      var response = res.body;

      return ReviewResponse.fromJson(res.body);
    }
  }

  /* 5.3 리뷰 삭제하기*/

  Future<normalResponse?> delReview(ReviewDeleteRequest data) async {
    final res = await apiProvider.delReview('/api/v1/review/delete', data);

    print("====🚀리뷰 삭제하기 ${res.statusCode} ${res.body} ====");

    if (res.statusCode == 200) {
      var response = res.body;

      return normalResponse.fromJson(res.body);
    }
  }
}
