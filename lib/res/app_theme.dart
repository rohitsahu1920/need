import 'package:flutter/material.dart';
import 'package:need_flutter_app/res/app_colors.dart';
import 'package:need_flutter_app/utils/sizes.dart';
import 'package:need_flutter_app/utils/textstyles.dart';

///Created by Rohit Sahu on 15-09-2021

ThemeData appTheme = ThemeData(
  iconTheme: IconThemeData(size: Sizes.s20, color: Colors.black),
  brightness: Brightness.light,
  primaryColor: AppColors.primary,
  primaryColorBrightness: Brightness.light,
  primaryColorLight: AppColors.primaryLightColor,
  primaryColorDark: AppColors.primary,
  //accentColor: AppColors.primaryLightColor,
  //accentColorBrightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  bottomAppBarColor: AppColors.primaryLightColor,
  cardColor: Colors.white,
  dividerColor: Colors.black,
  splashFactory: InkSplash.splashFactory,
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  fontFamily: FontFamily.regular,
);