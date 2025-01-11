import Flutter
import UIKit

public class TalkiePlugin: NSObject, FlutterPlugin {
  let talkieCodec: TalkieCodec

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "talkie", binaryMessenger: registrar.messenger())
    let instance = TalkiePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
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
      result(FlutterMethodNotImplemented)
    }
  }
}
