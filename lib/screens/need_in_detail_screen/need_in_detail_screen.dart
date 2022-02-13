import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:need_flutter_app/res/strings.dart';
import 'package:need_flutter_app/utils/sizes.dart';
import 'package:need_flutter_app/utils/textstyles.dart';
import 'package:need_flutter_app/utils/ui_helper.dart';
import 'package:need_flutter_app/widget/app_error_widget.dart';
import 'package:need_flutter_app/widget/custom_appbar.dart';
import 'package:get/get.dart';

import 'controller/need_in_detail_controller.dart';

class NeedInDetailScreen extends StatelessWidget {
  final NeedInDetailController _needInDetailController =
      Get.put(NeedInDetailController());

  NeedInDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(
        title: Strings.needInDetail,
        textStyle: TextStyles.appBarTittle,
        onBackTap: () {
          Get.back();
        },
      ),
      body: GetX<NeedInDetailController>(
        initState: (state) {},
        builder: (controller) {
          if (_needInDetailController.hasError.value) {
            return AppErrorWidget(
              errorMessage: _needInDetailController.errorMessage.value,
            );
          }
          return _body();
        },
      ),
    );
  }


  Widget _body() {
    return Column(
      children: [
        Expanded(
            child: ListView(
              children: [
                CarouselSlider(
              options: CarouselOptions(
                enableInfiniteScroll: true,
                height: 175.0,
                viewportFraction: 0.93,
                autoPlayInterval: Duration(seconds: 3),
                autoPlay: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.easeInQuad,
              ),
              items: [1, 2, 3].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            border: Border.all(
                              color: Colors.amber,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Center(
                          child: Text(
                            'text $i',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ));
                  },
                );
              }).toList(),
            ),
                C10(),
                Padding(
                  padding: EdgeInsets.fromLTRB(Sizes.s10, Sizes.s0, Sizes.s10, Sizes.s0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Long Title", style:  TextStyles.title,),
                      C10(),
                      Text("Long Title", style:  TextStyles.greyText,),
                    ],
                  ),
                ),
          ],
        ))
      ],
    );
  }
}
