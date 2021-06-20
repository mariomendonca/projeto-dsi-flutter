import 'package:cmedapp/components/app_bar.dart';
import 'package:cmedapp/src/ConsultaMarcada/body.dart';

import 'package:flutter/material.dart';

class ConsultaMarcada extends StatefulWidget {
  @override
  _ConsultaMarcadaState createState() => _ConsultaMarcadaState();
}

class _ConsultaMarcadaState extends State<ConsultaMarcada> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.10),
        child: AppBar2(),
      ),
      body: BodyConsultaMarcada(),
    );
  }
}
