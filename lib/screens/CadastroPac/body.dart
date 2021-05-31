import 'package:cmedapp/components/button_padrao.dart';
import 'package:cmedapp/screens/CadastroPac/input_cadastro.dart';
import 'package:cmedapp/screens/LoginPaciente.dart';
import 'package:flutter/material.dart';

class BodyPac extends StatelessWidget {
  const BodyPac({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Flexible(
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
              top: size.height * 0.08,
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
                    hint: "Digite seu nome",
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
                    label: "Telefone",
                    hint: "(81)99999-9999",
                    senha: false,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 14, left: 14),
                  child: InputCadastro(
                    label: "Senha",
                    hint: "No mínimo 8 dígitos",
                    senha: true,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 14, left: 14),
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
                      text: "Finalizar",
                      press: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => LoginPac(),
                          ),
                        );
                      }),
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
