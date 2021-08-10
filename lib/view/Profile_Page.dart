import 'package:flutter/material.dart';

import 'package:flutter_demo_project/widgets/profile-listview.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List myservices = [
    {"name": "Sagar Jadhav", "phone": "98648758", "charges": "200"},
    {"name": "Raj Rathod", "phone": "98648758", "charges": "200"},
    {"name": "Karan Patel", "phone": "98648758", "charges": "500"},
    {"name": "Sham Joshi", "phone": "986543323", "charges": "200"},
    {"name": "Rakesh Patil", "phone": "98648758", "charges": "300"},
    {"name": "Shubham Jadhav", "phone": "98648758", "charges": "200"},
    {"name": "Pratik Thete", "phone": "98648758", "charges": "400"},
    {"name": "Kunal Jadhav", "phone": "98648758", "charges": "200"},
    {"name": "Ritik Jadhav", "phone": "98648758", "charges": "200"},
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
        child: Stack(
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: mediaQuery.height * 0.06),
                child: Container(
                  width: mediaQuery.width * 0.27,
                  height: mediaQuery.width * 0.28,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/profile.jpg',
                        ),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: mediaQuery.width * 0.01,
                        color: Colors.grey.withOpacity(0.5)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: mediaQuery.height * 0.04),
                child: Text(
                  "Sagar Jadhav",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: mediaQuery.width * 0.050,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: mediaQuery.height * 0.02),
                child: Text(
                  "9845678761",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: mediaQuery.width * 0.043,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          height: mediaQuery.height * 0.33,
          width: mediaQuery.width * 09,
          color: Colors.cyan[200],
        ),
        DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.3,
            maxChildSize: 0.60,
            builder: (BuildContext context, scrollerController) {
              return Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  child: Stack(children: [
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          child: Image.asset(
                            'assets/images/ic_scroll_up_bottom_sheet.png',
                            color: Colors.black,
                            height: mediaQuery.height * 0.035,
                            width: mediaQuery.width * 0.08,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Recent Services",
                            style: TextStyle(color: Colors.black45),
                          ),
                        )
                      ],
                    ),
                    NotificationListener<OverscrollIndicatorNotification>(
                      onNotification:
                          (OverscrollIndicatorNotification overScroll) {
                        overScroll.disallowGlow();
                        return false;
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: mediaQuery.height * 0.03),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: myservices.length,
                            controller: scrollerController,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: ProfileListview(myservices, index),
                              );
                            }),
                      ),
                    )
                  ]),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15)),
                ),
              );
            })
      ],
    ));
  }
}
