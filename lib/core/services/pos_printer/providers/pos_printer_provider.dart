import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/services/pos_printer/implementation/ip_pos_printer_service.dart';
import 'package:flutter_template/core/services/pos_printer/providers/pos_printer_state_notifier.dart';


final printerServiceProvider = Provider<PosPrinterServideImpl>((ref) {

  return PosPrinterServideImpl(
    printerIp: '192.168.100.76', 
    ref: ref
  );

});


final printerConnectionProvider = StateNotifierProvider<PrinterConnectionStateNotifier, bool>((ref) {
  final printerService = ref.watch(printerServiceProvider);
  return PrinterConnectionStateNotifier(printerService);
});
