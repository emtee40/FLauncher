import 'package:flutter/material.dart';

class ScalingButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final double scale;
  final FocusNode? focusNode;
  final bool autofocus;

  ScalingButton({
    required this.child,
    required this.onPressed,
    required this.scale,
    this.focusNode,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) => TextButton(
        child: Builder(
          builder: (context) => Transform.scale(
            scale: Focus.of(context).hasFocus ? scale : 1,
            child: child,
          ),
        ),
        onPressed: onPressed,
        focusNode: focusNode,
        autofocus: autofocus,
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: MaterialStateProperty.all(Size.zero),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
      );
}
