import 'package:flutter/material.dart';

class BoxDay extends StatelessWidget {
  const BoxDay({Key key, this.dia, this.active}) : super(key: key);
  final String dia;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76,
      height: 43,
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
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: this.active ? Color(0xffEDF3F7) : Color(0xff00BFBA),
            ),
          ),
        ],
      ),
    );
  }
}
