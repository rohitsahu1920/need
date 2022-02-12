import 'dart:io';
import 'package:need_flutter_app/app.dart';
import 'package:dio/dio.dart';
///Created by Rohit Sahu on 17-09-2021

void main() {
  //HttpOverrides.global = new MyHttpOverrides();
  App.instance.startApp(devMode: true);
}

// class MyHttpOverrides extends HttpOverrides{
//   @override
//   HttpClient createHttpClient(SecurityContext context){
//     return super.createHttpClient(context)
//       ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
//   }
// }