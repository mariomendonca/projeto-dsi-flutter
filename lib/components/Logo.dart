import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Consulta',
          style: TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.w500,
            color: Colors.tealAccent[700],
          ),
        ),
        Text(
          'MED',
          style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w500,
              color: Colors.indigo[900]),
        ),
      ],
    );
  }
}
