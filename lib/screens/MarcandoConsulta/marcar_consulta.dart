import 'package:cmedapp/components/AppBar.dart';

import 'package:cmedapp/screens/MarcandoConsulta/body.dart';

import 'package:flutter/material.dart';

class MarcandoConsulta extends StatefulWidget {
  @override
  _MarcandoConsultaState createState() => _MarcandoConsultaState();
}

class _MarcandoConsultaState extends State<MarcandoConsulta> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.10),
        child: AppBar2(),
      ),
      body: BodyMarcandoConsulta(),
    );
  }
}
