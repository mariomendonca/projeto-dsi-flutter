import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmedapp/src/utils/authentication_service.dart';
import 'package:cmedapp/src/widgets/button_padrao.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class PerfilClinica extends StatefulWidget {
  @override
  _PerfilClinicaState createState() => _PerfilClinicaState();
}

class _PerfilClinicaState extends State<PerfilClinica> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyAdmin(),
    );
  }
}

class BodyAdmin extends StatefulWidget {
  @override
  _BodyAdminState createState() => _BodyAdminState();
}

class _BodyAdminState extends State<BodyAdmin> {
  String nome;

  void removeAccount(email) {
    FirebaseFirestore.instance
        .collection("clinicas")
        .doc(FirebaseAuth.instance.currentUser.email)
        .delete();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("clinicas")
            .doc(FirebaseAuth.instance.currentUser.email)
            .snapshots(),
        builder: (context, snapshots) {
          if (snapshots.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            Map<dynamic, dynamic> clinica = snapshots.data.data();
            return Container(
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
              child: Column(
                children: [
                  Container(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
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
                                            Navigator.of(context)
                                                .pushNamedAndRemoveUntil(
                                                    '/homePage',
                                                    (Route<dynamic> route) =>
                                                        false);
                                          },
                                          child: Text("Sair")),
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
                    ),
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      child: Center(
                        child: Stack(children: [
                          CircleAvatar(
                              radius: 90,
                              backgroundImage: NetworkImage(clinica["url"])),
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          clinica["nome"],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Descrição",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Endereço: " + clinica["endereco"],
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Complemento: " + clinica["complemento"],
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          clinica["email"],
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "cnpj: " + clinica["cnpj"],
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Especialidades: " + clinica["especialidades"],
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        ButtonPadrao(
                          text: "Apagar conta",
                          press: () {
                            showDialog(
                                context: context,
                                builder: (context) => new AlertDialog(
                                      title: Text("Apagar sua conta?"),
                                      content: Text(
                                          "Voce tem certeza que deseja apagar sua conta?"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              removeAccount(FirebaseAuth
                                                  .instance.currentUser.email);

                                              Navigator.of(context)
                                                  .pushNamedAndRemoveUntil(
                                                      '/homePage',
                                                      (Route<dynamic> route) =>
                                                          false);
                                            },
                                            child: Text("Sim")),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Cancelar"))
                                      ],
                                    ));
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
