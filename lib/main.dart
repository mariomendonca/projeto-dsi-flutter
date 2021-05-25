import 'package:cmedapp/CadastroMedP2.dart';
import 'package:cmedapp/CadastroMed.dart';
import 'package:flutter/material.dart';

import 'FirstPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'C-MED',
      theme:
          ThemeData(primaryColor: Colors.tealAccent[700], fontFamily: 'Inter'),
      home: MyHomePage(),
    );
  }
}
