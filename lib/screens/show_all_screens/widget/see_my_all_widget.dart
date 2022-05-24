import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:need_flutter_app/models/my_need_model.dart';

import '../../../network/urls.dart';
import '../../../utils/sizes.dart';
import '../../../utils/textstyles.dart';
import '../../../utils/ui_helper.dart';

class SeeMyAllWidget extends StatelessWidget {

  final ProductOutputs productOutputs;

  const SeeMyAllWidget({Key? key,  required this.productOutputs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(Sizes.s10),
            child: CachedNetworkImage(
              imageUrl: returnImage(
                  productOutputs.photoOne ?? "",
                  productOutputs.photoTwo ?? "",
                  productOutputs.thotThree ?? ""),
              height: 60,
              width: 60,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                size: 50,
              ),
            ),
          ),
          C10(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                C10(),
                Text(
                  productOutputs.title ?? "",
                  style: TextStyles.dialog,
                ),
                C5(),
                Text(
                  productOutputs.decription ?? "",
                  style: TextStyles.greyText,
                ),
                C5(),
                Padding(
                  padding: EdgeInsets.only(right: Sizes.s10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        productOutputs.category ?? "",
                        style: TextStyles.defaultRegular,
                      ),
                      Text(
                        productOutputs.publishDate ?? "",
                        style: TextStyles.defaultRegular,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  String returnImage(String linkOne, String linkTwo, String linkThree) {
    if (linkOne.isNotEmpty) {
      return AppUrl.awsImageLink + linkOne;
    }
    if (linkTwo.isNotEmpty) {
      return AppUrl.awsImageLink + linkTwo;
    }
    if (linkThree.isNotEmpty) {
      return AppUrl.awsImageLink + linkThree;
    }
    return "";
  }
}
