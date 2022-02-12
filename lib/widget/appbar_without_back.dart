import 'package:flutter/material.dart';
import 'package:need_flutter_app/utils/sizes.dart';
import 'package:get/get.dart';


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
