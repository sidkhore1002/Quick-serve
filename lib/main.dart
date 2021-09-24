import 'package:flutter/material.dart';
import 'package:flutter_demo_project/services/set-preferencedata.dart';
import 'package:flutter_demo_project/view/Home_Page.dart';
import 'package:flutter_demo_project/view/Profile_Page.dart';
import 'package:flutter_demo_project/view/Settings_Page.dart';
import 'package:flutter_demo_project/view/login-screen.dart';
import 'package:flutter_demo_project/view/otp-screen.dart';
import 'package:flutter_demo_project/view/tabs.dart';
import 'package:flutter_demo_project/widgets/contact-us.dart';
import 'package:flutter_demo_project/widgets/view-location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    Widget defaultScreen = LoginScreen();
    var userData = PreferencesData.getUserLoginData();
    print("////////////$userData");
    if (userData != null) {
      defaultScreen = TabScreen();
    }

    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.white,
          accentColorBrightness: Brightness.light,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => defaultScreen,
          '/tabscreen': (context) => TabScreen(),
          '/otpscreen': (context) => OtpScreen(),
          '/loginscreen': (context) => LoginScreen(),
          '/homepage': (context) => HomePage(),
          '/profilepage': (context) => ProfilePage(),
          '/settingspage': (context) => SettingsPage(),
          '/viewlocation': (context) => ViewLocation(),
          '/contactus': (context) => ContactUs(),
        });
  }
}
