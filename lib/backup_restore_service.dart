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

import 'dart:async';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class BackupRestoreService {
  late final Directory _flauncherDbDir;
  late final File _flauncherDbFile;
  late final File _flauncherDbFileShm;
  late final File _flauncherDbFileWal;
  late final Directory _sharedPrefsDir;

  BackupRestoreService() {
    _init();
  }

  Future<void> _init() async {
    _flauncherDbDir = await getApplicationDocumentsDirectory();
    _flauncherDbFile = File('${_flauncherDbDir.path}/db.sqlite');
    _flauncherDbFileShm = File('${_flauncherDbDir.path}/db.sqlite-shm');
    _flauncherDbFileWal = File('${_flauncherDbDir.path}/db.sqlite-wal');
    _sharedPrefsDir = Directory(dirname(_flauncherDbDir.path) + '/shared_prefs');
  }

  Future<bool> settingsBackup() async {
    final _backupDestPath = Directory('/storage/emulated/0/Download');
    final _timestamp = DateTime.now();
    final _backupFile =
        File('${_backupDestPath.path}/flauncher_backup_' + DateFormat('yyyyMMddHHmmss').format(_timestamp) + '.bak');
    try {
      if (_backupFile.existsSync()) {
        debugPrint('Deleting existing FLauncher settings backup file: ${_backupFile.path}');
        _backupFile.deleteSync();
      }
      debugPrint('Saving FLauncher settings backup file: ${_backupFile.path}');
      // Create FLauncher settings backup file
      final _flauncherBackup = ZipFileEncoder();
      _flauncherBackup.create(_backupFile.path);
      // Backup FLauncher database files
      await _flauncherBackup.addFile(_flauncherDbFile);
      await _flauncherBackup.addFile(_flauncherDbFileShm);
      await _flauncherBackup.addFile(_flauncherDbFileWal);
      // Backup FLauncher shared preferences
      await _flauncherBackup.addDirectory(_sharedPrefsDir);
      _flauncherBackup.close();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> settingsRestore() async {
    final _flauncherSupportDir = await getApplicationSupportDirectory();
    final FilePickerResult? _restoreFilePath = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['bak'],
      allowMultiple: false,
    );
    if (_restoreFilePath != null) {
      try {
        // Read FLauncher settings backup file from disk
        PlatformFile _restoreFile = _restoreFilePath.files.first;
        debugPrint('Reading FLauncher settings backup file: ${_restoreFile.path}');
        final _restoreFileStream = InputFileStream(_restoreFile.path!);
        // Decode the FLauncher settings backup file
        final _restoreFileArchive = ZipDecoder().decodeBuffer(_restoreFileStream);
        // Extract the contents of the FLauncher settings backup archive to disk
        debugPrint('Restoring FLauncher settings backup file');
        extractArchiveToDisk(_restoreFileArchive, _flauncherSupportDir.path);
        // Restore FLauncher database files
        debugPrint("Deleting existing FLauncher database files");
        if (_flauncherDbFile.existsSync()) {
          _flauncherDbFile.deleteSync();
        }
        if (_flauncherDbFileShm.existsSync()) {
          _flauncherDbFileShm.deleteSync();
        }
        if (_flauncherDbFileWal.existsSync()) {
          _flauncherDbFileWal.deleteSync();
        }
        debugPrint('Restoring FLauncher database files from backup');
        File('${_flauncherSupportDir.path}/db.sqlite').renameSync(_flauncherDbFile.path);
        File('${_flauncherSupportDir.path}/db.sqlite-shm').renameSync(_flauncherDbFileShm.path);
        File('${_flauncherSupportDir.path}/db.sqlite-wal').renameSync(_flauncherDbFileWal.path);
        // Restore FLauncher shared preferences
        if (_sharedPrefsDir.existsSync()) {
          debugPrint('Deleting existing FLauncher settings directory');
          _sharedPrefsDir.deleteSync(recursive: true);
        }
        debugPrint('Restoring FLauncher settings directory from backup');
        _sharedPrefsDir.createSync(recursive: true);
        final _restoreSharedPrefsFiles =
            Directory('${_flauncherSupportDir.path}/shared_prefs').listSync().whereType<File>();
        for (File _restoreSharedPrefsFile in _restoreSharedPrefsFiles) {
          _restoreSharedPrefsFile.rename('${_sharedPrefsDir.path}/' + basename(_restoreSharedPrefsFile.path));
        }
        // Cleanup
        Directory('${_flauncherSupportDir.path}/shared_prefs').deleteSync(recursive: true);
        File(_restoreFile.path!).deleteSync();
        return true;
      } catch (e) {
        print(e);
        return false;
      }
    } else {
      // User canceled file selection
      debugPrint('User canceled file selection. Aborting FLauncher settings restore');
      return false;
    }
  }
}
