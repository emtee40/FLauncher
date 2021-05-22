import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeWidget extends StatefulWidget {
  @override
  _DateTimeWidgetState createState() => _DateTimeWidgetState();
}

class _DateTimeWidgetState extends State<DateTimeWidget> {
  late DateTime _now;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _timer = Timer.periodic(Duration(seconds: 1), (_) => _refreshTime());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Text(
            DateFormat.Hm().format(_now),
            style: Theme.of(context).textTheme.headline5,
          ),
          Container(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(DateFormat.EEEE().format(_now),
                  style: Theme.of(context).textTheme.subtitle2),
              Text(
                  "${DateFormat.MMMMd().format(_now)}, "
                  "${DateFormat.y().format(_now)}",
                  style: Theme.of(context).textTheme.subtitle2),
            ],
          )
        ],
      );

  void _refreshTime() {
    setState(() {
      _now = DateTime.now();
    });
  }
}
