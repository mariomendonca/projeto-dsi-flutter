import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmedapp/globals.dart';
import 'package:cmedapp/src/AllDoctors/card_doctor.dart';
import 'package:cmedapp/src/PerfilMed/perfil_med.dart';

import 'package:flutter/material.dart';

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
              return Center(child: Text('Nenhum médico encontrado', style: TextStyle(fontSize: 18),));
            }
            print(snapshot.data);
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (BuildContext context, int index) {
                Map<dynamic, dynamic> doctor = snapshot.data.docs[index].data();
                return CardDoctor(
                  nome: doctor["nome"].toString().toUpperCase(),
                  sobrenome: doctor["sobrenome"].toString().toUpperCase(),
                  especialidade: doctor["especialidade"],
                  descricao: doctor["descricao"],
                  url:
                      "https://p2.trrsf.com/image/fget/cf/460/0/images.terra.com/2013/06/14/01especilidade.jpg",
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
// padding: EdgeInsets.only(top: 20),
//                 scrollDirection: Axis.vertical,
//                 children: [
//                   Column(
//                     children: [
//                       CardDoctor(
//                           nome: "Carlos",
//                           sobrenome: "Henrique",
//                           especialidade: "Dentista",
//                           url:
//                               "https://p2.trrsf.com/image/fget/cf/460/0/images.terra.com/2013/06/14/01especilidade.jpg",
//                           descricao:
//                               "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
//                           press: () {
//                             Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (context) => PerfilMed()));
//                           }),
//                     ],
//                   ),
//                 ];