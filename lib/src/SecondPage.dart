import 'package:cmedapp/components/appbar_with_logo.dart';
import 'package:cmedapp/src/CadastroMed/view/cadastro_med_p1.dart';
import 'package:cmedapp/src/CadastroPac/view.dart';

import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.3),
        child: MyAppBar(),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                40,
              ),
              topRight: Radius.circular(40)),
          color: Colors.white,
        ),
        child: ListView(children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: 100,
            ),
            height: 240,
            width: 278,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => CadastroMed(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              child: Row(
                children: [
                  Image.asset("assets/images/medico-home.png"),
                  Text(
                    "Sou médico",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.indigo[900],
                      fontFamily: "Quicksand",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: 100,
            ),
            height: 240,
            width: 278,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => CadastroPac(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              child: Row(
                children: [
                  Image.asset("assets/images/medico-home.png"),
                  Text(
                    "Sou paciente",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.indigo[900],
                      fontFamily: "Quicksand",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
