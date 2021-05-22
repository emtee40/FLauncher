import 'dart:typed_data';

import 'package:flauncher/app_card.dart';
import 'package:flauncher/apps.dart';
import 'package:flauncher/date_time_widget.dart';
import 'package:flauncher/scaling_button.dart';
import 'package:flauncher/wallpaper.dart';
import 'package:flauncher/wallpaper_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class FLauncher extends StatefulWidget {
  @override
  _FLauncherState createState() => _FLauncherState();
}

class _FLauncherState extends State<FLauncher> {
  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Consumer<Wallpaper>(
            builder: (_, wallpaper, __) => _wallpaper(wallpaper.wallpaperBytes),
          ),
          Scaffold(
            appBar: _appBar(context),
            body: Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: ListView(
                children: [
                  Focus(child: Container(height: 80)),
                  Padding(
                    padding: EdgeInsets.only(left: 16, bottom: 8),
                    child: Text(
                      "Applications",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Consumer<Apps>(
                    builder: (context, apps, _) => apps
                            .installedApplications.isEmpty
                        ? Center(child: CircularProgressIndicator())
                        : GridView.builder(
                            shrinkWrap: true,
                            gridDelegate: _gridDelegate(),
                            itemCount: apps.installedApplications.length,
                            padding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 16,
                            ),
                            itemBuilder: (_, int index) => AppCard(
                              application: apps.installedApplications[index],
                              autofocus: index == 0,
                            ),
                          ),
                  ),
                  Focus(child: Container(height: 80))
                ],
              ),
            ),
          ),
        ],
      );

  AppBar _appBar(BuildContext context) => AppBar(
        actions: [
          ScalingButton(
            scale: 1.2,
            child: Icon(Icons.wallpaper),
            onPressed: () => showDialog(
              context: context,
              builder: (context) => WallpaperDialog(),
            ),
          ),
          Container(width: 8),
          ScalingButton(
            scale: 1.2,
            child: Icon(Icons.settings_outlined),
            onPressed: () => context.read<Apps>().openSettings(),
          ),
          VerticalDivider(
            width: 24,
            thickness: 1,
            indent: 8,
            endIndent: 8,
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: DateTimeWidget(),
          ),
        ],
      );

  Widget _wallpaper(Uint8List? wallpaperImage) => wallpaperImage != null
      ? Image.memory(
          wallpaperImage,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        )
      : Container(color: Colors.white12);

  SliverGridDelegate _gridDelegate() =>
      SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          childAspectRatio: 16 / 9,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16);
}
