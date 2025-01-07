# talkie

flutter talkie codec

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

// 1. 加载so库,使用指令: strings libtalkie.so  查看方法列表
Java_com_ucchip_sdk_codec_talkie_TalkieCodec_init
Java_com_ucchip_sdk_codec_talkie_TalkieCodec_encoder
Java_com_ucchip_sdk_codec_talkie_TalkieCodec_decoder
Java_com_ucchip_sdk_codec_talkie_TalkieCodec_getFrameSize
Java_com_ucchip_sdk_codec_talkie_TalkieCodec_getEncodedFrameSize
Java_com_ucchip_sdk_codec_talkie_TalkieCodec_getSampleRate
Java_com_ucchip_sdk_codec_talkie_TalkieCodec_getFrameDuration
// 插件的包名和方法列表保持一致  此处包名为: com.ucchip.sdk.codec.talkie