import 'package:flauncher/flauncher.dart';
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
        theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.dark(primary: Colors.white),
          typography: Typography.material2018(),
          buttonTheme: ButtonThemeData(highlightColor: Colors.transparent),
          appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          scaffoldBackgroundColor: Colors.transparent,
        ),
        home: FLauncher(),
      );
}
