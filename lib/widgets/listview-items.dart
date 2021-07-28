import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo_project/constants/globalconstanst.dart';
import 'package:url_launcher/url_launcher.dart';

class ListViewItems extends StatefulWidget {
  final int index;
  final List Electrician;

  ListViewItems(this.index, this.Electrician);

  @override
  _ListViewItemsState createState() => _ListViewItemsState(index, Electrician);
}

class _ListViewItemsState extends State<ListViewItems> {
  final int index;
  final List Electrician;

  _ListViewItemsState(this.index, this.Electrician);

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
                top: mediaQuery.width * 0.00, bottom: mediaQuery.width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: mediaQuery.height * 0.01,
                      left: mediaQuery.width * 0.01),
                  child: Row(
                    children: [
                      Container(
                        width: mediaQuery.width * 0.20,
                        height: mediaQuery.height * 0.09,
                        child: CircleAvatar(
                          backgroundColor: randomGenerator(),
                          child: Text(
                            Electrician[index]['name'][0],
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Electrician[index]['name'],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: mediaQuery.width * 0.049,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(Electrician[index]['phone']),
                          SizedBox(height: 5),
                          Text(
                            '\u{20B9} ${Electrician[index]['charges']}',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    GlobalConstants.latitude =
                                        Electrician[index]["Address"]
                                            ["latitude"];
                                    GlobalConstants.longitude =
                                        Electrician[index]["Address"]
                                            ["longitude"];
                                  });
                                  Navigator.pushNamed(context, '/viewlocation');
                                },
                                child: Icon(
                                  Icons.where_to_vote,
                                  color: Colors.red,
                                ),
                              ),
                              Text(Electrician[index]["Address"]["address"])
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(right: mediaQuery.width * 0.08),
                      child: Icon(Icons.call)),
                  onTap: () {
                    customLaunch('tel:${Electrician[index]["phone"]}');
                  },
                )
              ],
            ),
          )),
    );
  }
}

// class ListViewItems extends StatelessWidget {
//   final int index;
//   final List Electrician;

//   ListViewItems(this.index, this.Electrician);

//   void customLaunch(command) async {
//     if (await canLaunch(command)) {
//       await launch(command);
//     } else {
//       print(' could not launch $command');
//     }
//   }

//   final List<Color> circleColors = [
//     Colors.red,
//     Colors.blue,
//     Colors.green,
//     Colors.amber,
//     Colors.pink,
//     Colors.purple
//   ];

//   Color randomGenerator() {
//     return circleColors[new Random().nextInt(circleColors.length)];
//   }

//   @override
//   Widget build(BuildContext context) {
//     var mediaQuery = MediaQuery.of(context).size;
//     return Container(
//       child: Card(
//           elevation: 5.0,
//           child: Container(
//             width: mediaQuery.width,
//             padding: EdgeInsets.only(
//                 top: mediaQuery.width * 0.01, bottom: mediaQuery.width * 0.02),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(top: mediaQuery.width * 0.03),
//                   child: Row(
//                     children: [
//                       Container(
//                         width: mediaQuery.width * 0.20,
//                         height: mediaQuery.height * 0.08,
//                         child: CircleAvatar(
//                           backgroundColor: randomGenerator(),
//                           child: Text(
//                             Electrician[index]['name'][0],
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 20.0),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             Electrician[index]['name'],
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: mediaQuery.width * 0.049,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(height: 5),
//                           Text(Electrician[index]['phone']),
//                           SizedBox(height: 5),
//                           Text(
//                             '\u{20B9} ${Electrician[index]['charges']}',
//                             style: TextStyle(color: Colors.grey),
//                           ),
//                           Row(
//                             children: [
//                               GestureDetector(
//                                 onTap: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => ViewLocation(
//                                                )));
//                                 },
//                                 child: Icon(
//                                   Icons.add_location,
//                                   color: Colors.red,
//                                 ),
//                               ),
//                               Text("Pune")
//                             ],
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 GestureDetector(
//                   child: Container(
//                       alignment: Alignment.center,
//                       padding: EdgeInsets.only(right: mediaQuery.width * 0.08),
//                       child: Icon(Icons.call)),
//                   onTap: () {
//                     customLaunch('tel:${Electrician[index]["phone"]}');
//                   },
//                 )
//               ],
//             ),
//           )),
//     );
//   }
// }
