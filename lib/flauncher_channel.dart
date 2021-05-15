import 'package:flauncher/application_info.dart';
import 'package:flutter/services.dart';

class FLauncherChannel {
  static const MethodChannel _channel =
      const MethodChannel('me.efesser.flauncher');

  static Future<List<ApplicationInfo>> getInstalledApplications() async {
    List<dynamic> apps =
        await _channel.invokeMethod('getInstalledApplications');
    return apps.map((e) => ApplicationInfo.create(e)).toList();
  }

  static Future<void> launchApp(ApplicationInfo app) async =>
      await _channel.invokeMethod(
        'launchApp',
        [app.packageName, app.className],
      );

  static Future<void> openSettings() async =>
      await _channel.invokeMethod('openSettings');
}
