class ValidatorHelper {
  static String? emailValidation(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email cannot be empty';
    }
    final RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(\.[a-zA-Z]{2,})+$",
    );

    if (!emailRegExp.hasMatch(email)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  static String? passwordValidation(String? password) {
    if (password == null || password.isEmpty) {
      return "Password is required";
    } else if (password.length < 6) {
      return "Password is too short (min 6 characters)";
    } else if (password.length > 15) {
      return "Password is too long (max 15 characters)";
    }
    return null;
  }

  static String? nameValidation(String? name) {
    if (name == null || name.trim().isEmpty) {
      return 'Name is required';
    }

    final regex = RegExp(r"^[A-Za-z]+( [A-Za-z]+)*$");

    if (!regex.hasMatch(name)) {
      return 'Enter a valid name (only letters, single spaces allowed)';
    }

    return null; 
  }

    static String? validatePhoneNumber(String? value){
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
    return 'enter valid phone number';
  }
  return null;
  }

}
