import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  Artboard _riveArtboard;
  RiveAnimationController _controller;

  bool _isDarkTheme = false;

  sharedPref(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkModeEnabled', isDark);
  }

  getBoolValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool boolValue = prefs.getBool('isDarkModeEnabled');
    return boolValue;
  }

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/anim/animm.riv').then(
      (data) async {
        final file = RiveFile();
        if (file.import(data)) {
          final artboard = file.mainArtboard;
          artboard.addController(_controller = SimpleAnimation('to_light'));
          setState(() => _riveArtboard = artboard);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.info),
              title: Text("Version 1.0.0"),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("About Us"),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Switch(
                value: _isDarkTheme,
                onChanged: (val) {
                  setState(() {
                    _isDarkTheme = val;
                    sharedPref(_isDarkTheme);
                  });
                  if (_isDarkTheme) {
                    Get.changeTheme(ThemeData.dark());
                    _riveArtboard.removeController(_controller);
                    _riveArtboard.addController(
                        _controller = SimpleAnimation('to_dark'));
                    Get.snackbar("title", "Theme Changed",
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM);
                  } else {
                    Get.changeTheme(ThemeData.light());
                    _riveArtboard.removeController(_controller);
                    _riveArtboard.addController(
                        _controller = SimpleAnimation('to_light'));
                  }
                },
              ),
            ),
            Flexible(
              child: Center(
                child: _riveArtboard == null
                    ? const SizedBox()
                    : Rive(artboard: _riveArtboard),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
