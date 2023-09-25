import 'dart:async';

import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
    runZonedGuarded<Future<void>>(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
      final fcmToken = await FirebaseMessaging.instance.getToken();
      await FirebaseMessaging.instance.setAutoInitEnabled(true);
      //FirebaseCrashlytics.instance.crash();
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
    },
        (error, stack) =>
            FirebaseCrashlytics.instance.recordError(error, stack));
  }
}
