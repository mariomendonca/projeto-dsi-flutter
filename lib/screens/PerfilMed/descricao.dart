import 'package:flutter/material.dart';

class Descricao extends StatelessWidget {
  const Descricao({
    Key key,
    @required this.size,
    this.descricao,
  }) : super(key: key);

  final Size size;
  final String descricao;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.8,
      margin: EdgeInsets.only(top: 20, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sobre o Dr.",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            descricao,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF94999C),
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
