import 'package:ansicolor/ansicolor.dart';

String colorize(String text, AnsiPen pen) {
    return pen(text);
  }