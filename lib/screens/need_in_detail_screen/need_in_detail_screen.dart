import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:need_flutter_app/res/strings.dart';
import 'package:need_flutter_app/utils/methods.dart';
import 'package:need_flutter_app/utils/sizes.dart';
import 'package:need_flutter_app/utils/textstyles.dart';
import 'package:need_flutter_app/utils/ui_helper.dart';
import 'package:need_flutter_app/widget/app_error_widget.dart';
import 'package:need_flutter_app/widget/custom_appbar.dart';
import 'package:get/get.dart';

import '../../dialogs/error_dialog.dart';
import '../../dialogs/loading_dialog.dart';
import '../../dialogs/reject_visit_dialog.dart';
import '../../models/getdahsoboard_model.dart';
import '../../network/urls.dart';
import '../../widget/app_primary_button.dart';
import 'controller/need_in_detail_controller.dart';

class NeedInDetailScreen extends StatelessWidget {
  final NeedInDetailController _needInDetailController =
      Get.put(NeedInDetailController());
  final Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> _markers = {};

  static double lat1 = 0.0;
  static double long1 = 0.0;
  static CameraPosition? _cameraPosition;

  final ProductOutputs productOutputs;

  NeedInDetailScreen({Key? key, required this.productOutputs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(
        title: Strings.needInDetail,
        textStyle: TextStyles.appBarTittle,
      ),
      body: GetX<NeedInDetailController>(
        initState: (state) {
          log("Products :: ${json.encode(productOutputs)}");
          lat1 = double.parse(productOutputs.lat ?? "0.0");
          long1 = double.parse(productOutputs.long ?? "0.0");
          long1 = double.parse(productOutputs.long ?? "0.0");
          _cameraPosition = CameraPosition(
            target: LatLng(lat1, long1),
            zoom: 13,
          );
          LatLng _position = LatLng(lat1, long1);
          _markers.add(Marker(
            markerId: MarkerId(productOutputs.title ?? "Title"),
            position: _position,
            infoWindow: InfoWindow(
              title: productOutputs.title,
              snippet: productOutputs.decription,
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
              items: imageList(
                      productOutputs.photoOne ?? "",
                      productOutputs.photoTwo ?? "",
                      productOutputs.thotThree ?? "")
                  .map((i) {
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
                          child: CachedNetworkImage(
                            imageUrl: i,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.error,
                              size: 50,
                            ),
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
                    productOutputs.title ?? "",
                    style: TextStyles.title,
                  ),
                  C10(),
                  Text(
                    productOutputs.decription ?? "",
                    style: TextStyles.greyText,
                  ),
                  C10(),
                  Row(
                    children: [
                      Text(productOutputs.publishDate ?? ""),
                      const Spacer(),
                      Text(productOutputs.city ?? "")
                    ],
                  ),
                  C15(),
                  Text(productOutputs.addOne ?? ""),
                  C15(),
                  Text(productOutputs.addTwo ?? ""),
                  C15(),
                  Text(productOutputs.pincode ?? ""),
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
                        initialCameraPosition: _cameraPosition!,
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
                  const C20(color: Colors.white),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector (
                        child: Text(
                          Strings.reportNeed,
                        ),
                        onTap: () => Get.dialog(
                           RejectVisitDialog(
                            onDone: (value) {
                              log("Done ::");
                            },
                            onCancel: () {
                              Get.back();
                            },
                          ),
                          barrierDismissible: true,
                        ),
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

  List<String> imageList(String linkOne, String linkTwo, String linkThree) {
    List<String> images = [];

    if (linkOne.isNotEmpty) images.add(AppUrl.awsImageLink + linkOne);
    if (linkTwo.isNotEmpty) images.add(AppUrl.awsImageLink + linkTwo);
    if (linkThree.isNotEmpty) images.add(AppUrl.awsImageLink + linkThree);

    log("Images :: $images");
    return images;
  }
}
