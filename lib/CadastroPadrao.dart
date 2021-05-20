import 'package:cmedapp/CadastroPaciente.dart';
import 'package:flutter/material.dart';

class CadastroPadrao extends StatefulWidget {
  @override
  _CadastroPadraoState createState() => _CadastroPadraoState();
}

class _CadastroPadraoState extends State<CadastroPadrao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: ListView(
        children: [
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
          Container(
            height: 30,
            // color: Colors.red
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
                // color: Colors.red
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
                              labelText: 'Nome completo'),
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
                              labelText: 'Email'),
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
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          autofocus: false,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              labelText: 'Senha'),
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
                          obscureText: true,
                          autofocus: false,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              labelText: 'Confirme sua senha',
                              // errorText: 'Esse campo é obrigatório',
                              ),
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
                            builder: (context) => CadastroPac()));
                            // print('')
                      },
                      child: Text("Avançar"),
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