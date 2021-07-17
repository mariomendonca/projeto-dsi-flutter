import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmedapp/src/ConsultaMarcada/view.dart';
import 'package:cmedapp/src/PerfilMed/widgets/descricao.dart';
import 'package:cmedapp/src/PerfilMed/widgets/email_and_phone.dart';
import 'package:cmedapp/src/PerfilMed/widgets/endereco.dart';
import 'package:cmedapp/src/PerfilMed/widgets/image_and_name.dart';
import 'package:cmedapp/src/PerfilMed/widgets/scroll_dias_de_consulta.dart';
import 'package:cmedapp/src/PerfilMed/widgets/text_dias_de_consulta.dart';
import 'package:cmedapp/src/widgets/app_bar.dart';
import 'package:cmedapp/src/widgets/button_padrao.dart';

import 'package:flutter/material.dart';
import 'package:strings/strings.dart';

class PerfilMed extends StatefulWidget {
  const PerfilMed({
    Key key,
    @required this.documentId,
  }) : super(key: key);
  final documentId;
  @override
  _PerfilMedState createState() => _PerfilMedState();
}

class _PerfilMedState extends State<PerfilMed> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.10),
        child: AppBar2(),
      ),
      body: BodyPerfilMed(
        id: widget.documentId,
        size: size,
      ),
    );
  }
}

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
                      nome: capitalize(info["nome"].toString()),
                      sobrenome: capitalize(info["sobrenome"].toString()),
                      especialidade:
                          info["especialidade"].toString().toUpperCase(),
                      url: info["url"],
                    ),
                  ),
                  Row(
                    children: [
                      Endereco(
                        size: size,
                        endereco: info["endereco"].toString().toUpperCase(),
                        numero: info["numero"],
                      ),
                      EmailAndPhone(
                        size: size,
                        fone: info["telefone"],
                        email: info["email"],
                      ),
                    ],
                  ),
                  Descricao(
                      size: size, descricao: capitalize(info["descricao"])),
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
