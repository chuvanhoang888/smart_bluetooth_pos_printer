import Flutter
import UIKit

public class SwiftFlutterPosPrinterPlatformPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "smart_bluetooth_pos_printer", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterPosPrinterPlatformPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
