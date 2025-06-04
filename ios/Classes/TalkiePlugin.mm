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
        NSData *byteData = typedData.data;
        NSUInteger bufferSize = [_talkieBridge getFrameSize];
        NSUInteger offset = 0;
        NSMutableData *encodedData = [NSMutableData data];
        while (offset < byteData.length) {
            NSUInteger chunkSize = MIN(bufferSize, byteData.length - offset);
            NSData *chunk = [byteData subdataWithRange:NSMakeRange(offset, chunkSize)];
            NSMutableData *paddedChunk = [NSMutableData dataWithData:chunk];
            // 数据不够时补0
            if (chunk.length < bufferSize) {
                NSUInteger paddingLength = bufferSize - chunk.length;
                uint8_t zero[paddingLength];
                memset(zero, 0, paddingLength);
                [paddedChunk appendBytes:zero length:paddingLength];
            }
            // 编码（假设 talk.encodeFrame 方法接受 NSData 或指针并返回 NSData*）
            NSData *encoded = [_talkieBridge encodeFrame:paddedChunk];
            if (encoded && encoded.length > 0) {
                [encodedData appendData:encoded];
//                NSLog(@"编码后的数据: %@，编码后的长度是: %lu", encoded, (unsigned long)encoded.length);
            } else {
//                NSLog(@"编码失败");
            }
            offset += chunkSize;
        }
        result(encodedData);
    } else if ([@"decode" isEqualToString:call.method]) {
        FlutterStandardTypedData *typedData = call.arguments[@"data"];
        NSData *byteData = typedData.data;
        NSUInteger bufferSize = [_talkieBridge getEncodedFrameSize];
        NSUInteger offset = 0;
        NSMutableData *decodedData = [NSMutableData data];
        while (offset < byteData.length) {
            NSUInteger chunkSize = MIN(bufferSize, byteData.length - offset);
            NSData *chunk = [byteData subdataWithRange:NSMakeRange(offset, chunkSize)];
            NSMutableData *paddedChunk = [NSMutableData dataWithData:chunk];
            // 数据不够时补0
            if (chunk.length < bufferSize) {
                NSUInteger paddingLength = bufferSize - chunk.length;
                uint8_t zero[paddingLength];
                memset(zero, 0, paddingLength);
                [paddedChunk appendBytes:zero length:paddingLength];
            }
            // 编码（假设 talk.encodeFrame 方法接受 NSData 或指针并返回 NSData*）
            NSData *decoded = [_talkieBridge decodeFrame:paddedChunk];
            if (decoded && decoded.length > 0) {
                [decodedData appendData:decoded];
//                NSLog(@"解码后的数据: %@，解码后的长度是: %lu", encoded, (unsigned long)encoded.length);
            } else {
//                NSLog(@"解码失败");
            }
            offset += chunkSize;
        }
        result(decodedData);
    } else {
      result(FlutterMethodNotImplemented);
    }
}

@end
