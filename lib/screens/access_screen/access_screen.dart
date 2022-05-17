import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:need_flutter_app/res/strings.dart';
import 'package:need_flutter_app/screens/access_screen/widgets/access_item_widget.dart';
import 'package:need_flutter_app/screens/login_and_registration%20_screen/login_screen.dart';
import 'package:need_flutter_app/utils/assets.dart';
import 'package:need_flutter_app/utils/common.dart';
import 'package:need_flutter_app/utils/sizes.dart';
import 'package:need_flutter_app/utils/textstyles.dart';
import 'package:need_flutter_app/utils/ui_helper.dart';
import 'package:need_flutter_app/widget/app_primary_button.dart';
import 'package:need_flutter_app/widget/custom_appbar.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/auth/auth_manager.dart';
import '../dashboard_screen/dashboard_screen.dart';

class AccessScreen extends StatelessWidget {
  const AccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(
        title: Strings.needAccess,
        textStyle: TextStyles.appBarTittle.copyWith(
          fontFamily: FontFamily.semiBold,
        ),
        onBackTap: () {},
        actions: [],
      ),
      body: Container(
        padding: EdgeInsets.all(Sizes.s20),
        child: Column(
          children: [
            const Divider(),
            AccessItemWidget(
              icon: Assets.storage,
              title: Strings.storage,
              subtitle: Strings.storagePermission,
            ),
            const Divider(),
            AccessItemWidget(
              icon: Assets.locationMarkerBlack,
              title: Strings.location,
              subtitle: Strings.locationPermission,
            ),
            const Divider(),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: AppPrimaryButton(
                text: Strings.allowAccess,
                onPressed: () => _checkPermission(),
              ),
            ),
            const C20(),
            InkWell(
              onTap: () {
                if (Get.find<AuthManager>().getLoginData()?.status != "0" &&
                    Get.find<AuthManager>().getLoginData()?.status != null) {
                  Get.offAll(() => DashBoardScreen());
                } else {
                  Get.offAll(() => LoginScreen());
                }
              },
              child: Center(
                child: Text(Strings.skip),
              ),
            ),
            C10(),
          ],
        ),
      ),
    );
  }

  _checkPermission() async {
    List<Permission> list = List<Permission>.from(
      [
        Permission.storage,
        Permission.location,
      ],
      growable: true,
    );

    if (Platform.isAndroid) {
      list.add(Permission.phone);
    }

    Map<Permission, PermissionStatus> statuses = await list.request();

    bool allGranted = true;

    statuses.forEach((key, value) {
      if (value.isDenied || !value.isLimited) {
        allGranted = false;
      }
    });
    if (allGranted) {
      //Common.toast("no");
      Get.offAll(() => LoginScreen());
    } else {
      Common.toast(Strings.permissionsRequired);
    }
  }
}
