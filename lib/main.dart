import 'package:devstravel/src/pages/city.dart';
import 'package:devstravel/src/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/models/appdata.dart';
import 'src/pages/home.dart';
import 'src/pages/listCity.dart';
import 'src/pages/preload.dart';
import 'src/pages/continent.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppData(),
        )
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/home": (context) => HomePage(),
        "/preload": (context) => PreloadPage(),
        "/search": (context) => SearchPage(),
        "/continent": (context) => ContinentPage(),
        "/listCity": (context) => ListCityPage(),
        "/city": (context) => CityPage()
      },
      initialRoute: "/preload",
    );
  }
}
