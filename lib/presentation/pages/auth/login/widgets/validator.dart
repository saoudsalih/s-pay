class Validator {
  static String? validatePhoneNumber(String phone) {
    if (phone == "") {
      return "Phone Number cannot be empty";
    }
    if (phone.length != 10) {
      return "Enter a valid phone number";
    }
    return null;
  }

  static String? validatePassword(String pass){
    if(pass == ""){
      return "Password cannot be empty";
    }

    // String patten = "^[a-zA-Z0-6!@#\$%&*]+\$";

    // RegExp regExp = RegExp(patten);
    if(pass.length <= 6){
      return "Password must be 6 characters long";
    }
    return null;
  }
}
