import 'package:cmedapp/CadastroPaciente.dart';
import 'package:cmedapp/LoginPaciente.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'C-MED',
      theme:
          ThemeData(primaryColor: Colors.tealAccent[700], fontFamily: 'Inter'),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: Column(children: [
        Container(
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Consulta',
                style: TextStyle(
                    fontSize: 50,
                    color: Colors.tealAccent[700],
                    fontFamily: "Quicksand",
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'MED',
                style: TextStyle(
                    fontSize: 50,
                    color: Colors.indigo[900],
                    fontFamily: "Quicksand",
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          height: 350,
          width: 341,
          margin: EdgeInsets.only(bottom: 50, left: 30),
          child: Image.asset(
            "assets/images/medical.png",
          ),
        ),
        Container(
          width: 278,
          height: 55,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CadastroPac(),
                ),
              );
            },
            child: Text("Comece agora"),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0),
              ),
              primary: Colors.tealAccent[700],
              onPrimary: Colors.white,
              onSurface: Colors.grey,
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 16),
          child: Row(
            children: [
              Container(
                width: 40,
              ),
              Text(
                "Já possui um cadastro? Faça seu ",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.indigo[900],
                    fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                child: Text(
                  "login.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.indigo[900],
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPac()));
                },
              ),
            ],
          ),
        )
      ]),
    );
  }
}
