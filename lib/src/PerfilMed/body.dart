import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmedapp/components/button_padrao.dart';
import 'package:cmedapp/src/ConsultaMarcada/marcar_consulta.dart';
import 'package:cmedapp/src/MarcandoConsulta/body.dart';

import 'package:cmedapp/src/PerfilMed/descricao.dart';
import 'package:cmedapp/src/PerfilMed/email_and_phone.dart';
import 'package:cmedapp/src/PerfilMed/endereco.dart';
import 'package:cmedapp/src/PerfilMed/image_and_name.dart';
import 'package:cmedapp/src/PerfilMed/scroll_dias_de_consulta.dart';
import 'package:cmedapp/src/PerfilMed/text_dias_de_consulta.dart';
import 'package:flutter/material.dart';

class BodyPerfilMed extends StatelessWidget {
  const BodyPerfilMed({
    Key key,
    this.size,
    @required this.id,
  }) : super(key: key);

  final Size size;
  final String id;

  @override
  Widget build(BuildContext context) {
    var consultadia;
    var consultahora;
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("medicos")
            .doc(id)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            Map<dynamic, dynamic> info = snapshot.data.data();
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
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ImageAndName(
                      size: size,
                      nome: info["nome"].toString().toUpperCase(),
                      sobrenome: info["sobrenome"].toString().toUpperCase(),
                      especialidade: info["especialidade"],
                    ),
                  ),
                  Row(
                    children: [
                      Endereco(
                        size: size,
                        endereco: info["endereco"],
                        numero: info["numero"],
                      ),
                      EmailAndPhone(
                        size: size,
                        fone: info["telefone"],
                        email: info["email"],
                      ),
                    ],
                  ),
                  Descricao(size: size, descricao: info["descricao"]),
                  Container(
                    width: size.width * 0.8,
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: TextAndLabelDias(size: size),
                  ),
                  Spacer(),
                  Container(
                    width: size.width * 0.8,
                    child: Row(
                      children: [
                        ScrollDiasConsulta(
                          id: info["email"],
                          size: size,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ButtonPadrao(
                      text: "Avançar",
                      press: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ConsultaMarcada()));
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
