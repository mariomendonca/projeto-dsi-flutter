import 'package:cmedapp/CadastroPaciente.dart';
import 'package:cmedapp/LoginPaciente.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'C-MED',
      theme: ThemeData(
        primaryColor: Colors.tealAccent[700],
      ),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Consulta',
              style: TextStyle(fontSize: 50, color: Colors.tealAccent[700]),
            ),
            Text(
              'MED',
              style: TextStyle(fontSize: 50, color: Colors.indigo[900]),
            ),
          ],
        ),
        Container(
          height: 350,
          width: 350,
          child: Image.asset("assets/images/medical.png"),
        ),
        Container(
          height: 20,
        ),
        Container(
          width: 250,
          height: 45,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CadastroPac()));
            },
            child: Text("Comece agora"),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
              primary: Colors.indigo[900],
              onPrimary: Colors.white,
              onSurface: Colors.grey,
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ),
        Container(
          child: Row(
            children: [
              Container(
                width: 40,
              ),
              Text("Já possui um cadastro? Faça seu",
                  style: TextStyle(fontSize: 18, color: Colors.indigo[900])),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginPac()));
                  },
                  child: Text("Login",
                      style:
                          TextStyle(fontSize: 18, color: Colors.indigo[900])))
            ],
          ),
        )
      ]),
    );
  }
}
