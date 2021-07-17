import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmedapp/src/AllDoctors/view.dart';

import 'package:cmedapp/src/FiltroScreen/view.dart';
import 'package:cmedapp/src/FiltroScreen/widgets/box_especialidade.dart';
import 'package:flutter/material.dart';
import 'package:strings/strings.dart';

class ScrollEspecialidades extends StatelessWidget {
  const ScrollEspecialidades({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> especialidades = [];
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("medicos").snapshots(),
        builder: (context, snapshots) {
          if (snapshots.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          for (var snap in snapshots.data.docs) {
            Map<dynamic, dynamic> doctor = snap.data();
            doctor.forEach((key, value) {
              if (key == "especialidade") {
                if (especialidades.contains(value) == false) {
                  especialidades.add(value);
                }
              }
            });
          }

          return ListView.builder(
              itemCount: especialidades.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, snapshot) {
                return Column(
                  children: [
                    BoxEspecialidade(
                        especialidade:
                            capitalize(especialidades[snapshot].toString()),
                        press: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AllDoctors(
                                    especialidade:
                                        especialidades[snapshot].toString(),
                                    isEspecialidade: true,
                                  )));
                        }),
                    Espaco(),
                  ],
                );
              });
        });
  }
}
