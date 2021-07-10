import 'package:cmedapp/screens/CadastroMed/cadastro_med_p1.dart';
import 'package:cmedapp/screens/CadastroMed/cadastro_med_p2.dart';
import 'package:cmedapp/screens/CadastroPac/cadastro_paciente.dart';
import 'package:cmedapp/screens/ConsultaMarcando/body.dart';
import 'package:cmedapp/screens/Home/Home.dart';
import 'package:cmedapp/screens/PerfilMed/perfil_med.dart';
import 'package:flutter/material.dart';
import 'package:cmedapp/screens/FirstPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'C-MED',
        theme: ThemeData(
            primaryColor: Colors.tealAccent[700], fontFamily: 'Inter'),
        // home: CadastroMed2());
        home: MyHomePage());
  }
}
