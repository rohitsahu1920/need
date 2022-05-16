import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double defaultScreenWidth = 400;
double defaultScreenHeight = 810;
double screenWidth = defaultScreenWidth;
double screenHeight = defaultScreenHeight;

///Adapting screen and font size.
///Let your UI display a reasonable layout on different screen sizes!
class Sizes {
  static bool initialized = false;

  static double getSize(double value) =>
      initialized ? ScreenUtil().setWidth(value) : value;

  //<editor-fold desc="Width Getters">
  static double get appContentPadding => getSize(20);

  static double get s0 => getSize(0);

  static double get s1 => getSize(1);

  static double get s2 => getSize(2);

  static double get s3 => getSize(3);

  static double get s4 => getSize(4);

  static double get s5 => getSize(5);

  static double get s6 => getSize(6);

  static double get s7 => getSize(7);

  static double get s8 => getSize(8);

  static double get s9 => getSize(9);

  static double get s10 => getSize(10);

  static double get s11 => getSize(11);

  static double get s12 => getSize(12);

  static double get s13 => getSize(13);

  static double get s14 => getSize(14);

  static double get s15 => getSize(15);

  static double get s16 => getSize(16);

  static double get s17 => getSize(17);

  static double get s18 => getSize(18);

  static double get s20 => getSize(20);

  static double get s21 => getSize(21);

  static double get s23 => getSize(23);

  static double get s24 => getSize(24);

  static double get s25 => getSize(25);

  static double get s26 => getSize(26);

  static double get s30 => getSize(30);

  static double get s35 => getSize(35);

  static double get s40 => getSize(40);

  static double get s42 => getSize(42);

  static double get s45 => getSize(45);

  static double get s50 => getSize(50);

  static double get s55 => getSize(55);

  static double get s60 => getSize(60);

  static double get s70 => getSize(70);

  static double get s75 => getSize(75);

  static double get s80 => getSize(80);

  static double get s90 => getSize(90);

  static double get s100 => getSize(100);

  static double get s120 => getSize(120);

  static double get s140 => getSize(140);

  static double get s150 => getSize(150);

  static double get s165 => getSize(165);

  static double get s200 => getSize(200);

  static double get s220 => getSize(220);

  static double get s230 => getSize(230);

  static double get s250 => getSize(250);

  static double get s260 => getSize(260);

  static double get s300 => getSize(300);

  static double get defaultImageHeight => s100;

  static double get defaultImageRadius => s40;

  //</editor-fold>

  /*Screen Size dependent Constants*/
  static double screenWidthHalf = screenWidth / 2;
  static double screenHeightHalf = screenHeight / 2;
  static double screenHeightThirdd = screenHeight / 0.6;
  static double screenWidthThird = screenWidth / 3;
  static double screenWidthFourth = screenWidth / 4;
  static double screenWidthFifth = screenWidth / 5;
  static double screenWidthSixth = screenWidth / 6;
  static double screenWidthTenth = screenWidth / 10;
  static double screenWidthTwelweth = screenWidth / 12;

  static EdgeInsets get defaultSpace => EdgeInsets.all(Sizes.s8);

  static EdgeInsets get smallSpace => EdgeInsets.all(Sizes.s10);

  static EdgeInsets get extraSmallSpace => EdgeInsets.all(Sizes.s5);

  static EdgeInsets get mediumSpace => EdgeInsets.all(Sizes.s15);

  static EdgeInsets get largeSpace => EdgeInsets.all(Sizes.s20);

  ///initialize sizes
  ///Should be called only once
  ///
  static void initScreenAwareSizes(
      BuildContext context, BoxConstraints constraints) {
    if (initialized) {
      debugPrint('Sizes already initialized');
      // printScreenInformation();
      return;
    }
    initialized = true;

    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    if (screenWidth > 300 && screenWidth < 500) {
      defaultScreenWidth = 450;
      defaultScreenHeight = defaultScreenWidth * screenHeight / screenWidth;
    } else if (screenWidth > 500 && screenWidth < 600) {
      defaultScreenWidth = 500;
      defaultScreenHeight = defaultScreenWidth * screenHeight / screenWidth;
    } else if (screenWidth > 600 && screenWidth < 700) {
      defaultScreenWidth = 550;
      defaultScreenHeight = defaultScreenWidth * screenHeight / screenWidth;
    } else if (screenWidth > 700 && screenWidth < 1050) {
      defaultScreenWidth = 800;
      defaultScreenHeight = defaultScreenWidth * screenHeight / screenWidth;
    } else {
      defaultScreenWidth = screenWidth;
      defaultScreenHeight = screenHeight;
    }

    ScreenUtil.init(
      context,
      designSize: const Size(360, 690),
    );
    FontSizes.initScreenAwareFontSize();
  }
}

class FontSizes {
  static bool initialized = false;

  static double getSp(double value) =>
      initialized ? ScreenUtil().setSp(value) : value;

  //<editor-fold desc="FontSize Getters">
  static double get s5 => getSp(5);

  static double get s6 => getSp(7);

  static double get s7 => getSp(7);

  static double get s8 => getSp(8);

  static double get s9 => getSp(9);

  static double get s10 => getSp(10);

  static double get s11 => getSp(11);

  static double get s12 => getSp(12);

  static double get s13 => getSp(13);

  static double get s14 => getSp(14);

  static double get s15 => getSp(15);

  static double get s16 => getSp(16);

  static double get s17 => getSp(17);

  static double get s18 => getSp(18);

  static double get s19 => getSp(19);

  static double get s20 => getSp(20);

  static double get s21 => getSp(21);

  static double get s22 => getSp(22);

  static double get s23 => getSp(23);

  static double get s24 => getSp(24);

  static double get s25 => getSp(25);

  static double get s26 => getSp(26);

  static double get s27 => getSp(27);

  static double get s28 => getSp(28);

  static double get s29 => getSp(29);

  static double get s30 => getSp(30);

  static double get s36 => getSp(36);

  //</editor-fold>

  ///initialize FontSize
  ///
  static initScreenAwareFontSize() {
    if (initialized) {
      debugPrint('FontSize already initialized');
      return;
    }
    initialized = true;
  }
}
