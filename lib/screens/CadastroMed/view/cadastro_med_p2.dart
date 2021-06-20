import 'package:cmedapp/authentication.dart';
import 'package:cmedapp/components/appbar_with_logo.dart';
import 'package:cmedapp/components/button_padrao.dart';
import 'package:cmedapp/components/input.dart';
import 'package:cmedapp/screens/CadastroMed/model.dart';
import 'package:flutter/material.dart';
import 'package:weekday_selector/weekday_selector.dart';
import 'package:cmedapp/screens/CadastroMed/controller.dart';

// ignore: must_be_immutable
class CadastroMed2 extends StatefulWidget {
  String nome;
  String sobrenome;
  String telefone;
  String cpf;
  String especialidade;
  String senha;
  String email;

  CadastroMed2(
    this.nome,
    this.sobrenome,
    this.telefone,
    this.cpf,
    this.especialidade,
    this.senha,
    this.email,
  );

  @override
  CadastroMed2State createState() => CadastroMed2State();
}

class CadastroMed2State extends State<CadastroMed2> {
  GlobalKey<FormState> _formKeyMed2 = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    void registrarUser() {
      Medicos(
              widget.nome,
              widget.sobrenome,
              widget.telefone,
              widget.cpf,
              widget.email,
              widget.senha,
              controllerDescricao.text,
              controllerEndereco.text,
              controllerFimExpediente.text,
              controllerInicioExpediente.text,
              controllerNumero.text,
              widget.especialidade)
          .addInfo(widget.email);
      addUser(widget.email, widget.senha);
    }

    bool validate() {
      if (_formKeyMed2.currentState.validate()) {
        return true;
      } else {
        return false;
      }
    }

    String validarend(String value) {
      if (value.isEmpty) {
        return "Esse campo não pode estar vazio";
      } else if (value.length < 2) {
        return "Insira um endereço valido";
      } else {
        return null;
      }
    }

    String validarnum(String value) {
      if (value.isEmpty) {
        return "Esse campo não pode estar vazio";
      } else if (value.length < 2) {
        return "Insira um numero de enreço valido";
      } else {
        return null;
      }
    }

    String validarinicio(String value) {
      if (value.isEmpty) {
        return "Esse campo não pode estar vazio";
      } else if (value.length < 2) {
        return "Insira o horario de inicio do seu expediente";
      } else {
        return null;
      }
    }

    String validarfim(String value) {
      if (value.isEmpty) {
        return "Esse campo não pode estar vazio";
      } else if (value.length < 2) {
        return "Insira o horario final do seu expediente";
      } else {
        return null;
      }
    }

    String validardesc(String value) {
      if (value.isEmpty) {
        return "Esse campo não pode estar vazio";
      } else if (value.length < 2) {
        return "Faça uma breve descrição sobre você";
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
          key: _formKeyMed2,
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
            child: ListView(children: [
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
                        padding:
                            const EdgeInsets.only(top: 10, right: 14, left: 14),
                        child: Input(
                          label: "Endereço",
                          hint: "Rua dos bobos",
                          senha: false,
                          validador: validarend,
                          controlador: controllerEndereco,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 14, left: 14),
                        child: Input(
                          label: "Número",
                          hint: "290",
                          senha: false,
                          validador: validarnum,
                          controlador: controllerNumero,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 14, left: 14),
                        child: WeekdaySelector(
                          onChanged: (v) {},
                          values: [
                            true,
                            true,
                            true,
                            true,
                            true,
                            true,
                            true,
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: size.width * 0.40,
                              child: Input(
                                label: "Início de expediente",
                                hint: "00:00",
                                senha: false,
                                validador: validarinicio,
                                controlador: controllerInicioExpediente,
                              ),
                            ),
                            Container(
                              width: size.width * 0.40,
                              child: Input(
                                label: "Fim de expediente",
                                hint: "00:00",
                                senha: false,
                                validador: validarfim,
                                controlador: controllerFimExpediente,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        //margin: EdgeInsets.only(bottom: 50),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 14, left: 14),
                          child: Input(
                            label: "Descrição",
                            hint: "Conte-nos um pouco sobre você",
                            senha: false,
                            validador: validardesc,
                            controlador: controllerDescricao,
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 14,
                          left: 14,
                        ),
                        child: ButtonPadrao(
                            text: "Finalizar",
                            press: () {
                              validate();
                              if (validate()) {
                                _formKeyMed2.currentState.save();
                                registrarUser();
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/login', (Route<dynamic> route) => false);
                              }
                            }),
                      ),
                      Spacer()
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
