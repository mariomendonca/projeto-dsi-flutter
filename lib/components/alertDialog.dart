import 'package:flutter/material.dart';

// ignore: camel_case_types
class Alert_Box extends StatelessWidget {
  final Key key;
  final buttons;
  final text;
  final title;
  final action;

  const Alert_Box(
      {this.buttons,
      this.text,
      this.title = " Ocorreu um erro ",
      this.key,
      this.action});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: new Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        content: new Text(text),
        actions: buttons,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))));
  }
}
