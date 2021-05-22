import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class Wallpaper extends ChangeNotifier {
  late final File _wallpaperFile;

  Uint8List? _wallpaper;

  Uint8List? get wallpaperBytes => _wallpaper;

  Wallpaper() {
    _init();
  }

  Future<void> _init() async {
    final directory = await getApplicationDocumentsDirectory();
    _wallpaperFile = File("${directory.path}/wallpaper");
    if (await _wallpaperFile.exists()) {
      _wallpaper = await _wallpaperFile.readAsBytes();
      notifyListeners();
    }
  }

  Future<void> setWallpaper(Uint8List bytes) async {
    _wallpaperFile.writeAsBytes(bytes);
    _wallpaper = bytes;
    notifyListeners();
  }

  Future<void> clearWallpaper() async {
    if (await _wallpaperFile.exists()) {
      await _wallpaperFile.delete();
    }
    _wallpaper = null;
    notifyListeners();
  }
}
