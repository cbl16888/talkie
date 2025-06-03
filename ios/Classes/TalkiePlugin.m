#import "TalkiePlugin.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "talkie.h"

@implementation TalkiePlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"talkie"
                                     binaryMessenger:[registrar messenger]];
    TalkiePlugin* instance = [[TalkiePlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"cropImage" isEqualToString:call.method]) {

  } else {
      result(FlutterMethodNotImplemented);
  }
}

@end
