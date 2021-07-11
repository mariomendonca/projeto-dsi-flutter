import 'package:cmedapp/src/AllDoctors/all_doctors.dart';
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
          BoxEspecialidade(
              especialidade: "Cardiologista",
              press: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AllDoctors(
                          especialidade: "cardiologista",
                        )));
              }),
          Espaco(),
          BoxEspecialidade(
              especialidade: "Nutricionista",
              press: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AllDoctors(
                          especialidade: "nutricionista",
                        )));
              }),
          Espaco(),
          BoxEspecialidade(
              especialidade: "Oftalmologista",
              press: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AllDoctors(
                          especialidade: 'oftalmologista',
                        )));
              }),
          Espaco(),
          BoxEspecialidade(
              especialidade: "Pediatra",
              press: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AllDoctors(
                          especialidade: 'pediatra',
                        )));
              }),
          Espaco(),
          BoxEspecialidade(
              especialidade: "Clínico Geral",
              press: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AllDoctors(
                          especialidade: 'clínico geral',
                        )));
              }),
          Espaco(),
          BoxEspecialidade(
              especialidade: "Dermatologista",
              press: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AllDoctors(
                          especialidade: 'dermatologista',
                        )));
              }),
          Espaco(),
          BoxEspecialidade(
              especialidade: "Obstetra",
              press: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AllDoctors(
                          especialidade: 'obstetra',
                        )));
              }),
          // Espaco(),
          // BoxEspecialidade(especialidade: "Otorrino", press: () {}),
          // Espaco(),
          // BoxEspecialidade(especialidade: "Cardiologista", press: () {}),
          // Espaco(),
          // BoxEspecialidade(especialidade: "Otorrino", press: () {}),
        ],
      ),
    );
  }
}
