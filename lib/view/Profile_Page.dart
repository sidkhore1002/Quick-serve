import 'package:flutter/material.dart';
import 'package:flutter_demo_project/widgets/profile-listview.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
                padding: EdgeInsets.only(top: mediaQuery.height * 0.12),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                  radius: mediaQuery.width * 0.14,
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
          height: mediaQuery.height * 0.40,
          width: mediaQuery.width * 09,
          color: Colors.cyan[200],
        ),
        DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.3,
            maxChildSize: 0.68,
            builder: (BuildContext context, scrollerController) {
              return Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
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
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                ),
              );
            })
      ],
    ));
  }
}
