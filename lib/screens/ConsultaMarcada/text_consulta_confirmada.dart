import 'package:flutter/material.dart';

class TextConsultaConfirmada extends StatelessWidget {
  const TextConsultaConfirmada({
    Key key,
    this.nome,
    this.sobrenome,
    this.horario,
    this.dia,
  }) : super(key: key);

  final String nome;
  final String sobrenome;
  final String horario;
  final String dia;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      child: Text(
        "Sua consulta, na especialidade Cardiologista, com a Dr.  $nome $sobrenome foi confirmada no horário $horario no $dia.",
        style: TextStyle(
          fontSize: 15,
          color: Color(0xFF94999C),
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
