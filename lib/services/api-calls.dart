import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo_project/constants/globalconstanst.dart';

import 'package:flutter_demo_project/popup/error-popup.dart';
import 'package:flutter_demo_project/popup/loader.dart';
import 'package:flutter_demo_project/services/set-preferencedata.dart';
import 'package:flutter_demo_project/utils/network-utils.dart';
import 'package:flutter_demo_project/utils/toast-utils.dart';
import 'package:http/http.dart' as http;

class HelperFunctions {
  Future postRequest(BuildContext context, var requestUri, jsonBody,
      {bool showLoader: true, bool check500: true}) async {
    var responseData;

    if (await NetworkCheck().check()) {
      if (showLoader) Loader.show(context);
      await http
          .post(Uri.parse(requestUri), body: jsonBody, headers: {
            'Accept': 'application/vnd.coc; version=v1',
            'Content-Type': 'application/json',
            'X-auth-token': (GlobalConstants.authToken != null)
                ? GlobalConstants.authToken
                : ""
          })
          .timeout(Duration(seconds: 15))
          .then((http.Response response) async {
            debugPrint(response.toString());
            if (showLoader) Loader.hide(context);

            if (response.statusCode == 200 || response.statusCode == 201) {
              debugPrint(response.toString());
              responseData = jsonDecode(response.body);
            } else if (response.statusCode == 422) {
              debugPrint(response.toString());
              responseData = jsonDecode(response.body);
            } else if (response.statusCode == 401) {
              debugPrint(response.toString());
              PreferencesData.clearPrefs();
              Navigator.of(context).popUntil((route) => route.isFirst);
              Navigator.of(context).pushReplacementNamed('/login');
            } else if (response.statusCode == 500 && check500 == true) {
              debugPrint(response.toString());
              MessagePopup popup = new MessagePopup(
                okButton: true,
                okButtonText: 'Ok',
                cancelButton: false,
                okButtonExpanded: false,
                bodyText: GlobalConstants.Error500,
                type: MessagePopupImage.ALERT,
                okCallback: (_, __) {},
                backgroundDismissible: true,
                cancelButtonText: '',
                cancelCallback: () {},
                buttonInColumn: false,
              );
              popup.showMaterialDialog(context);
            } else {
              debugPrint(responseData.toString());
            }
          })
          .catchError((error) {
            if (showLoader) Loader.hide(context);
            debugPrint(error.toString());
          });
    } else {
      ToastUtils.showCustomToast(context, GlobalConstants.NetworkError);
    }
    return responseData;
  }

  Future getRequest(BuildContext context, var requestUri,
      {bool showLoader: true}) async {
    var responseData;

    if (await NetworkCheck().check()) {
      if (showLoader) Loader.show(context);
      await http
          .get(Uri.parse(requestUri), headers: {
            'Accept': 'application/vnd.coc; version=v1',
            'Content-Type': 'application/json',
            'X-auth-token': (GlobalConstants.authToken != null)
                ? GlobalConstants.authToken
                : ""
          })
          .timeout(Duration(seconds: 15))
          .then((http.Response response) async {
            debugPrint(response.toString());
            if (showLoader) Loader.hide(context);

            if (response.statusCode == 200 || response.statusCode == 201) {
              debugPrint(response.toString());
              responseData = jsonDecode(response.body);
            } else if (response.statusCode == 401) {
              debugPrint(response.toString());
              PreferencesData.clearPrefs();
              Navigator.of(context).popUntil((route) => route.isFirst);
              Navigator.of(context).pushReplacementNamed('/login');
            } else if (response.statusCode == 500) {
              debugPrint(response.toString());

              MessagePopup popup = new MessagePopup(
                okButton: true,
                okButtonText: 'Ok',
                cancelButton: false,
                okButtonExpanded: false,
                bodyText: GlobalConstants.Error500,
                type: MessagePopupImage.ALERT,
                okCallback: (_, __) {},
                backgroundDismissible: true,
                cancelButtonText: '',
                cancelCallback: () {},
                buttonInColumn: false,
              );

              // MessagePopup popup = new MessagePopup(okButton: true, okButtonText: 'Ok',
              //   cancelButton: false, okButtonExpanded:false,
              //   bodyText: GlobalConstants.Error500, type: MessagePopupImage.ALERT,
              //   okCallback: (_,__){}, );
              popup.showMaterialDialog(context);
            } else {
              debugPrint(response.toString());
            }
          })
          .catchError((error) {
            if (showLoader) Loader.hide(context);
            debugPrint(error.toString());
          });
    } else {
      ToastUtils.showCustomToast(context, GlobalConstants.NetworkError);
    }
    return responseData;
  }

  Future putRequest(BuildContext context, var requestUri, jsonBody,
      {bool showLoader: true}) async {
    var responseData;
    debugPrint(jsonBody.toString());

    if (await NetworkCheck().check()) {
      if (showLoader) Loader.show(context);

      await http
          .put(Uri.parse(requestUri), body: jsonBody, headers: {
            'Accept': 'application/vnd.coc; version=v1',
            'Content-Type': 'application/json',
            'X-auth-token': (GlobalConstants.authToken != null)
                ? GlobalConstants.authToken
                : ""
          })
          .timeout(Duration(seconds: 15))
          .then((http.Response response) async {
            debugPrint(response.toString());

            if (showLoader) Loader.hide(context);

            if (response.statusCode == 200 || response.statusCode == 201) {
              debugPrint(response.toString());
              responseData = jsonDecode(response.body);
            } else if (response.statusCode == 401) {
              debugPrint(response.toString());
              PreferencesData.clearPrefs();
              Navigator.of(context).popUntil((route) => route.isFirst);
              Navigator.of(context).pushReplacementNamed('/login');
            } else if (response.statusCode == 500) {
              debugPrint(response.toString());
              MessagePopup popup = new MessagePopup(
                okButton: true,
                okButtonText: 'Ok',
                cancelButton: false,
                okButtonExpanded: false,
                bodyText: GlobalConstants.Error500,
                type: MessagePopupImage.ALERT,
                okCallback: (_, __) {},
                backgroundDismissible: true,
                cancelButtonText: '',
                cancelCallback: () {},
                buttonInColumn: false,
              );
              popup.showMaterialDialog(context);
            } else {
              debugPrint(response.toString());
            }
          })
          .catchError((error) {
            if (showLoader) Loader.hide(context);
            debugPrint(error.toString());
          });
    } else {
      ToastUtils.showCustomToast(context, GlobalConstants.NetworkError);
    }
    return responseData;
  }

  Future deleteRequest(BuildContext context, var requestUri,
      {bool showLoader: false}) async {
    var responseData;

    if (await NetworkCheck().check()) {
      if (showLoader) Loader.show(context);
      await http
          .delete(requestUri, headers: {
            'Accept': 'application/vnd.coc; version=v1',
            'Content-Type': 'application/json',
            'X-auth-token': (GlobalConstants.authToken != null)
                ? GlobalConstants.authToken
                : ""
          })
          .timeout(Duration(seconds: 15))
          .then((http.Response response) async {
            debugPrint(response.toString());
            if (showLoader) Loader.hide(context);

            if (response.statusCode == 200 || response.statusCode == 201) {
              debugPrint(response.toString());
              responseData = jsonDecode(response.body);
            } else if (response.statusCode == 401) {
              debugPrint(response.toString());
              PreferencesData.clearPrefs();
              Navigator.of(context).popUntil((route) => route.isFirst);
              Navigator.of(context).pushReplacementNamed('/login');
            } else if (response.statusCode == 500) {
              debugPrint(response.toString());
              MessagePopup popup = new MessagePopup(
                okButton: true,
                okButtonText: 'Ok',
                cancelButton: false,
                okButtonExpanded: false,
                bodyText: GlobalConstants.Error500,
                type: MessagePopupImage.ALERT,
                okCallback: (_, __) {},
                backgroundDismissible: true,
                cancelButtonText: '',
                cancelCallback: () {},
                buttonInColumn: false,
              );
              popup.showMaterialDialog(context);
            } else {
              debugPrint(response.toString());
            }
          })
          .catchError((error) {
            if (showLoader) Loader.hide(context);
            debugPrint(error.toString());
          });
    } else {
      ToastUtils.showCustomToast(context, GlobalConstants.NetworkError);
    }
    return responseData;
  }
}
