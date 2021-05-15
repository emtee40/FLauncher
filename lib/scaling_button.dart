import 'package:flutter/material.dart';

class ScalingButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;

  ScalingButton({this.child, this.onPressed});

  @override
  Widget build(BuildContext context) => TextButton(
        child: Builder(
          builder: (context) => Transform.scale(
            scale: Focus.of(context).hasFocus ? 1.2 : 1,
            child: child,
          ),
        ),
        onPressed: onPressed,
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: MaterialStateProperty.all(Size.zero),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
      );
}
