// ignore_for_file: constant_identifier_names

import 'package:logging/logging.dart';


enum LogNames{
  LOGGER_NOTIFICATIONS,
  GENERAL_INFO,
  SERVER_CONNECTION
}

class LogHelper {
  static Logger getLogger(LogNames logName){
    return Logger(logName.toString().split(".").last);
  }
}