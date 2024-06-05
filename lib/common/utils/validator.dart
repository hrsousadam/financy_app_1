class Validador {
  Validador._();

  static String? validateName(String? value) {
    final condition = RegExp(r"^(([a-zA-Z\u00C0-\u00FF]{2,})+( [a-zA-Z\u00C0-\u00FF]+)+)$");

    if (value != null && value.isEmpty) {
      return 'Please enter your name';
    }
    if (value != null && !condition.hasMatch(value)) {
      return 'Please enter a valid name';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final condition = RegExp(
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");

    if (value != null && value.isEmpty) {
      return 'Please enter your email';
    }
    if (value != null && !condition.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    final condition =
        RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");

    if (value != null && value.isEmpty) {
      return 'Please enter your password';
    }
    if (value != null && !condition.hasMatch(value)) {
      return 'Please enter a valid password';
    }
    return null;
  }

  static String? validateConfirmPassword(String? first, String? second) {
    if(first != second){
      return 'Passwords do not match';
    }
    return null;
  }
}
