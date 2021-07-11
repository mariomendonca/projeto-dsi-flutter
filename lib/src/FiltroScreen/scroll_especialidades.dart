import 'package:cmedapp/src/FiltroScreen/box_especialidade.dart';
import 'package:cmedapp/src/FiltroScreen/filter_screen.dart';
import 'package:flutter/material.dart';

class ScrollEspecialidades extends StatelessWidget {
  const ScrollEspecialidades({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          BoxEspecialidade(especialidade: "Cardiologista", press: () {}),
          Espaco(),
          BoxEspecialidade(especialidade: "Otorrino", press: () {}),
          Espaco(),
          BoxEspecialidade(especialidade: "Cardiologista", press: () {}),
          Espaco(),
          BoxEspecialidade(especialidade: "Otorrino", press: () {}),
          Espaco(),
          BoxEspecialidade(especialidade: "Cardiologista", press: () {}),
          Espaco(),
          BoxEspecialidade(especialidade: "Otorrino", press: () {}),
          Espaco(),
          BoxEspecialidade(especialidade: "Cardiologista", press: () {}),
          Espaco(),
          BoxEspecialidade(especialidade: "Otorrino", press: () {}),
          Espaco(),
          BoxEspecialidade(especialidade: "Cardiologista", press: () {}),
          Espaco(),
          BoxEspecialidade(especialidade: "Otorrino", press: () {}),
        ],
      ),
    );
  }
}
