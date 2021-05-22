import 'package:flauncher/application_info.dart';
import 'package:flauncher/apps.dart';
import 'package:flauncher/scaling_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppCard extends StatelessWidget {
  final ApplicationInfo application;
  final bool autofocus;

  AppCard({
    required this.application,
    required this.autofocus,
  });

  @override
  Widget build(BuildContext context) => ScalingButton(
        scale: 1.15,
        autofocus: autofocus,
        onPressed: () => context.read<Apps>().launchApp(application),
        child: Builder(
          builder: (context) => Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: _borderRadius(),
                    color: Theme.of(context).backgroundColor),
                clipBehavior: Clip.antiAlias,
                child: application.banner != null
                    ? Image.memory(application.banner!)
                    : Row(
                        children: [
                          Image.memory(application.icon!),
                          Expanded(
                            child: Text(
                              application.name,
                              style: Theme.of(context).textTheme.bodyText2,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          )
                        ],
                      ),
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 100),
                opacity: Focus.of(context).hasFocus ? 0 : 0.25,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: _borderRadius(),
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  BorderRadius _borderRadius() => BorderRadius.circular(16);
}
