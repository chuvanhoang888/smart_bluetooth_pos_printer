import 'package:smart_bluetooth_pos_printer/smart_bluetooth_pos_printer.dart';

class PrinterManager {
  final bluetoothPrinterConnector = BluetoothPrinterConnector.instance;

  PrinterManager._();

  static PrinterManager _instance = PrinterManager._();

  static PrinterManager get instance => _instance;

  Stream<PrinterDevice> discovery({bool isBle = false}) {
    return bluetoothPrinterConnector.discovery(isBle: isBle);
  }

  Stream<List<PrinterDevice>> scanResults() {
    return bluetoothPrinterConnector.scanResults;
  }

  Stream<bool> isScanning() {
    return bluetoothPrinterConnector.isScanning;
  }

  Future startScan({Duration? timeout, bool isBle = false}) async {
    return await bluetoothPrinterConnector.startScan(
        timeout: timeout, isBle: isBle);
  }

  Future stopScan() async {
    return await bluetoothPrinterConnector.stopScan();
  }

  Future<bool> connect({required BasePrinterInput model}) async {
    try {
      var conn = await bluetoothPrinterConnector
          .connect(model as BluetoothPrinterInput);
      return conn;
    } catch (e) {
      throw Exception('model must be type of BluetoothPrinterInput');
    }
  }

  Future<bool> disconnect({int? delayMs}) async {
    return await bluetoothPrinterConnector.disconnect();
  }

  Future<bool> send({required List<int> bytes}) async {
    return await bluetoothPrinterConnector.send(bytes);
  }

  Stream<BTStatus> get stateBluetooth =>
      bluetoothPrinterConnector.currentStatus.cast<BTStatus>();

  BTStatus get currentStatusBT => bluetoothPrinterConnector.status;
}
