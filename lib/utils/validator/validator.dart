import 'package:need_flutter_app/res/strings.dart';

class Validator {
  static Pattern mobilePattern = r'^\+?[0-9]{10}$';

  static Pattern emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static Pattern urlPattern =
      r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-@]+))*$";

  static String validateEmptyCheck(String value) {
    if (value.isEmpty) return Strings.invalidInput;
    return "";
  }

  static String invalidCheck(String value) {
    if (value.isEmpty) return Strings.fieldMandatory;
    return "";
  }


  static String validatePassword(String value) {
    if (value.isEmpty) return Strings.passValidation;
    return "";
  }

  static String validatePhone(String value) {
    if (value.isEmpty) return Strings.validPhone;
    RegExp regexPhone = RegExp("$mobilePattern");
    if (regexPhone.hasMatch(value))
      return "";
    else
      return Strings.validPhone;
  }

  static String validateEmail(String value) {
    if (value.isEmpty) return Strings.validEmail;
    RegExp regexEmail = RegExp("$emailPattern");
    if (regexEmail.hasMatch(value))
      return "";
    else
      return Strings.validEmail;
  }

  static String? validateUsername(String value) {
    if (value.isEmpty) return Strings.usernameBlank;
    RegExp regexPhone = RegExp("$mobilePattern");
    RegExp regexEmail = RegExp("$emailPattern");
    if (regexPhone.hasMatch(value))
      return null;
    else if (regexEmail.hasMatch(value))
      return null;
    else
      return Strings.usernameInvalid;
  }
}
