import 'package:get/get.dart';
import 'package:need_flutter_app/models/login_response.dart';
import 'package:need_flutter_app/network/api_client.dart';
import 'package:need_flutter_app/network/urls.dart';
import 'package:need_flutter_app/res/api_keys.dart';
import 'package:need_flutter_app/utils/methods.dart';

class LoginRepository {
  final APIClient _apiClient = Get.find();

  Future<LoginResponse> login(
      {required String email, required String pass}) async {
    final url = AppUrl.urlBase() + AppUrl.login;
    Map data = {APIKeys.email: email, APIKeys.pass: pass};

    Map<String, dynamic> response = await _apiClient.post(url, data: data);
    log(response.toString());
    return LoginResponse.fromJson(response);
  }
}
