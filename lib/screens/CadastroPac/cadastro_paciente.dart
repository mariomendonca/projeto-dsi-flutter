import 'dart:ffi';

import 'package:cmedapp/components/AppBarWithLogo.dart';
import 'package:cmedapp/components/button_padrao.dart';
import 'package:flutter/material.dart';

import '../LoginPaciente.dart';
import 'body.dart';
import 'input_cadastro.dart';

class CadastroPac extends StatefulWidget {
  @override
  CadastroPacState createState() => CadastroPacState();
}

class CadastroPacState extends State<CadastroPac> {
  void validarcpf(controladorcpf) {
    if (controladorcpf.lenght < 11) {
      print(" asdasd");
    } else {
      return null;
    }
  }

  GlobalKey<FormState> formKey = new GlobalKey();

  final cpfcontrolador = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.3),
        child: MyAppBar(),
      ),
      body: Form(
        key: formKey,
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  40,
                ),
                topRight: Radius.circular(40)),
            color: Colors.white,
          ),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
                child: InputCadastro(
                  label: "Nome",
                  hint: "Digite seu nome",
                  senha: false,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
                child: InputCadastro(
                  label: "Sobrenome",
                  hint: "Digite seu nome",
                  senha: false,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
                child: InputCadastro(
                  label: "Email",
                  hint: "exemplo@dominio.com",
                  senha: false,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
                child: InputCadastro(
                  label: "CPF",
                  hint: "Apenas os números",
                  senha: false,
                  tipodeteclado: TextInputType.number,
                  numeromaximo: 11,
                  controlador: cpfcontrolador,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
                child: InputCadastro(
                  label: "Telefone",
                  hint: "(81)99999-9999",
                  senha: false,
                  numeromaximo: 11,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
                child: InputCadastro(
                  label: "Senha",
                  hint: "No mínimo 8 dígitos",
                  senha: true,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
                child: InputCadastro(
                  label: "Confirmar senha",
                  hint: "Confirme sua senha",
                  senha: true,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 26, right: 14, left: 14),
                child: ButtonPadrao(
                    text: "Finalizar",
                    press: () {
                      final isValid = formKey.currentState.validate();

                      //
                      //
                      //
                      //Navigator.of(context).push(
                      //MaterialPageRoute(
                      // builder: (context) => LoginPac(),
                      //  ),
                      // );
                      //
                      //
                      //
                    }),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
