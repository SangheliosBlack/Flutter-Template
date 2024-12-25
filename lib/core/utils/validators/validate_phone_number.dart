bool validatePhoneNumber(String phoneNumber) {
  final phoneRegExp = RegExp(r'^\+?\d{10,15}$');
  return phoneRegExp.hasMatch(phoneNumber);
}
