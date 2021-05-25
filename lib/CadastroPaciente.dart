import 'package:cmedapp/CadastroPadrao.dart';
import 'package:cmedapp/components/Logo.dart';
import 'package:flutter/material.dart';

class CadastroPac extends StatefulWidget {
  @override
  CadastroPacState createState() => CadastroPacState();
}

class CadastroPacState extends State<CadastroPac> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: ListView(
        children: [
          Container(
            height: 35,
          ),
          logo(),
          Container(
            height: 30,
          ),
          Container(
              height: 550,
              width: 410,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      40,
                    ),
                    topRight: Radius.circular(40)),
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 45,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 45, left: 45),
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
                              labelText: 'Nome'),
                        ),
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 45, left: 45),
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
                    height: 25,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 45, left: 45),
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
                              labelText: 'CPF'),
                        ),
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 45, left: 45),
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
                              labelText: 'Número'),
                        ),
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 45, left: 45),
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
                              labelText: 'Senha'),
                        ),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 250,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CadastroPadrao()));
                      },
                      child: Text("Finalizar Cadastro"),
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                        primary: Colors.tealAccent[700],
                        onPrimary: Colors.white,
                        onSurface: Colors.grey,
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
