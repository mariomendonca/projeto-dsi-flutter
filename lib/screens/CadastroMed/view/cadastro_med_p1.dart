import 'package:cmedapp/components/appbar_with_logo.dart';
import 'package:cmedapp/components/button_padrao.dart';
import 'package:cmedapp/components/input.dart';
import 'package:cmedapp/screens/CadastroMed/controller.dart';
import 'package:flutter/material.dart';
import 'cadastro_med_p2.dart';

class CadastroMed extends StatefulWidget {
  @override
  CadastroMedState createState() => CadastroMedState();
}

class CadastroMedState extends State<CadastroMed> {
  GlobalKey<FormState> _formKeyMed = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    var confirmp;

    bool validateAndPass() {
      if (_formKeyMed.currentState.validate()) {
        _formKeyMed.currentState.save();
        return true;
      } else {
        return false;
      }
    }

    String confirmarSenha(value) {
      if (value.isEmpty) {
        return "Este campo não pode estar vazio. *";
      } else if (value != confirmp) {
        return "As senhas devem ser iguais! *";
      }
      return null;
    }

    String validarCpf(String value) {
      if (value.isEmpty) {
        return "Esse campo não pode estar vazio";
      } else if (value.length < 10) {
        return "Preencha os 11 digitos do seu Cpf";
      } else {
        return null;
      }
    }

    String validarCell(String value) {
      if (value.isEmpty) {
        return "Esse campo não pode estar vazio";
      } else if (value.length < 10) {
        return "Preencha os 11 digitos do seu telefone";
      } else {
        return null;
      }
    }

    String validarEmailmed(String value) {
      if (value.isEmpty) {
        return "Esse campo não pode estar vazio";
      } else if (!(value.contains('@') && value.contains('.com'))) {
        return "Digite um email válido ";
      } else {
        return null;
      }
    }

    String validarSenhamed(String value) {
      if (value.isEmpty) {
        return "Esse campo não pode estar vazio";
      } else if (value.length < 8) {
        return "A senha deve conter no minimo 8 digitos";
      } else {
        confirmp = value;
        return null;
      }
    }

    String validarNomemed(String value) {
      if (value.isEmpty) {
        return "Esse campo não pode estar vazio";
      } else if (value.length < 2) {
        return "Insira um nome valido";
      } else {
        return null;
      }
    }

    String validarSobrenomemed(String value) {
      if (value.isEmpty) {
        return "Esse campo não pode estar vazio";
      } else if (value.length < 2) {
        return "Insira um sobrenome valido";
      } else {
        return null;
      }
    }


    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.3),
        child: MyAppBar(),
      ),
      body: Form(
        key: _formKeyMed,
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
          child: ListView(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
              child: Input(
                label: "Nome",
                hint: "Digite seu nome",
                senha: false,
                validador: validarNomemed,
                controlador: controllerNome,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
              child: Input(
                label: "Sobrenome",
                hint: "Digite seu sobrenome",
                senha: false,
                validador: validarSobrenomemed,
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
                validador: validarEmailmed,
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
                validador: validarCpf,
                controlador: controllerCpf,
                numeromaximo: 11,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
              child: Input(
                label: "Especialidade",
                hint: "Digite sua especialidade",
                senha: false,
                controlador: controllerEspecialidade,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
              child: Input(
                label: "Telefone",
                hint: "Digite seu telefone",
                senha: true,
                validador: validarCell,
                controlador: controllerCell,
                numeromaximo: 11,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
              child: Input(
                label: "Senha",
                hint: "No mínimo 8 dígitos",
                senha: true,
                validador: validarSenhamed,
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
                  text: "Avançar",
                  press: () {
                    validateAndPass();
                    if (validateAndPass()) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CadastroMed2(
                              controllerNome.text,
                              controllerSobrenome.text,
                              controllerCell.text,
                              controllerCpf.text,
                              controllerEspecialidade.text,
                              controllerSenha.text,
                              controllerEmail.text),
                        ),
                      );
                    }

                    // final isValid = formKeyMed.currentState.validate();
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}
