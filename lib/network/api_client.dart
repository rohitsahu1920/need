import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:need_flutter_app/res/strings.dart';
import 'package:need_flutter_app/utils/common.dart';


class APIClient {
  final Dio _dio = Dio();
  Future<Map<String, dynamic>> get(
    String path, {
      required Map<String, dynamic> queryParameters,
  }) async {
    Map<String, dynamic> responseData = Map();

    try {
      Response response = await _dio.get(
        Uri.encodeFull(path),
        queryParameters: queryParameters,
      );

      responseData = response.data;
    } on DioError catch (e) {
      if (e.response == null) throw e;
      if (e.response!.statusCode == null) throw e;
      if (e.response!.statusCode == 401) {
        log("unauthorized");
        Common.toast(Strings.loginAgain);
      } else
        throw e;
    }
    return responseData;
  }

  Future<Map<String, dynamic>> post(
    String path, {
    required Map data,
  }) async {
    print("API URL $path");
    print("API POST Data ${jsonEncode(data)}");
    Map<String, dynamic> responseData = Map();

    try {
      Response response = await _dio.post(
        Uri.encodeFull(path),
        data: data,
      );
      responseData = response.data;
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        log("unauthorized");
        Common.toast(Strings.loginAgain);
      } else if(e.response!.statusCode == 400){
        Common.toast(e.response!.data["msg"]);
      }
      else{
        throw e;
      }
    }

    return responseData;
  }
}
