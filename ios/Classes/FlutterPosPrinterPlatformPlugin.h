#import <Flutter/Flutter.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "ConnecterManager.h"

#define NAMESPACE @"smart_bluetooth_pos_printer"

@interface FlutterPosPrinterPlatformPlugin : NSObject<FlutterPlugin, CBCentralManagerDelegate, CBPeripheralDelegate>
@property(nonatomic,copy)ConnectDeviceState state;
@end

@interface BluetoothPrintStreamHandler : NSObject<FlutterStreamHandler>
@property FlutterEventSink sink;
@end