import 'package:cloud_firestore/cloud_firestore.dart';
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
  const ScrollDiasConsulta(
      {Key key, this.day, this.function, this.id, @required this.size})
      : super(key: key);
  final String day;
  final Size size;
  final Function function;
  final String id;

  @override
  _ScrollDiasConsultaState createState() => _ScrollDiasConsultaState();
}

class _ScrollDiasConsultaState extends State<ScrollDiasConsulta> {
  @override
  String _weekDay = "";

  Widget build(BuildContext context) {
    var day = widget.day;
    var dias = [];

    // ignore: missing_return
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("medicos")
            .doc(widget.id)
            .collection("diasdeconsulta")
            .doc("dias")
            .snapshots(),
        builder: (context, snapshots) {
          if (snapshots.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var list = [];
            Map<dynamic, dynamic> dias = snapshots.data.data();
            dias.forEach((key, value) {
              if (value == true) {
                list.add(key);
              }
            });
            return Container(
              width: widget.size.width * 0.8,
              height: widget.size.height * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, snapshot) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _weekDay = list[snapshot].toString().toUpperCase();
                      });
                    },
                    child: BoxDay(
                        dia: list[snapshot].toString().toUpperCase(),
                        horas: "8h ás 22h",
                        active: _weekDay ==
                            list[snapshot].toString().toUpperCase()),
                  );
                },
              ),
            );
          }
        });
  }
}
