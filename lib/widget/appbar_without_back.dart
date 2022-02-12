import 'package:flutter/material.dart';


AppBar appBarWithoutBack({
  String title = "",
  TextStyle? textStyle,
  Widget? leading,
  Color backgroundColor = Colors.white,
  Color color = Colors.black,
  Color buttonColor = Colors.black,
  Function? onBackTap,
  List<Widget>? actions,
  bool center = true,
}) {
  return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0.0,
      title: Text(
        title,
        style: textStyle,
      ),
      centerTitle: center,
      actions: actions
  );
}
