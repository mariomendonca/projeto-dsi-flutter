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
          // LOGO
          Container(
            margin: EdgeInsets.only(top: 60, bottom: 70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Consulta',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.tealAccent[700],
                    fontFamily: "Quicksand",
                  ),
                ),
                Text(
                  'MED',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo[900],
                    fontFamily: "Quicksand",
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 40, left: 40),
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  width: 414,
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
                  child: Column(
                    children: [
                      SizedBox(
                        height: 45,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 35, left: 35),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 40),
                          child: Text(
                            "Seja bem-vindo(a) de volta!",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 30),
                        child: Padding(
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
                                  "Esqueceu sua senha?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontFamily: "Inter"),
                                )),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              width: 123,
                              height: 33,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.tealAccent[700]
                                          .withOpacity(0.5),
                                      blurRadius: 5.0,
                                      offset: Offset(0.0, 5.0))
                                ],
                                borderRadius: BorderRadius.circular(10),
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
                                      fontSize: 16,
                                      fontFamily: "inter",
                                      fontWeight: FontWeight.w600),
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
