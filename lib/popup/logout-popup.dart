import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_project/services/set-preferencedata.dart';
import 'package:flutter_freshchat/flutter_freshchat.dart';

class LogoutPopup extends StatefulWidget {
  LogoutPopup();

  @override
  _LogoutPopupState createState() => _LogoutPopupState();
}

class _LogoutPopupState extends State<LogoutPopup> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AlertDialog(
      contentPadding: EdgeInsets.fromLTRB(
          width * 0.04, width * 0.04, width * 0.04, width * 0.04),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(23)),
      content: SingleChildScrollView(
        child: Container(
          width: width,
          margin: EdgeInsets.all(width * 0.05),
          padding: EdgeInsets.only(top: width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Are you sure you want to logout?",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'UbuntuRegular'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.1),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.1,
                                vertical: width * 0.02),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.cyan[200],
                            ),
                            child: Container(
                              child: Text(
                                "No",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.05,
                                    fontFamily: 'Ubuntu',
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.1),
                      child: Center(
                        child: GestureDetector(
                          onTap: () async {
                            await FlutterFreshchat.resetUser();

                            var userdata = PreferencesData.clearPrefs();
                            print("lllllllll$userdata");
                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
                            Navigator.of(context)
                                .pushReplacementNamed('/loginscreen');
                            //Navigator.pushNamed(context, '/loginscreen');
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.1,
                                vertical: width * 0.02),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.cyan[200]),
                            child: Container(
                              child: Text(
                                "Yes",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.05,
                                    fontFamily: 'Ubuntu',
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
