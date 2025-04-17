import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/services/pos_printer/implementation/ip_pos_printer_service.dart';

class PrinterConnectionStateNotifier extends StateNotifier<bool> {

  final PosPrinterServideImpl printerService;

  Timer? _timer;
  
  PrinterConnectionStateNotifier(this.printerService) : super(false) {
    _checkConnection();  
    _startPeriodicCheck(); 
  }

  Future<void> _checkConnection() async {
    try {
      final isConnected = await printerService.isConnected();
      state = isConnected; 
    } catch (error) {
      state = false;
    }
  }

  void _startPeriodicCheck() {

    _timer = Timer.periodic(const Duration(seconds: 10), (_) {
      _checkConnection();
    });

  }

  Future<void> refreshConnection() async {

    state = false; 
    await _checkConnection();  
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
