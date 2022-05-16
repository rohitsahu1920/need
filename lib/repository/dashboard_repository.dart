

import 'dart:async';

import 'package:need_flutter_app/models/getdahsoboard_model.dart';

import '../models/api_response.dart';
import '../network/api_client.dart';
import 'package:get/get.dart';

import '../network/urls.dart';
import '../utils/methods.dart';

class DashboardRepository {
  final APIClient _apiClient = Get.find();

  Future<ApiResponse> addNeedRepo(Map data) async {
    log("Under addNeedRepo");
    final url = AppUrl.urlBase() + AppUrl.addNeed;

    Map<String, dynamic> response = await _apiClient.post(url, data: data);
    log(response.toString());

    return ApiResponse.fromJson(response);
  }


  Future<GetDashBoardModel> getDashboardDetails() async{

    final url = AppUrl.urlBase() + AppUrl.getDashboard;

    Map<String,dynamic> response = await _apiClient.get(url);

    return GetDashBoardModel.fromJson(response);

  }


}