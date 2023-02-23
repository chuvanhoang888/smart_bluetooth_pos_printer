import 'dart:io';

class PrinterDevice {
  String name;
  String operatingSystem = Platform.operatingSystem;
  String? address;

  PrinterDevice({required this.name, this.address});
}
