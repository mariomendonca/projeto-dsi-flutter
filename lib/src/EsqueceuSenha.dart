import 'package:flutter/material.dart';

import '../components/Logo.dart';

class EsqueceuSenha extends StatefulWidget {
  @override
  _EsqueceuSenhaState createState() => _EsqueceuSenhaState();
}

class _EsqueceuSenhaState extends State<EsqueceuSenha> {
  GlobalKey<FormState> _formKey = new GlobalKey();
  containerHeight(size) {
    double height;
    if (size.height < 600) {
      height = 490;
    } else if (size.width < 400 && size.height >= 640 && size.height < 800) {
      height = size.height * 0.75;
    } else {
      height = size.height * 0.62;
    }
    return height;
  }

  submitButton(size) {
    if (size.width > 400) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: size.width * 0.5,
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
              onPressed: () {},
              child: Text("Avançar"),
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
                onPressed: () {},
                child: Text("Entrar"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.tealAccent[700],
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
                onPressed: () {},
                child: Text(
                  "Esqueci minha senha",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                )),
          ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var _formkey;
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: ListView(
        children: <Widget>[
          // LOGO
          Padding(
            padding: EdgeInsets.all(40),
            child: Logo(),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: containerHeight(size),
                  width: size.width * 0.8,
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
                  child: Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50, right: 35, left: 35),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 40),
                            child: Text(
                              "Esqueceu sua senha?",
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.w700),
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
                                    labelText: 'E-mail',
                                    hintText: "exemplo@dominio.com"),
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
                                    labelText: 'Nova senha',
                                    hintText:
                                        "Sua senha deve conter no mínimo 8 dígitos"),
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.all(20),
                            child: submitButton(size))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
