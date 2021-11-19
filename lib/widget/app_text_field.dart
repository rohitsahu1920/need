import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:need_flutter_app/res/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final String? initialValue;
  final bool? passwordVisible;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final int? maxLines;
  final bool? enabled;
  final int? maxLength;

  const AppTextField({
    Key? key,
    this.keyboardType = TextInputType.text,
    this.hintText = "",
    this.controller,
    this.passwordVisible,
    this.suffixIcon,
    this.initialValue = "",
    this.validator,
    this.prefixIcon ,
    this.maxLines = 1,
    this.enabled = true,
    this.maxLength = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      enabled: enabled,
      maxLines: maxLines,
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: !passwordVisible!,
      initialValue: initialValue,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        border: InputBorder.none,
        hintText: hintText,
        fillColor: AppColors.greyLight,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
