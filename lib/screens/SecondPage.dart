import 'package:cmedapp/components/Logo.dart';
import 'package:cmedapp/screens/CadastroPaciente.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: ListView(
          children: [
          Container(
            height: 35,
          ),
          Logo(),
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CadastroPac(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              child: Row(children: [
                Image.asset(
                  "assets/images/medico-home.png"
                ),
                Text(
                  "Sou médico",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.indigo[900],
                    fontFamily: "Quicksand",
                  ),
                ),
              ],),
            ),
          ),
          
          Container(
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: 50,
            ),
            height: 190,
            width: 278,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CadastroPac(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white
              ),
              child: Row(children: [
                Image.asset(
                  "assets/images/medico-home.png"
                ),
                Text(
                  "Sou paciente",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.indigo[900],
                    fontFamily: "Quicksand",
                  ),
                ),
              ],),
            ),
          ),

          ],
        )
        
      )
    );
  }
}