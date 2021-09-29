import 'package:flutter/material.dart';
import 'package:need_flutter_app/utils/sizes.dart';


AppBar appBarCustom({
  String title = "",
  required TextStyle textStyle,
  Color backgroundColor = Colors.white,
  Color color = Colors.white,
  Color buttonColor = Colors.white,
  required Function onBackTap,
  required List<Widget> actions,
}) {
  return AppBar(
    backgroundColor: backgroundColor,
    elevation: 0.0,
    title: Text(
      title,
      style: textStyle,
    ),
    centerTitle: true,
    actions: actions
  );
}

class AppBackButton extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final Function onTap;
  final Color color;

  const AppBackButton({
    Key? key,
    required this.padding,
    required this.onTap,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: padding,
      icon: Icon(
        Icons.arrow_back_ios_outlined,
        color: color,
        size: Sizes.s20,
      ),
      onPressed: onTap()
    );
  }
}
