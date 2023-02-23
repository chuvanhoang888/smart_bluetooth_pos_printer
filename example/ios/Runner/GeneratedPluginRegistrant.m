//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<network_info_plus/FLTNetworkInfoPlusPlugin.h>)
#import <network_info_plus/FLTNetworkInfoPlusPlugin.h>
#else
@import network_info_plus;
#endif

#if __has_include(<smart_bluetooth_pos_printer/FlutterPosPrinterPlatformPlugin.h>)
#import <smart_bluetooth_pos_printer/FlutterPosPrinterPlatformPlugin.h>
#else
@import smart_bluetooth_pos_printer;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FLTNetworkInfoPlusPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTNetworkInfoPlusPlugin"]];
  [FlutterPosPrinterPlatformPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterPosPrinterPlatformPlugin"]];
}

@end
