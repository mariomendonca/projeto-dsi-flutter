import 'package:flutter/material.dart';

class SchedulesBox extends StatelessWidget {
  const SchedulesBox({
    Key key,
    this.from,
    this.to,
    this.active,
  }) : super(key: key);
  final String from;
  final String to;
  final bool active;

  @override
  Widget build(BuildContext context) {
    // print(this.active);

    return Container(
      width: 80,
      height: 50,
      decoration: BoxDecoration(
        color: this.active ? Color(0xff00BFBA) : Color(0xffEDF3F7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            ('${this.from}h às ${this.to}h'),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: this.active ? Color(0xffEDF3F7) : Color(0xff00BFBA),
            ),
          ),
        ],
      ),
    );
  }
}
