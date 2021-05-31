import 'package:cmedapp/screens/EsqueceuSenha.dart';
import 'package:flutter/material.dart';

import '../components/Logo.dart';
import 'Home/Home.dart';

class LoginPac extends StatefulWidget {
  @override
  _LoginPacState createState() => _LoginPacState();
}

class _LoginPacState extends State<LoginPac> {
  containerHeight(size) {
    print(size);
    double height;
    if (size.height < 600) {
      height = size.height * 0.65;
    } else if (size.width < 400 && size.height >= 640 && size.height < 800) {
      height = size.height * 0.70;
    } else {
      height = size.height * 0.60;
    }
    return height;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(30),
            child: Logo(),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: containerHeight(size),
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black54.withOpacity(0.5),
                          blurRadius: 5.0,
                          offset: Offset(0.0, 5.0))
                    ],
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: LoginArea(size: size),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LoginArea extends StatelessWidget {
  const LoginArea({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    submitButton(size) {
      if (size.width > 300) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => EsqueceuSenha()));
                },
                child: Text(
                  "Esqueceu sua senha?",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                )),
            Container(
              width: 100,
              height: 45,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.tealAccent[700].withOpacity(0.5),
                      blurRadius: 5.0,
                      offset: Offset(0.0, 5.0))
                ],
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Home()));
                },
                child: Text("Entrar"),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(0, 191, 186, 1),
                  onPrimary: Colors.white,
                  onSurface: Colors.grey,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        );
      } else {
        return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 45,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.tealAccent[700].withOpacity(0.5),
                        blurRadius: 5.0,
                        offset: Offset(0.0, 5.0))
                  ],
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Home()));
                  },
                  child: Text("Entrar"),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(0, 191, 186, 1),
                    onPrimary: Colors.white,
                    onSurface: Colors.grey,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EsqueceuSenha()));
                  },
                  child: Text(
                    "Esqueci minha senha?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  )),
            ]);
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, right: 35, left: 35),
          child: Container(
            margin: EdgeInsets.only(bottom: 40),
            child: Text(
              "Seja bem-vindo(a) de volta",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Container(
              height: 55,
              child: TextFormField(
                style: TextStyle(color: Colors.tealAccent[700]),
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                autofocus: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: 'E-mail'),
              ),
            )),
        SizedBox(
          height: 30,
        ),
        Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Container(
              height: 55,
              child: TextFormField(
                style: TextStyle(color: Colors.tealAccent[700]),
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                autofocus: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: 'Senha'),
              ),
            )),
        Padding(padding: const EdgeInsets.all(20), child: submitButton(size))
      ],
    );
  }
}
