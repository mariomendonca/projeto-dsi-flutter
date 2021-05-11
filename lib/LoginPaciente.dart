import 'package:flutter/material.dart';

class LoginPac extends StatefulWidget {
  @override
  _LoginPacState createState() => _LoginPacState();
}

class _LoginPacState extends State<LoginPac> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: ListView(
        children: <Widget>[
          Container(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Consulta',
                style: TextStyle(fontSize: 40, color: Colors.tealAccent[700]),
              ),
              Text(
                'MED',
                style: TextStyle(fontSize: 40, color: Colors.indigo[900]),
              ),
            ],
          ),
          SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40, left: 40),
            child: Column(
              children: <Widget>[
                Container(
                  height: 410,
                  width: 325,
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black54,
                          blurRadius: 15.0,
                          offset: Offset(0.0, 0.75))
                    ],
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 45,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Container(
                          child: Text(
                            "Seja bem-vindo(a) de volta",
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
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
                                  labelText: 'E-Mail'),
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
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Esqueci minha senha",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )),
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              width: 100,
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text("Login"),
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
                            )
                          ],
                        ),
                      )
                    ],
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
