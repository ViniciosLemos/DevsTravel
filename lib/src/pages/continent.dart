import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "../partials/customAppbar.dart";
import "../models/appdata.dart";
import '../partials/customdrawer.dart';
import '../partials/citybox.dart';
import '../pages/listCity.dart';

class ContinentPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TextStyle styleTextHome = TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, fontFamily: "Helvetica Neue");

  void seeCityAction(context, continentIndex) {
    print(continentIndex);
    Navigator.pushNamed(context, "/listCity", arguments: continentIndex);
  }

  cityBoxAction(context, data) {
    Navigator.pushNamed(context, "/city", arguments: data);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
        // interligar o home com o provider appdata
        builder: (context, appdata, child) => Scaffold(
            key: _scaffoldKey,
            appBar: customAppBar(
                title01: "Escolha um continente",
                pageContext: context,
                hideSearch: false,
                scaffoldKey: _scaffoldKey,
                showBack: false),
            drawer: customDrawer(
              pagecontext: context,
            ),
            body: ListView.builder(
                itemCount: appdata.data.length,
                itemBuilder: (context, index) {
                  //Text(appdata.data[index]['name']);
                  var cities = [];

                  for (var country in appdata.data[index]["countries"]) {
                    cities.addAll(country['cities']);
                  }

                  return Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            "${appdata.data[index]["name"]} (${cities.length})",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            seeCityAction(context, index);
                          },
                          child: Text(
                            "Ver Cidades",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                                fontFamily: 'Helvetica Neue',
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cities.length,
                        itemBuilder: (cityContext, cityIndex) {
                          return CityBox(
                              data: cities[cityIndex],
                              ontap: (data) {
                                cityBoxAction(context, data);
                              });
                        },
                      ),
                    )
                  ]);
                })));
  }
}
