import 'package:flauncher/ApplicationInfo.dart';
import 'package:flutter/services.dart';

class PackageManager {
  static const MethodChannel _channel =
      const MethodChannel('me.efesser.flauncher/package_manager');

  static Future<List<ApplicationInfo>> getInstalledApplications() async {
    List<dynamic> apps =
        await _channel.invokeMethod('getInstalledApplications');
    return apps.map((e) => ApplicationInfo.create(e)).toList();
  }

  static Future<void> startActivity(String packageName) async =>
      await _channel.invokeMethod('startActivity', packageName);

  static Future<void> openSettings() async =>
      await _channel.invokeMethod('openSettings');
}
