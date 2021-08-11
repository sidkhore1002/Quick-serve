import 'package:flutter/material.dart';
import 'package:flutter_demo_project/constants/globalconstanst.dart';

enum MessagePopupImage { ALERT }

class MessagePopup {
  final bool okButton;
  final String okButtonText;
  final String cancelButtonText;
  final bool cancelButton;
  final String bodyText;
  final Function cancelCallback;
  final Function okCallback;
  final MessagePopupImage type;
  final bool backgroundDismissible;
  final bool buttonInColumn;
  final bool okButtonExpanded;

  MessagePopup(
      {required this.okButton,
      required this.okButtonText,
      required this.cancelButton,
      required this.cancelButtonText,
      required this.bodyText,
      required this.cancelCallback,
      required this.okCallback,
      required this.type,
      required this.backgroundDismissible,
      required this.buttonInColumn,
      required this.okButtonExpanded});

  void showMaterialDialog(context) {
    showDialog(
        barrierDismissible: (this.backgroundDismissible == null)
            ? true
            : this.backgroundDismissible,
        context: context,
        builder: (context) {
          var mediaQuery = MediaQuery.of(context).size;
          return AlertDialog(
            contentPadding: EdgeInsets.fromLTRB(
                mediaQuery.width * 0.01,
                mediaQuery.width * 0.01,
                mediaQuery.width * 0.01,
                mediaQuery.width * 0.03),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(23)),
            content: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: mediaQuery.height * 0.3,
                  minWidth: mediaQuery.width * 0.10),
              child: Container(
                // height: (this.buttonInColumn == null || this.buttonInColumn == false)? 220: 250,
                width: mediaQuery.width * 0.5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(height: mediaQuery.width * 0.01),
                    Container(
                      // margin: EdgeInsets.only(top: 35, bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            this.getPopupImagePath(this.type),
                            fit: BoxFit.contain,
                            height: mediaQuery.height * 0.1,
                          ),
                          SizedBox(height: mediaQuery.width * 0.05),
                          Padding(
                              padding: EdgeInsets.only(
                                  bottom: mediaQuery.width * 0.01),
                              child: Text(bodyText,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    height: 1.3,
                                    color: Color(0xff676666),
                                    fontSize: mediaQuery.width * 0.037,
                                    fontWeight: FontWeight.bold,
                                  )))
                        ],
                      ),
                    ),
                    if (okButton)
                      Container(
                        height: mediaQuery.width * .1,
                        width: mediaQuery.width * .25,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: GlobalConstants.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    mediaQuery.width * 0.03),
                              ),
                            ),
                            child: Text(this.okButtonText,
                                style: TextStyle(
                                    fontSize: mediaQuery.width * 0.04,
                                    color: Colors.black)),
                            onPressed: () async {
                              _dismissDialog(context);
                              this.okCallback(true, context);
                            }),
                      )
                  ],
                ),
              ),
            ),
          );
        });
  }

  String getPopupImagePath(MessagePopupImage type) {
    switch (type) {
      case MessagePopupImage.ALERT:
        return 'assets/images/alert1.png';
        break;

      default:
        return 'assets/images/alert1.png';
    }
  }

  void _dismissDialog(context) {
    Navigator.pop(context);
  }
}
