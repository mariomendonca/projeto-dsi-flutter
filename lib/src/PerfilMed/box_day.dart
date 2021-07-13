import 'package:flutter/material.dart';

class BoxDay extends StatelessWidget {
  const BoxDay({Key key, this.dia, this.horas, this.active}) : super(key: key);
  final String dia;
  final String horas;
  final bool active;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: size.width * 0.01,
        ),
        Container(
          width: size.width * 0.2,
          height: size.height * 0.1,
          decoration: BoxDecoration(
            color: this.active ? Color(0xff00BFBA) : Color(0xffEDF3F7),
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
                  color: this.active ? Color(0xffEDF3F7) : Color(0xff00BFBA),
                ),
              ),
              Text(
                horas,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: this.active ? Color(0xffEDF3F7) : Color(0xff00BFBA),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
