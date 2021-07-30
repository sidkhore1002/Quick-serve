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

  List electrician = [
    {
      "name": "Sagar Jadhav",
      "phone": "98648758",
      "charges": "200",
      "Address": "pune"
    },
    {
      "name": "Sagar Jadhav",
      "phone": "98648758",
      "charges": "200",
      "Address": "pune"
    },
    {
      "name": "Sagar Jadhav",
      "phone": "98648758",
      "charges": "200",
      "Address": "pune"
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
    //String jsondata = jsonEncode(values);

    //print("helllo $jsondata ");
    //Map<String, dynamic> args = {"comments": electrician};
    //  var body = json.encode(electrician);

    var values = {
      "name": "Sagar Jadhav",
      "phone": "98648758",
      "charges": "200",
      "Address": "pune",
    };

    var url = Uri.parse(
        'https://script.google.com/macros/s/AKfycbyhMbjWIL86FxxaXwAK1OlGbEkLDFn6JBVa5waTmnlC02rP5CtGSP38zScQ2j7QgLBA/exec');
    var response = await http.post(url, body: values);

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
