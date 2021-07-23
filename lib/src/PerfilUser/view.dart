import 'package:cmedapp/src/utils/authentication_service.dart';
import 'package:cmedapp/src/widgets/recentes.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cmedapp/src/utils/globals.dart' as globals;
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cmedapp/src/utils/firestore_model.dart';

import 'package:strings/strings.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class PerfilUser extends StatefulWidget {
  @override
  _PerfilUserState createState() => _PerfilUserState();
}

class _PerfilUserState extends State<PerfilUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Color.fromRGBO(0, 191, 186, 1),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              showDialog(
                  context: context,
                  builder: (context) => new AlertDialog(
                        title: Text("Encerrar sua sessão"),
                        content: Text(
                            "Voce tem certeza que deseja encerrar sua sessão?"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                var user = AuthenticationService();
                                user.logOut();
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/homePage',
                                    (Route<dynamic> route) => false);
                              },
                              child: Text("Sair")),
                          /////////////////////////////////////////////////
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Cancelar"))
                        ],
                      ));
            },
            color: Color.fromRGBO(0, 191, 186, 1),
          ),
        ],
      ),
      body: BodyUser(),
    );
  }
}

class BodyUser extends StatefulWidget {
  @override
  _BodyUserState createState() => _BodyUserState();
}

class _BodyUserState extends State<BodyUser> {
  @override
  Widget build(BuildContext context) {
    var nome = capitalize(globals.nome.toString());

    var sobrenome = capitalize(globals.sobrenome.toString());
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
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Favoritos',
                          style: TextStyle(
                              color: Color.fromRGBO(40, 58, 67, 1),
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                FavoritosScroll(),
                Padding(
                    padding: const EdgeInsets.only(top: 15.0),
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
                  Row(
                    children: [
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
                                              await cancelConsult(widget
                                                  .snapshots
                                                  .data
                                                  .docs[snapshot]
                                                  .id);
                                              Navigator.of(context).pop();
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
                      IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => new AlertDialog(
                                      title: Text("Cancelar consulta"),
                                      content: Text(
                                          "Você tem certeza que deseja cancelar sua consulta?"),
                                      actions: [
                                        TextButton(
                                            onPressed: () async {
                                              await cancelConsult(widget
                                                  .snapshots
                                                  .data
                                                  .docs[snapshot]
                                                  .id);
                                              Navigator.of(context).pop();
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
                          },
                          icon: Icon(Icons.delete))
                    ],
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
            child: (Text('Dr(a) ${capitalize(nome)} ${capitalize(sobrenome)}',
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
          ),
        ],
      ),
    );
  }
}

class FavoritosScroll extends StatefulWidget {
  const FavoritosScroll({Key key}) : super(key: key);

  @override
  _FavoritosScrollState createState() => _FavoritosScrollState();
}

class _FavoritosScrollState extends State<FavoritosScroll> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.only(top: 15),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("pacientes")
              .doc(FirebaseAuth.instance.currentUser.email)
              .collection("favoritos")
              .snapshots(),
          builder: (context, snapshots) {
            if (snapshots.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshots.data.size == 0) {
              return Container(
                  height: 65,
                  child: Center(
                      child: Text("Você não favoritou nenhum médico(a)")));
            } else {
              return SizedBox(
                width: double.infinity,
                height: size.height * 0.12,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshots.data.size,
                    itemBuilder: (context, snapshot) {
                      Map<dynamic, dynamic> info =
                          snapshots.data.docs[snapshot].data();
                      if (!snapshots.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Container(
                            child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            child: CardFavorito(
                              nome: info["nome"],
                              sobrenome: info["sobrenome"],
                              url: info["url"],
                              especialidade: info["especialidade"],
                              email: info["email"],
                            ),
                          ),
                        ));
                      }
                    }),
              );
            }
          },
        ));
  }
}

class CardFavorito extends StatefulWidget {
  const CardFavorito(
      {Key key,
      this.nome,
      this.sobrenome,
      this.url,
      this.especialidade,
      this.email})
      : super(key: key);
  final String nome;
  final String sobrenome;
  final String url;
  final String especialidade;
  final String email;
  @override
  _CardFavoritoState createState() => _CardFavoritoState();
}

class _CardFavoritoState extends State<CardFavorito> {
  void removeFavorite(email) {
    FirebaseFirestore.instance
        .collection("pacientes")
        .doc(FirebaseAuth.instance.currentUser.email)
        .collection("favoritos")
        .doc(email)
        .delete();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        height: size.height * 0.4,
        width: size.width * 0.75,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xffE5F6FE)),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image.network(
                  widget.url,
                  fit: BoxFit.fill,
                  width: size.width * 0.25,
                  height: size.height * 0.4,
                ),
              ),
            ),
            Container(
              width: size.width * 0.5,
              height: size.height * 0.4,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dr. ${capitalize(widget.nome)} ${capitalize(widget.sobrenome)}",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 0.002,
                    ),
                    Text(
                      capitalize(widget.especialidade),
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      Positioned(
          right: 1,
          top: 2,
          child: IconButton(
              onPressed: () {
                removeFavorite(widget.email);
              },
              // icon
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 22,
              ))),
    ]);
  }
}
