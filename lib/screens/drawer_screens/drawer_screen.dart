import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:need_flutter_app/res/strings.dart';
import 'package:need_flutter_app/screens/drawer_screens/about_us_screen.dart';
import 'package:need_flutter_app/screens/drawer_screens/contact_us_screen.dart';
import 'package:need_flutter_app/screens/login_and_registration%20_screen/registration_screen.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.amber,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.amber,
            ),
            accountName: const Text("Account Name"),
            accountEmail: const Text("Account Email"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform != TargetPlatform.iOS
                  ? Colors.blue
                  : Colors.white,
              child: const Text(
                "A",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text(Strings.viewProfile),
            trailing: const Icon(Icons.arrow_forward_ios_sharp),
            onTap: (){
              Get.back();
              Get.to(() => RegistrationScreen());
            }
          ),
          ListTile(
              leading: const Icon(Icons.all_inclusive),
              title: Text(Strings.myNeeds),
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
              onTap: (){
                Get.back();
                Get.to(() => RegistrationScreen());
              }
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: Text(Strings.aboutUs),
            trailing: const Icon(Icons.arrow_forward_ios_sharp),
            onTap: () {
              Get.back();
              Get.to(() => const AboutUsScreen());
            } ,
          ),
          ListTile(
            leading: const Icon(Icons.call),
            title: Text(Strings.contactUs),
            trailing: const Icon(Icons.arrow_forward_ios_sharp),
            onTap: () {
              Get.back();
              Get.to(() => const ContactUsScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: Text(Strings.logout),
            onTap: () {
              Get.back();
              Get.to(() => RegistrationScreen());
            } ,
          ),
          ListTile(
            leading: const Icon(Icons.delete, color: Colors.red,),
            title: Text(Strings.deleteAccount, style: const TextStyle(color: Colors.red),),
            onTap: () {
              Get.back();
              Get.to(() => RegistrationScreen());
            },
          ),
        ],
      ),
    );
  }
}
