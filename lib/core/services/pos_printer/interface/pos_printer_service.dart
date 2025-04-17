abstract interface class PosPrinterService {
  
  Future<void> printReceipt({required String receipt});

  Future<bool> isConnected();

}