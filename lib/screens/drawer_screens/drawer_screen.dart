import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            accountName: Text("Account Name"),
            accountEmail: Text("Account Email"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform != TargetPlatform.iOS
                  ? Colors.blue
                  : Colors.white,
              child: Text(
                "A",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("View profile"),
            trailing: Icon(Icons.arrow_forward_ios_sharp),
            onTap: () => Get.to(() => RegistrationScreen()),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("About us"),
            trailing: Icon(Icons.arrow_forward_ios_sharp),
            onTap: () => Get.to(() => RegistrationScreen()),
          ),
          ListTile(
            leading: Icon(Icons.call),
            title: Text("Contact us"),
            trailing: Icon(Icons.arrow_forward_ios_sharp),
            onTap: () => Get.to(() => RegistrationScreen()),
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text("Logout"),
            trailing: Icon(Icons.arrow_forward_ios_sharp),
            onTap: () => Get.to(() => RegistrationScreen()),
          ),
          ListTile(
            leading: Icon(Icons.delete, color: Colors.red,),
            title: Text("Delete Account", style: TextStyle(color: Colors.red),),
            onTap: () => Get.to(() => RegistrationScreen()),
          ),
        ],
      ),
    );
  }
}
