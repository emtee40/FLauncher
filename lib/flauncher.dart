import 'dart:io';
import 'dart:typed_data';

import 'package:flauncher/app_card.dart';
import 'package:flauncher/application_info.dart';
import 'package:flauncher/date_time_widget.dart';
import 'package:flauncher/flauncher_channel.dart';
import 'package:flauncher/scaling_button.dart';
import 'package:flauncher/wallpaper_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';

class FLauncher extends StatefulWidget {
  @override
  _FLauncherState createState() => _FLauncherState();
}

class _FLauncherState extends State<FLauncher> {
  List<ApplicationInfo> _applications = [];
  List<FocusNode> _focusNodes = [];
  Uint8List? _wallpaperImage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await _refreshWallpaper();
      final applications = await FLauncherChannel.getInstalledApplications();
      _focusNodes = List.generate(applications.length, (_) => FocusNode());
      setState(() {
        _applications = applications;
      });
    });
  }

  @override
  void dispose() {
    _focusNodes.forEach((focusNode) => focusNode.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          _wallpaper(context),
          Scaffold(
            appBar: _appBar(context),
            body: Padding(
              padding: EdgeInsets.all(16),
              child: ListView(
                children: [
                  Focus(child: Container(height: 80)),
                  Padding(
                    padding: EdgeInsets.only(left: 8, bottom: 8),
                    child: Text(
                      "Applications",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  _applications == null
                      ? Center(child: CircularProgressIndicator())
                      : GridView.builder(
                          shrinkWrap: true,
                          gridDelegate: _gridDelegate(),
                          itemCount: _applications.length,
                          itemBuilder: (_, int index) => Padding(
                            padding: EdgeInsets.all(4),
                            child: AppCard(
                              application: _applications[index],
                              focusNode: _focusNodes[index],
                              autofocus: index == 0,
                            ),
                          ),
                        ),
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
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (context) => WallpaperDialog(),
              );
              await _refreshWallpaper();
            },
          ),
          Container(width: 8),
          ScalingButton(
            scale: 1.2,
            child: Icon(Icons.settings_outlined),
            onPressed: () => FLauncherChannel.openSettings(),
          ),
          VerticalDivider(width: 24),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: DateTimeWidget(),
          ),
        ],
      );

  Widget _wallpaper(BuildContext context) => _wallpaperImage != null
      ? Image.memory(
          _wallpaperImage!,
          fit: BoxFit.fill,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        )
      : Container(color: Colors.white12);

  SliverGridDelegate _gridDelegate() =>
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        childAspectRatio: 16 / 9,
      );

  Future<void> _refreshWallpaper() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File("${directory.path}/wallpaper");
    Uint8List? wallpaper;
    if (await file.exists()) {
      wallpaper = await file.readAsBytes();
    }
    setState(() {
      _wallpaperImage = wallpaper;
    });
  }
}
