import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:strings/strings.dart';

class CardHosp extends StatelessWidget {
  const CardHosp({
    Key key,
    this.nome,
    this.endereco,
    this.complemento,
    this.telefone,
    this.url,
  }) : super(key: key);
  final String nome;
  final String endereco;
  final String complemento;
  final String telefone;
  final String url;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        height: size.height * 0.2,
        width: size.width * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xffE5F6FE)),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image.network(
                  url,
                  fit: BoxFit.fill,
                  width: size.width * 0.3,
                  height: size.height,
                ),
              ),
            ),
            Container(
              width: size.width * 0.5,
              height: size.height,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "${nome}",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                      minFontSize: 12,
                    ),
                    SizedBox(
                      height: size.height * 0.002,
                    ),
                    AutoSizeText(
                      endereco.toUpperCase(),
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.black,
                      ),
                      minFontSize: 8,
                    ),
                    AutoSizeText(
                      complemento,
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.black,
                      ),
                      minFontSize: 8,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Flexible(
                      child: AutoSizeText(
                        capitalize(telefone),
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 11.0,
                            color: Color(0xff94999C),
                            fontWeight: FontWeight.w500),
                        minFontSize: 10,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
