import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "../partials/customAppbar.dart";
import "../models/appdata.dart";
import '../partials/customdrawer.dart';

class CityPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TextStyle styleTextHome = TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, fontFamily: "Helvetica Neue");
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? cityData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    print(cityData!["places"]);
    var starRate = double.parse(cityData["review"]).floor();
    var stars = [];
    for (var i = 0; i < 5; i++) {
      if (i < starRate) {
        stars.add(true);
      } else {
        stars.add(false);
      }
    }
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Consumer<AppData>(
        // interligar o home com o provider appdata
        builder: (context, appdata, child) => Scaffold(
            key: _scaffoldKey,
            drawer: customDrawer(
              pagecontext: context,
            ),
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: 250,
                    child: Image.network(
                      cityData["places"][0]["img"],
                      fit: BoxFit.cover,
                    )),
                ListView(
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 220),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      cityData["name"],
                                      style: TextStyle(
                                          fontFamily: "Helvetica Neue",
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: stars[0]
                                            ? Colors.blue
                                            : Colors.grey,
                                        size: 18,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: stars[1]
                                            ? Colors.blue
                                            : Colors.grey,
                                        size: 18,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: stars[2]
                                            ? Colors.blue
                                            : Colors.grey,
                                        size: 18,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: stars[3]
                                            ? Colors.blue
                                            : Colors.grey,
                                        size: 18,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: stars[4]
                                            ? Colors.blue
                                            : Colors.grey,
                                        size: 18,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child: Text(
                                          cityData["review"],
                                          style: TextStyle(
                                              fontFamily: "Helvetica Neue",
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.favorite_border,
                                    color: Colors.red,
                                  )),
                            )
                          ],
                        )
                      ]),
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(top: statusBarHeight),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back, color: Colors.white)),
                ),
              ],
            )));
  }
}
