#import <Cordova/CDVPlugin.h>
@interface SecurityChecks : CDVPlugin
- (void)echo:(CDVInvokedUrlCommand*)command;
- (void)isDebuggable:(CDVInvokedUrlCommand*)command;
- (void)isSimulator:(CDVInvokedUrlCommand*)command;
- (void)isEmulator:(CDVInvokedUrlCommand*)command;
@end
@implementation SecurityChecks
- (void)echo:(CDVInvokedUrlCommand*)command {
    NSString* msg = [command.arguments.firstObject isKindOfClass:[NSString class]] ? command.arguments.firstObject : @"";
    CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:msg];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}
- (void)isDebuggable:(CDVInvokedUrlCommand*)command {
#if DEBUG
    BOOL debuggable = YES;
#else
    BOOL debuggable = NO;
#endif
    NSDictionary* payload = @{ @"value": @(debuggable) };
    CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:payload];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}
- (void)isSimulator:(CDVInvokedUrlCommand*)command {
#if TARGET_OS_SIMULATOR
    BOOL simulator = YES;
#else
    BOOL simulator = NO;
#endif
    NSDictionary* payload = @{ @"value": @(simulator) };
    CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:payload];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}
- (void)isEmulator:(CDVInvokedUrlCommand*)command {
#if TARGET_OS_SIMULATOR
    BOOL emulator = YES;
#else
    BOOL emulator = NO;
#endif
    NSDictionary* payload = @{ @"value": @(emulator) };
    CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:payload];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}
@end
