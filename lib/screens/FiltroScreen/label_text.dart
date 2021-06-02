import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  const LabelText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "O que você precisa?",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            "Selecione uma categoria:",
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF94999C),
            ),
            textAlign: TextAlign.start,
          )
        ],
      ),
    );
  }
}
