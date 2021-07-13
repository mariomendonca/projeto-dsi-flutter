import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmedapp/components/button_padrao.dart';
import 'package:cmedapp/src/ConsultaMarcada/label_consulta_marcada.dart';
import 'package:cmedapp/globals.dart' as globals;
import 'package:cmedapp/src/ConsultaMarcada/text_consulta_confirmada.dart';

import 'package:flutter/material.dart';

class BodyConsultaMarcada extends StatelessWidget {
  const BodyConsultaMarcada({
    Key key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("medicos")
            .doc(globals.medicoId)
            .snapshots(),
        builder: (context, snapshots) {
          if (snapshots.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            Map<dynamic, dynamic> medico = snapshots.data.data();
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
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: LabelConsultaMarcada(),
                ),
                Spacer(),
                TextConsultaConfirmada(
                  nome: medico["nome"],
                  sobrenome: medico["sobrenome"],
                  horario: "${medico['inicioExpediente']}h ás ${medico['fimExpediente']}h",
                  dia: globals.diaDaConsulta,
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ButtonPadrao(
                    text: "Finalizar",
                    press: () {},
                  ),
                )
              ],
            ),
          );
          }
        });
  }
}
