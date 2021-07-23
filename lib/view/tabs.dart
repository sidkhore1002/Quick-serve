import 'package:flutter/material.dart';
import 'package:flutter_demo_project/view/Home_Page.dart';
import 'package:flutter_demo_project/view/Profile_Page.dart';
import 'package:flutter_demo_project/view/Settings_Page.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo"),
      ),
      body: TabBarView(
        children: [HomePage(), ProfilePage(), SettingsPage()],
        controller: controller,
      ),
      bottomNavigationBar: Material(
        color: Colors.pink[800],
        child: TabBar(
          tabs: <Widget>[
            Tab(text: "Home"),
            Tab(text: "Profile"),
            Tab(text: "Settings"),
          ],
          controller: controller,
        ),
      ),
    );
  }
}
