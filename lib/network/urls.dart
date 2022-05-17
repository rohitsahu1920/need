

class AppUrl {
  static String urlBase() {
    return "http://15.206.186.18/api/";
  }

  static String get awsImageLink => "https://needbucket.s3.ap-south-1.amazonaws.com/";

  static String get login => "login/login";
  static String get registration => "login/register";
  static String get uploadImages => "product/uploadFiles";
  static String get addNeed => "product/addProduct";
  static String get getDashboard => "product/getDashboard";
}