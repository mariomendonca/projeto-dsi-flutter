import 'package:cmedapp/components/app_bar.dart';
import 'package:cmedapp/src/PerfilMed/body.dart';

import 'package:flutter/material.dart';

class PerfilMed extends StatefulWidget {
  @override
  _PerfilMedState createState() => _PerfilMedState();
}

class _PerfilMedState extends State<PerfilMed> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.10),
        child: AppBar2(),
      ),
      body: BodyPerfilMed(size: size),
    );
  }
}
