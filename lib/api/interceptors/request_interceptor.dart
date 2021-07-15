import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yam_stack/shared/constants/storage.dart';

FutureOr<Request> requestInterceptor(request) async {
  final token =  Get.find<SharedPreferences>().getString(StorageConstants.token);

  request.headers['Content-Type'] = 'application/json';
  request.headers['x-auth-token'] = "$token";

  EasyLoading.show(status: 'loading...');
  return request;
}