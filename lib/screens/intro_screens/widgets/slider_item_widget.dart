import 'package:flutter/material.dart';
import 'package:need_flutter_app/res/app_colors.dart';
import 'package:need_flutter_app/screens/intro_screens/model/slide.dart';
import 'package:need_flutter_app/utils/sizes.dart';
import 'package:need_flutter_app/utils/textstyles.dart';
import 'package:need_flutter_app/utils/ui_helper.dart';

class SliderItemWidget extends StatelessWidget {
  final int index;

  SliderItemWidget(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        C30(),
        Image.asset(
          slideList[index].imageUrl,
          scale: Sizes.s4,
        ),
        C40(),
        Text(
          slideList[index].title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: FontSizes.s18,
            fontFamily: FontFamily.medium,
          ),
        ),
        C5(),
        Text(
          slideList[index].description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: FontSizes.s15,
            color: AppColors.greyText,
          ),
        ),
      ],
    );
  }
}
