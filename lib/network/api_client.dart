import 'package:dio/dio.dart';
import 'package:need_flutter_app/res/strings.dart';
import 'package:need_flutter_app/utils/common.dart';
import 'package:need_flutter_app/utils/methods.dart';

class APIClient {
  final Dio _dio = Dio();

  _requestHeaders() {
    return {
      'Content-Type': 'application/json',
    };
  }

  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    log("API URL $path");
    Map<String, dynamic> responseData = {};

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
      if (e.response == null) rethrow;
      if (e.response!.statusCode == null) rethrow;
      if (e.response!.statusCode == 401) {
        log("unauthorized");
        Common.toast(Strings.loginAgain);
      } else {
        rethrow;
      }
    } catch (e) {
      log("Dio Error :: ${e.toString()}");
    }
    return responseData;
  }

  Future<Map<String, dynamic>> post(
    String path, {
    Map? data,
    Map<String, dynamic>? headers,
    FormData? formData,
  }) async {
    log("Before API URL :: $path");
    log("Request :: $data");
    //log("API POST Data ${jsonEncode(data)}");
    Map<String, dynamic> responseData = {};

    log("Checking :: ${data ?? formData}");
    log("Checking :: ${headers ?? _requestHeaders()}");

    try {
      log("Under try method ::");
      Response response = await _dio.post(
        Uri.encodeFull(path),
        data: formData ?? data,
        options: Options(
          headers: headers ?? _requestHeaders(),
        ),
      );
      log("After post method ::");
      log("$response");

      log("After API URL $path");
      responseData = response.data;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        log("unauthorized");
        Common.toast(Strings.loginAgain);
      } else if (e.response?.statusCode == 400) {
        Common.toast("${e.response?.data["msg"]}");
      } else if (e.response?.statusCode == 415) {
        log("Under post Method of api client of 415 :: ${e.response?.data["msg"]}");
      } else {
        log("Under post Method of api client :: $e");
        rethrow;
      }
      log("$e");
      log("Under dio");
    } catch (e) {
      log("Dio Error :: ${e.toString()}");
    }
    log("$responseData");
    return responseData;
  }
}
