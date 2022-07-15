#import "ElginSatPlugin.h"
#if __has_include(<elgin_sat/elgin_sat-Swift.h>)
#import <elgin_sat/elgin_sat-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "elgin_sat-Swift.h"
#endif

@implementation ElginSatPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftElginSatPlugin registerWithRegistrar:registrar];
}
@end
