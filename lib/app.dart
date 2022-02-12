import 'dart:io';

import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:need_flutter_app/res/app_theme.dart';
import 'package:need_flutter_app/screens/splash_screen.dart';
import 'package:need_flutter_app/translations/app_translations.dart';

///Created by Rohit Sahu on 15-09-2021

class App {
  static App instance = App();

  bool _devMode = false;

  bool get devMode => _devMode;

  startApp({
    required bool devMode,
  }) async {
    _devMode = devMode;
    WidgetsFlutterBinding.ensureInitialized();
    runApp(ConnectivityAppWrapper(
      app: GetMaterialApp(
        translations: AppTranslations(),
        locale: Locale('en', 'US'),
        fallbackLocale: Locale('en', 'US'),
        home: SplashScreen(),
        theme: appTheme,
      ),
    ));
  }
}

