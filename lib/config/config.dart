// config_dev.dart

import 'package:ansicolor/ansicolor.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_template/helpers/colorized.dart';
import 'package:flutter_template/helpers/logger.dart';
import 'package:logging/logging.dart';

class Developer {
  final backendUrl = dotenv.env['BACKEND_URL']!;
  final port = dotenv.env['PORT']!;
  Logger logger = LogHelper.getLogger(LogNames.SERVER_CONNECTION);

  String apiUrl() {
    if (port.isNotEmpty) {
      logger.info(colorize(
          "Conectado a la dirección $backendUrl en el puerto $port",
          AnsiPen()..green()));
    } else {
      logger.info("Conectado a la dirección $backendUrl");
    }

    if (port.isNotEmpty) {
      return '$backendUrl:$port';
    } else {
      return backendUrl;
    }
  }
}
