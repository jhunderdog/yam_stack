import 'package:get/get.dart';
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

import 'base_provider.dart';

class ApiProvider extends BaseProvider {
  //----------------------------------------------
  /* 1. 회원
  * 1.1 로그인
  * 1.2 리프레시 토큰
  * 1.3 회원가입
  * 1.4 본인 인증
  * 1.5 닉네임 중복 체크
  * 1.6 인증 번호 재 전송
  * 1.8 비밀 번호 찾기
  *  */
  //----------------------------------------------

  /*1.1 로그인 */

  Future<Response> login(String path, LoginRequest data) {
    return post(path, data.toJson());
  }

  /*1.2 리프레시 토큰 */

  Future<Response> refreshToken(String path, RefreshTokenRequest data) {
    return post(path, data.toJson());
  }

  /*1.3 회원가입 */

  Future<Response> register(String path, RegisterRequest data) {
    return post(path, data.toJson());
  }

  /*1.4 본인인증 */

  Future<Response> verification(String path, VerificationRequest data) {
    return post(path, data.toJson());
  }

  /*1.4 닉네임 중복 체크 */

  Future<Response> checkName(String path) {
    return get(path);
  }

  /* 1.6 인증 번호 재 전송 */

  Future<Response> reVerification(String path, ReVerificationRequest data) {
    return post(path, data.toJson());
  }

  //----------------------------------------------
  /* 2. 사용자 계정
  * 2.2 사용자 계정 가져오기
  * 2.3 사용자 계정 수정하기
  * 2.4 사용자 계정 삭제하기
  * */
  //----------------------------------------------

  /* 2.2 사용자 계정 가져오기 */

  Future<Response> getAccount(String path) {
    return get(path);
  }

  /* 2.3.0 사용자 현재 비밀번호 확인하기 */

  Future<Response> passwdCheck(String path, PasswdCheckRequest data) {
    return post(path, data.toJson());
  }
  /* 2.3 사용자 계정 수정하기 */

  Future<Response> editAccount(String path, EditAccountRequest data) {
    return put(path, data.toJson());
  }

  /* 2.4 사용자 계정 삭제하기 */

  Future<Response> delAccount(String path) {
    return delete(path);
  }

  //----------------------------------------------
  /* 3. 식당
  * 3.1 식당 리스트 추가
  * 3.2 식당 정보 가져오기
  * 3.3 식당 리스트 가져오기 (여기얌)
  * */
  //----------------------------------------------

  /* 3.1 식당 리스트 추가 */

  Future<Response> postAddRestaurantList(
      String path, AddRestaurantListRequest data) {
    return post(path, data.toJson());
  }

  /* 3.2 식당 정보 가져오기 */

  Future<Response> getRestaurantInfo(String path) {
    return get(path);
  }

  /* 3.3 식당 리스트 가져오기 */

  Future<Response> postRestaurantList(String path, RestaurantListRequest data) {
    return post(path, data.toJson());
  }

  //----------------------------------------------
  /* 4. 얌 리스트
  * 4.1 필터 및 달성률 정보를 위한 metalInfo 가져오기
  * 4.2 얌 리스트 가져오기
  * 4.3 식당 정보에서 내 얌으로 가져오기
  * 4.4 얌 수정하기
  * 4.5 얌 완료 (후기 작성 안함)
  * 4.6 얌 삭제
  * */
  //----------------------------------------------

  /* 4.1 필터 및 달성률 정보를 위한 metaInfo 가져오기 */

  // Future<Response> getYamMetaInfo(String path) {
  //   return get(path);
  // }

  /* 4.2 얌 리스트 가져오기 */
  Future<Response> postYamList(String path, YamListRequest data) {
    return post(path, data.toJson());
  }

  /* 4.3 식당 정보에서 내 얌으로 가져오기 */
  Future<Response> getAddYamList(String path) {
    return get(path);
  }

  /* 4.4 얌 수정하기 */

  Future<Response> editYam(String path, YamEditRequest data) {
    return put(path, data.toJson());
  }

  /* 4.5 얌 완료 */

  Future<Response> visitYam(String path, VisitYamRequest data) {
    return put(path, data.toJson());
  }

  /* 4.6 얌 삭제 */

  Future<Response> deleteYam(String path) {
    return delete(path);
  }

  //----------------------------------------------
  /* 5. 리뷰
    * 5.1 리뷰 등록하기
    * 5.2 리뷰 조회하기
    * 5.3 리뷰 삭제하기
    * */
  //-----------------------------------------------

  /*  5.1 리뷰 등록하기 */
  Future<Response> postReview(String path, YamListRequest data) {
    return post(path, data.toJson());
  }

  /* 5.2 리뷰 조회하기 */
  Future<Response> reviewInfo(String path) {
    return get(path);
  }

  /* 5.3 리뷰 삭제하기 */

  Future<Response> delReview(String path, ReviewDeleteRequest data) {
    return put(path, data.toJson());
  }
}
