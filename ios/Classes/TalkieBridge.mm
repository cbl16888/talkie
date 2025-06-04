#import "TalkieBridge.h"
#include "libtalkie.h"

@interface TalkieBridge()
@end

@implementation TalkieBridge

- (BOOL) initCodec {
    return initCodec();
}

// 编码一帧
- (NSData *)encodeFrame:(NSData *)inputData {
    unsigned int in_size = (unsigned int)[inputData length];
    const short *input = (const short *)[inputData bytes];
    
    unsigned char *output = (unsigned char *)malloc(getEncodedFrameSize());
    encodeFrame(input, output, in_size);
    
    NSData *encodedData = [NSData dataWithBytes:output length:getEncodedFrameSize()];
    free(output);
    
    return encodedData;
}

// 解码一帧
- (NSData *)decodeFrame:(NSData *)encodedData {
    unsigned int in_size = (unsigned int)[encodedData length];
    const unsigned char *input = (const unsigned char *)[encodedData bytes];
    
    short *output = (short *)malloc(getFrameSize());
    decodeFrame(input, output, in_size);
    
    NSData *decodedData = [NSData dataWithBytes:output length:getFrameSize()];
    free(output);
    
    return decodedData;
}

- (NSInteger)getFrameSize {
    return getFrameSize();
}

- (NSInteger)getEncodedFrameSize {
    return getEncodedFrameSize();
}

- (NSInteger)getSampleRate {
    return getSampleRate();
}

- (NSInteger)getFrameDuration {
    return getFrameDuration();
}

@end
