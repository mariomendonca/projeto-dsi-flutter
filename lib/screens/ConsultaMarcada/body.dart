import 'package:cmedapp/components/button_padrao.dart';
import 'package:cmedapp/screens/ConsultaMarcada/label_consulta_marcada.dart';
import 'package:cmedapp/screens/ConsultaMarcada/text_consulta_confirmada.dart';

import 'package:flutter/material.dart';

class BodyConsultaMarcada extends StatelessWidget {
  const BodyConsultaMarcada({
    Key key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
            nome: "Isadora",
            sobrenome: "Tavares",
            horario: "18h ás 19h",
            dia: "sábado",
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
}
