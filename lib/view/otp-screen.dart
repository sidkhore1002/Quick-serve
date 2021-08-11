import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_project/constants/globalconstanst.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otp = "";

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
          Column(
            children: [
              Container(
                child: Text(
                  "Verification Code",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: mediaQuery.width * 0.06),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: mediaQuery.height * 0.01),
                child: Container(
                  child: Text(
                    "Please enter the OTP sent to your device",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      // fontSize: mediaQuery.width * 0.06
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: mediaQuery.height * 0.07),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: mediaQuery.width * 0.02),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(mediaQuery.width * 0.10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: Offset(0.0, 2.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  width: mediaQuery.width * 0.60,
                  height: mediaQuery.width * 0.12,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.start,
                    onChanged: (text) {
                      setState(() {
                        otp = text;
                      });
                    },
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: mediaQuery.width * 0.042),
                    cursorColor: Colors.black.withOpacity(0.3),
                    decoration: InputDecoration(
                      hintText: "Enter OTP",
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
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: mediaQuery.height * 0.07, left: mediaQuery.width * 0.03),
              child: Container(
                  height: mediaQuery.width * .12,
                  width: mediaQuery.width * .62,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: GlobalConstants.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(mediaQuery.width * 0.06),
                        ),
                      ),
                      child: Text('Verify',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: mediaQuery.width * 0.05,
                              fontWeight: FontWeight.w500)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/tabscreen');
                      }))),
          SizedBox(height: 15),
        ])));
  }
}
