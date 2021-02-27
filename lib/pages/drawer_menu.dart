import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass_blured/pages/settings_page.dart';

final Color backgroundColor = Color(0xFF4A4A58);

class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu>
    with SingleTickerProviderStateMixin {
  bool isDrawerClosed = true;
  double screenWidth, screenHeight;
  final Duration durationn = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: durationn);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.6).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Stack(
          children: <Widget>[menu(context), dashboard(context)],
        ));
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(left: 16, bottom: 10),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          "https://sdk.bitmoji.com/render/panel/853b9378-b5c2-4a12-9bf8-efcdc45f465d-b93dde4d-c80d-4c9f-a0af-70cbc082671e-v1.png?transparent=1&palette=1"),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Text(
                    "Mukesh Suthar",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Text(
                    "UI/UX Designer",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.dashboard,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Dashboard",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.account_tree_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Projects",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.miscellaneous_services,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Services",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.person_outline,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "About me",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Exit",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: durationn,
      top: 0,
      bottom: 0,
      left: isDrawerClosed ? 0 : 0.6 * screenWidth,
      right: isDrawerClosed ? 0 : -0.4 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: durationn,
          borderRadius: isDrawerClosed
              ? BorderRadius.all(Radius.circular(0))
              : BorderRadius.all(Radius.circular(30)),
          elevation: 8,
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Icon(
                          Icons.menu,
                          size: 26,
                        ),
                        onTap: () {
                          setState(() {
                            if (isDrawerClosed) {
                              _controller.forward();
                            } else {
                              _controller.reverse();
                            }
                            isDrawerClosed = !isDrawerClosed;
                          });
                        },
                      ),
                      Text(
                        "Dashboard",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        child: Icon(
                          Icons.settings,
                          size: 26,
                        ),
                        onTap: () {
                          Get.to(SettingPage());
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 200,
                    child: PageView(
                      controller: PageController(viewportFraction: 0.8),
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          width: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          width: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Text(
                  //   "Transactions",
                  //   style: TextStyle(color: Colors.white, fontSize: 20),
                  // ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // ListView.separated(
                  //     shrinkWrap: true,
                  //     itemBuilder: (context, index) {
                  //       return ListTile(
                  //         title: Text("Macbook"),
                  //         subtitle: Text("hfcsacow"),
                  //         trailing: Text("-2300"),
                  //       );
                  //     },
                  //     separatorBuilder: (context, index) {
                  //       return Divider(height: 16);
                  //     },
                  //     itemCount: 10)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
