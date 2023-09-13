import 'package:hitch_handler_v2/app/utils/string_extenstions.dart';

String? emailValidator(String? pattern) {
  if (pattern == null || pattern.isEmpty) {
    return "Email required";
  }
  if (!pattern.isValidEmail()) {
    return "Invalid email";
  }
  return null;
}

String? passwordValidator(String? pattern) {
  if (pattern == null || pattern.isEmpty) {
    return "Password required";
  }
  if (!pattern.isValidPassword()) {
    return "Invalid Password";
  }
  return null;
}

String? rollValidator(String? pattern, {int low = 8, int high = 10}) {
  if (pattern == null || pattern.isEmpty) {
    return "Roll no. required";
  }
  if (!pattern.isValidLengthRange(low: low, high: high)) {
    return "Invalid Roll Number";
  }
  return null;
}

String? phoneValidator(String? pattern) {
  if (pattern == null || pattern.isEmpty) {
    return "Phone Number required";
  }
  if (!pattern.isValidMobile()) {
    return "Invalid Phone Number";
  }
  return null;
}

String? lengthValidator(String? pattern, {int length = 8}) {
  if (pattern == null || !pattern.isValidLength(length: length)) {
    return "Must be atleast $length characters long";
  }
  return null;
}

String? birthdayValidator(String? date) {
  if (date == null || date.isEmpty) {
    return "Date is required";
  }

  final RegExp dateRegExp = RegExp(r'^\d{2}-\d{2}-\d{4}$');
  if (!dateRegExp.hasMatch(date)) {
    return "Invalid date format (dd-MM-yyyy)";
  }

  final List<String> dateParts = date.split('-');
  final int day = int.tryParse(dateParts[0]) ?? 0;
  final int month = int.tryParse(dateParts[1]) ?? 0;
  final int year = int.tryParse(dateParts[2]) ?? 0;

  if (day < 1 || day > 31 || month < 1 || month > 12) {
    return "Invalid date";
  }

  final DateTime currentDate = DateTime.now();
  final DateTime birthDate = DateTime(year, month, day);

  final Duration ageDifference = currentDate.difference(birthDate);
  final int ageInYears = ageDifference.inDays ~/ 365;

  if (ageInYears < 18) {
    return "You must be at least 18 years old";
  }

  return null;
}
