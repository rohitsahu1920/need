import 'package:flutter/material.dart';

import '../../res/strings.dart';
import '../../utils/sizes.dart';
import '../../utils/textstyles.dart';
import '../../widget/custom_appbar.dart';
import '../dashboard_screen/controller/dashboard_controller.dart';
import 'package:get/get.dart';

import '../need_in_detail_screen/my_need_in_detail_screen.dart';
import '../need_in_detail_screen/need_in_detail_screen.dart';
import '../show_all_screens/widget/see_all_widget.dart';
import '../show_all_screens/widget/see_my_all_widget.dart';

class MyNeedScreen extends StatefulWidget {
  final _dashboardController = Get.put(DashBoardController());

  MyNeedScreen({Key? key}) : super(key: key);

  @override
  State<MyNeedScreen> createState() => _MyNeedScreenState();
}

class _MyNeedScreenState extends State<MyNeedScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await widget._dashboardController.getMyNeeds();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(
        title: Strings.needInDetail,
        textStyle: TextStyles.appBarTittle,
      ),
      body: Padding(
        padding: EdgeInsets.all(Sizes.s15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget._dashboardController.getMyNeedScreenCount > 0
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget._dashboardController.myNeedModel
                        .productOutputs?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          onTap: () {
                            Get.to(() => MyNeedInDetailScreen(
                                  productOutputs: widget._dashboardController
                                      .myNeedModel.productOutputs![index],
                                ));
                          },
                          child: SeeMyAllWidget(
                            productOutputs: widget._dashboardController
                                .myNeedModel.productOutputs![index],
                          ));
                    })
                : const Align(
                    alignment: Alignment.center,
                    child: Text("No Need Found"),
                  )
          ],
        ),
      ),
    );
  }
}
