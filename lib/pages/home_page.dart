import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass_blured/pages/drawer_menu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: DrawerMenu(),
    );
  }
}
