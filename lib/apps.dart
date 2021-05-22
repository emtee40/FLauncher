import 'dart:async';

import 'package:flauncher/application_info.dart';
import 'package:flauncher/flauncher_channel.dart';
import 'package:flutter/foundation.dart';

class Apps extends ChangeNotifier {
  final FLauncherChannel _fLauncherChannel;
  List<ApplicationInfo> _apps = [];

  List<ApplicationInfo> get installedApplications => _apps;

  Apps(this._fLauncherChannel) {
    _init();
  }

  Future<void> _init() async {
    final apps = await _fLauncherChannel.getInstalledApplications();
    _apps = apps.map((e) => ApplicationInfo.create(e)).toList();
    _fLauncherChannel.addAppsChangedListener(_onAppsChanged);
    notifyListeners();
  }

  Future<void> _onAppsChanged(Map<dynamic, dynamic> event) async {
    final apps = await _fLauncherChannel.getInstalledApplications();
    _apps = apps.map((e) => ApplicationInfo.create(e)).toList();
    notifyListeners();
  }

  Future<void> launchApp(ApplicationInfo app) =>
      _fLauncherChannel.launchApp(app.packageName, app.className);

  Future<void> openSettings() => _fLauncherChannel.openSettings();
}
