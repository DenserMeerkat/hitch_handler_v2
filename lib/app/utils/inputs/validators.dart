import 'package:hitch_handler_v2/app/utils/string_extenstions.dart';

String? emailValidator(String? pattern) {
  if (pattern == null || !pattern.isValidEmail()) {
    return "Invalid email";
  }
  return null;
}

String? passwordValidator(String? pattern) {
  if (pattern == null || !pattern.isValidPassword()) {
    return "Invalid Password";
  }
  return null;
}

String? lengthValidator(String? pattern, {int length = 8}) {
  if (pattern == null || !pattern.isValidLength(length: length)) {
    return "Invalid Password";
  }
  return null;
}

String? phoneValidator(String? pattern) {
  if (pattern == null || !pattern.isValidMobile()) {
    return "Invalid Phone Number";
  }
  return null;
}
