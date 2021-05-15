import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeWidget extends StatefulWidget {
  @override
  _DateTimeWidgetState createState() => _DateTimeWidgetState();
}

class _DateTimeWidgetState extends State<DateTimeWidget> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer =
        Timer.periodic(Duration(seconds: 1), (Timer timer) => _refreshTime());
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Row(children: [
      Text(
        DateFormat.Hm().format(now),
        style: Theme.of(context).textTheme.headline5,
      ),
      Container(width: 8),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(DateFormat.EEEE().format(now),
              style: Theme.of(context).textTheme.subtitle2),
          Text(
              "${DateFormat.MMMMd().format(now)}, "
              "${DateFormat.y().format(now)}",
              style: Theme.of(context).textTheme.subtitle2),
        ],
      )
    ]);
  }

  void _refreshTime() {
    setState(() {});
  }
}
