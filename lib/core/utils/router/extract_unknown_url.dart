String? extractPath({required String input}) {

  if(input.isEmpty) return "/";


  try {

    final regex = RegExp(r"/[^\s'>()]*");
    final match = regex.firstMatch(input);
    return match?.group(0);

  } catch (e) {
    
    return "/";

  }
  

}