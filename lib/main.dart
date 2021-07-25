import 'package:cmedapp/src/AllDoctors/view.dart';
import 'package:cmedapp/src/CadastroMed/view/cadastro_med_p1.dart';
import 'package:cmedapp/src/CadastroPac/view.dart';
import 'package:cmedapp/src/EsqueceuSenha/view.dart';
import 'package:cmedapp/src/FirstPage/view.dart';
import 'package:cmedapp/src/Home/view.dart';
import 'package:cmedapp/src/Hospitais/view.dart';
import 'package:cmedapp/src/PerfilAdmin/view.dart';
import 'package:cmedapp/src/PerfilClinica/view.dart';
import 'package:cmedapp/src/PerfilUser/view.dart';
import 'package:cmedapp/src/Login/view.dart';
import 'package:cmedapp/src/SecondPage/view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'src/utils/globals.dart' as globals;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    globals.user = {};
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'C-MED',
        theme: ThemeData(
            primaryColor: Colors.tealAccent[700], fontFamily: 'Inter'),
        routes: {
          "/homePage": (context) => MyHomePage(),
          "/secondPage": (context) => SecondPage(),
          "/cadastroPac": (context) => CadastroPac(),
          "/cadastroMed1": (context) => CadastroMed(),
          "/login": (context) => Login(),
          "/home": (context) => Home(),
          "/esqueceuSenha": (context) => EsqueceuSenha(),
          "/doctors": (context) => AllDoctors(),
          "/perfiluser": (context) => PerfilUser(),
          "/cadastroHosp": (context) => CadastroHosp(),
          "/admin": (context) => PerfilAdmin(),
          "/clinica": (context) => PerfilClinica(),
        },
        home: MyHomePage());
  }
}
