import 'package:devstravel/src/partials/customdrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "../partials/customAppbar.dart";
import "../models/appdata.dart";

class SearchPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
        // interligar o home com o provider appdata
        builder: (context, appdata, child) => Scaffold(
              key: _scaffoldKey,
              appBar: customAppBar(
                  title01: "Busque uma Cidade",
                  pageContext: context,
                  hideSearch: true,
                  scaffoldKey: _scaffoldKey,
                  showBack: false),
              drawer: customDrawer(pagecontext: context),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Pagina de busca")],
                ),
              ),
            ));
  }
}
