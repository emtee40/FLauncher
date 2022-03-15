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
import 'dart:ui';

import 'package:battery_plus/battery_plus.dart';
import 'package:flauncher/providers/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BatteryWidget extends StatefulWidget {
  @override
  _BatteryWidgetState createState() => _BatteryWidgetState();
}

class _BatteryWidgetState extends State<BatteryWidget> {
  var _battery = Battery();
  int _level = 100;
  BatteryState _batteryState = BatteryState.full;
  late Timer _timer;
  late StreamSubscription _streamSubscription;

  @override
  void initState() {
    super.initState();
    _getBatteryPercentage();
    _getBatteryState();
    _timer = Timer.periodic(Duration(seconds: 5), (_timer) { _getBatteryPercentage(); });
  }

  void _getBatteryPercentage() async {
    final _batteryLevel = await _battery.batteryLevel;
    this._level = _batteryLevel;
    setState(() {});
  }

  void _getBatteryState() {
    _streamSubscription = _battery.onBatteryStateChanged.listen((state) {
      setState(() {
        this._batteryState = state;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _streamSubscription.cancel();
    super.dispose();
  }

  Widget batteryIcon(BatteryState state, int level) {
    switch (state) {
      case BatteryState.full:
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              top: 1.5,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2, tileMode: TileMode.decal),
                child: Icon(Icons.battery_full_outlined, color: Colors.black54),
              ),
            ),
            Icon(Icons.battery_full_outlined, size: 24, color: Colors.green),
          ],
        );
      case BatteryState.charging:
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              top: 1.5,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2, tileMode: TileMode.decal),
                child: Icon(Icons.battery_charging_full_outlined, color: Colors.black54),
              ),
            ),
            ShaderMask(
              blendMode: BlendMode.srcATop,
              shaderCallback: (Rect rect) {
                return LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0, level/100, (level/100)+0.01],
                  colors: [Colors.white, Colors.white, Colors.white.withOpacity(0)],
                ).createShader(rect);
              },
              child: SizedBox(
                child: Icon(Icons.battery_charging_full_outlined, size: 24, color: Colors.grey),
                width: 24,
                height: 24,
              ),
            ),
          ],
        );
      case BatteryState.discharging:
      default:
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              top: 1.5,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2, tileMode: TileMode.decal),
                child: Icon(Icons.battery_full_outlined, color: Colors.black54),
              ),
            ),
            ShaderMask(
              blendMode: BlendMode.srcATop,
              shaderCallback: (Rect rect) {
                return LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0, level/100, (level/100)+0.01],
                  colors: [Colors.white, Colors.white, Colors.white.withOpacity(0)],
                ).createShader(rect);
              },
              child: SizedBox(
                child: Icon(Icons.battery_full_outlined, size: 24, color: Colors.grey),
                width: 24,
                height: 24,
              ),
            ),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) =>  Selector<SettingsService, bool>(
    selector: (_, settingsService) => settingsService.showBatteryPercentage,
    builder: (context, showBatteryPercentage, _) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        batteryIcon(_batteryState, _level),
        if(showBatteryPercentage)
            Text(
            '${_level}%',
            style: Theme.of(context).textTheme.headline6!.copyWith(
              shadows: [Shadow(color: Colors.black54, offset: Offset(1, 1), blurRadius: 8)],
            ),
            textAlign: TextAlign.end,
          ),
      ],
    ),
  );

}
