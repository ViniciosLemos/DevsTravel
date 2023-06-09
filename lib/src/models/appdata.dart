import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppData with ChangeNotifier {
  var data = [];

  void setData(newData) {
    data = newData;

    notifyListeners();
  }

  Future<bool> requestData() async {
    final res =
        await http.get(Uri.parse("https://api.b7web.com.br/flutter1wb/"));
    if (res.statusCode == 200) {
      setData(jsonDecode(
          res.body)); //transforma a requisição em um JSON e coloca em data[]

      return true;
    } else {
      return false;
    }
  }
}
