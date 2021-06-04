/*
 * FLauncher
 * Copyright (C) 2021  Étienne Fesser
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

import 'package:flauncher/apps.dart';
import 'package:flauncher/settings.dart';
import 'package:flauncher/wallpaper.dart';
import 'package:flauncher/widgets/right_panel_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) => RightPanelDialog(
        width: 300,
        child: Consumer<Settings>(
          builder: (context, settings, _) => Column(
            children: [
              Text(
                "Settings",
                style: Theme.of(context).textTheme.headline6,
              ),
              Divider(),
              TextButton(
                child: Row(
                  children: [
                    Icon(Icons.wallpaper_outlined),
                    Container(width: 8),
                    Text(
                      "Wallpaper",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => _WallpaperDialog(),
                ),
              ),
              Divider(),
              TextButton(
                child: Row(
                  children: [
                    Icon(Icons.settings_outlined),
                    Container(width: 8),
                    Text(
                      "Android settings",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
                onPressed: () => context.read<Apps>().openSettings(),
              ),
              Divider(),
              SwitchListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
                value: settings.crashReportsEnabled,
                onChanged: (value) => settings.setCrashReportsEnabled(value),
                title: Text("Crash Reporting"),
                dense: true,
                subtitle: Text(
                    "Automatically send crash reports through Firebase Crashlytics."),
              ),
            ],
          ),
        ),
      );
}

class _WallpaperDialog extends StatelessWidget {
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
                  await context.read<Wallpaper>().pickWallpaper();
                  Navigator.of(context).pop();
                },
                child: Text("SELECT"),
              ),
              TextButton(
                onPressed: () async {
                  await context.read<Wallpaper>().clearWallpaper();
                  Navigator.of(context).pop();
                },
                child: Text("CLEAR"),
              ),
            ],
          ),
        ],
      );
}
