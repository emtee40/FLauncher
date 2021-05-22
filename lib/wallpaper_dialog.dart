import 'package:flauncher/wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

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
                onPressed: () => _pickFile(context),
                child: Text("SELECT"),
              ),
              TextButton(
                onPressed: () => _clearWallpaper(context),
                child: Text("CLEAR"),
              ),
            ],
          ),
        ],
      );

  Future<void> _pickFile(BuildContext context) async {
    final imagePicker = context.read<ImagePicker>();
    final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      context.read<Wallpaper>().setWallpaper(bytes);
    }
    Navigator.of(context).pop();
  }

  Future<void> _clearWallpaper(BuildContext context) async {
    await context.read<Wallpaper>().clearWallpaper();
    Navigator.of(context).pop();
  }
}
