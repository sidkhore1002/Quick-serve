import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_project/popup/error-popup.dart';
import 'package:flutter_demo_project/services/set-preferencedata.dart';
import 'package:flutter_demo_project/utils/toast-utils.dart';
import 'package:flutter_demo_project/view-models/login-screen-viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backwardsCompatibility: false,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          toolbarHeight: 0,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.white),
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Column(children: [
          Padding(
            padding: EdgeInsets.only(
                top: mediaQuery.height * 0.1, bottom: mediaQuery.height * 0.02),
            child: Image.asset(
              'assets/images/quick.png',
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.width * 0.25,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: mediaQuery.height * 0.12),
            child: Container(
              child: Text(
                "Quick Serve",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: mediaQuery.width * 0.06),
              ),
            ),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(
                  bottom: mediaQuery.height * 0.01,
                  left: mediaQuery.width * 0.15),
              child: Text(
                "Enter your Email",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.bold,
                    fontSize: mediaQuery.width * 0.035),
                textAlign: TextAlign.start,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: mediaQuery.width * 0.02),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        offset: Offset(0.0, 2.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  width: mediaQuery.width * 0.75,
                  height: mediaQuery.width * 0.12,
                  child: TextField(
                    textAlign: TextAlign.start,
                    onChanged: (text) {
                      setState(() {
                        email = text;
                      });
                    },
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: mediaQuery.width * 0.042),
                    cursorColor: Colors.black.withOpacity(0.3),
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.9),
                          fontSize: mediaQuery.width * 0.035),
                      contentPadding: EdgeInsets.only(
                          left: mediaQuery.width * 0.04,
                          top: mediaQuery.width * 0.08),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
          Padding(
              padding: EdgeInsets.only(
                  top: mediaQuery.height * 0.07, left: mediaQuery.width * 0.03),
              child: Container(
                  height: mediaQuery.width * .12,
                  width: mediaQuery.width * .76,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.cyan[200],
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(mediaQuery.width * 0.03),
                        ),
                      ),
                      child: Text('Get OTP',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: mediaQuery.width * 0.05,
                              fontWeight: FontWeight.w500)),
                      onPressed: () {
                        if (email.trim() != "") {
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(email);
                          if (emailValid == true) {
                            getEmail();
                            Navigator.pushNamed(context, '/otpscreen');
                          } else {
                            ToastUtils.showCustomToast(
                                context, "Please enter valid email address");
                          }
                        } else {
                          ToastUtils.showCustomToast(
                              context, "Please enter email");
                        }
                        PreferencesData.setUserLoginData(email);

                        // popup.showMaterialDialog(context);
                      }))),
          SizedBox(height: 15),
        ])));
  }

  getEmail() {
    LoginScreenViewModel().loginwithEmail(context, email);
  }
}
