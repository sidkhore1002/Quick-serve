import 'package:flutter/material.dart';
import 'package:flutter_demo_project/constants/globalconstanst.dart';

class Loader {
  static void show(context) {
    showDialog(
        barrierDismissible: false,
        // barrierColor: Colors.transparent,
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () {
              return Future.value(false); // if true allow back else block it
            },
            child: AlertDialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.14,
                      width: MediaQuery.of(context).size.width * 0.4,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.8)),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Loading...',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.width * 0.05,
                            width: MediaQuery.of(context).size.width * 0.05,
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.05),
                            child: CircularProgressIndicator(
                              strokeWidth: 3.0,
                              valueColor: AlwaysStoppedAnimation(
                                  GlobalConstants.primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          );
        });
  }

  static void hide(context) {
    Navigator.pop(context);
  }
}
