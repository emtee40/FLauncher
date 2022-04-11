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

import 'package:flauncher/backup_restore_service.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

class SettingsBackupRestorePanelPage extends StatelessWidget {
  static const String routeName = "settings_backup_restore_panel";
  final backupRestoreService = BackupRestoreService();

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Text("Settings backup/restore", style: Theme.of(context).textTheme.headline6),
          Divider(),
          TextButton(
            autofocus: true,
            child: Row(
              children: [
                Icon(Icons.backup_outlined),
                Container(width: 8),
                Text("Backup to file", style: Theme.of(context).textTheme.bodyText2),
              ],
            ),
            onPressed: () async {
              if (await backupRestoreService.settingsBackup()) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content:
                          Text("FLauncher settings backup successfully created and stored in your Download folder"),
                      actions: <Widget>[
                        TextButton(
                          child: Text("OK"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text("Failed to create FLauncher settings backup"),
                      actions: <Widget>[
                        TextButton(
                          child: Text("OK"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              }
            },
          ),
          TextButton(
            child: Row(
              children: [
                Icon(Icons.restore_outlined),
                Container(width: 8),
                Text("Restore from file", style: Theme.of(context).textTheme.bodyText2),
              ],
            ),
            onPressed: () async {
              if (await backupRestoreService.settingsRestore()) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text(
                          "FLauncher settings successfully restored from backup. FLauncher will be restarted now."),
                      actions: <Widget>[
                        TextButton(
                          child: Text("OK"),
                          onPressed: () {
                            Restart.restartApp();
                          },
                        ),
                      ],
                    );
                  },
                );
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text("Failed to restore FLauncher settings from backup"),
                      actions: <Widget>[
                        TextButton(
                          child: Text("OK"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              }
            },
          ),
        ],
      );
}
