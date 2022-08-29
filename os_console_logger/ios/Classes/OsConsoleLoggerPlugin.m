#import "OsConsoleLoggerPlugin.h"
#if __has_include(<os_console_logger/os_console_logger-Swift.h>)
#import <os_console_logger/os_console_logger-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "os_console_logger-Swift.h"
#endif

@implementation OsConsoleLoggerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftOsConsoleLoggerPlugin registerWithRegistrar:registrar];
}
@end
