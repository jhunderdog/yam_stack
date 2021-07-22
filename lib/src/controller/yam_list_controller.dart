import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yam_stack/src/models/response/yam_list_response.dart';

class YamListController extends GetxController {
  // final ApiRepository apiRepository;
  // YamListController({required this.apiRepository});

  var mylist = YamListResponse().obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  // void register(BuildContext context) async {
  //   AppFocus.unfocus(context);
  //     // final res = await apiRepository.register(
  //     //   RegisterRequest(
  //     //     email: registerEmailController.text,
  //     //     password: registerPasswordController.text,
  //     //   ),
  //     // );
  //     //
  //     // final prefs = Get.find<SharedPreferences>();
  //     // if (res!.token.isNotEmpty) {
  //     //   prefs.setString(StorageConstants.token, res.token);
  //     //   print('Go to Home screen>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
  //     // }
  //   }
  //}
}
