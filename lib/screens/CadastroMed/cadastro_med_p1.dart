import 'package:cmedapp/components/AppBarWithLogo.dart';
import 'package:cmedapp/screens/CadastroMed/body_p1.dart';

import 'package:flutter/material.dart';

class CadastroMed extends StatefulWidget {
  @override
  CadastroMedState createState() => CadastroMedState();
}

class CadastroMedState extends State<CadastroMed> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.lightBlue[50],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.3),
          child: MyAppBar(),
        ),
        body: BodyMed1(
          size: size,
        ));
  }
}
