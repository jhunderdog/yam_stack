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
  /* 4. ??? ?????????
  * 4.1 ?????? ??? ????????? ????????? ?????? metaInfo ????????????
  * 4.2 ??? ????????? ????????????
  * 4.3 ?????? ???????????? ??? ????????? ????????????
  * 4.4 ??? ????????????
  * 4.5 ??? ?????? (?????? ?????? ??????)
  * 4.6 ??? ??????
  * */
  //----------------------------------------------

  /* 4.2 ??? ????????? ???????????? */

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
    // print("$response ??????????");
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

    // print("$response ??????????");
  }

  // ??? ????????? ????????? showlist ?????? //
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
  /* 4.3.0 ????????????????????? ??? ????????? ??????*/

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
    print("$addRestaurantResponse ??????????");

    showList.value = [];
    searchList.value = [];
    loading = false;
    allLoaded = false;
    yamListPage.value = 0;

    yamList();
  }

  /* 4.3 ?????? ???????????? ??? ????????? ????????????*/

  Future<void> addYam() async {
    final res = await apiRepository.addYam(127);

    addYamResponse.value = res!;

    print("$response ??????????");
  }

  /* 4.4 ??? ????????????*/

  Future<void> editYam() async {
    final res = await apiRepository.editYam(YamEditRequest(
        id: 16, foods: ["????????????"], tags: ["?????? ??????", "?????? ??????"], memo: "??? ??????"));

    editYamResponse.value = res!;

    print("$response ??????????");
  }

  /* 4.5 ??? ?????? (?????? ?????? ??????)*/

  Future<void> visitYam() async {
    final res =
        await apiRepository.visitYam(VisitYamRequest(id: 16, reVisit: true));

    visitYamResonse.value = res!;

    print("$response ??????????");
  }

  /* 4.6 ??? ??????*/

  Future<void> deleteYam() async {
    final res = await apiRepository.deleteYam("false", 16);

    visitYamResonse.value = res!;

    print("$response ??????????");
  }
}
