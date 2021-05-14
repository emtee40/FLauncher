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
        theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.dark(primary: Colors.white),
          typography: Typography.material2018(),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: MaterialStateProperty.all(Size.zero),
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
          ),
          appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
        home: FLauncher(),
      );
}
