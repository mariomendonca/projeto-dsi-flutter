import 'package:cmedapp/components/button_padrao.dart';
import 'package:cmedapp/screens/CadastroMed/cadastro_med_p2.dart';
import 'package:cmedapp/screens/CadastroPac/input_cadastro.dart';

import 'package:flutter/material.dart';

class BodyMed1 extends StatelessWidget {
  const BodyMed1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView(children: [
      Container(
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
                child: InputCadastro(
                  label: "Nome",
                  hint: "Digite seu nome",
                  senha: false,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 14, left: 14),
                child: InputCadastro(
                  label: "Sobrenome",
                  hint: "Digite seu sobrenome",
                  senha: false,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 14, left: 14),
                child: InputCadastro(
                  label: "Email",
                  hint: "exemplo@dominio.com",
                  senha: false,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 14, left: 14),
                child: InputCadastro(
                  label: "CPF",
                  hint: "Apenas os números",
                  senha: false,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 14, left: 14),
                child: InputCadastro(
                  label: "Especialidade",
                  hint: "Digite sua especialidade",
                  senha: false,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 14, left: 14),
                child: InputCadastro(
                  label: "Senha",
                  hint: "No mínimo 8 dígitos",
                  senha: true,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 14, left: 14),
                child: InputCadastro(
                  label: "Confirmar senha",
                  hint: "Confirme sua senha",
                  senha: true,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 14, left: 14),
                child: ButtonPadrao(
                    text: "Avançar",
                    press: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CadastroMed2(),
                        ),
                      );
                    }),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    ]);
  }
}
