import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:talkie/talkie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _talkiePlugin = Talkie();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            TextButton(
                onPressed: () {
                  _talkiePlugin.init().then((value) {
                    print("init: $value");
                  });
                },
                child: const Text("init codec")),
            TextButton(
                onPressed: () {
                  _talkiePlugin.getFrameSize().then((value) {
                    print("getFrameSize: $value");
                  });
                },
                child: const Text("getFrameSize")),
            TextButton(
                onPressed: () {
                  _talkiePlugin.getEncodedFrameSize().then((value) {
                    print("getEncodedFrameSize: $value");
                  });
                },
                child: const Text("getEncodedFrameSize")),
            TextButton(
                onPressed: () {
                  _talkiePlugin.getSampleRate().then((value) {
                    print("getSampleRate: $value");
                  });
                },
                child: const Text("getSampleRate")),
            TextButton(
                onPressed: () {
                  _talkiePlugin.getFrameDuration().then((value) {
                    print("getFrameDuration: $value");
                  });
                },
                child: const Text("getFrameDuration"))
          ],
        ),
      ),
    );
  }
}
