
import 'dart:convert';

import 'package:yam_stack/src/models/request/login_request.dart';
import 'package:yam_stack/src/models/request/register_request.dart';
import 'package:yam_stack/src/models/request/yam_list_request.dart';
import 'package:yam_stack/src/models/response/login_response.dart';
import 'package:yam_stack/src/models/response/register_response.dart';
import 'package:yam_stack/src/models/response/users_response.dart';
import 'package:yam_stack/src/models/response/yam_list_response.dart';

import 'api.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<LoginResponse?> login(LoginRequest data) async {
    final res = await apiProvider.login('/login/sign', data);
    if (res.statusCode == 200) {
      print(res.body);
      return LoginResponse.fromJson(res.body);
    }
  }

  Future<RegisterResponse?> register(RegisterRequest data) async {
    final res = await apiProvider.register('/login/join', data);
    if (res.statusCode == 200) {
      return RegisterResponse.fromJson(res.body);
    }
  }

  Future<YamListResponse?> getYamList(int page, int size , String direction, YamListRequest data) async {
    final res = await apiProvider.getYamList('/api/v1/yam/?page=0&size=10&direction=DESC',data);

    if (res.statusCode == 200) {
      var response =  res.body;
      return YamListResponse.fromJson(res.body);
    }
    }
}
