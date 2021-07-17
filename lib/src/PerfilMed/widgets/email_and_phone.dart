import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class EmailAndPhone extends StatelessWidget {
  const EmailAndPhone({
    Key key,
    @required this.size,
    this.email,
    this.fone,
  }) : super(key: key);

  final Size size;
  final String email;
  final String fone;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.50,
      height: size.height * 0.1,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFF2F0F0),
        ),
      ),
      child: Flexible(
        child: Container(
          margin: EdgeInsets.all(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                fone,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff94999C),
                ),
              ),
              AutoSizeText(
                email,
                minFontSize: 8,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff94999C),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
