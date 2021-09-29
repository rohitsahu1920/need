import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:need_flutter_app/mixins/after_layout.dart';
import 'package:need_flutter_app/utils/assets.dart';
import 'package:need_flutter_app/utils/shared_pref_manager/sp_keys.dart';
import 'package:need_flutter_app/utils/sizes.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app.dart';
import 'access_screen/access_screen.dart';
import 'dashboard_screen/dashboard_screen.dart';
import 'intro_screens/intro_screen.dart';

///Created by Rohit Sahu on 17-09-2021

const Duration splashDuration = Duration(seconds: 3);

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with AfterLayoutMixin<SplashScreen>{

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    _startApp();
  }

  _startApp() {
    if (App.instance.devMode) return _checkForPermissions();
    return Timer(splashDuration, () async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      if (preferences.getBool(SPKeys.isFirst.value) ?? true) {
        Get.offAll(() => IntroScreen());
      } else {
        _checkForPermissions();
      }
    });
  }

  _checkForPermissions() async {

    bool storageStatus = await Permission.storage.status.isGranted;
    bool location = await Permission.location.status.isGranted;

    if (storageStatus &&
        location) {
      Get.offAll(() => DashBoardScreen());
    } else {
      Get.offAll(() => AccessScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          image: AssetImage(Assets.logo),
          height: Sizes.s100,
          width: Sizes.s100,
        ),
      ),
    );
  }
}

