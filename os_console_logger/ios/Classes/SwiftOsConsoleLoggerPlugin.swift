import Flutter
import UIKit

public class SwiftOsConsoleLoggerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "os_console_logger", binaryMessenger: registrar.messenger())
    let instance = SwiftOsConsoleLoggerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS: " + UIDevice.current.systemVersion)
      break
      
    case "debug":
      let arguments = call.arguments as! NSDictionary
      let message = arguments["message"]! as! String;
      // https://github.com/flutter/flutter/issues/13204#issuecomment-347659250
      NSLog("\n LOG: %@ ", message)
      result(nil)
      break

    case "error":
      let arguments = call.arguments as! NSDictionary
      let message = arguments["message"]! as! String;
      // https://github.com/flutter/flutter/issues/13204#issuecomment-347659250
      NSLog("\n LOG: %@ ", message)
      result(nil)
      break

    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
