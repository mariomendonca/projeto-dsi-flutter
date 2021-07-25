import 'package:cmedapp/src/CadastroMed/view/cadastro_med_p1.dart';
import 'package:cmedapp/src/CadastroPac/view.dart';
import 'package:cmedapp/src/Clinicas/view.dart';
import 'package:cmedapp/src/Hospitais/view.dart';
import 'package:cmedapp/src/widgets/appbar_with_logo.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              top: 20,
            ),
            height: 195,
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
                  Container(
                    width: 100,
                    height: 80,
                    child: new SvgPicture.asset("assets/images/med.svg"),
                  ),
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
              top: 50,
            ),
            height: 195,
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
                  Container(
                      width: 100,
                      height: 80,
                      child: new SvgPicture.asset("assets/images/pac.svg")),
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
          Container(
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: 50,
            ),
            height: 195,
            width: 278,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => CadastroHosp(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                      width: 100,
                      height: 80,
                      child: new Image.asset("assets/images/hospital.png")),
                  Text(
                    "Criar Hospital",
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
              top: 50,
            ),
            height: 195,
            width: 278,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => CadastroClinica(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                      width: 100,
                      height: 80,
                      child: new SvgPicture.asset("assets/images/pac.svg")),
                  Text(
                    "Criar Clinica",
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
