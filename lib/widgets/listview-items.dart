import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo_project/constants/globalconstanst.dart';
import 'package:url_launcher/url_launcher.dart';

class ListViewItems extends StatefulWidget {
  final int index;
  final List listdata;

  ListViewItems(this.index, this.listdata);

  @override
  _ListViewItemsState createState() => _ListViewItemsState(index, listdata);
}

class _ListViewItemsState extends State<ListViewItems> {
  final int index;
  final List listdata;

  _ListViewItemsState(this.index, this.listdata);

  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }

  final List<Color> circleColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.amber,
    Colors.pink,
    Colors.purple
  ];

  Color randomGenerator() {
    return circleColors[new Random().nextInt(circleColors.length)];
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      child: Card(
          elevation: 5.0,
          child: Container(
            width: mediaQuery.width,
            padding: EdgeInsets.only(
                top: mediaQuery.width * 0.03, bottom: mediaQuery.width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: mediaQuery.width * 0.20,
                  height: mediaQuery.height * 0.09,
                  child: CircleAvatar(
                    backgroundColor: randomGenerator(),
                    child: Text(
                      listdata[index]['name'][0],
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: mediaQuery.width * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  listdata[index]["name"],
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: mediaQuery.width * 0.049,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    right: mediaQuery.width * 0.08),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow[700],
                                    ),
                                    Text(
                                      listdata[index]['stars'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Text(
                            listdata[index]['phone'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\u{20B9} ${listdata[index]['charges']}',
                                style: TextStyle(color: Colors.grey),
                              ),
                              GestureDetector(
                                child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(
                                        right: mediaQuery.width * 0.08),
                                    child: Icon(Icons.call)),
                                onTap: () {
                                  customLaunch(
                                      'tel:${listdata[index]["phone"]}');
                                },
                              )
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    GlobalConstants.latitude =
                                        listdata[index]["Address"]["latitude"];
                                    GlobalConstants.longitude =
                                        listdata[index]["Address"]["longitude"];
                                  });
                                  Navigator.pushNamed(context, '/viewlocation');
                                },
                                child: Icon(
                                  Icons.where_to_vote,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                listdata[index]["Address"]["address"],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
