import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_project/popup/logout-popup.dart';
import 'package:flutter_freshchat/flutter_freshchat.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_demo_project/constants/globalconstanst.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool status = false;

  Position _currentPosition;

  Future<void> _getCurrentLocation() async {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        GlobalConstants.latitude = _currentPosition.latitude;
        GlobalConstants.longitude = _currentPosition.longitude;
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    await FlutterFreshchat.init(
        appID: "5a380239-c3bf-4f4e-b8b1-56b4d6fc354d",
        appKey: "8fefb485-3603-4b6f-9a04-8a5ad6a8fbb5",
        domain: "msdk.in.freshchat.com");
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backwardsCompatibility: false,
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: 1,
          backgroundColor: GlobalConstants.primaryColor,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: GlobalConstants.primaryColor.withOpacity(0.7)),
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Column(children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(mediaQuery.width * 0.25)),
              color: GlobalConstants.primaryColor,
            ),
            width: mediaQuery.width,
            height: mediaQuery.height * 0.16,
            child: Padding(
                padding: EdgeInsets.only(top: mediaQuery.height * 0.05),
                child: Text(
                  "Settings",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                      fontSize: mediaQuery.width * 0.08),
                  textAlign: TextAlign.center,
                )),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: mediaQuery.height * 0.12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: mediaQuery.height * 0.001),
                          child: IconButton(
                            icon: Icon(Icons.person_outline),
                            onPressed: null,
                          ),
                        ),
                        Padding(
                            padding:
                                EdgeInsets.only(right: mediaQuery.width * 0.01),
                            child: Center(
                              child: Text(
                                "Status",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: mediaQuery.width * 0.05),
                              ),
                            )),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: mediaQuery.height * 0.001),
                      child: Transform.scale(
                        scale: 0.7,
                        child: CustomSwitch(
                          activeColor: GlobalConstants.primaryColor,
                          value: status,
                          onChanged: (value) {
                            setState(() {
                              status = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/viewlocation');
            },
            child: bulidSettingOptions(
                context, Icon(Icons.where_to_vote_outlined), "My location"),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/contactus');
            },
            child: bulidSettingOptions(
                context, Icon(Icons.contact_mail_outlined), "Contact Us"),
          ),
          Divider(),
          GestureDetector(
            onTap: () async {
              FreshchatUser user = FreshchatUser.initial();
              user.email = "thakaredipali14@gmail.com";
              user.firstName = "Test";
              user.lastName = "User";
              user.phoneCountryCode = "+91";
              user.phone = "9518796894";

              FlutterFreshchat.updateUserInfo(user: user);

              var restoreid = user.id;
              FlutterFreshchat.identifyUser(
                  externalID: 'thakaredipali14@gmail.com',
                  restoreID: restoreid);
              String title = "Support Screen";
              await FlutterFreshchat.showConversations(
                  tags: const [], title: title);
            },
            child: bulidSettingOptions(
                context, Icon(Icons.contact_mail_outlined), "Support"),
          ),
          Divider(),
          GestureDetector(
            onTap: () async {
              // String title = "Support Screen";
              await FlutterFreshchat.showFAQs();
            },
            child: bulidSettingOptions(
                context, Icon(Icons.contact_mail_outlined), "Show FAQs"),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              showDialog(
                barrierDismissible: true,
                context: context,
                builder: (context) => LogoutPopup(),
              );
            },
            child: bulidSettingOptions(
                context, Icon(Icons.logout_outlined), "Log Out"),
          )
        ])));
  }

  bulidSettingOptions(BuildContext context, Icon icon, String title) {
    var mediaQuery = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: mediaQuery.height * 0.001),
              child: IconButton(
                icon: icon,
                onPressed: null,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(right: mediaQuery.width * 0.01),
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.black, fontSize: mediaQuery.width * 0.05),
                  ),
                )),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: mediaQuery.height * 0.001),
          child: IconButton(
            icon: Icon(Icons.arrow_forward_ios, size: mediaQuery.height * 0.03),
            onPressed: null,
          ),
        ),
      ],
    );
  }
}
