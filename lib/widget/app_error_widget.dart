import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:need_flutter_app/dialogs/error_dialog.dart';
import 'package:need_flutter_app/res/strings.dart';

class AppErrorWidget extends StatelessWidget {
  final String errorMessage;

  const AppErrorWidget({Key? key, this.errorMessage = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
        ),
        child: ErrorDialog(
          errorMessage: errorMessage.isEmpty ? Strings.wrongMsg : errorMessage,
        ),
      ),
    );
  }
}
