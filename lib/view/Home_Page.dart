import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo_project/widgets/listview-items.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownvalue = 'Electrician';

  List<String> items = [
    'Electrician',
    'Plumber',
  ];

  List Electrician = [
    {
      "name": "Sagar Jadhav",
      "phone": "98648758",
      "charges": "200",
      "address": "Pune"
    },
    {
      "name": "Raj Rathod",
      "phone": "98648758",
      "charges": "200",
      "address": "Mumbai"
    },
    {
      "name": "Karan Patel",
      "phone": "98648758",
      "charges": "500",
      "address": "Nagpur"
    },
    {
      "name": "Sham Joshi",
      "phone": "986543323",
      "charges": "200",
      "address": "Pune",
    },
    {
      "name": "Rakesh Patil",
      "phone": "98648758",
      "charges": "300",
      "address": "Mumbai"
    },
    {
      "name": "Shubham Jadhav",
      "phone": "98648758",
      "charges": "200",
      "address": "Pune"
    },
    {
      "name": "Pratik Thete",
      "phone": "98648758",
      "charges": "400",
      "address": "Mumbai"
    },
    {
      "name": "Kunal Jadhav",
      "phone": "98648758",
      "charges": "200",
      "address": "Pune"
    },
    {
      "name": "Ritik Jadhav",
      "phone": "98648758",
      "charges": "200",
      "address": "Mumbai"
    },
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: mediaQuery.height * 0.08),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: mediaQuery.width * 0.10,
                  right: mediaQuery.width * 0.10),
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
                child: DropdownButton(
                    value: dropdownvalue,
                    items: items.map((String itemslist) {
                      return DropdownMenuItem(
                          value: itemslist, child: Text(itemslist));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        //    dropdownvalue = value;
                      });
                    }),
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
              child: Container(
                child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    itemCount: Electrician.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: ListViewItems(index, Electrician),
                      );
                    }),
              ),
            ))),
          ],
        ),
      ),
    ));
  }
}
