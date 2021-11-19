import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppUrl {
  static String urlBase() {

    return "https://localhost:44362/api/";
  }

  static String get visitList => "login/login";

}
