#import "TalkiePlugin.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "TalkieBridge.h"

@implementation TalkiePlugin {
    TalkieBridge* _talkieBridge;
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"talkie"
                                     binaryMessenger:[registrar messenger]];
    TalkiePlugin* instance = [[TalkiePlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"init" isEqualToString:call.method]) {
        if (_talkieBridge == nil) {
            _talkieBridge = [[TalkieBridge alloc] init];
            id data = @([_talkieBridge initCodec]);
            result(data);
        } else {
            result(@(YES));
        }
    } else if ([@"getFrameSize" isEqualToString:call.method]) {
        result(@([_talkieBridge getFrameSize]));
    } else if ([@"getEncodedFrameSize" isEqualToString:call.method]) {
        result(@([_talkieBridge getEncodedFrameSize]));
    } else if ([@"getSampleRate" isEqualToString:call.method]) {
        result(@([_talkieBridge getSampleRate]));
    } else if ([@"getFrameDuration" isEqualToString:call.method]) {
        result(@([_talkieBridge getFrameDuration]));
    } else if ([@"encode" isEqualToString:call.method]) {
        FlutterStandardTypedData *typedData = call.arguments[@"data"];
        result([_talkieBridge encodeFrame:typedData.data]);
    } else if ([@"decode" isEqualToString:call.method]) {
        FlutterStandardTypedData *typedData = call.arguments[@"data"];
        result([_talkieBridge decodeFrame:typedData.data]);
    } else {
      result(FlutterMethodNotImplemented);
    }
}

@end
