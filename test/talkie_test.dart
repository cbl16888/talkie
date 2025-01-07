import 'package:flutter_test/flutter_test.dart';
import 'package:talkie/talkie.dart';
import 'package:talkie/talkie_platform_interface.dart';
import 'package:talkie/talkie_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTalkiePlatform
    with MockPlatformInterfaceMixin
    implements TalkiePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TalkiePlatform initialPlatform = TalkiePlatform.instance;

  test('$MethodChannelTalkie is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTalkie>());
  });

  test('getPlatformVersion', () async {
    Talkie talkiePlugin = Talkie();
    MockTalkiePlatform fakePlatform = MockTalkiePlatform();
    TalkiePlatform.instance = fakePlatform;

    expect(await talkiePlugin.getPlatformVersion(), '42');
  });
}
