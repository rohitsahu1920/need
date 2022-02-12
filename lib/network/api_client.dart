import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:need_flutter_app/res/strings.dart';
import 'package:need_flutter_app/utils/common.dart';

class APIClient {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {

    print("API URL $path");
    Map<String, dynamic> responseData = Map();

    try {
      Response response = await _dio.get(
        Uri.encodeFull(path),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        queryParameters: queryParameters,
      );
      log("ok    $response");
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
      final ioc = new HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      //final http = new IOClient(ioc);
      Response response = await _dio.post(
        Uri.encodeFull(path),
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      log("ok    $response");
      responseData = response.data;
    } on DioError catch (e) {
      // if (e.response!.statusCode == 401) {
      //   log("unauthorized");
      //   Common.toast(Strings.loginAgain);
      // } else if(e.response!.statusCode == 400){
      //   Common.toast(e.response!.data["msg"]);
      // }
      // else{
      //   throw e;
      // }
      log("$e");
      log("Under dio");
    }
    log("$responseData");
    return responseData;
  }
}
