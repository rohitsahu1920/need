import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:need_flutter_app/res/app_colors.dart';
import 'package:need_flutter_app/res/strings.dart';
import 'package:need_flutter_app/screens/add_needs_screens/add_need_screen.dart';
import 'package:need_flutter_app/screens/dashboard_screen/controller/dashboard_controller.dart';
import 'package:need_flutter_app/screens/drawer_screens/drawer_screen.dart';
import 'package:need_flutter_app/screens/show_all_screens/see_all_screen.dart';
import 'package:need_flutter_app/utils/sizes.dart';
import 'package:need_flutter_app/utils/textstyles.dart';
import 'package:need_flutter_app/widget/appbar_without_back.dart';
import '../../widget/app_error_widget.dart';
import '../need_in_detail_screen/need_in_detail_screen.dart';
import '../show_all_screens/widget/see_all_widget.dart';

///Created by Rohit Sahu on 29-09-2021

class DashBoardScreen extends StatefulWidget {
  final _dashboardController = Get.put(DashBoardController());

  DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await widget._dashboardController.getDashboardDetails();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarWithoutBack(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.amber,
                ),
                onPressed: () {
                  //_drawer();
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: Strings.dashboard,
          textStyle: TextStyles.appBarTittle,
          actions: [],
        ),
        body: GetX<DashBoardController>(
          initState: (state) async {},
          builder: (controller) {
            if (widget._dashboardController.hasError.value) {
              return AppErrorWidget(
                errorMessage: widget._dashboardController.errorMessage.value,
              );
            }
            return _body();
          },
        ),
        drawer: DrawerScreen(),
        floatingActionButton: FloatingActionButton.extended(
            elevation: 0.0,
            icon: const Icon(
              Icons.add,
              color: Colors.black,
            ),
            backgroundColor: Colors.amber,
            label: Text(
              Strings.addNeed,
              style: const TextStyle(fontSize: 12.0, color: Colors.black),
            ),
            onPressed: () {
              //_dashboardController.print();
              Get.to(() => AddNeedScreen());
            }),
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
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.easeInQuad,
                ),
                items: [
                  1,
                  2,
                  3,
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                          child: Center(
                            child: Image.asset(
                              widget._dashboardController.imageList[i - 1],
                              fit: BoxFit.cover,
                            ),
                          ));
                    },
                  );
                }).toList(),
              ),
              Padding(
                padding: EdgeInsets.all(Sizes.s15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text(
                          Strings.dashBoardTitle,
                          style: TextStyles.dialog,
                        ),
                        const Spacer(),
                        InkWell(
                            onTap: () {
                              Get.to(() => SeeAllScreen());
                            },
                            child: Text(
                              Strings.seeAll,
                              style: TextStyles.defaultRegular,
                            ))
                      ],
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget._dashboardController.getDashBoardModel
                                    .productOutputs !=
                                null
                            ? widget._dashboardController.getDashBoardModel
                                .productOutputs?.length
                            : 0,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                              onTap: () {
                                Get.to(() => NeedInDetailScreen(
                                      productOutputs: widget
                                          ._dashboardController
                                          .getDashBoardModel
                                          .productOutputs![index],
                                    ));
                              },
                              child: SeeAllWidget(
                                productOutputs: widget._dashboardController
                                    .getDashBoardModel.productOutputs![index],
                              ));
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: Sizes.s15),
          child: Text(
            Strings.poweredBy,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.greyText),
          ),
        ),
      ],
    );
  }
}

// class DashBoardScreen extends StatelessWidget {
//   final _dashboardController = Get.put(DashBoardController());
//
//   DashBoardScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: appBarWithoutBack(
//           leading: Builder(
//             builder: (BuildContext context) {
//               return IconButton(
//                 icon: const Icon(
//                   Icons.menu,
//                   color: Colors.amber,
//                 ),
//                 onPressed: () {
//                   //_drawer();
//                   Scaffold.of(context).openDrawer();
//                 },
//                 tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
//               );
//             },
//           ),
//           title: Strings.dashboard,
//           textStyle: TextStyles.appBarTittle,
//           actions: [],
//         ),
//         body: GetX<DashBoardController>(
//           initState: (state) async {
//             WidgetsBinding.instance?.addPostFrameCallback((_) async {
//               //await _dashboardController.getDashboardDetails();
//               //state.build(context);
//             });
//           },
//           builder: (controller) {
//             if (_dashboardController.hasError.value) {
//               return AppErrorWidget(
//                 errorMessage: _dashboardController.errorMessage.value,
//               );
//             }
//             return _body();
//           },
//         ),
//         drawer: DrawerScreen(),
//         floatingActionButton: FloatingActionButton.extended(
//             elevation: 0.0,
//             icon: const Icon(
//               Icons.add,
//               color: Colors.black,
//             ),
//             backgroundColor: Colors.amber,
//             label: Text(
//               Strings.addNeed,
//               style: const TextStyle(fontSize: 12.0, color: Colors.black),
//             ),
//             onPressed: () {
//               //_dashboardController.print();
//               Get.to(() => AddNeedScreen());
//             }),
//       ),
//     );
//   }
//
//   Widget _body() {
//     return Column(
//       children: [
//         Expanded(
//           child: ListView(
//             children: [
//               CarouselSlider(
//                 options: CarouselOptions(
//                   enableInfiniteScroll: true,
//                   height: 175.0,
//                   viewportFraction: 0.93,
//                   autoPlayInterval: const Duration(seconds: 3),
//                   autoPlay: true,
//                   autoPlayAnimationDuration: const Duration(milliseconds: 800),
//                   autoPlayCurve: Curves.easeInQuad,
//                 ),
//                 items: [
//                   1,
//                   2,
//                   3,
//                 ].map((i) {
//                   return Builder(
//                     builder: (BuildContext context) {
//                       return Container(
//                           width: MediaQuery.of(context).size.width,
//                           margin: const EdgeInsets.symmetric(horizontal: 5.0),
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               border: Border.all(
//                                 color: Colors.white,
//                               ),
//                               borderRadius:
//                                   const BorderRadius.all(Radius.circular(20))),
//                           child: Center(
//                             child: Image.asset(
//                               _dashboardController.imageList[i - 1],
//                               fit: BoxFit.cover,
//                             ),
//                           ));
//                     },
//                   );
//                 }).toList(),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(Sizes.s15),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           Strings.dashBoardTitle,
//                           style: TextStyles.dialog,
//                         ),
//                         const Spacer(),
//                         InkWell(
//                             onTap: () {
//                               Get.to(() => SeeAllScreen());
//                             },
//                             child: Text(
//                               Strings.seeAll,
//                               style: TextStyles.defaultRegular,
//                             ))
//                       ],
//                     ),
//                     ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: _dashboardController
//                             .getDashBoardModel.productOutputs?.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return SeeAllWidget();
//                         }),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(bottom: Sizes.s15),
//           child: Text(
//             Strings.poweredBy,
//             style: const TextStyle(
//                 fontWeight: FontWeight.bold, color: AppColors.greyText),
//           ),
//         ),
//       ],
//     );
//   }
// }
