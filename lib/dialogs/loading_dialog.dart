import 'package:flutter/material.dart';
import 'package:need_flutter_app/res/strings.dart';
import 'package:need_flutter_app/utils/sizes.dart';
import 'package:need_flutter_app/utils/ui_helper.dart';
import 'package:need_flutter_app/widget/loader/double_bounce.dart';

class LoadingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(Sizes.s10),
        ),
      ),
      content: Container(
        width: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Sizes.s10),
        ),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SpinKitDoubleBounce(
              color: Colors.black,
              size: Sizes.s35,
            ),
            C10(),
            Text(
              Strings.pleaseWait,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: FontSizes.s16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
