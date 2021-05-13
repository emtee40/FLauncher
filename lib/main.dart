import 'package:flauncher/FLauncher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        shortcuts: WidgetsApp.defaultShortcuts
          ..addAll(
              {LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent()}),
        title: 'FLauncher',
        theme: ThemeData.dark().copyWith(typography: Typography.material2018()),
        home: FLauncher(),
      );
}
