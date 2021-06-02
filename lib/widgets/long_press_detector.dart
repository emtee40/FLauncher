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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Duration _timerDuration = Duration(milliseconds: 500);

class LongPressDetector extends StatefulWidget {
  final Widget child;
  final Function(BuildContext)? onPressed;
  final Function(BuildContext)? onLongPressed;

  LongPressDetector({
    required this.child,
    this.onPressed,
    this.onLongPressed,
  });

  @override
  _LongPressDetectorState createState() => _LongPressDetectorState();
}

class _LongPressDetectorState extends State<LongPressDetector> {
  bool _keyDown = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Focus(
        canRequestFocus: false,
        onKey: (_, rawKeyEvent) => _handleKey(context, rawKeyEvent),
        child: widget.child,
      );

  KeyEventResult _handleKey(BuildContext context, RawKeyEvent rawKeyEvent) {
    if (!_isSelect(rawKeyEvent)) {
      return KeyEventResult.ignored;
    }
    switch (rawKeyEvent.runtimeType) {
      case RawKeyDownEvent:
        _keyDownEvent(context);
        break;
      case RawKeyUpEvent:
        _keyUpEvent(context);
        break;
    }
    return KeyEventResult.handled;
  }

  void _keyDownEvent(BuildContext context) {
    if (!_keyDown) {
      _keyDown = true;
      _timer = Timer(_timerDuration, () => widget.onLongPressed?.call(context));
    }
  }

  void _keyUpEvent(BuildContext context) {
    _keyDown = false;
    if (_timer?.isActive ?? false) {
      _timer!.cancel();
      widget.onPressed?.call(context);
    }
  }

  bool _isSelect(RawKeyEvent rawKeyEvent) =>
      rawKeyEvent.logicalKey == LogicalKeyboardKey.select ||
      rawKeyEvent.logicalKey == LogicalKeyboardKey.enter ||
      rawKeyEvent.logicalKey == LogicalKeyboardKey.space;
}
