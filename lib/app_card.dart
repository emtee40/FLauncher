import 'package:flauncher/application_info.dart';
import 'package:flauncher/flauncher_channel.dart';
import 'package:flauncher/scaling_button.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final ApplicationInfo application;
  final FocusNode focusNode;
  final bool autofocus;

  AppCard({
    required this.application,
    required this.focusNode,
    required this.autofocus,
  });

  @override
  Widget build(BuildContext context) => ScalingButton(
        scale: 1.1,
        focusNode: focusNode,
        autofocus: autofocus,
        onPressed: () => FLauncherChannel.launchApp(application),
        child: Builder(
          builder: (context) {
            final hasFocus = Focus.of(context).hasFocus;
            return Stack(
              children: [
                SizedBox.expand(
                  child: Card(
                    elevation: hasFocus ? 4 : 0,
                    clipBehavior: Clip.antiAlias,
                    child: application.banner != null
                        ? Image.memory(application.banner!, fit: BoxFit.cover)
                        : Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Image.memory(
                                  application.icon!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  application.name,
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              )
                            ],
                          ),
                  ),
                ),
                SizedBox.expand(
                  child: Opacity(
                    opacity: hasFocus ? 0 : 0.25,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      );
}
