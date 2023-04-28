import "package:flutter/material.dart";
import "../pages/home.dart";

PreferredSizeWidget? customAppBar(
    {GlobalKey<ScaffoldState>? scaffoldKey,
    BuildContext? pageContext,
    String title01 = "",
    bool hideSearch = false,
    bool showBack = false}) {
  void searchAction() {
    Navigator.pushReplacementNamed(pageContext!, "/search");
  }

  IconButton drawerIcon = IconButton(
      onPressed: () {
        scaffoldKey?.currentState?.openDrawer();
      },
      icon: Icon(
        Icons.menu,
        color: Colors.black,
        size: 30,
      ));

  IconButton backIcon = IconButton(
      onPressed: () {
        Navigator.pop(pageContext!);
      },
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
        size: 30,
      ));

  IconButton? leadingButton = drawerIcon;
  if (showBack) {
    leadingButton = backIcon;
  }

  return AppBar(
    elevation: 0,

    backgroundColor: Colors.white,
    //qnd ele detectar o drawer ele vai acoplar ao app bar
    title: Text(
      title01,
      style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: "Helvetica Neue"),
    ),
    leading: leadingButton,
    actions: [
      !hideSearch
          ? IconButton(
              onPressed: searchAction,
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: 30,
              ))
          : Container()
    ],
  );
}
