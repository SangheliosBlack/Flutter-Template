class AvatarName {

  static String getAvatarLetters({required String name}) {

    List<String> listText = name.split(" ");

    if (listText.length < 2) {
      return "";
    }

    String initials = listText[0][0] + listText[1][0];

    return initials.toUpperCase();

  }
}
