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
  GlobalKey<FormState> formKey = new GlobalKey();

  final TextEditingController cpfcontrolador = TextEditingController();

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

    String validarcelular(String value) {
      if (value.isEmpty) {
        return "Esse campo não pode estar vazio";
      } else if (value.length < 10) {
        return "Preencha os 11 digitos do seu telefone";
      } else {
        return null;
      }
    }

    String validaremail(String value) {
      if (value.isEmpty) {
        return "Esse campo não pode estar vazio";
      } else if (!(value.contains('@') && value.contains('.com'))) {
        return "Digite um email válido ";
      } else {
        return null;
      }
    }

    String validarsenha(String value) {
      if (value.isEmpty) {
        return "Esse campo não pode estar vazio";
      } else if (value.length < 8) {
        return "A senha deve conter no minimo 8 digitos";
      } else {
        return null;
      }
    }

    String validarnome(String value) {
      if (value.isEmpty) {
        return "Esse campo não pode estar vazio";
      } else if (value.length < 2) {
        return "Insira um nome valido";
      } else {
        return null;
      }
    }

    String validarsobrenome(String value) {
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
                  validador: validarnome,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
                child: InputCadastro(
                  label: "Sobrenome",
                  hint: "Digite seu nome",
                  senha: false,
                  validador: validarsobrenome,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
                child: InputCadastro(
                  label: "Email",
                  hint: "exemplo@dominio.com",
                  senha: false,
                  validador: validaremail,
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
                  validador: validarcpf,
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
                  validador: validarcelular,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
                child: InputCadastro(
                  label: "Senha",
                  hint: "No mínimo 8 dígitos",
                  senha: true,
                  validador: validarsenha,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
                child: InputCadastro(
                  label: "Confirmar senha",
                  hint: "Confirme sua senha",
                  senha: true,
                  validador: validarsenha,
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
