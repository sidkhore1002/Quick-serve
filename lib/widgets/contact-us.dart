import 'package:flutter/material.dart';

class ContcatUs extends StatelessWidget {
  const ContcatUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Text("Contact Us"),
      ),
    );
  }
}
