import 'package:cmedapp/src/PerfilMed/box_day.dart';
import 'package:flutter/material.dart';

// class ScrollDiasConsulta extends StatelessWidget {
//   const ScrollDiasConsulta({
//     Key key,
//     this.day,
//     this.function,
//     @required this.size,
//   }) : super(key: key);
//   final String day;
//   final Size size;
//   final Function function;

class ScrollDiasConsulta extends StatefulWidget {
  const ScrollDiasConsulta({
    Key key,
    this.day,
    this.function,
    @required this.size,
  }) : super(key: key);
  final String day;
  final Size size;
  final Function function;

  @override
  _ScrollDiasConsultaState createState() => _ScrollDiasConsultaState();
}

class _ScrollDiasConsultaState extends State<ScrollDiasConsulta> {
  @override
  String _weekDay = "Ter";

  Widget build(BuildContext context) {
    var day = widget.day;
    var size = widget.size;
    // var press = widget.press;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _weekDay = 'Seg';
              });
            },
            child: BoxDay(
                dia: "Seg", horas: "8h ás 22h", active: 'Seg' == _weekDay),
          ),
          SizedBox(width: size.width * 0.02),
          GestureDetector(
            onTap: () {
              setState(() {
                _weekDay = 'Ter';
              });
            },
            child: BoxDay(
                dia: "Ter", horas: "8h ás 22h", active: "Ter" == _weekDay),
          ),
          SizedBox(width: size.width * 0.02),
          GestureDetector(
            onTap: () {
              setState(() {
                _weekDay = 'Qua';
              });
            },
            child: BoxDay(
                dia: "Qua", horas: "8h ás 22h", active: 'Qua' == _weekDay),
          ),
          SizedBox(width: size.width * 0.02),
          GestureDetector(
            onTap: () {
              setState(() {
                _weekDay = 'Qui';
              });
            },
            child: BoxDay(
                dia: "Qui", horas: "8h ás 22h", active: 'Qui' == _weekDay),
          ),
          SizedBox(width: size.width * 0.02),
          GestureDetector(
            onTap: () {
              setState(() {
                _weekDay = 'Sex';
              });
            },
            child: BoxDay(
                dia: "Sex", horas: "8h ás 22h", active: 'Sex' == _weekDay),
          ),
          SizedBox(width: size.width * 0.02),
          GestureDetector(
            onTap: () {
              setState(() {
                _weekDay = 'Sab';
              });
            },
            child: BoxDay(
                dia: "Sab", horas: "8h ás 22h", active: 'Sab' == _weekDay),
          ),
          SizedBox(width: size.width * 0.02),
          GestureDetector(
            onTap: () {
              setState(() {
                _weekDay = 'Dom';
              });
            },
            child: BoxDay(
                dia: "Dom", horas: "8h ás 22h", active: 'Dom' == _weekDay),
          ),
        ],
      ),
    );
  }
}
