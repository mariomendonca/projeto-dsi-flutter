import 'package:flutter/material.dart';

class CadastroMed2 extends StatefulWidget {
  @override
  CadastroMed2State createState() => CadastroMed2State();
}

class CadastroMed2State extends State<CadastroMed2> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300.0),
        child: Container(
          margin: EdgeInsets.only(top: 60),
          padding: EdgeInsets.only(bottom: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Consulta',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.tealAccent[700],
                    fontFamily: "Quicksand",
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'MED',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.indigo[900],
                    fontFamily: "Quicksand",
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    40,
                  ),
                  topRight: Radius.circular(40)),
              color: Colors.white,
            ),
            child: Container(
              margin: EdgeInsets.only(
                top: 50,
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 45, left: 45),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 50),
                      height: 55,
                      child: TextFormField(
                        style: TextStyle(color: Colors.tealAccent[700]),
                        keyboardType: TextInputType.name,
                        obscureText: false,
                        autofocus: false,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            labelText: 'Endereço da clínica'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 50),
                    child: Padding(
                        padding: const EdgeInsets.only(right: 45, left: 45),
                        child: Container(
                          height: 55,
                          child: TextFormField(
                            style: TextStyle(color: Colors.tealAccent[700]),
                            keyboardType: TextInputType.number,
                            obscureText: false,
                            autofocus: false,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                labelText: 'Número'),
                          ),
                        )),
                  ),
                  Container(
                    width: 278,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Finalizar Cadastro"),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        primary: Colors.tealAccent[700],
                        onPrimary: Colors.white,
                        onSurface: Colors.grey,
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontStyle: FontStyle.normal,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
