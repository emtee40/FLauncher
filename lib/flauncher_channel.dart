import 'package:flutter/services.dart';

class FLauncherChannel {
  static const MethodChannel _channel =
      const MethodChannel('me.efesser.flauncher');

  Future<List<dynamic>> getInstalledApplications() async =>
      (await _channel.invokeMethod<List<dynamic>>('getInstalledApplications'))!;

  Future<void> launchApp(String packageName, String className) async =>
      await _channel.invokeMethod('launchApp', [packageName, className]);

  Future<void> openSettings() async =>
      await _channel.invokeMethod('openSettings');
}
