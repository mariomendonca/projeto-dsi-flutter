import 'package:cmedapp/components/AppBarWithLogo.dart';
import 'package:cmedapp/components/button_padrao.dart';
import 'package:cmedapp/screens/CadastroPac/input_cadastro.dart';
import 'package:flutter/material.dart';
import 'cadastro_med_p2.dart';

class CadastroMed extends StatefulWidget {
  @override
  CadastroMedState createState() => CadastroMedState();
}

class CadastroMedState extends State<CadastroMed> {
  GlobalKey<FormState> formKeyMed = new GlobalKey();

  final TextEditingController cpfcontroladormed = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String validarcpf(String value) {
      if (value.isEmpty) {
        return "Esse campo não pode estar vazio";
      } else if (value.length < 10) {
        return "Preencha os 11 digitos do seu Cpf";
      } else {
        return null;
      }
    }

    String validarespec(String value) {
      if (value.isEmpty) {
        return "Esse campo não pode estar vazio";
      } else if (value.length < 10) {
        return "Preencha os 11 digitos do seu telefone";
      } else {
        return null;
      }
    }

    String validaremailmed(String value) {
      if (value.isEmpty) {
        return "Esse campo não pode estar vazio";
      } else if (!(value.contains('@') && value.contains('.com'))) {
        return "Digite um email válido ";
      } else {
        return null;
      }
    }

    String validarsenhamed(String value) {
      if (value.isEmpty) {
        return "Esse campo não pode estar vazio";
      } else if (value.length < 8) {
        return "A senha deve conter no minimo 8 digitos";
      } else {
        return null;
      }
    }

    String validarnomemed(String value) {
      if (value.isEmpty) {
        return "Esse campo não pode estar vazio";
      } else if (value.length < 2) {
        return "Insira um nome valido";
      } else {
        return null;
      }
    }

    String validarsobrenomemed(String value) {
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
        key: formKeyMed,
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
              child: InputCadastro(
                label: "Nome",
                hint: "Digite seu nome",
                senha: false,
                validador: validarnomemed,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
              child: InputCadastro(
                label: "Sobrenome",
                hint: "Digite seu sobrenome",
                senha: false,
                validador: validarsobrenomemed,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
              child: InputCadastro(
                label: "Email",
                hint: "exemplo@dominio.com",
                senha: false,
                validador: validaremailmed,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
              child: InputCadastro(
                label: "CPF",
                hint: "Apenas os números",
                senha: false,
                validador: validarcpf,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
              child: InputCadastro(
                label: "Especialidade",
                hint: "Digite sua especialidade",
                senha: false,
                validador: validarespec,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
              child: InputCadastro(
                label: "Senha",
                hint: "No mínimo 8 dígitos",
                senha: true,
                validador: validarsenhamed,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
              child: InputCadastro(
                label: "Confirmar senha",
                hint: "Confirme sua senha",
                senha: true,
                validador: validarsenhamed,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 26, right: 14, left: 14),
              child: ButtonPadrao(
                  text: "Avançar",
                  press: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CadastroMed2(),
                        //final isValid = formKeyMed.currentState.validate();
                      ),
                    );
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}
