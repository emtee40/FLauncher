import 'dart:async';

import 'package:flutter/services.dart';

class FLauncherChannel {
  static const _methodChannel = MethodChannel('me.efesser.flauncher/method');
  static const _eventChannel = EventChannel('me.efesser.flauncher/event');

  Future<List<dynamic>> getInstalledApplications() async =>
      (await _methodChannel
          .invokeMethod<List<dynamic>>('getInstalledApplications'))!;

  Future<void> launchApp(String packageName, String className) async =>
      await _methodChannel.invokeMethod('launchApp', [packageName, className]);

  Future<void> openSettings() async =>
      await _methodChannel.invokeMethod('openSettings');

  void addAppsChangedListener(void Function(Map<dynamic, dynamic>) listener) =>
      _eventChannel.receiveBroadcastStream().listen((event) => listener(event));
}
