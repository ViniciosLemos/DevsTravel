import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "../partials/customAppbar.dart";
import "../models/appdata.dart";
import '../partials/customdrawer.dart';

class HomePage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TextStyle styleTextHome = TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, fontFamily: "Helvetica Neue");
  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
        // interligar o home com o provider appdata
        builder: (context, appdata, child) => Scaffold(
              key: _scaffoldKey,
              appBar: customAppBar(
                  title01: "Página home",
                  pageContext: context,
                  hideSearch: false,
                  scaffoldKey: _scaffoldKey,
                  showBack: false),
              drawer: customDrawer(
                pagecontext: context,
              ),
              backgroundColor: Colors.white,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          bottom: 30), //coloca margin so nas partes q quiser
                      child: Text(
                        "Bem vindo(a) ao",
                        style: styleTextHome,
                      ),
                    ),
                    Image.asset(
                      "lib/assets/devstravel_logo.png",
                      width: 200,
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            top: 20), //coloca margin so nas partes q quiser
                        child: Text(
                          "Seu guia de viagem perfeito",
                          style: styleTextHome,
                        )),
                  ],
                ),
              ),
            ));
  }
}
