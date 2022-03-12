
import 'package:need_flutter_app/app.dart';
import 'package:need_flutter_app/network/urls.dart';
import 'dart:developer' as d;

void log(Object object) {
  if (App.instance.devMode) d.log("APP LOG $object");
}

String getEndPoint(String url) {
  if (url.contains("https://")) {
    return url.replaceAll(AppUrl.urlBase(), "");
  }
  return url;
}

bool isFormValid(key) {
  final form = key.currentState;
  if (form.validate()) {
    form.save();
    return true;
  }
  return false;
}
