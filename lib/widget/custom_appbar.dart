import 'package:flutter/material.dart';
import 'package:need_flutter_app/utils/sizes.dart';
import 'package:get/get.dart';


AppBar appBarCustom({
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
      leading: leading ??
          AppBackButton(
            color: buttonColor,
            onTap: onBackTap,
          ),
    title: Text(
      title,
      style: textStyle,
    ),
    centerTitle: center,
    actions: actions
  );
}

class AppBackButton extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Function? onTap;
  final Color color;

  const AppBackButton({
    Key? key,
    this.padding,
    this.onTap,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: padding ?? EdgeInsets.all(0),
      icon: Icon(
        Icons.arrow_back_ios_outlined,
        color: color,
        size: Sizes.s20,
      ),
      onPressed: () => onTap!() ?? Get.back(),
    );
  }
}
