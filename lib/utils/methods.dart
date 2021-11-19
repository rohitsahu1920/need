
import 'package:need_flutter_app/network/urls.dart';

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
