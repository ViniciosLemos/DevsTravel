import 'package:flutter/material.dart';

class CityBox extends StatelessWidget {
  CityBox({required this.data, this.ontap});
  final data;
  final void Function(dynamic data)? ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 4, right: 4, bottom: 8),
        child: GestureDetector(
          // botao invisivel pra tornar todo o quadrado clicavel
          onTap: () {
            ontap!(data);
          },
          child: Stack(
            children: [
              AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              // deixar um quadrado responsivo
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    data['places'][0]['img'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  right: 0,
                  top: 0,
                  left: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black])),
                  )),
              Positioned(
                child: Text(
                  data["name"],
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                left: 0,
                right: 0,
                bottom: 10,
              )
            ],
          ), // widget para deixar um acima do outro
        ));
  }
}
