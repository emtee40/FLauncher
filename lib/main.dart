import 'package:flauncher/apps.dart';
import 'package:flauncher/flauncher.dart';
import 'package:flauncher/flauncher_channel.dart';
import 'package:flauncher/wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider(create: (_) => ImagePicker()),
          ChangeNotifierProvider(create: (_) => Wallpaper()),
          ChangeNotifierProvider(create: (_) => Apps(FLauncherChannel()))
        ],
        child: MaterialApp(
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
          home: WillPopScope(
            onWillPop: () => Future.value(false),
            child: FLauncher(),
          ),
        ),
      );
}
