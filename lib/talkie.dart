
import 'dart:typed_data';

import 'talkie_platform_interface.dart';

class Talkie {
  // 初始化编解码器
  Future<bool> init() async {
    return TalkiePlatform.instance.init();
  }

  // 编码
  Future<Uint8List?> encode(Uint8List data) async {
    return TalkiePlatform.instance.encode(data);
  }

  // 解码
  Future<Uint8List?> decode(Uint8List data) async {
    return TalkiePlatform.instance.decode(data);
  }

  // 获取参数
  Future<int> getFrameSize() async {
    return TalkiePlatform.instance.getFrameSize();
  }

  Future<int> getEncodedFrameSize() async {
    return TalkiePlatform.instance.getEncodedFrameSize();
  }

  Future<int> getSampleRate() async {
    return TalkiePlatform.instance.getSampleRate();
  }

  Future<int> getFrameDuration() async {
    return TalkiePlatform.instance.getFrameDuration();
  }
}
