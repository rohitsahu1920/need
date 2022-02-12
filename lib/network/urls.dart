import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppUrl {
  static String urlBase() {

    return "http://15.206.178.168/api/";
  }

  static String get login => "login/login";

}