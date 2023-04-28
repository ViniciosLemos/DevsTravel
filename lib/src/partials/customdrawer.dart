import 'package:flutter/material.dart';

Widget customDrawer({
  BuildContext? pagecontext,
}) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "DevsTravel",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Helvetica Neue"),
              ),
              Text(
                "Versão 1.0",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Helvetica Neue"),
              )
            ],
          ),
          decoration: BoxDecoration(color: Colors.blue),
        ),
        ListTile(
          leading: Icon(
            Icons.home,
            color: Colors.black,
          ),
          title: Text("Home"),
          onTap: () {
            Navigator.pushReplacementNamed(pagecontext!, "/home");
          },
        ),
        ListTile(
          leading: Icon(
            Icons.public,
            color: Colors.black,
          ),
          title: Text("Escolher continente"),
          onTap: () {
            Navigator.pushReplacementNamed(pagecontext!, "/continent");
          },
        ),
        ListTile(
          leading: Icon(
            Icons.search,
            color: Colors.black,
          ),
          title: Text("Buscar cidades"),
          onTap: () {
            Navigator.pushReplacementNamed(pagecontext!, "/search");
          },
        ),
        ListTile(
          leading: Icon(
            Icons.favorite,
            color: Colors.black,
          ),
          title: Text("Cidades salvas"),
          onTap: () {
            Navigator.pushReplacementNamed(pagecontext!, "/home");
          },
        ),
      ],
    ),
  );
}
