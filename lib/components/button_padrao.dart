import 'package:flutter/material.dart';

class ButtonPadrao extends StatelessWidget {
  const ButtonPadrao({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 278,
      height: 55,
      child: ElevatedButton(
        onPressed: press,
        child: Text(text),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          primary: Colors.tealAccent[700],
          onPrimary: Colors.white,
          onSurface: Colors.grey,
          textStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontFamily: "Inter",
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
