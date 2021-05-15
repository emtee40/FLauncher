import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class WallpaperDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SimpleDialog(
        title: Text("Wallpaper"),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                autofocus: true,
                onPressed: () async {
                  await _changeWallpaper();
                  Navigator.of(context).pop();
                },
                child: Text("SELECT"),
              ),
              TextButton(
                onPressed: () async {
                  await _clearWallpaper();
                  Navigator.of(context).pop();
                },
                child: Text("CLEAR"),
              ),
            ],
          ),
        ],
      );

  Future<void> _changeWallpaper() async {
    final file = await ImagePicker().getImage(source: ImageSource.gallery);
    if (file != null) {
      final directory = await getApplicationDocumentsDirectory();
      File(file.path).copy("${directory.path}/wallpaper");
    }
  }

  Future<void> _clearWallpaper() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File("${directory.path}/wallpaper");
    if (await file.exists()) {
      await file.delete();
    }
  }
}
