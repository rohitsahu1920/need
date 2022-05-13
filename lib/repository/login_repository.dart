import 'package:get/get.dart';
import 'package:need_flutter_app/utils/methods.dart';
import 'package:dio/dio.dart' as d;
import '../models/Status.dart';
import '../models/api_response.dart';
import '../models/login_response.dart';
import '../network/api_client.dart';
import '../network/urls.dart';
import '../res/api_keys.dart';

class LoginRepository {
  final APIClient _apiClient = Get.find();



  Future<LoginResponse> login(
      {required String email, required String pass}) async {
    final url = AppUrl.urlBase() + AppUrl.login;
    Map data = {APIKeys.email: email, APIKeys.password: pass};

    Map<String, dynamic> response = await _apiClient.post(url, data: data);
    log(response.toString());
    return LoginResponse.fromJson(response);
  }

  Future<ApiResponse> upload(String name, String filePath) async {
    final url = AppUrl.urlBase() + AppUrl.uploadImages;

    log("Name :: $name");
    log("file Path :: $filePath");

    d.FormData formData = d.FormData.fromMap({
      APIKeys.name: name,
      APIKeys.image: await d.MultipartFile.fromFile(filePath),
    });

    log("Form Data :: ${formData.files.length}");

    Map<String, dynamic> response = await _apiClient.post(url,
        formData: formData,
        headers: {APIKeys.contentType: "multipart/form-data"});
    log("Upload Image response :: $response");

    return ApiResponse.fromJson(response);
  }

  Future<ApiResponse> registration(Map data) async {
    final url = AppUrl.urlBase() + AppUrl.registration;

    Map<String, dynamic> response = await _apiClient.post(url, data: data);
    log(response.toString());

    return ApiResponse.fromJson(response);
  }
}
