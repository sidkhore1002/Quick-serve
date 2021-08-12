import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_project/utils/toast-animation.dart';

class ToastUtils {
  static Timer toastTimer;
  static OverlayEntry _overlayEntry;

  static int shortDuration = 2;
  static int normalDuration = 5;
  static int longDuration = 10;

  static void showCustomToast(BuildContext context, String message,
      {ToastDuration toastDuration: ToastDuration.NORMAL}) async {
    if (message == null || message.length == 0) {
      message = "Error Occurred. Please try after sometime";
    }

    FocusScope.of(context).requestFocus(new FocusNode());

    if (toastTimer == null || toastTimer.isActive) {
      _overlayEntry = createOverlayEntry(context, message);
      Overlay.of(context).insert(_overlayEntry);
      toastTimer = Timer(
          Duration(
              seconds: toastDuration == ToastDuration.NORMAL
                  ? normalDuration
                  : toastDuration == ToastDuration.LONG
                      ? longDuration
                      : shortDuration), () {
        if (_overlayEntry != null) {
          _overlayEntry?.remove();
          _overlayEntry = null;
        }
      });
    } else {
      toastTimer.cancel();
      _overlayEntry?.remove();
      _overlayEntry = null;
      _overlayEntry = createOverlayEntry(context, message);
      Overlay.of(context).insert(_overlayEntry);
      toastTimer = Timer(
          Duration(
              seconds: toastDuration == ToastDuration.NORMAL
                  ? normalDuration
                  : toastDuration == ToastDuration.LONG
                      ? longDuration
                      : shortDuration), () {
        if (_overlayEntry != null) {
          _overlayEntry.remove();
        }
      });
    }
  }

  static OverlayEntry createOverlayEntry(BuildContext context, String message) {
    return OverlayEntry(
        builder: (context) => Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SlideInToastMessageAnimation(
                Material(
                  elevation: 10.0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(width: 2, color: Colors.white)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.all(5),
                              child: Container(
                                width: MediaQuery.of(context).size.width - 15,
                                child: AutoSizeText(
                                  message,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontFamily: 'UbuntuMedium'),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}

enum ToastDuration { SHORT, NORMAL, LONG }
