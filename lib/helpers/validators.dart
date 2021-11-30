const Pattern emailPattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
const Pattern numberPattern = r'[0-9]';  
const Pattern noSpacePattern = r'\s';

String validateEmail(String email) {
  RegExp regex = new RegExp(emailPattern);
  if (email.isEmpty || email == null) {
    return 'Email can not be empty';
  } else if (!regex.hasMatch(email))
    return 'Enter Valid Email';
  else
    return null;
}

String validatePassword(String password) {
  if (password == null || password.isEmpty ) {
    return 'Your password can not be empty';
  }  else {
      return null;
    }
}

String validateString(String value) {
  if (value == null || value.isEmpty) {
    return 'String can not be empty';
  } else
    return null;
}

bool isNumber(String value) =>
    value.contains(RegExp(numberPattern)) ? true : false;
