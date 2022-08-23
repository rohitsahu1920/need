import 'package:flutter/material.dart';
import 'package:need_flutter_app/res/strings.dart';
import 'package:need_flutter_app/utils/assets.dart';
import 'package:need_flutter_app/utils/sizes.dart';
import 'package:need_flutter_app/utils/textstyles.dart';
import 'package:need_flutter_app/utils/ui_helper.dart';
import 'package:need_flutter_app/widget/buttons/secondary_text_button.dart';

class ErrorDialog extends StatelessWidget {
  final String errorMessage;

  const ErrorDialog({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(Sizes.s14),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(Sizes.s14),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Image.asset(
                    Assets.errorIcon,
                    height: Sizes.s40,
                    width: Sizes.s40,
                  ),
                  C10(),
                  Center(
                    child: Text(
                      Strings.weAreSorry,
                      style: TextStyles.appBarTittle,
                    ),
                  ),
                  C10(),
                  Center(
                    child: Text(
                      errorMessage,
                      style: TextStyles.defaultRegular,
                    ),
                  ),
                  Column(
                    children: [
                      C10(),
                      SecondaryTextButton(
                        text: Strings.retry,
                        onTap: () {

                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
