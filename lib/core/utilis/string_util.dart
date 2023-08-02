class StringUtil {
  //~        Functions To Validation
static  bool isEmail(String value) {
  RegExp regExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  return regExp.hasMatch(value);
}

static bool isPassword(String value) {
  RegExp passValid = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{1,}.{8,}$');
  return passValid.hasMatch(value);
}

// static bool isName(String value) {
//   RegExp nameValid = RegExp(r"^[A-Z].{1,}[A-Za-z]$");
//   return nameValid.hasMatch(value);
// }

static bool isName(String value) {
  RegExp nameValid = RegExp(r"^[A-Za-z]+$");
  return nameValid.hasMatch(value);
}

static bool isValidSyriaMobileNumber(String value) {
  RegExp regex = RegExp(r'^(!?(\+|00)?(963)|0)?9\d{8}$');
  return regex.hasMatch(value);
}

static bool isAddress(String value) {
  RegExp regex = RegExp(r'^[#.0-9a-zA-Z\s,-]+$');
  return regex.hasMatch(value);
}

static bool isAge(String value) {
  RegExp regexp = RegExp(r'^(?:1[01][0-9]|120|1[8-9]|[2-9][0-9])$');
  return regexp.hasMatch(value);
}

}
