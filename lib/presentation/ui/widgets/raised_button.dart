import 'package:flutter/material.dart';

class RaisedButton extends StatelessWidget {
  const RaisedButton({
    Key? key,
    this.color,
    this.onPressed,
    this.padding,
    this.shape,
    required this.child,
    this.elevation,
    this.splashColor,
    this.textColor,
    this.shrinkSize = true,
  }) : super(key: key);

  final Color? color;
  final void Function()? onPressed;
  final EdgeInsets? padding;
  final OutlinedBorder? shape;
  final Widget child;
  final double? elevation;
  final Color? splashColor;
  final Color? textColor;
  final bool shrinkSize;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = ElevatedButton.styleFrom(
      minimumSize: !shrinkSize ? Size(double.infinity, 40) : null,
      padding: padding,
      shape: shape,
      elevation: elevation,
      backgroundColor: color,
    );

    return ElevatedButton(
      style: flatButtonStyle,
      onPressed: onPressed,
      child: child,
    );
  }
}

class RaisedIconButton extends StatelessWidget {
  const RaisedIconButton(
      {Key? key,
      this.onPressed,
      this.shape,
      required this.label,
      this.color,
      this.textColor,
      required this.icon})
      : super(key: key);
  final void Function()? onPressed;
  final RoundedRectangleBorder? shape;
  final Text label;
  final Color? color;
  final Color? textColor;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = ElevatedButton.styleFrom(
      shape: shape,
      backgroundColor: color,
    );

    return ElevatedButton.icon(
        onPressed: onPressed, icon: icon, label: label, style: flatButtonStyle);
  }
}
