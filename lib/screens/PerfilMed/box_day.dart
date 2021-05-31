import 'package:flutter/material.dart';

class BoxDay extends StatelessWidget {
  const BoxDay({
    Key key,
    this.dia,
    this.horas,
  }) : super(key: key);
  final String dia;
  final String horas;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76,
      height: 43,
      decoration: BoxDecoration(
        color: Color(0xffEDF3F7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            dia,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xff00BFBA),
            ),
          ),
          Text(
            horas,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: Color(0xff00BFBA),
            ),
          )
        ],
      ),
    );
  }
}
