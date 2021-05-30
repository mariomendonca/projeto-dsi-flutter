import 'package:cmedapp/components/button_padrao.dart';

import 'package:cmedapp/screens/CadastroPac/input_cadastro.dart';

import 'package:flutter/material.dart';

class BodyMed2 extends StatelessWidget {
  const BodyMed2({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Expanded(
        child: Container(
          height: size.height,
          width: size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  40,
                ),
                topRight: Radius.circular(40)),
            color: Colors.white,
          ),
          child: Container(
            margin: EdgeInsets.only(
              top: 50,
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 14, left: 14),
                  child: Container(
                    // margin: EdgeInsets.only(bottom: 50),
                    height: 55,
                    child: InputCadastro(
                      label: "Endereço",
                      hint: "Rua dos bobos",
                      senha: false,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  // margin: EdgeInsets.only(bottom: 50),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, right: 14, left: 14),
                    child: Container(
                        height: 55,
                        child: InputCadastro(
                          label: "Número",
                          hint: "290",
                          senha: false,
                        )),
                  ),
                ),
                Spacer(),
                Container(
                  //margin: EdgeInsets.only(bottom: 50),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, right: 14, left: 14),
                    child: Container(
                        height: 55,
                        child: InputCadastro(
                          label: "Dias de funcionamento",
                          hint: "será um weekday selector",
                          senha: false,
                        )),
                  ),
                ),
                Spacer(),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 55,
                        width: size.width * 0.40,
                        child: InputCadastro(
                          label: "Início de expediente",
                          hint: "00:00",
                          senha: false,
                        ),
                      ),
                      Container(
                        height: 55,
                        width: size.width * 0.40,
                        child: InputCadastro(
                          label: "Fim de expediente",
                          hint: "00:00",
                          senha: false,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  //margin: EdgeInsets.only(bottom: 50),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, right: 14, left: 14),
                    child: Container(
                        height: 55,
                        child: InputCadastro(
                          label: "Descrição",
                          hint: "Conte-nos um pouco sobre você",
                          senha: false,
                        )),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 14,
                    left: 14,
                  ),
                  child: ButtonPadrao(text: "Finalizar", press: () {}),
                ),
                Spacer()
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
