import 'package:cmedapp/components/AppBarWithLogo.dart';
import 'package:cmedapp/components/button_padrao.dart';
import 'package:cmedapp/screens/CadastroPac/input_cadastro.dart';

import 'package:flutter/material.dart';
import 'package:weekday_selector/weekday_selector.dart';

import '../LoginPaciente.dart';

class CadastroMed2 extends StatefulWidget {
  @override
  CadastroMed2State createState() => CadastroMed2State();
}

class CadastroMed2State extends State<CadastroMed2> {
  GlobalKey<FormState> formKeyMed2 = new GlobalKey();
  int lastTapped;
  final values = List.filled(7, false);

  final TextEditingController cpfcontroladormed2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          key: formKeyMed2,
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
                        child: InputCadastro(
                          label: "Endereço",
                          hint: "Rua dos bobos",
                          senha: false,
                          validador: validarend,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 14, left: 14),
                        child: InputCadastro(
                          label: "Número",
                          hint: "290",
                          senha: false,
                          validador: validarnum,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 14, left: 14),
                        child: WeekdaySelector(
                          values: values,
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
                              child: InputCadastro(
                                label: "Início de expediente",
                                hint: "00:00",
                                senha: false,
                                validador: validarinicio,
                              ),
                            ),
                            Container(
                              width: size.width * 0.40,
                              child: InputCadastro(
                                label: "Fim de expediente",
                                hint: "00:00",
                                senha: false,
                                validador: validarfim,
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
                          child: InputCadastro(
                            label: "Descrição",
                            hint: "Conte-nos um pouco sobre você",
                            senha: false,
                            validador: validardesc,
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 14,
                          left: 14,
                        ),
                        child: ButtonPadrao(text: "Finalizar", press: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoginPac()));
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
