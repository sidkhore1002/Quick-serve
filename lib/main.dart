import 'package:flutter/material.dart';
import 'package:flutter_demo_project/view/Home_Page.dart';
import 'package:flutter_demo_project/view/Profile_Page.dart';
import 'package:flutter_demo_project/view/Settings_Page.dart';

import 'package:flutter_demo_project/view/tabs.dart';
import 'package:flutter_demo_project/widgets/view-location.dart';

// @dart=2.9
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.pink[800],
          accentColorBrightness: Brightness.light,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => TabScreen(),
          '/homepage': (context) => HomePage(),
          '/profilepage': (context) => ProfilePage(),
          '/settingspage': (context) => SettingsPage(),
          '/viewlocation': (context) => ViewLocation(),
        });
  }
}
