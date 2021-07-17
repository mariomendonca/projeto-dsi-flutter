import 'package:flutter/material.dart';

class TextConsultaConfirmada extends StatelessWidget {
  const TextConsultaConfirmada({
    Key key,
    this.nome,
    this.sobrenome,
    this.horario,
    this.dia,
    this.especialidade,
  }) : super(key: key);

  final String nome;
  final String sobrenome;
  final String horario;
  final String dia;
  final String especialidade;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    dayName(name) {
      switch (name) {
        case 'SEG':
          return 'na segunda';
          break;
        case 'TER':
          return 'na terça';
          break;
        case 'QUA':
          return 'na quarta';
          break;
        case 'QUI':
          return 'na quinta';
          break;
        case 'SEX':
          return 'na sexta';
          break;
        case 'SAB':
          return 'no sábado';
          break;
        case 'DOM':
          return 'no domingo';
          break;
      }
    }

    return Container(
      width: size.width * 0.8,
      child: Text(
        "Deseja marcar uma consulta, na especialidade $especialidade, com o(a) Dr(a).  $nome $sobrenome, no horário entre $horario ${dayName(dia)}?",
        style: TextStyle(
          fontSize: 15,
          color: Color(0xFF94999C),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}