import 'package:cmedapp/components/button_padrao.dart';

import 'package:cmedapp/screens/PerfilMed/descricao.dart';
import 'package:cmedapp/screens/PerfilMed/email_and_phone.dart';
import 'package:cmedapp/screens/PerfilMed/endereco.dart';
import 'package:cmedapp/screens/PerfilMed/image_and_name.dart';
import 'package:cmedapp/screens/PerfilMed/scroll_dias_de_consulta.dart';
import 'package:cmedapp/screens/PerfilMed/text_dias_de_consulta.dart';
import 'package:flutter/material.dart';

class BodyPerfilMed extends StatelessWidget {
  const BodyPerfilMed({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
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
              nome: "Isadora",
              sobrenome: "Tavares",
              especialidade: "Cardiologista",
            ),
          ),
          Row(
            children: [
              Endereco(
                size: size,
                endereco: "Rua doutor Murilo de Menezes Lira",
                numero: "538",
              ),
              EmailAndPhone(
                size: size,
                fone: "(81)99999-9999",
                email: "carlossouzap@outlook.com",
              ),
            ],
          ),
          Descricao(
            size: size,
            descricao:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua...",
          ),
          Container(
            width: size.width * 0.8,
            margin: EdgeInsets.only(top: 20, bottom: 10),
            child: TextAndLabelDias(size: size),
          ),
          Spacer(),
          Container(
            width: size.width * 0.8,
            child: ScrollDiasConsulta(size: size),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ButtonPadrao(
              text: "Avançar",
              press: () {},
            ),
          ),
        ],
      ),
    );
  }
}
