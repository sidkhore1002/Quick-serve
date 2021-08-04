import 'package:flutter/material.dart';

import 'package:flutter_demo_project/widgets/listview-items.dart';
import 'package:flutter_demo_project/widgets/plumber-listview.dart';
import 'package:flutter_demo_project/widgets/profile-listview.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? dropdownvalue = 'Electrician';

  List<String> items = [
    'Electrician',
    'Plumber',
  ];

  List electrician = [
    {
      "name": "Sagar Jadhav ",
      "phone": "98648758",
      "charges": "200",
      "stars": "2",
      "Address": {
        "address": "Borivali",
        "latitude": 19.228825,
        "longitude": 72.854118
      }
    },
    {
      "name": "Raj Rathod",
      "phone": "98648758",
      "charges": "200",
      "stars": "3",
      "Address": {
        "address": "Andheri west",
        "latitude": 19.136326,
        "longitude": 72.827660
      }
    },
    {
      "name": "Karan Patel",
      "phone": "98648758",
      "charges": "500",
      "stars": "4",
      "Address": {
        "address": "Pune",
        "latitude": 18.516726,
        "longitude": 73.856255
      }
    },
    {
      "name": "Sham Joshi",
      "phone": "986543323",
      "charges": "200",
      "stars": "5",
      "Address": {
        "address": "Mumbai",
        "latitude": 19.076090,
        "longitude": 72.877426
      }
    },
    {
      "name": "Rakesh Patil",
      "phone": "98648758",
      "charges": "300",
      "stars": "2",
      "Address": {
        "address": "Borivali",
        "latitude": 19.228825,
        "longitude": 72.854118
      }
    },
    {
      "name": "Shubham Jadhav",
      "phone": "98648758",
      "charges": "200",
      "stars": "2",
      "Address": {
        "address": "Andheri west",
        "latitude": 19.136326,
        "longitude": 72.827660
      }
    },
    {
      "name": "Pratik Thete",
      "phone": "98648758",
      "charges": "400",
      "stars": "2",
      "Address": {
        "address": "Pune",
        "latitude": 18.516726,
        "longitude": 73.856255
      }
    },
    {
      "name": "Kunal Jadhav",
      "phone": "98648758",
      "charges": "200",
      "stars": "2",
      "Address": {
        "address": "Mumbai",
        "latitude": 19.076090,
        "longitude": 72.877426
      }
    },
    {
      "name": "Ritik Jadhav",
      "phone": "98648758",
      "charges": "200",
      "stars": "2",
      "Address": {
        "address": "Borivali",
        "latitude": 19.228825,
        "longitude": 72.854118
      }
    },
  ];

  List plumber = [
    {
      "name": "Rahul Mahajan",
      "phone": "98648758",
      "charges": "200",
      "stars": "2",
      "Address": {
        "address": "Borivali",
        "latitude": 19.228825,
        "longitude": 72.854118
      }
    },
    {
      "name": "kishor Rathod",
      "phone": "98648758",
      "charges": "200",
      "stars": "2",
      "Address": {
        "address": "Andheri west",
        "latitude": 19.136326,
        "longitude": 72.827660
      }
    },
    {
      "name": "Karan Patel",
      "phone": "98648758",
      "charges": "500",
      "stars": "2",
      "Address": {
        "address": "Pune",
        "latitude": 18.516726,
        "longitude": 73.856255
      }
    },
    {
      "name": "Rakesh Patil",
      "phone": "98648758",
      "charges": "300",
      "stars": "2",
      "Address": {
        "address": "Borivali",
        "latitude": 19.228825,
        "longitude": 72.854118
      }
    },
  ];

  List contractor = [
    {
      "name": "contractor Rahul ",
      "phone": "98648758",
      "charges": "200",
      "stars": "2",
      "Address": {
        "address": "Borivali",
        "latitude": 19.228825,
        "longitude": 72.854118
      }
    },
    {
      "name": " contractor kishor",
      "phone": "98648758",
      "charges": "200",
      "stars": "2",
      "Address": {
        "address": "Andheri west",
        "latitude": 19.136326,
        "longitude": 72.827660
      }
    },
    {
      "name": " contractor Karan ",
      "phone": "98648758",
      "charges": "500",
      "stars": "2",
      "Address": {
        "address": "Pune",
        "latitude": 18.516726,
        "longitude": 73.856255
      }
    },
    {
      "name": "contractor Rakesh ",
      "phone": "98648758",
      "charges": "300",
      "stars": "2",
      "Address": {
        "address": "Borivali",
        "latitude": 19.228825,
        "longitude": 72.854118
      }
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: mediaQuery.height * 0.04),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(top: mediaQuery.height * 0.02),
              child: Container(
                padding: EdgeInsets.only(left: mediaQuery.width * 0.1),
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
                width: mediaQuery.width * 0.55,
                // height: mediaQuery.width * 0.12,
                child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                      ),
                      value: dropdownvalue,
                      items: items.map((String itemslist) {
                        return DropdownMenuItem(
                            value: itemslist, child: Text(itemslist));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          dropdownvalue = value;
                        });
                      }),
                ),
              ),
            ),
            Expanded(
                child: Container(
                    child:
                        NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overScroll) {
                overScroll.disallowGlow();
                return false;
              },
              child: Padding(
                padding: EdgeInsets.only(top: mediaQuery.height * 0.02),
                child: Container(
                  child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      itemCount: dropdownvalue == "Electrician"
                          ? electrician.length
                          : plumber.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            child: dropdownvalue == "Electrician"
                                ? ListViewItems(index, electrician)
                                : ListViewItems(index, plumber));
                      }),
                ),
              ),
            ))),
          ],
        ),
      ),
    ));
  }
}
