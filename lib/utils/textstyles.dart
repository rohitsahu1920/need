import 'package:flutter/material.dart';
import 'package:need_flutter_app/res/app_colors.dart';
import 'package:need_flutter_app/utils/sizes.dart';


class FontFamily {
  static const String regular = "Sora-Regular";
  static const String bold = "Sora-Bold";
  static const String extraBold = "Sora-ExtraBold";
  static const String extraLight = "Sora-ExtraLight";
  static const String light = "Sora-Light";
  static const String medium = "Sora-Medium";
  static const String semiBold = "Sora-SemiBold";
  static const String thin = "Sora-Thin";
}

class TextStyles {
  static const TextDecoration underline = TextDecoration.underline;
  static const TextDecoration lineThrough = TextDecoration.lineThrough;

  static TextStyle get appBarTittle => TextStyle(
        fontFamily: FontFamily.regular,
        fontSize: FontSizes.s16,
        color: Colors.black,
        inherit: false,
      );

  static TextStyle get title => TextStyle(
        fontFamily: FontFamily.bold,
        fontSize: FontSizes.s20,
        color: Colors.black,
        inherit: false,
      );

  static TextStyle get dialog => TextStyle(
        fontFamily: FontFamily.bold,
        fontSize: FontSizes.s15,
        color: Colors.black,
        inherit: false,
      );

  static TextStyle get timer => TextStyle(
        fontFamily: FontFamily.bold,
        fontSize: FontSizes.s20,
        color: Colors.black,
        inherit: false,
      );

  static TextStyle get greyText => TextStyle(
        fontSize: FontSizes.s13,
        color: AppColors.greyText,
        inherit: false,
      );

  static TextStyle get bigTitle => TextStyle(
        fontSize: FontSizes.s20,
        color: AppColors.ticketAvailable,
        inherit: false,
      );

  static TextStyle get appBarBold => TextStyle(
        fontSize: FontSizes.s20,
        color: Colors.black,
        fontWeight: FontWeight.bold,
        inherit: false,
      );

  static TextStyle get url => TextStyle(
        fontSize: FontSizes.s13,
        color: Colors.blue,
        inherit: false,
        decoration: TextStyles.underline,
      );

  static TextStyle get defaultRegular => TextStyle(
        fontSize: FontSizes.s13,
        color: Colors.black,
        inherit: false,
      );

  static TextStyle get greydefaultRegular => TextStyle(
        fontSize: FontSizes.s12,
        color: Colors.grey,
        inherit: false,
      );

  static TextStyle get defaultRegularbold => TextStyle(
        fontSize: FontSizes.s13,
        color: Colors.black,
        fontFamily: FontFamily.regular,
        fontWeight: FontWeight.bold,
        inherit: false,
      );

  static TextStyle get ticketId => TextStyle(
        fontSize: FontSizes.s13,
        color: AppColors.darkBlue,
        fontFamily: FontFamily.semiBold,
        inherit: false,
      );

  static TextStyle get textStyle => TextStyle(
      fontSize: FontSizes.s13,
      color: Colors.black,
      fontFamily: FontFamily.regular);

  static TextStyle get hintStyle => TextStyle(
      fontSize: FontSizes.s12,
      fontWeight: FontWeight.normal,
      fontFamily: FontFamily.regular);
}
