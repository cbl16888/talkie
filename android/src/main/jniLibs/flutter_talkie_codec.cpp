#include <jni.h>
#include <string>
#include <android/log.h>

#define LOG_TAG "TalkieCodec"
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)

extern "C" {

JNIEXPORT jint JNICALL
Java_com_aewt_talkie_codec_flutter_1talkie_1codec_TalkieCodec_init(JNIEnv *env, jobject thiz) {
    // TODO: 实现初始化逻辑
    return 0;
}

JNIEXPORT jbyteArray JNICALL
Java_com_aewt_talkie_codec_flutter_1talkie_1codec_TalkieCodec_encoder(JNIEnv *env, jobject thiz, jbyteArray data) {
    // TODO: 实现编码逻辑
    return nullptr;
}

JNIEXPORT jbyteArray JNICALL
Java_com_aewt_talkie_codec_flutter_1talkie_1codec_TalkieCodec_decoder(JNIEnv *env, jobject thiz, jbyteArray data) {
    // TODO: 实现解码逻辑
    return nullptr;
}

JNIEXPORT jint JNICALL
Java_com_aewt_talkie_codec_flutter_1talkie_1codec_TalkieCodec_getFrameSize(JNIEnv *env, jobject thiz) {
    // TODO: 实现获取帧大小逻辑
    return 0;
}

JNIEXPORT jint JNICALL
Java_com_aewt_talkie_codec_flutter_1talkie_1codec_TalkieCodec_getEncodedFrameSize(JNIEnv *env, jobject thiz) {
    // TODO: 实现获取编码帧大小逻辑
    return 0;
}

JNIEXPORT jint JNICALL
Java_com_aewt_talkie_codec_flutter_1talkie_1codec_TalkieCodec_getSampleRate(JNIEnv *env, jobject thiz) {
    // TODO: 实现获取采样率逻辑
    return 0;
}

JNIEXPORT jint JNICALL
Java_com_aewt_talkie_codec_flutter_1talkie_1codec_TalkieCodec_getFrameDuration(JNIEnv *env, jobject thiz) {
    // TODO: 实现获取帧时长逻辑
    return 0;
}

}
