import 'package:ansicolor/ansicolor.dart';
import 'package:flutter_template/core/utils/constants/environments.dart';
import 'package:flutter_template/helpers/colorized.dart';
import 'package:flutter_template/helpers/logger.dart';
import 'package:logging/logging.dart';

class Developer {

  final pathUrl = Environments.pathUrl;
  
  final port = Environments.port;
  Logger logger = LogHelper.getLogger(LogNames.SERVER_CONNECTION);

  String apiUrl() {

    if (port.isNotEmpty) {

      logger.info(colorize("Connected to the address $apiUrl on port $port", AnsiPen()..green()));

    } else {
      
      logger.info(colorize("Connected to the address $pathUrl", AnsiPen()..green));

    }

    if (port.isNotEmpty) {
      return '$pathUrl:$port';
    } else {
      return pathUrl;
    }
  }
}
