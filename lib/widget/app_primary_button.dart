import 'package:flutter/material.dart';
import 'package:need_flutter_app/utils/sizes.dart';

class AppPrimaryButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color textColor;
  final Color bgColor;
  final Color borderColor;

  const AppPrimaryButton({
    Key? key,
    required this.text,
    this.textColor = Colors.white,
    this.bgColor = Colors.black,
    this.borderColor = Colors.black,
    required this.onPressed,
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
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(Sizes.s8),
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
      onPressed: () => onPressed(),
    );
  }
}
