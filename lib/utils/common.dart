import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:need_flutter_app/utils/textstyles.dart';

class Common {

  static Timer? toastTimer;
  static OverlayEntry? _overlayEntry;
  static Color? _color;

  static void toast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      backgroundColor: Colors.grey[800],
    );
  }


  static OverlayEntry createOverlayEntry(BuildContext context, String message) {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: 50.0,
        width: MediaQuery.of(context).size.width - 20,
        left: 10,
        child: Container(
          padding:
          const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
          decoration: BoxDecoration(
            color: _color, borderRadius: BorderRadius.circular(10),),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              message,
              textAlign: TextAlign.left,
              softWrap: true,
              style: FontFamily.mulishBold(
                14,
                _color!.computeLuminance() > 0.5
                    ? Colors.black
                    : Colors.white,),
            ),
          ),
        ),
      ),
    );
  }

  static void showCustomToast(
      BuildContext? context, String message, Color color,) {
    _color = color;
    if (toastTimer == null || !toastTimer!.isActive) {
      _overlayEntry = createOverlayEntry(context!, message);
      Overlay.of(context)!.insert(_overlayEntry!);
      toastTimer = Timer(const Duration(seconds: 2), () {
        if (_overlayEntry != null) {
          _overlayEntry!.remove();
        }
      });
    }
  }



  Future<bool> checkConnection() async {

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
         return false;
      }
    } on SocketException catch(_) {
      return false;
    }
  }

}
