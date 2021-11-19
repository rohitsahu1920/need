import 'package:flutter/material.dart';
import 'package:need_flutter_app/utils/sizes.dart';

class CircleIconButton extends StatelessWidget {
  final Widget icon;
  final Color iconTint;
  final double iconSize;
  final Function onTap;
  final EdgeInsets padding;

  CircleIconButton({
    Key ?key,
    required this.icon,
    required this.iconTint,
    required this.iconSize,
    required this.onTap,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap(),
      child: Container(
        padding: padding,
        height: iconSize,
        width: iconSize,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(Sizes.s25),
          ),
          color: iconTint,
        ),
        child: icon,
      ),
    );
  }
}
