
import 'package:get/get.dart';
import 'package:yam_stack/api/interceptors/auth_interceptor.dart';
import 'package:yam_stack/src/models/request/login_request.dart';
import 'package:yam_stack/src/models/request/register_request.dart';
import 'package:yam_stack/src/models/request/yam_list_request.dart';

import 'base_provider.dart';

class ApiProvider extends BaseProvider {
  Future<Response> login(String path, LoginRequest data) {
    return post(path, data.toJson());
  }

  Future<Response> register(String path, RegisterRequest data) {
    return post(path, data.toJson());
  }

  Future<Response> getYamList(String path,YamListRequest data) {
    return post(path, data.toJson());
  }


  // Future<Response> postRestaurantList(String path,Resta data) {
  //   return post(path, data.toJson());
  // }
}
