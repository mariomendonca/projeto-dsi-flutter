import 'package:cmedapp/authentication.dart';
import 'package:cmedapp/components/appbar_with_logo.dart';
import 'package:cmedapp/components/button_padrao.dart';
import 'package:cmedapp/components/input.dart';

import 'package:cmedapp/src/CadastroPac/controller.dart';
import 'package:cmedapp/src/CadastroPac/model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'controller.dart';

class CadastroPac extends StatefulWidget {
  @override
  CadastroPacState createState() => CadastroPacState();
}

class CadastroPacState extends State<CadastroPac> {
  final _firebase = FirebaseAuth.instance;
  GlobalKey<FormState> _formKey = new GlobalKey();
  final TextEditingController controllerNome = TextEditingController();
  final TextEditingController controllerSobrenome = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerSenha = TextEditingController();
  final TextEditingController controllerCell = TextEditingController();
  final TextEditingController controllerCpf = TextEditingController();
  final TextEditingController controllerConfirmPass = TextEditingController();
  bool validateAndSave() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      return true;
    } else {
      return false;
    }
  }

  void registerUser() {
    Pacientes(
      controllerNome.text.trim(),
      controllerSobrenome.text.trim(),
      controllerCell.text,
      controllerCpf.text,
      controllerSenha.text,
      controllerEmail.text.trim(),
    ).addInfo(controllerEmail.text);
    addUser(controllerEmail.text.trim(), controllerSenha.text);
  }

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
        key: _formKey,
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
                child: Input(
                  label: "Nome",
                  hint: "Digite seu nome",
                  senha: false,
                  validador: validarnome,
                  controlador: controllerNome,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
                child: Input(
                  label: "Sobrenome",
                  hint: "Digite seu nome",
                  senha: false,
                  validador: validarsobrenome,
                  controlador: controllerSobrenome,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
                child: Input(
                  label: "Email",
                  hint: "exemplo@dominio.com",
                  senha: false,
                  validador: validaremail,
                  controlador: controllerEmail,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
                child: Input(
                  label: "CPF",
                  hint: "Apenas os números",
                  senha: false,
                  tipodeteclado: TextInputType.number,
                  numeromaximo: 11,
                  validador: validarcpf,
                  controlador: controllerCpf,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
                child: Input(
                  label: "Telefone",
                  hint: "(81)99999-9999",
                  senha: false,
                  numeromaximo: 11,
                  validador: validarcelular,
                  controlador: controllerCell,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
                child: Input(
                  label: "Senha",
                  hint: "No mínimo 8 dígitos",
                  senha: true,
                  validador: validarsenha,
                  controlador: controllerSenha,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
                child: Input(
                  label: "Confirmar senha",
                  hint: "Confirme sua senha",
                  senha: true,
                  validador: confirmarSenha,
                  controlador: controllerConfirmPass,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 26, right: 14, left: 14),
                child: ButtonPadrao(
                  text: "Finalizar",
                  press: () {
                    validateAndSave();

                    if (validateAndSave()) {
                      registerUser();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/login', (Route<dynamic> route) => false);
                    }

                    // final isValid = formKey.currentState.validate();
                  },
                ),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
