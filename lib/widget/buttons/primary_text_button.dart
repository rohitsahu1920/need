import 'package:flutter/material.dart';
import 'package:need_flutter_app/utils/sizes.dart';

class PrimaryTextButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final double fontSize;
  final Color bgColor;
  final Color borderColor;
  final Color textColor;

  const PrimaryTextButton({
    Key ?key,
    required this.onTap,
    required this.text,
    required this.fontSize,
    this.textColor = Colors.white,
    this.bgColor = Colors.black,
    this.borderColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          bgColor,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Sizes.s8,
          ),
          side: BorderSide(
            color: borderColor,
          ),
        )),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizes.s8),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      onPressed: onTap(),
    );
  }
}
