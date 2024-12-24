

import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';

class Logger {

  static const String _reset = '\x1B[0m';
  static const String _red = '\x1B[91m';
  static const String _green = '\x1B[92m';
  static const String _yellow = '\x1B[93m';
  static const String _blue = '\x1B[94m';

  static void debug({required String message}) {
    if (kDebugMode) {
      debugPrint('$_blue[DEBUG] $message$_reset');
    }
  }

  static void error({required String message}) {
    if (kDebugMode) {
      debugPrint('$_red[ERROR] $message$_reset');
    }
  }

  static void warning({required String message}) {
    if (kDebugMode) {
      debugPrint('$_yellow[WARNING] $message$_reset');
    }
  }

  static void success({required String message}) {
    if (kDebugMode) {
      debugPrint('$_green[SUCCESS] $message$_reset');
    }
  }

  static void defaultLog({required String message}) {

    log(
      message,
      name: 'AppRouter',
      time: DateTime.now(),
      zone: Zone.current,
    );

  }

  
}