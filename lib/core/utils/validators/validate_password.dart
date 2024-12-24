bool validatePassword(String password) {
  final passwordRegExp = RegExp(r'^(?=.*\d{4,})(?=.*[!@#$%^&*]).{5,}$');
  return passwordRegExp.hasMatch(password);
}
