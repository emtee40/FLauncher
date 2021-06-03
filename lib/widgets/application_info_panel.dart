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

import 'package:flauncher/application_info.dart';
import 'package:flauncher/apps.dart';
import 'package:flauncher/widgets/right_panel_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApplicationInfoPanel extends StatelessWidget {
  final ApplicationInfo application;

  ApplicationInfoPanel({
    required this.application,
  });

  @override
  Widget build(BuildContext context) => RightPanelDialog(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Image.memory(application.icon!, width: 50),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      application.name,
                      style: Theme.of(context).textTheme.headline6,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                application.packageName,
                style: Theme.of(context).textTheme.caption,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              "v${application.version}",
              style: Theme.of(context).textTheme.caption,
              overflow: TextOverflow.ellipsis,
            ),
            Divider(),
            TextButton(
              child: Row(
                children: [
                  Icon(Icons.info_outlined),
                  Container(width: 8),
                  Text(
                    "App info",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              onPressed: () => context.read<Apps>().openAppInfo(application),
            ),
            TextButton(
              child: Row(
                children: [
                  Icon(Icons.delete_outlined),
                  Container(width: 8),
                  Text(
                    "Uninstall",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              onPressed: () async {
                await context.read<Apps>().uninstallApp(application);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
}
