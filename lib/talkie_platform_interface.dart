import 'dart:typed_data';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'talkie_method_channel.dart';

abstract class TalkiePlatform extends PlatformInterface {
  /// Constructs a TalkiePlatform.
  TalkiePlatform() : super(token: _token);

  static final Object _token = Object();

  static TalkiePlatform _instance = MethodChannelTalkie();

  /// The default instance of [TalkiePlatform] to use.
  ///
  /// Defaults to [MethodChannelTalkie].
  static TalkiePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TalkiePlatform] when
  /// they register themselves.
  static set instance(TalkiePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  // 初始化编解码器
  Future<bool> init() async {
    throw UnimplementedError('init() has not been implemented.');
  }

  // 编码
  Future<Uint8List?> encode(Uint8List data) async {
    throw UnimplementedError('encode() has not been implemented.');
  }

  // 解码
  Future<Uint8List?> decode(Uint8List data) async {
    throw UnimplementedError('decode() has not been implemented.');
  }

  // 获取参数
  Future<int> getFrameSize() async {
    throw UnimplementedError('getFrameSize() has not been implemented.');
  }

  Future<int> getEncodedFrameSize() async {
    throw UnimplementedError('getEncodedFrameSize() has not been implemented.');
  }

  Future<int> getSampleRate() async {
    throw UnimplementedError('getSampleRate() has not been implemented.');
  }

  Future<int> getFrameDuration() async {
    throw UnimplementedError('getFrameDuration() has not been implemented.');
  }
}
