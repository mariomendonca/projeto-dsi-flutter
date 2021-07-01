
import 'package:flutter/material.dart';

class MedBox extends StatefulWidget {
  const MedBox({
    Key key,
    this.text,
    this.icon,
    this.active,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final bool active;

  @override
  _MedBoxState createState() => _MedBoxState();
}

class _MedBoxState extends State<MedBox> {

  @override
  Widget build(BuildContext context) {
    var text = widget.text;
    var icon = widget.icon;
    var active = widget.active;
    return Container(
      width: 80,
      height: 60,
      decoration: BoxDecoration(
        color: active ? Color(0xff00BFBA) : Color(0xffEDF3F7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: active ? Color(0xffEDF3F7) : Color(0xff00BFBA),
            size: 30,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: active ? Color(0xffEDF3F7) : Color(0xff00BFBA),
            ),
          ),
        ],
      ),
    );
  }
}
