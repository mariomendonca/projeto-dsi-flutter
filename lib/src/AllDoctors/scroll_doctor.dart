import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cmedapp/src/AllDoctors/card_doctor.dart';
import 'package:cmedapp/src/PerfilMed/perfil_med.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

class ScrollDoctors extends StatelessWidget {
  final String especialidade;
  const ScrollDoctors({key, this.especialidade}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var firestore = FirebaseFirestore.instance;
    return Container(
      width: size.width * 0.8,
      height: size.height * 0.6,
      child: FutureBuilder(
          future: firestore
              .collection("medicos")
              .where('especialidade', isEqualTo: especialidade)
              .get(),
          builder: (context, snapshot) {
            print(snapshot.data);
            return ListView.builder(
              itemCount: 1,
              itemBuilder: (context, qqroutracoisa) {
                return CardDoctor(
                  nome: "Carlos",
                  sobrenome: "Henrique",
                  especialidade: "Dentista",
                  url:
                      "https://p2.trrsf.com/image/fget/cf/460/0/images.terra.com/2013/06/14/01especilidade.jpg",
                  descricao:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  press: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => PerfilMed()));
                  },
                );
              },
            );
          }),
    );
  }
}
