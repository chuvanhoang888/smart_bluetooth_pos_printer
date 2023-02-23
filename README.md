# smart_bluetooth_pos_printer

[![Pub Version](https://img.shields.io/badge/pub-v1.0.12-green)](https://pub.dev/packages/smart_bluetooth_pos_printer)

A library to discover printers, and send printer commands.

This library allows to print esc commands to printers in different platforms such as android, ios, windows and different interfaces as Bluetooth and BLE

Inspired by [flutter_pos_printer_platform](https://pub.dev/packages/flutter_pos_printer_platform).


## Main Features
* Android, iOS and Windows support
* Scan for bluetooth devices
* Send raw `List<int> bytes` data to a device, review this library to generate ESC/POS commands [flutter_esc_pos_utils](https://pub.dev/packages/flutter_esc_pos_utils).

## Features

|                         |      Android       |         iOS          |      Windows       |            Description            |
| :---------------        | :----------------: | :------------------: | :----------------: | :-------------------------------- |
| Bluetooth classic interface | :white_check_mark: |  :white_square_button:  | :white_square_button: | Allows connection with classic bt devices. |
| Bluetooth low energy (BLE) interface | :white_check_mark: |  :white_check_mark:  | :white_square_button: | Allows connection with bt BLE devices. |
| scan                    | :white_check_mark: |  :white_check_mark:  | :white_check_mark: | Starts a scan for only Bluetooth devices or network devices(Android/iOS). |
| connect                 | :white_check_mark: |  :white_check_mark:  | :white_check_mark: | Establishes a connection to the device. |
| disconnect              | :white_check_mark: |  :white_check_mark:  | :white_check_mark: | Cancels an active or pending connection to the device. |
| state                   | :white_check_mark: |  :white_check_mark:  | :white_check_mark: | Stream of state changes for the Bluetooth Device. |
| print                   | :white_check_mark: |  :white_check_mark:  | :white_check_mark: | print bytes. |

## Getting Started

For a full example please check /example folder. Here are only the most important parts of the code to illustrate how to use the library.

Generate bytes to print through [flutter_esc_pos_utils](https://pub.dev/packages/flutter_esc_pos_utils).

```dart
    import 'package:esc_pos_utils/esc_pos_utils.dart';

    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);
    List<int> bytes = [];

    bytes += generator.text('Test Print', styles: const PosStyles(align: PosAlign.center));
    bytes += generator.text('Product 1');
    bytes += generator.text('Product 2');
```

## Android
Allow to connect bluetooth (classic and BLE), USB and network devices

### Change the minSdkVersion for Android

smart_bluetooth_pos_printer is compatible only from version 21 of Android SDK so you should change this in android/app/build.gradle:

In build.gradle set
```
    defaultConfig {
        ...
        minSdkVersion 21
        targetSdkVersion 31
        ...
```

select type of device `PrinterType` ( bluetooth, usb, network)

if select bluetooth you can send optional params

- isBle -> allow to connect with bluetooth that supports this technology
- autoconnect -> allow to reconnect when state of device is None

## iOS
Allow to connect bluetooth (BLE) and network devices


## How to use it
### init a PrinterManager instance

```dart
import 'package:smart_bluetooth_pos_printer/smart_bluetooth_pos_printer.dart';

    var printerManager = PrinterManager.instance;

 ```

### scan

```dart
    var devices = [];
    _scan({bool isBle = false}) {
        // Find printers
        PrinterManager.instance.discovery(isBle: isBle).listen((device) {
            devices.add(device);
        });
    }
```

### connect

```dart
_connectDevice(PrinterDevice selectedPrinter, {bool reconnect = false, bool isBle = false}) async {
    await printerManager.connect(
        model: BluetoothPrinterInput(
            name: selectedPrinter!.deviceName,
            address: selectedPrinter!.address!,
            isBle: selectedPrinter!.isBle ?? false,
            autoConnect: _reconnect));
  }
```
### disconnect

```dart
    _disconnectDevice() async {
        await PrinterManager.instance.disconnect();
        }
```

### listen bluetooth state
```dart
    PrinterManager.instance.stateBluetooth.listen((status) {
      log(' ----------------- status bt $status ------------------ ');
    });
```

### send bytes to print
```dart
    _sendBytesToPrint(List<int> bytes) async { 
      PrinterManager.instance.send(bytes: bytes);
    }

```

## Troubleshooting

error:'State restoration of CBCentralManager is only allowed for applications that have specified the "bluetooth-central" background mode'
info.plist add:

```
<key>NSBluetoothAlwaysUsageDescription</key>
<string>Allow App use bluetooth?</string>
<key>NSBluetoothPeripheralUsageDescription</key>
<string>Allow App use bluetooth?</string>
<key>UIBackgroundModes</key>
<array>
    <string>bluetooth-central</string>
    <string>bluetooth-peripheral</string>
</array>
```

## Support me

If you think that this project has helped you with your developments, you can support this project, any support is much appreciated.

[![Paypal](https://raw.githubusercontent.com/arthas1888/smart_bluetooth_pos_printer/main/btn-sm-paypal-payment.png)](https://www.paypal.com/donate/?hosted_button_id=92HK6VNCK7MUY)