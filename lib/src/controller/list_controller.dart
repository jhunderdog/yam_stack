import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yam_stack/api/api_repository.dart';
import 'package:yam_stack/shared/utils/focus.dart';
import 'package:yam_stack/src/models/request/yam_list_request.dart';
import 'package:yam_stack/src/models/response/yam_list_response.dart';

class ListController extends GetxController {

  final ApiRepository apiRepository;
  ListController({required this.apiRepository});

  int yamListPage = 0;
  int yamListSize = 10;
  String direction = "DESC";
  String region = "";
  String category = "";
  List<String> tags = [""];
  String searchName = "";
  int mode = 0;

  var response = YamListResponse();

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    yamList();

  }

  @override
  void onReady() async {
    super.onReady();

  }

  Future<void> yamList() async {
    final res = await apiRepository.getYamList(
        yamListPage,
        yamListSize,
        direction,
        YamListRequest(
            // region: region,
            // category: category,
            // tags: tags,
            // searchName: searchName,
            mode: mode));

      response = res!;
      
      print("$response 응답은?");
  }
}
