import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmedapp/components/recentes.dart';
import 'package:cmedapp/firestore_model.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cmedapp/globals.dart' as globals;

class BodyUser extends StatefulWidget {
  @override
  _BodyUserState createState() => _BodyUserState();
}

class _BodyUserState extends State<BodyUser> {
  @override
  Widget build(BuildContext context) {
    var nome = globals.nome.toUpperCase();

    var sobrenome = globals.sobrenome.toUpperCase();
    var size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(children: [
          Container(
            width: size.width,
            height: size.height * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    '$nome $sobrenome',
                    style: TextStyle(
                        fontSize: size.width * 0.08,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(40, 58, 67, 1)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Container(
                    width: size.width * 0.8,
                    height: 2,
                    color: Color.fromRGBO(242, 240, 240, 1),
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Recentes',
                          style: TextStyle(
                              color: Color.fromRGBO(40, 58, 67, 1),
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Recentes(),
                Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("pacientes")
                            .doc(FirebaseAuth.instance.currentUser.email)
                            .collection("consultas")
                            .snapshots(),
                        builder: (context, snapshots) {
                          int contador = snapshots.data.size;
                          if (snapshots.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return Container(
                              width: size.width,
                              height: size.height * 0.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Consultas Marcadas',
                                    style: TextStyle(
                                        color: Color.fromRGBO(40, 58, 67, 1),
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Text('$contador consultas'),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  ScrollConsultas(
                                    snapshots: snapshots,
                                    count: contador,
                                  )
                                ],
                              ),
                            );
                          }
                        }))
              ]))
        ]));
  }
}

class ScrollConsultas extends StatefulWidget {
  const ScrollConsultas({key, this.snapshots, this.count}) : super(key: key);
  final AsyncSnapshot<QuerySnapshot<Object>> snapshots;
  final int count;

  @override
  _ScrollConsultasState createState() => _ScrollConsultasState();
}

class _ScrollConsultasState extends State<ScrollConsultas> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.4,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: widget.count,
          // ignore: missing_return
          itemBuilder: (context, snapshot) {
            Map<dynamic, dynamic> info =
                widget.snapshots.data.docs[snapshot].data();

            if (widget.snapshots.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                children: [
                  // ignore: missing_required_param
                  Dismissible(
                    key: UniqueKey(),
                    background: Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.delete),
                    ),
                    secondaryBackground: Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.delete),
                    ),
                    onDismissed: (direction) async {
                      if (direction == DismissDirection.startToEnd ||
                          direction == DismissDirection.endToStart) {
                        showDialog(
                            context: context,
                            builder: (context) => new AlertDialog(
                                  title: Text("Cancelar consulta"),
                                  content: Text(
                                      "Você tem certeza que deseja cancelar sua consulta?"),
                                  actions: [
                                    TextButton(
                                        onPressed: () async {
                                          await cancelConsult(widget.snapshots
                                              .data.docs[snapshot].id);
                                        },
                                        child: Text("Sim")),
                                    /////////////////////////////////////////////////
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          setState(() {});
                                        },
                                        child: Text("Não"))
                                  ],
                                ));
                      }
                    },
                    child: Consulta(
                      nome: info["nome"],
                      sobrenome: info["sobrenome"],
                      inicioExpediente: info["inicioExpediente"],
                      fimExpediente: info["fimExpediente"],
                      dia: info["dia"],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  )
                ],
              );
            }
          }),
    );
  }
}

class Consulta extends StatelessWidget {
  const Consulta({
    Key key,
    this.nome,
    this.sobrenome,
    this.inicioExpediente,
    this.fimExpediente,
    this.dia,
  }) : super(key: key);
  final String nome;
  final String sobrenome;
  final String inicioExpediente;
  final String fimExpediente;
  final String dia;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var inicio = inicioExpediente + "h";
    var fim = fimExpediente + "h";
    return Container(
      width: size.width * 0.8,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Color.fromRGBO(237, 243, 247, 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: (size.width * 0.8) - 120,
            child: (Text('Dr(a) $nome $sobrenome',
                style: TextStyle(
                    color: Color.fromRGBO(0, 191, 186, 1),
                    fontWeight: FontWeight.bold))),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: size.width * 0.2,
                  child: Center(
                    child: Text('$dia',
                        style: TextStyle(
                            fontSize: 11,
                            color: Color.fromRGBO(0, 191, 186, 1),
                            fontWeight: FontWeight.bold)),
                  )),
              Container(
                width: size.width * 0.2,
                child: Text('$inicio às $fim',
                    style: TextStyle(
                        fontSize: 9,
                        color: Color.fromRGBO(0, 191, 186, 1),
                        fontWeight: FontWeight.bold)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
