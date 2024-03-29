extension StringExtensions on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  bool isValidMobile() {
    return RegExp(r'(^[+][0-9]{2,4}[-\s]?[0-9]{8,13}$)').hasMatch(this);
  }

  bool isValidLength({length = 8}) {
    return this.length >= length;
  }

  bool isValidLengthRange({low = 8, high = 10}) {
    return length >= low && length <= high;
  }

  bool isValidPassword() {
    return RegExp(
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
        .hasMatch(this);
  }

  bool isValidRoll() {
    if (int.tryParse(this) != null && length > 7) {
      return true;
    } else {
      return false;
    }
  }

  bool isValidName() {
    return RegExp(r"^[\p{L} ,.'-]*$",
            caseSensitive: false, unicode: true, dotAll: true)
        .hasMatch(this);
  }

  bool isWhitespace() => trim().isEmpty;

  bool isValidDouble() => double.tryParse(this) != null;

  bool isValidInt() => int.tryParse(this) != null;

  String obscureContact() {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      caseSensitive: false,
    );

    final RegExp phoneRegex = RegExp(r'(^[+][0-9]{2,4}[-\s]?[0-9]{8,13}$)');

    if (emailRegex.hasMatch(this)) {
      final List<String> parts = split('@');
      if (parts.length == 2) {
        final String localPart = parts[0];

        if (localPart.isNotEmpty) {
          final String obscuredLocalPart = replaceRange(
            3,
            localPart.length - 2,
            "*" * (localPart.length - 5),
          );
          return obscuredLocalPart;
        }
      }
    } else if (phoneRegex.hasMatch(this)) {
      int index = indexOf(' ');
      return replaceRange(index + 3, index + 7, '*****');
    }

    return this;
  }

  String toCapitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
