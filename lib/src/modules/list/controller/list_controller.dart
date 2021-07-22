import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yam_stack/api/api_repository.dart';
import 'package:yam_stack/shared/utils/focus.dart';
import 'package:yam_stack/src/models/request/add_restaurant_list_request.dart';
import 'package:yam_stack/src/models/request/visit_yam_request.dart';
import 'package:yam_stack/src/models/request/yam_edit_request.dart';
import 'package:yam_stack/src/models/request/yam_list_request.dart';
import 'package:yam_stack/src/models/response/add_restaurant_list_response.dart';
import 'package:yam_stack/src/models/response/yam_edit_response.dart';
import 'package:yam_stack/src/models/response/yam_list_response.dart';
import 'package:yam_stack/src/models/response/yam_normal_response.dart';

class ListController extends GetxController {
  final ApiRepository apiRepository;
  ListController({required this.apiRepository});

  RxInt yamListPage = 0.obs;
  int yamListSize = 10;
  String direction = "DESC";
  String region = "";
  String category = "";
  List<String> tags = [""];
  String searchName = "";
  int mode = 0;

  int deletemode = 3;

  var response = YamListResponse().obs;
  var addYamResponse = YamNormalResponse().obs;
  var editYamResponse = YamEditReponse().obs;
  var visitYamResonse = YamNormalResponse().obs;
  var yamListResponseContent = YamListResponseContentRestaurant().obs;

  var addRestaurantResponse = AddRestaurantListResponse().obs;

  var showList = [].obs;
  var deletedList = [].obs;
  //Search Query//

  var searchList = [].obs;
  var query = '';

  ScrollController scrollController = ScrollController();
  bool loading = false;
  bool allLoaded = false;
  /*
    ListAddScreen Properties
   */

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController restaurantNameController = TextEditingController();
  TextEditingController memoController = TextEditingController();

  var place_name = "".obs;
  var id;
  var category_name;
  var category_group_code;
  var category_group_name;
  var phone;
  var address_name;
  var road_address_name;
  var x;
  var y;
  var place_url;
  //kako modeling

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await yamList();
    await getdeletedList();
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          loading == false) {
        yamListPage.value = yamListPage.value + 1;
        if (yamListPage.value >= response.value.totalPages!.toInt()) {
          allLoaded = true;
        }
        if (allLoaded == true) {
          return;
        } else {
          print("new data call");
          yamList();
        }
      }
    });
    // makeShowList();
    //editYam();
    //visitYam();
    //deleteYam();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

    restaurantNameController.dispose();
    memoController.dispose();
    scrollController.dispose();
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

  /* 4.2 얌 리스트 가져오기 */

  Future<void> yamList() async {
    loading = true;
    final res = await apiRepository.postYamList(
        yamListPage.value,
        yamListSize,
        direction,
        YamListRequest(
            // region: region,
            // category: category,
            // tags: tags,
            // searchName: searchName,
            mode: mode));
    response.value = res!;
    makeShowList();
    makeSearchList();
    loading = false;
    // print("$response 응답은?");
  }

  Future<void> getdeletedList() async {
    final res = await apiRepository.postYamList(
        yamListPage.value,
        yamListSize,
        direction,
        YamListRequest(
            // region: region,
            // category: category,
            // tags: tags,
            // searchName: searchName,
            mode: deletemode));
    for (var item in res!.content!) {
      deletedList.add(item);
    }

    // print("$response 응답은?");
  }

  // 창 내에서 검색시 showlist 복원 //
  void makeShowList() {
    for (var item in response.value.content!) {
      showList.add(item);
    }
    print(showList.length);
  }

  void makeSearchList() {
    for (var item in response.value.content!) {
      searchList.add(item);
    }
  }

  // controller.response.value.content![index]!.restaurant!.name!,
  /* 4.3.0 카카오검색에서 얌 리스트 추가*/

  Future<void> postAddRestaurantList() async {
    final res =
        await apiRepository.postAddRestaurantList(AddRestaurantListRequest(
      addressName: address_name,
      categoryGroupCode: category_group_code,
      categoryGroupName: category_group_name,
      categoryName: category_name,
      id: id,
      phone: phone,
      placeName: place_name.value,
      placeUrl: place_url,
      roadAddressName: road_address_name,
      x: x,
      y: y,
      memo: memoController.text,
    ));

    addRestaurantResponse.value = res!;
    print("$addRestaurantResponse 응답은?");

    showList.value = [];
    searchList.value = [];
    loading = false;
    allLoaded = false;
    yamListPage.value = 0;

    yamList();
  }

  /* 4.3 식당 정보에서 내 얌으로 가져오기*/

  Future<void> addYam() async {
    final res = await apiRepository.addYam(127);

    addYamResponse.value = res!;

    print("$response 응답은?");
  }

  /* 4.4 얌 수정하기*/

  Future<void> editYam() async {
    final res = await apiRepository.editYam(YamEditRequest(
        id: 16, foods: ["추가음식"], tags: ["수정 태그", "추가 태그"], memo: "얌 수정"));

    editYamResponse.value = res!;

    print("$response 응답은?");
  }

  /* 4.5 얌 완료 (후기 작성 안함)*/

  Future<void> visitYam() async {
    final res =
        await apiRepository.visitYam(VisitYamRequest(id: 16, reVisit: true));

    visitYamResonse.value = res!;

    print("$response 응답은?");
  }

  /* 4.6 얌 삭제*/

  Future<void> deleteYam() async {
    final res = await apiRepository.deleteYam("false", 16);

    visitYamResonse.value = res!;

    print("$response 응답은?");
  }
}
