import 'package:cmedapp/components/AppBarWithLogo.dart';
import 'package:cmedapp/screens/CadastroMed/body_p2.dart';

import 'package:flutter/material.dart';

class CadastroMed2 extends StatefulWidget {
  @override
  CadastroMed2State createState() => CadastroMed2State();
}

class CadastroMed2State extends State<CadastroMed2> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.lightBlue[50],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.3),
          child: MyAppBar(),
        ),
        body: BodyMed2(
          size: size,
        ));
  }
}
