import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  @required
  final String? text;
  final Color? color;
  final bool? isbold;
  final double? size;
  final TextAlign? textAlign;
  final String? fontfamily;

  const TextView(
      {Key? key,
      this.text,
      this.color,
      this.isbold,
      this.size,
      this.textAlign,
      this.fontfamily})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: isbold == true ? FontWeight.bold : null,
          fontFamily: fontfamily),
    );
  }
}
