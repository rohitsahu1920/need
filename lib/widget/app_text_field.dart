import 'package:flutter/material.dart';
import 'package:need_flutter_app/res/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final bool? passwordVisible;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final int? maxLines;
  final bool? enabled;
  final int? maxLength;
  final Widget? prefixIcon;

  const AppTextField({
    Key? key,
    required this.controller,
    this.hintText,
    this.passwordVisible,
    this.suffixIcon,
    this.keyboardType,
    required this.validator,
    this.maxLines,
    this.enabled,
    this.maxLength,
    this.prefixIcon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      enabled: enabled,
      maxLines: maxLines,
      validator: validator,
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      obscureText: passwordVisible ?? false,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        border: InputBorder.none,
        hintText: hintText,
        fillColor: AppColors.greyLight,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
