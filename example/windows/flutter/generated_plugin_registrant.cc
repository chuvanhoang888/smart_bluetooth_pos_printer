//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <network_info_plus_windows/network_info_plus_windows_plugin.h>
#include <smart_bluetooth_pos_printer/flutter_pos_printer_platform_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  NetworkInfoPlusWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("NetworkInfoPlusWindowsPlugin"));
  FlutterPosPrinterPlatformPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FlutterPosPrinterPlatformPlugin"));
}
