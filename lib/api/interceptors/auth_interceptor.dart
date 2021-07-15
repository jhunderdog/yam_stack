import 'dart:async';

import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yam_stack/shared/constants/storage.dart';

FutureOr<Request> authInterceptor(request) async {
  final token =  Get.find<SharedPreferences>().getString(StorageConstants.token);

  request.headers['Content-Type'] = 'application/json';
  request.headers['x-auth-token'] = "$token";

  return request;
}
