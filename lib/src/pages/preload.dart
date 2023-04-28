import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';

class PreloadPage extends StatefulWidget {
  @override
  _PreloadPage createState() => _PreloadPage();
}

class _PreloadPage extends State<PreloadPage> {
  bool loading = true;

  void requestInfo() async {
    await Future.delayed(Duration(milliseconds: 2));

    setState(() {
      loading = true;
    });
    bool req = await Provider.of<AppData>(context, listen: false).requestData();

    if (req) {
      Navigator.pushReplacementNamed(
          context, "/home"); // manda pra rota sem o botao de voltar
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  void initState() {
    super.initState();
    requestInfo();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle
        .dark); //muda cores das informações da barra de cima
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "lib/assets/devstravel_logo.png",
            width: 200,
          ),
          loading //if ternario para escolher qual widget carregar
              ? Container(
                  margin: EdgeInsets.all(30),
                  child: Text(
                    "Carregando Informações....",
                    style: TextStyle(fontSize: 16),
                  ))
              : Container(),
          loading
              ? CircularProgressIndicator(
                  strokeWidth: 5,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                )
              : Container(),
          !loading
              ? TextButton(onPressed: () {}, child: Text("Tentar Novamente"))
              : Container()
        ],
      )),
    );
  }
}
