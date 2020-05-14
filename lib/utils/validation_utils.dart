class ValidationUtils {
  static bool isEmail(String email) {
    String emailValidationRule =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(emailValidationRule);
    return regExp.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    String passwordValidationRule =
        "^(?=.*[A-Z])(?=.*[a-z])^(?=.*[0-9\\!\\@\\.\\<\\>\\-_#\$%\\^&\\*])(?=.{8,})";

    RegExp regExp = RegExp(passwordValidationRule);
    return regExp.hasMatch(password) && password.length > 9;
  }

  static bool isValidAddress(String value) {
    String address = "/^[#.0-9a-zA-Z\s,-]{5,}\$/";
    RegExp regExp = RegExp(address);
    return regExp.hasMatch(value);
  }

  static bool isValidString(String value, {int count = 8}) {
    return value.isNotEmpty && value.length >= count;
  }

  static bool isValidDate(String input) {
    try {
      DateTime now = DateTime.now();
      final date = DateTime.parse(input);

      final originalFormatString = toOriginalFormatString(date);
      return input == originalFormatString &&
          date.year < now.year - 10 &&
          date.year > now.year - 100;
    } catch (e) {
      return false;
    }
  }

  static String toOriginalFormatString(DateTime dateTime) {
    final y = dateTime.year.toString().padLeft(4, '0');
    final m = dateTime.month.toString().padLeft(2, '0');
    final d = dateTime.day.toString().padLeft(2, '0');
    return "$y$m$d";
  }
}
