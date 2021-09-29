import 'package:flutter/material.dart';
import 'package:need_flutter_app/res/app_colors.dart';
import 'package:need_flutter_app/utils/sizes.dart';

class SliderDots extends StatelessWidget {
  final bool isActive;

  const SliderDots({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Sizes.s5),
      height: Sizes.s7,
      width: Sizes.s7,
      decoration: BoxDecoration(
        color: isActive ? AppColors.pink : AppColors.greyText,
        borderRadius: BorderRadius.all(
          Radius.circular(Sizes.s12),
        ),
      ),
    );
  }
}
