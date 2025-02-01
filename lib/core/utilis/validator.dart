class Validator {
  static String? validateName(String? value) {
    if (_isEmpty(value)) {
      return ("Name is required");
    }
    return null;
  }

  static String? validateEmail(String? v) {
    if (_isEmpty(v)) {
      return "you must enter your Email";
    }

    var regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (!regex.hasMatch(v!)) {
      return "Invalid email address";
    }
    return null;
  }

  static String? validatePassword(String? v) {
    if (_isEmpty(v)) {
      return "you must enter your Password";
    }
    var regex = RegExp(
        r"(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.\\n])(?=.*[A-Z])(?=.*[a-z])(?=.*\d).*$");

    if (!regex.hasMatch(v!)) {
      return 'Must contains A-Z, a-z, @-#-&.. , 1-9';
    }
    return null;
  }

  static String? validatePasswordConfirmation({
    String? password,
    String? confirmPassword,
  }) {
    if (_isEmpty(confirmPassword)) {
      return ("Confirm Password is required");
    }

    if (password != confirmPassword) {
      return 'Passwords does not match';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (_isEmpty(value)) {
      return 'Phone Number is required';
    }

    var regex = RegExp(
      r"^\+201[0125]\d{8}$",
    );

    if (!regex.hasMatch(value!)) {
      return "Must be 11 digits starting with (+20)";
    }

    return null;
  }

  static bool _isEmpty(String? value) {
    return value == null || value.trim().isEmpty;
  }
}
