package com.ucchip.sdk.codec.talkie;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** TalkiePlugin */
public class TalkiePlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private TalkieCodec talkieCodec;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "talkie");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    switch (call.method) {
      case "init":
        try {
          talkieCodec = new TalkieCodec();
          result.success(true);
        } catch (Exception e) {
          result.error("INIT_ERROR", e.getMessage(), null);
        }
        break;
      case "encode":
        try {
          byte[] data = call.argument("data");
          if (data == null) {
            result.error("ENCODE_ERROR", "No data provided", null);
            return;
          }
          byte[] encoded = talkieCodec.encoder(data);
          result.success(encoded);
        } catch (Exception e) {
          result.error("ENCODE_ERROR", e.getMessage(), null);
        }
        break;
      case "decode":
        try {
          byte[] data = call.argument("data");
          if (data == null) {
            result.error("DECODE_ERROR", "No data provided", null);
            return;
          }
          byte[] decoded = talkieCodec.decoder(data);
          result.success(decoded);
        } catch (Exception e) {
          result.error("DECODE_ERROR", e.getMessage(), null);
        }
        break;
      case "getFrameSize":
        result.success(talkieCodec.getFrameSize());
        break;
      case "getEncodedFrameSize":
        result.success(talkieCodec.getEncodedFrameSize());
        break;
      case "getSampleRate":
        result.success(talkieCodec.getSampleRate());
        break;
      case "getFrameDuration":
        result.success(talkieCodec.getFrameDuration());
        break;
      default:
        result.notImplemented();
        break;
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
