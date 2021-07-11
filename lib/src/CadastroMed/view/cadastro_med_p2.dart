import 'package:cmedapp/components/appbar_with_logo.dart';
import 'package:cmedapp/components/button_padrao.dart';
import 'package:cmedapp/components/input.dart';
import 'package:cmedapp/src/CadastroMed/model.dart';
import 'package:flutter/material.dart';
import 'package:weekday_selector/weekday_selector.dart';
import 'package:cmedapp/src/CadastroMed/controller.dart';

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
  final TextEditingController controllerEndereco = TextEditingController();
  final TextEditingController controllerNumero = TextEditingController();
  final TextEditingController controllerInicioExpediente =
      TextEditingController();
  final TextEditingController controllerFimExpediente = TextEditingController();
  final TextEditingController controllerDescricao = TextEditingController();
  final values = List.filled(7, false);

  @override
  Widget build(BuildContext context) {
    void registrarUser() {
      Medicos(
        widget.nome,
        widget.sobrenome,
        widget.telefone,
        widget.cpf,
        widget.especialidade,
        widget.senha,
        widget.email,
        controllerEndereco.text,
        controllerNumero.text,
        controllerInicioExpediente.text,
        controllerFimExpediente.text,
        controllerDescricao.text,
        values
      ).addInfo(widget.email, );
    }

    bool validate() {
      if (_formKeyMed2.currentState.validate()) {
        return true;
      } else {
        return false;
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
                          values: values,
                          // firstDayOfWeek: values[0],
                          shortWeekdays: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'],
                          onChanged: (i) {
                            print(i);
                            setState(() {
                              values[i % 7] = !values[i % 7];
                            });
                          },
                          selectedFillColor: Colors.indigo[900],
                          disabledFillColor: Colors.cyanAccent,
                          fillColor: Colors.tealAccent[700],
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
                                print(widget.nome +
                                    widget.sobrenome +
                                    widget.cpf +
                                    widget.especialidade +
                                    widget.telefone +
                                    widget.senha);
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
