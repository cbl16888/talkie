//
//  TalkieBridge.h
//  swift-demo
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TalkieBridge : NSObject

// 初始化编解码器
- (BOOL)initCodec;

// 编码一帧数据
- (NSData *)encodeFrame:(NSData *)inputData;

// 解码一帧数据
- (NSData *)decodeFrame:(NSData *)encodedData;

// 获取每帧字节数
- (NSInteger)getFrameSize;

// 获取编码后的每帧字节数
- (NSInteger)getEncodedFrameSize;

// 获取采样率
- (NSInteger)getSampleRate;

// 获取每帧时长
- (NSInteger)getFrameDuration;

@end

NS_ASSUME_NONNULL_END
