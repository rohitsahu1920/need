import 'package:flutter/material.dart';
import 'package:need_flutter_app/res/strings.dart';
import 'package:need_flutter_app/screens/show_all_screens/widget/see_all_widget.dart';
import 'package:need_flutter_app/utils/textstyles.dart';
import 'package:need_flutter_app/widget/app_error_widget.dart';
import 'package:need_flutter_app/widget/custom_appbar.dart';
import 'package:get/get.dart';

import 'controller/show_all_controller.dart';

class SeeAllScreen extends StatelessWidget {
  final ShowAllDetailsController _showAllDetailsController =
      Get.put(ShowAllDetailsController());

  SeeAllScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(
        title: Strings.weNeedYou,
        textStyle: TextStyles.appBarTittle,
        onBackTap: () {
          Get.back();
        },
      ),
      body: GetX<ShowAllDetailsController>(
        initState: (state) {},
        builder: (controller) {
          if (_showAllDetailsController.hasError.value) {
            return AppErrorWidget(
              errorMessage: _showAllDetailsController.errorMessage.value,
            );
          }
          return _body();
        },
      ),
    );
  }

  Widget _body() {
    return Container(
      color: Colors.amber,
      child: ListView(
        //color: Colors.amber,
        children: [
          SeeAllWidget(),
          SeeAllWidget(),
        ],
      ),
    );
  }
}
