import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:need_flutter_app/utils/assets.dart';
import 'package:need_flutter_app/utils/sizes.dart';
import 'package:need_flutter_app/utils/textstyles.dart';
import 'package:need_flutter_app/utils/ui_helper.dart';

class SeeAllWidget extends StatelessWidget {
  const SeeAllWidget({Key? key}) : super(key: key);

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
                imageUrl: "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80",
                height: 60,
                width: 60,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error, size: 50,),
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
                  "Title",
                  style: TextStyles.dialog,
                ),
                C5(),
                Text(
                  "Description",
                  style: TextStyles.greyText,
                ),
                C5(),
                Padding(
                  padding: EdgeInsets.only(right: Sizes.s10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "data",
                        style: TextStyles.defaultRegular,
                      ),
                      Text(
                        "data",
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
}
