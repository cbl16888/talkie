
// 初始化
bool initCodec();

// 编码一帧
void encodeFrame(const short* in, unsigned char* out, unsigned int in_size);

// 解码一帧
void decodeFrame(const unsigned char* in, short* out, unsigned int in_size);

// 获取每帧字节数
int getFrameSize();

// 获取编码后的每帧字节数
int getEncodedFrameSize();

// 获取采样率
int getSampleRate();

// 获取帧时长
int getFrameDuration();
