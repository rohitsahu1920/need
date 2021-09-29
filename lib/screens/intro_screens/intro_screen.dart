import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:need_flutter_app/res/app_colors.dart';
import 'package:need_flutter_app/res/strings.dart';
import 'package:need_flutter_app/screens/access_screen/access_screen.dart';
import 'package:need_flutter_app/screens/intro_screens/widgets/slider_dots.dart';
import 'package:need_flutter_app/screens/intro_screens/widgets/slider_item_widget.dart';
import 'package:need_flutter_app/utils/shared_pref_manager/sp_keys.dart';
import 'package:need_flutter_app/utils/sizes.dart';
import 'package:need_flutter_app/utils/ui_helper.dart';
import 'package:need_flutter_app/widget/app_primary_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/slide.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _currentPage = 0;

  late Timer _timer;

  final _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    isFirstLaunch();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 3)
        _currentPage++;
      else
        _currentPage = 0;

      _pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    });
  }

  void isFirstLaunch() async {
    Get.find<SharedPreferences>().setBool(SPKeys.isFirst.value, false);
  }

  onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: Sizes.s15,
          right: Sizes.s15,
          top: Sizes.s100,
          bottom: Sizes.s25,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset(Assets.logo, scale: Sizes.s3),
                C10(),
                // Text(
                //   Strings.appName,
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontSize: FontSizes.s22,
                //     fontFamily: FontFamily.medium,
                //   ),
                // ),
              ],
            ),
            C10(),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: onPageChanged,
                itemCount: slideList.length,
                itemBuilder: (context, index) => SliderItemWidget(index),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < slideList.length; i++)
                  if (i == _currentPage)
                    SliderDots(
                      isActive: true,
                    )
                  else
                    SliderDots(
                      isActive: false,
                    ),
              ],
            ),
            C10(),
            SizedBox(
              width: double.infinity,
              child: AppPrimaryButton(
                text: Strings.getStarted,
                onPressed: () {
                  Get.offAll(() => AccessScreen());
                },
              ),
            ),
            C20(),
            Text(
              Strings.poweredBy,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.greyText),
            ),
          ],
        ),
      ),
    );
  }
}
