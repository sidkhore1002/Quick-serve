import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String dropdownvalue = 'Electrician';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Profile Page"),
      ),
    );
  }
}
