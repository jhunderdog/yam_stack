import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yam_stack/api/api_repository.dart';
import 'package:yam_stack/shared/enums/restaurant_list_mode.dart';
import 'package:yam_stack/shared/utils/focus.dart';
import 'package:yam_stack/src/models/request/add_restaurant_list_request.dart';
import 'package:yam_stack/src/models/request/restaurant_request.dart';
import 'package:yam_stack/src/models/request/yam_list_request.dart';
import 'package:yam_stack/src/models/response/add_restaurant_list_response.dart';
import 'package:yam_stack/src/models/response/get_restaurant_info_request.dart';
import 'package:yam_stack/src/models/response/restaurant_response.dart';
import 'package:yam_stack/src/models/response/yam_list_response.dart';

class FeedController extends GetxController {
  final ApiRepository apiRepository;

  FeedController({required this.apiRepository});

  int restaurantListPage = 0;
  int restaurantListSize = 10;


  var restaurantInfoResponse = GetRestaurantInfoResponse().obs;
  var addRestaurantListResponse = AddRestaurantListResponse().obs;


  /*
   여기 가까워, 여기 갈래 , 여기 강추 , 여기 가봤어
  */


  List typeList = ["여기 가까워", "여기갈래", "여긴 강추", "여긴 가봤어"].obs;
  List<RestaurantResponse> restaurantResponseList = [];
  var nearRestaurantListResponse = RestaurantResponse().obs;
  var wantRestaurantListResponse = RestaurantResponse().obs;
  var recommendRestaurantListResponse = RestaurantResponse().obs;
  var doneRestaurantListResponse = RestaurantResponse().obs;


  //Detail Page
  final RxString mode = "want".obs;
  var restaurantListResponse = RestaurantResponse().obs;


  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    restaurantList("near");
    restaurantList("want");
    restaurantList("recommend");
    restaurantList("done");


    debounce(mode, restaurantModeList, time: Duration(microseconds: 500));
    print("feed init");
  }

  @override
  void onReady() async {
    super.onReady();
  }


  @override
  void onClose() {
    // TODO: implement onClose

    super.onClose();
  }


  //----------------------------------------------
  /* 3. 식당
  * 3.1 식당 리스트 추가
  * 3.2 식당 정보 가져오기
  * 3.3 식당 리스트 가져오기 (여기얌)
  * */
  //----------------------------------------------


  /* 3.3 식당 리스트 가져오기 (여기얌) */

  Future<void> restaurantList(String mode) async {
    final res = await apiRepository.postRestaurantList(
        restaurantListPage,
        restaurantListSize,
        RestaurantListRequest(mode: mode, x: "120.123456", y: "36.123456"));

    switch (mode) {
      case "want":
        wantRestaurantListResponse.value = res!;
        restaurantResponseList.add(res);
        break;
      case "near":
        nearRestaurantListResponse.value = res!;
        restaurantResponseList.add(res);
        break;
      case "recommend":
        recommendRestaurantListResponse.value = res!;
        restaurantResponseList.add(res);
        break;
      case "done":
        doneRestaurantListResponse.value = res!;
        restaurantResponseList.add(res);
        break;
    }
  }


  Future<void> restaurantModeList(String mode) async {
    final res = await apiRepository.postRestaurantList(
        restaurantListPage,
        restaurantListSize,
        RestaurantListRequest(mode: mode, x: "120.123456", y: "36.123456"));

    restaurantListResponse.value = res!;
  }


  /* 3.2 식당 정보 가져오기 */

  Future<void> restaurantInfo() async {
    final res = await apiRepository.getRestaurantInfo(127);

    restaurantInfoResponse.value = res!;
  }

  /*
    int? id;
  String? apiId;
  String? name;
  String? addName;
  String? roadAddName;
  String? region1depth;
  String? region2depth;
  String? region3depth;
  String? x;
  String? y;
  String? category1depth;
  String? category2depth;
  int? closedCount;
   */


  /* 3.1 식당 리스트 추가 */

  Future<void> addRestaurantList() async {
    final res = await apiRepository.postAddRestaurantList(
        AddRestaurantListRequest(
            id: "123451111111116",
            placeName: "얌스택 식당ㅁㄴㅇㄹㅁㅇㄴㄹㅁㅇ",
            categoryName: "음식점 > 한식 > 분식",
            categoryGroupCode: "",
            categoryGroupName: "",
            phone: "010-1234-1234",
            addressName: "라라라라라라라랄",
            roadAddressName: "뱌뱌뱌ㅑ뱌뱌",
            x: "123.123123213213",
            y: "123.12312301203",
            placeUrl: "naver.com",
            foods: ["김치볶음밥", "김치"],
            tags: ["미슐랭", "분식"],
            memo: "맛있는 식"
        ));

    addRestaurantListResponse.value = res!;
  }


}