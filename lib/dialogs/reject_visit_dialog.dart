import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:need_flutter_app/utils/methods.dart';

import '../res/app_colors.dart';
import '../res/strings.dart';
import '../utils/sizes.dart';
import '../utils/textstyles.dart';
import '../utils/ui_helper.dart';
import '../widget/buttons/primary_text_button.dart';
import '../widget/buttons/secondary_text_button.dart';
import '../widget/textview.dart';

class RejectVisitDialog extends StatelessWidget {
  final textController = TextEditingController();
  final Function(String) onDone;
  final Function() onCancel;

  RejectVisitDialog({
    Key? key,
    required this.onDone,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            text: Strings.areYouSure,
            size: FontSizes.s15,
            isbold: true,
            textAlign: TextAlign.center,
          ),
          C10(),
          TextView(
            size: FontSizes.s13,
            text: Strings.remark,
          ),
          C10(),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.greyLightbackground,
              ),
              child: TextFormField(
                style: TextStyles.textStyle,
                controller: textController,
                textCapitalization: TextCapitalization.sentences,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                minLines: 3,
                decoration: InputDecoration(
                  labelStyle: TextStyles.textStyle,
                  hintStyle: TextStyles.hintStyle,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: Sizes.s9,
                    horizontal: Sizes.s15,
                  ),
                ),
              ),
            ),
          ),
          const C20(),
          Row(
            children: [
              Expanded(
                child: SecondaryTextButton(
                  text: Strings.cancel,
                  onTap: () {
                    onCancel();
                  }
                ),
              ),
              const C20(),
              Expanded(
                child: PrimaryTextButton(
                  bgColor: Colors.amber,
                  textColor: Colors.black,
                  text: Strings.reportNeed,
                  onTap: () {
                    onDone(textController.text);
                  }, fontSize: FontSizes.s13,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
