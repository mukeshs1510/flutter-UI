import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:glass_blured/pages/phoneauth.dart';

void main() {
  runApp(MyApp());
}

final Color backgroundColor = Color(0xFF4A4A58);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      debugShowCheckedModeBanner: false,
      home: PhoneAuth(),
    );
  }
}
