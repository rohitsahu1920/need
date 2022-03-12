import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../res/strings.dart';
import '../../utils/textstyles.dart';
import '../../utils/ui_helper.dart';
import '../../widget/app_primary_button.dart';
import '../../widget/custom_appbar.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

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
                    InkWell(
                      onTap:(){
                        launchEmail();
                      },
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Icon(Icons.email),
                              C10(),
                              Text("Email us"),
                              Spacer(),
                              Icon(Icons.send),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap:() => launch("tel://214324234") ,
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Icon(Icons.call),
                              C10(),
                              Text("Call us"),
                              Spacer(),
                              Icon(Icons.send),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future launchEmail() async{
    final url = 'mailto:rohitsahu1920@gmail.com';
    if(await canLaunch(url)){
      await launch(url);
    }
  }

}
