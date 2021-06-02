import 'package:flutter/material.dart';

class BoxEspecialidade extends StatelessWidget {
  const BoxEspecialidade({
    Key key,
    this.especialidade,
    this.press,
  }) : super(key: key);

  final String especialidade;
  final Function press;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      height: 65,
      width: size.width * 0.6,
      child: ElevatedButton(
        onPressed: press,
        child: Text(
          especialidade,
          style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          primary: Color(0xFF00BFBA),
          onPrimary: Colors.white,
          onSurface: Colors.grey,
        ),
      ),
    );
  }
}
