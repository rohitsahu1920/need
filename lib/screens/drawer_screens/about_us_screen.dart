import 'package:flutter/material.dart';
import 'package:need_flutter_app/screens/drawer_screens/contact_us_screen.dart';

import '../../res/strings.dart';
import '../../utils/textstyles.dart';
import '../../utils/ui_helper.dart';
import '../../widget/app_primary_button.dart';
import '../../widget/custom_appbar.dart';
import 'package:get/get.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(
        title: Strings.aboutUs,
        textStyle: TextStyles.appBarBold,
        actions: [
          C0(),
        ],
      ),
      body: Container(
        color: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Center(
                      child: Text(
                        "not-for-profit organization in India, registered under the Societies’ Registration Act of 1860. Set up in 1978, the organization works for ‘the cause and care of disadvantaged older persons to improve their quality of life’ HelpAge envisions a society where elderly have the right to an active, healthy and dignified life. It recently became the first and only Indian organization to be honoured with the ‘UN Population Award 2020’ for its exemplary work in the field of ageing, relief efforts work during the Covid 19 pandemic and recognition of the organization’s outstanding contribution to population issues and efforts in the realization of older persons rights in India.",
                          textAlign: TextAlign.center,
                        style: TextStyles.appBarBold,
                      ),
                    ),
                    C30(color: Colors.amber,),
                    Center(
                      child: Text(
                        "not-for-profit organization in India, registered under the Societies’ Registration Act of 1860. Set up in 1978, the organization works for ‘the cause and care of disadvantaged older persons to improve their quality of life’ HelpAge envisions a society where elderly have the right to an active, healthy and dignified life. It recently became the first and only Indian organization to be honoured with the ‘UN Population Award 2020’ for its exemplary work in the field of ageing, relief efforts work during the Covid 19 pandemic and recognition of the organization’s outstanding contribution to population issues and efforts in the realization of older persons rights in India.",
                        textAlign: TextAlign.center,
                        style: TextStyles.appBarBold,
                      ),
                    )
                  ],
                ),
              ),
              C10(),
              SizedBox(
                width: double.infinity,
                child: AppPrimaryButton(
                  text: Strings.contactUs,
                  onPressed: () => Get.to(() => ContactUsScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
