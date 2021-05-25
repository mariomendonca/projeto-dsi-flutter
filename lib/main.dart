import 'package:cmedapp/screens/CadastroMedP2.dart';
import 'package:cmedapp/screens/CadastroMed.dart';
import 'package:cmedapp/screens/CadastroPaciente.dart';
import 'package:cmedapp/screens/CadastroPadrao.dart';
import 'package:cmedapp/screens/LoginPaciente.dart';
import 'package:cmedapp/screens/FirstPage.dart';
import 'package:flutter/material.dart';

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