import 'package:flutter/services.dart' show rootBundle;
import 'dart:typed_data';

Future<Uint8List> loadCertificate() async {
  final ByteData data = await rootBundle.load('assets/cert.pem');
  return data.buffer.asUint8List();
}