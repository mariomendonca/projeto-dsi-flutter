import 'package:cmedapp/screens/PerfilMed/box_day.dart';
import 'package:flutter/material.dart';

class ScrollDiasConsulta extends StatelessWidget {
  const ScrollDiasConsulta({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BoxDay(
            dia: "Seg",
            horas: "8h ás 22h",
          ),
          SizedBox(width: size.width * 0.02),
          BoxDay(
            dia: "Ter",
            horas: "8h ás 22h",
          ),
          SizedBox(width: size.width * 0.02),
          BoxDay(
            dia: "Qua",
            horas: "8h ás 22h",
          ),
          SizedBox(width: size.width * 0.02),
          BoxDay(
            dia: "Qui",
            horas: "8h ás 22h",
          ),
          SizedBox(width: size.width * 0.02),
          BoxDay(
            dia: "Sex",
            horas: "8h ás 22h",
          ),
          SizedBox(width: size.width * 0.02),
          BoxDay(
            dia: "Sab",
            horas: "8h ás 22h",
          ),
          SizedBox(width: size.width * 0.02),
          BoxDay(
            dia: "Dom",
            horas: "8h ás 22h",
          ),
        ],
      ),
    );
  }
}
