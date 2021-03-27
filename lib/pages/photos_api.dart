import 'package:flutter/material.dart';
import 'package:glass_blured/components/components.dart';
import 'package:glass_blured/pages/settings_page.dart';

class PhotosAPi extends StatefulWidget {
  @override
  _PhotosAPiState createState() => _PhotosAPiState();
}

class _PhotosAPiState extends State<PhotosAPi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PhotosApi"),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.add), onPressed: () {}),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: Image.network(
                  "https://sdk.bitmoji.com/render/panel/853b9378-b5c2-4a12-9bf8-efcdc45f465d-b93dde4d-c80d-4c9f-a0af-70cbc082671e-v1.png?transparent=1&palette=1"),
              accountName: Text(
                "Account Name",
                style: boldText,
              ),
              accountEmail: Text("Abc@gmail.com"),
              decoration: BoxDecoration(color: Colors.grey),
            ),
            ListTile(
              title: Text("Home Page"),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text("Wallet"),
              leading: Icon(Icons.account_balance_wallet_rounded),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text("Home Page"),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text("Home Page"),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text("Setting Page"),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text("Setting Page"),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
