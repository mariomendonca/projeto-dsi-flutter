import 'package:auto_size_text/auto_size_text.dart';
import 'package:cmedapp/components/fonte.dart';
import 'package:flutter/material.dart';

class CardDoctor extends StatelessWidget {
  const CardDoctor(
      {Key key,
      this.nome,
      this.sobrenome,
      this.especialidade,
      this.url,
      this.descricao,
      this.press})
      : super(key: key);
  final String nome;
  final String sobrenome;
  final String especialidade;
  final String url;
  final String descricao;
  final Function press;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
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
              child: Image(
                width: size.width * 0.3,
                height: size.height,
                fit: BoxFit.fill,
                alignment: Alignment.center,
                image: NetworkImage(url),
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
                      "Dr. $nome $sobrenome",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                      minFontSize: 12,
                    ),
                    SizedBox(
                      height: size.height * 0.002,
                    ),
                    AutoSizeText(
                      especialidade.toUpperCase(),
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
                        descricao,
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
            )
          ],
        ),
      ),
    );
  }
}
