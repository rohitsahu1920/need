import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:need_flutter_app/res/strings.dart';
import 'package:need_flutter_app/screens/drawer_screens/drawer_screen.dart';
import 'package:need_flutter_app/screens/show_all_screens/see_all_screen.dart';
import 'package:need_flutter_app/utils/sizes.dart';
import 'package:need_flutter_app/utils/textstyles.dart';
import 'package:need_flutter_app/widget/appbar_without_back.dart';

///Created by Rohit Sahu on 29-09-2021

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAd();
  }

  void loadAd() {
    _bannerAd = BannerAd(
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          setState(() {
            _isLoaded = true;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          // Dispose the ad here to free resources.
          ad.dispose();
        },
      ),
    )..load();
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
          title: Strings.notification,
          textStyle: TextStyles.appBarTittle,
          actions: [],
        ),
        body: _body(),
        drawer: DrawerScreen(),
        // floatingActionButton: new FloatingActionButton.extended(
        //     elevation: 0.0,
        //     icon: const Icon(
        //       Icons.add,
        //       color: Colors.black,
        //     ),
        //     backgroundColor: Colors.amber,
        //     label: Text(
        //       Strings.addNeed,
        //       style: TextStyle(fontSize: 12.0, color: Colors.black),
        //     ),
        //     onPressed: () {
        //       Get.to(() => AddNeedScreen());
        //     }),
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
                items: [1, 2, 3, 4, 5].map((i) {
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
                        Spacer(),
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
                  ],
                ),
              ),
            ],
          ),
        ),
        // Padding(
        //   padding: EdgeInsets.only(bottom: Sizes.s15),
        //   child: Text(
        //     Strings.poweredBy,
        //     style: TextStyle(
        //         fontWeight: FontWeight.bold, color: AppColors.greyText),
        //   ),
        //
        // ),
        Padding(
          padding: EdgeInsets.only(bottom: Sizes.s15),
          child: _bannerAd != null
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: SafeArea(
                    child: SizedBox(
                      width: _bannerAd!.size.width.toDouble(),
                      height: _bannerAd!.size.height.toDouble(),
                      child: AdWidget(ad: _bannerAd!),
                    ),
                  ),
                )
              : Container(),
        ),
      ],
    );
  }
}
