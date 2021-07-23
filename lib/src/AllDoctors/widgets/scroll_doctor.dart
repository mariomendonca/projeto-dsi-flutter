import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmedapp/src/AllDoctors/widgets/card_doctor.dart';

import 'package:cmedapp/src/PerfilMed/view.dart';

import 'package:flutter/material.dart';
import 'package:strings/strings.dart';

class ScrollDoctors extends StatelessWidget {
  final String especialidade;
  final String nome;
  final bool isEspecialidade;
  const ScrollDoctors(
      {key, this.especialidade, this.isEspecialidade, this.nome})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var snapshots;
    if (isEspecialidade) {
      snapshots = FirebaseFirestore.instance
          .collection("medicos")
          .where("especialidade", isEqualTo: especialidade)
          .snapshots();
      // ignore: dead_code
    } else {
      snapshots = FirebaseFirestore.instance
          .collection("medicos")
          .where("nome", isEqualTo: nome)
          .snapshots();
    }

    String documentId;
    return Container(
      width: size.width * 0.8,
      height: size.height * 0.6,
      child: StreamBuilder<QuerySnapshot>(
          stream: snapshots,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.data.docs.length == 0) {
              return Center(
                  child: Text(
                'Nenhum médico encontrado',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ));
            }

            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (BuildContext context, int index) {
                Map<dynamic, dynamic> doctor = snapshot.data.docs[index].data();
                return CardDoctor(
                  nome: capitalize(doctor["nome"].toString()),
                  sobrenome: capitalize(doctor["sobrenome"].toString()),
                  especialidade: doctor["especialidade"],
                  descricao: doctor["descricao"],
                  url: doctor["url"],
                  email: doctor["email"],
                  press: () {
                    documentId = doctor["email"];
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PerfilMed(
                              documentId: documentId,
                            )));
                  },
                );
              },
            );
          }),
    );
  }
}
