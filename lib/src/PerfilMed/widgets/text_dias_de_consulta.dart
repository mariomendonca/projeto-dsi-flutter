import 'package:flutter/material.dart';

class TextAndLabelDias extends StatelessWidget {
  const TextAndLabelDias({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Dias disponiveis",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          "Escolha um dia para sua consulta:",
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF94999C),
          ),
        ),
      ],
    );
  }
}
