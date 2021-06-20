import 'package:cmedapp/src/PerfilMed/perfil_med.dart';
import 'package:flutter/material.dart';

import 'icone.dart';

class Recentes extends StatefulWidget {
  @override
  _RecentesState createState() => _RecentesState();
}

class _RecentesState extends State<Recentes> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Icone(
            img: "assets/images/medico-1.jpg",
            press: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => PerfilMed()));
            }),
        Icone(
            img: "assets/images/medico-3.jpg",
            press: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => PerfilMed()));
            }),
        Icone(
            img: "assets/images/medico-4.jpg",
            press: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => PerfilMed()));
            }),
        Icone(
            img: "assets/images/medico-5.jpg",
            press: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => PerfilMed()));
            }),
        Icone(
            img: "",
            press: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => PerfilMed()));
            })
      ]),
    );
  }
}
