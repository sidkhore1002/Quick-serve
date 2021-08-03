import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo_project/model/service-model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<ServiceModel> services = <ServiceModel>[];

  List sheetdata = [
    {
      "name": "Sagar Jadhav",
      "phone": "98648758",
      "charges": "200",
      "address": "pune"
    },
    {
      "name": "Ram Jadhav",
      "phone": "98648758",
      "charges": "200",
      "address": "mumbai"
    },
    {
      "name": "Karan Jadhav",
      "phone": "98648758",
      "charges": "200",
      "address": "pune"
    },
  ];

  getFeedbackFromSheet() async {
    var raw = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbygLlV_ITs8s7_kI9xU4pxs85jVTJhK1xBlJYbEJTtL28GEARLEUHTFCSUjRECeqTjF/exec"));

    var jsonService = convert.jsonDecode(raw.body);

    print('this is json service $jsonService');

    // feedbacks = jsonFeedback.map((json) => FeedbackModel.fromJson(json));

    jsonService.forEach((element) {
      print(element);
      ServiceModel serviceModel =
          new ServiceModel(address: '', name: '', phone: '', charges: '');
      serviceModel.name = element['name'];
      serviceModel.phone = element['phone'].toString();
      serviceModel.charges = element['charges'].toString();
      serviceModel.address = element['address'];

      services.add(serviceModel);
    });

    for (int i = 1; i < services.length; i++) {
      print(services[i].name);
    }
  }

  postTest() async {
    //print("helllo $jsondata ");
    // Map<String, dynamic> args = {"comments": electrician};
    // var values = json.encode(sheetdata);
    for (int i = 0; i < sheetdata.length; i++) {
      print(sheetdata.length);
      print(sheetdata[i]['name']);
      var values = {
        "name": sheetdata[i]['name'],
        "phone": sheetdata[i]['phone'],
        "charges": sheetdata[i]['charges'],
        "address": sheetdata[i]['address'],
      };
    }

    var values = {
      "name": "ram",
      "phone": "7654455",
      "charges": "500",
      "address": "Pune"
    };

    String jsondata = jsonEncode(sheetdata);
    print(jsondata);
    var url = Uri.parse(
        'https://script.google.com/macros/s/AKfycbwFkh2zpqIhpW27obM7lfl96XCfAdYTTrQIIW5UwbiU7pGjUrxJWlJKzyHEDUK8Rqat/exec');
    var response = await http.post(url, body: jsondata);

    print(response);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    //  print(await http.read(url));
  }

  @override
  void initState() {
    // getFeedbackFromSheet();
    // postTest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            postTest();
          },
          child: Text("press"),
        ),
      ),
    );
  }
}
