import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:need_flutter_app/res/strings.dart';
import 'package:need_flutter_app/utils/sizes.dart';
import 'package:need_flutter_app/utils/textstyles.dart';
import 'package:need_flutter_app/utils/ui_helper.dart';
import 'package:need_flutter_app/widget/app_error_widget.dart';
import 'package:need_flutter_app/widget/custom_appbar.dart';
import 'package:get/get.dart';

import '../../widget/app_primary_button.dart';
import 'controller/need_in_detail_controller.dart';

class NeedInDetailScreen extends StatelessWidget {
  final NeedInDetailController _needInDetailController =
      Get.put(NeedInDetailController());
  final Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> _markers = {};

  static const LatLng _position = LatLng(50.4501, 30.5234);

  static const CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(50.4501, 30.5234),
    zoom: 13,
  );

  NeedInDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(
        title: Strings.needInDetail,
        textStyle: TextStyles.appBarTittle,
      ),
      body: GetX<NeedInDetailController>(
        initState: (state) {
          _markers.add(const Marker(
            markerId: MarkerId("latlong"),
            position: _position,
            infoWindow: InfoWindow(
              title: 'Really cool place',
              snippet: '5 Star Rating',
            ),
            icon: BitmapDescriptor.defaultMarker,
          ));
        },
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
                autoPlayInterval: const Duration(seconds: 3),
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.easeInQuad,
              ),
              items: [1, 2, 3].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            border: Border.all(
                              color: Colors.amber,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: Center(
                          child: Text(
                            'text $i',
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ));
                  },
                );
              }).toList(),
            ),
            C15(),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(Sizes.s15, Sizes.s0, Sizes.s15, Sizes.s0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Long Title",
                    style: TextStyles.title,
                  ),
                  C10(),
                  Text(
                    "Long Title",
                    style: TextStyles.greyText,
                  ),
                  C10(),
                  Row(
                    children: const [Text("Date"), Spacer(), Text("City")],
                  ),
                  C15(),
                  const Text("Full Address"),
                  C15(),
                  const Text("Pin Code"),
                  C15(),
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Card(
                      color: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: GoogleMap(
                        mapType: MapType.hybrid,
                        initialCameraPosition: _cameraPosition,
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                        markers: _markers,
                      ),
                    ),
                  ),
                  const C20(),
                  SizedBox(
                    width: double.infinity,
                    child: AppPrimaryButton(
                      text: Strings.callHelper,
                      onPressed: () {},
                    ),
                  ),
                  C10(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Text(
                          Strings.reportNeed,
                        ),
                        onTap: () {
                          //Get.to(() => RegistrationScreen());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ))
      ],
    );
  }
}
