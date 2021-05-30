import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Endereco extends StatelessWidget {
  const Endereco({
    Key key,
    @required this.size,
    this.endereco,
    this.numero,
  }) : super(key: key);

  final Size size;
  final String endereco;
  final String numero;

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
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              "$endereco, $numero",
              textAlign: TextAlign.center,
              minFontSize: 8,
              maxLines: 2,
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff94999C),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
