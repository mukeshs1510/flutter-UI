import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass_blured/pages/drawer_menu.dart';
import 'package:glass_blured/pages/home_page.dart';
import 'package:glass_blured/pages/photos_api.dart';
import 'package:glass_blured/pages/settings_page.dart';
import 'package:glass_blured/pages/wallet.dart';

class PhoneAuth extends StatefulWidget {
  @override
  _PhoneAuthState createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Hello there"),
        //   centerTitle: true,
        //   elevation: 0,
        //   actions: [
        //     IconButton(
        //         icon: Icon(Icons.settings),
        //         onPressed: () {
        //           Get.to(() => SettingPage());
        //         }),
        //     IconButton(icon: Icon(Icons.add_shopping_cart), onPressed: () {})
        //   ],
        // ),
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // RaisedButton(
        //   onPressed: () {
        //     Get.to(() => WalletPage());
        //   },
        //   child: Text("Wallet"),
        // ),
        ElevatedButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0))),
            onPressed: () {
              Get.to(() => WalletPage());
            },
            child: Text("Wallet")),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
            onPressed: () {
              Get.to(() => SettingPage());
            },
            child: Text("Settings")),

        SizedBox(
          height: 30,
        ),
        ElevatedButton(
            onPressed: () {
              Get.to(() => PhotosAPi());
            },
            child: Text("PhotosApi App")),
      ],
    ));
  }
}
