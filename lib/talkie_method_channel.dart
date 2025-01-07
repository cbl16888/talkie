import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'talkie_platform_interface.dart';

/// An implementation of [TalkiePlatform] that uses method channels.
class MethodChannelTalkie extends TalkiePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('talkie');

  // 初始化编解码器
  @override
  Future<bool> init() async {
    final bool success = await methodChannel.invokeMethod('init');
    return success;
  }

  // 编码
  @override
  Future<Uint8List?> encode(Uint8List data) async {
    final result = await methodChannel.invokeMethod('encode', {
      'data': data,
    });
    return result != null ? Uint8List.fromList(result) : null;
  }

  // 解码
  @override
  Future<Uint8List?> decode(Uint8List data) async {
    final result = await methodChannel.invokeMethod('decode', {
      'data': data,
    });
    return result != null ? Uint8List.fromList(result) : null;
  }

  // 获取参数
  @override
  Future<int> getFrameSize() async {
    return await methodChannel.invokeMethod('getFrameSize');
  }

  @override
  Future<int> getEncodedFrameSize() async {
    return await methodChannel.invokeMethod('getEncodedFrameSize');
  }

  @override
  Future<int> getSampleRate() async {
    return await methodChannel.invokeMethod('getSampleRate');
  }

  @override
  Future<int> getFrameDuration() async {
    return await methodChannel.invokeMethod('getFrameDuration');
  }
}
