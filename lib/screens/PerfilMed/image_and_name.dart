import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ImageAndName extends StatelessWidget {
  const ImageAndName({
    Key key,
    @required this.size,
    this.nome,
    this.sobrenome,
    this.especialidade,
  }) : super(key: key);

  final Size size;
  final String nome;
  final String sobrenome;
  final String especialidade;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 77,
            height: 77,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.red),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "Dr. $nome $sobrenome",
                      minFontSize: 16,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    AutoSizeText(
                      "$especialidade",
                      minFontSize: 10,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF94999C),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
