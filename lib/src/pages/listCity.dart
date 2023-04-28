import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "../partials/customAppbar.dart";
import "../models/appdata.dart";
import '../partials/customdrawer.dart';
import '../partials/citybox.dart';

class ListCityPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TextStyle styleTextHome = TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, fontFamily: "Helvetica Neue");

  cityBoxAction(data, BuildContext context) {
    Navigator.pushNamed(context, "/city", arguments: data);
  }

  @override
  Widget build(BuildContext context) {
    final int continentIndex =
        ModalRoute.of(context)!.settings.arguments as int;
    print("ARGS:$continentIndex");
    return Consumer<AppData>(
        // interligar o home com o provider appdata
        builder: (context, appdata, child) {
      var cities = [];

      for (var country in appdata.data[continentIndex]["countries"]) {
        cities.addAll(country["cities"]);
      }

      return Scaffold(
          key: _scaffoldKey,
          appBar: customAppBar(
              title01:
                  "${appdata.data[continentIndex]["name"]} (${cities.length}) cidades",
              pageContext: context,
              hideSearch: false,
              scaffoldKey: _scaffoldKey,
              showBack: true),
          drawer: customDrawer(
            pagecontext: context,
          ),
          backgroundColor: Colors.white,
          body: GridView.count(
            crossAxisCount: 3,
            children: List.generate(cities.length, (index) {
              return CityBox(
                data: cities[index],
                ontap: (data) {
                  cityBoxAction(data, context);
                },
              );
            }),
          ));
    });
  }
}
