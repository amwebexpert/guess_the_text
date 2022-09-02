import Cocoa
import FlutterMacOS

public class OsConsoleLoggerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "os_console_logger", binaryMessenger: registrar.messenger)
    let instance = OsConsoleLoggerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
      break
      
    case "debug":
      let arguments = call.arguments as! NSDictionary
      print(arguments["message"]!)
      result(nil)
      break

    case "error":
      let arguments = call.arguments as! NSDictionary
      print(arguments["message"]!)
      result(nil)
      break

    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
