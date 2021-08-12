import 'dart:convert';

import 'package:flutter/material.dart';

class ApiService {
  Future loginWithEmail(BuildContext context, String email) async {
    var requestUri = "";

    Map data = {"email": email};
    var jsonData = jsonEncode(data);
    print("jsondata$jsonData");
    var responseData;
    // var responseData =
    //     await HelperFunctions().postRequest(context, requestUri, jsonData);
    if (responseData != null && responseData['data'] != null) {
      return responseData['data'];
    }
    return responseData;
  }

  Future verifyOtp(BuildContext context, String otp) async {
    var requestUri = "";

    Map data = {"otp": otp};

    var jsonData = jsonEncode(data);
    print("jsondata$jsonData");
    var responseData;
    // var responseData =
    //     await HelperFunctions().postRequest(context, requestUri, jsonData);

    if (responseData != null && responseData['data'] != null) {
      return responseData['data'];
    }
    return responseData;
  }
}
