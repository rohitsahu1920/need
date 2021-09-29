import 'package:flutter/material.dart';
import 'package:need_flutter_app/res/app_colors.dart';
import 'package:need_flutter_app/utils/sizes.dart';
import 'package:need_flutter_app/utils/textstyles.dart';
import 'package:need_flutter_app/utils/ui_helper.dart';

class AccessItemWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;

  const AccessItemWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: Sizes.s26,
          backgroundColor: AppColors.iconBg,
          child: Image.asset(
            icon,
            height: Sizes.s18,
            width: Sizes.s18,
          ),
        ),
        C10(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: FontSizes.s14,
                  fontFamily: FontFamily.medium,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
