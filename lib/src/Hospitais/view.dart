import 'dart:io';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:cmedapp/src/CadastroMed/view/cadastro_med_p1.dart';
import 'package:cmedapp/src/Hospitais/model.dart';
import 'package:cmedapp/src/utils/authentication_service.dart';

import 'package:cmedapp/src/CadastroPac/controller.dart';
import 'package:cmedapp/src/utils/storage.dart';
import 'package:cmedapp/src/widgets/appbar_with_logo.dart';
import 'package:cmedapp/src/widgets/button_padrao.dart';
import 'package:cmedapp/src/widgets/input.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'controller.dart';

class CadastroHosp extends StatefulWidget {
  @override
  CadastroHospState createState() => CadastroHospState();
}

class CadastroHospState extends State<CadastroHosp> {
  GlobalKey<FormState> _formKey = new GlobalKey();
  final TextEditingController controllerNomeHosp = TextEditingController();
  final TextEditingController controllerEndereco = TextEditingController();
  final TextEditingController controllerComplemento = TextEditingController();
  final TextEditingController controllerCnpj = TextEditingController();
  final TextEditingController controllerCellHosp = TextEditingController();
  final TextEditingController controllerEmailHosp = TextEditingController();
  final TextEditingController controllerConfirmarSenhaHosp =
      TextEditingController();
  bool validateAndSave() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      return true;
    } else {
      return false;
    }
  }

  void _registerUser() {
    var user = AuthenticationService();
    Hospital(
      controllerNomeHosp.text.trim(),
      controllerEndereco.text.trim(),
      controllerComplemento.text.trim(),
      controllerCnpj.text.trim(),
      controllerCellHosp.text.trim(),
      controllerConfirmarSenhaHosp.text.trim(),
      controllerEmailHosp.text.trim(),
      "",
    ).addInfo(
      controllerEmailHosp.text.trim(),
    );

    user.signUp(
        email: controllerEmailHosp.text.trim(),
        password: controllerConfirmarSenhaHosp.text.trim());
  }

  File _image;

  @override
  Future getImage() async {
    final PickedFile pickedFile =
        await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

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
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: _image != null
                            ? FileImage(_image)
                            : AssetImage('assets/images/medico-home.png'),
                        backgroundColor: Colors.white,
                      ),
                      Positioned(
                          bottom: 5,
                          right: 5,
                          child: IconButton(
                            icon: Icon(Icons.camera_alt_sharp),
                            onPressed: getImage,
                          )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
                child: Input(
                  label: "Nome do Hospital",
                  hint: "Digite o nome do Hospital",
                  senha: false,
                  validador: validarnome,
                  controlador: controllerNomeHosp,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
                child: Input(
                  label: "Endereço",
                  hint: "Digite o endereço do Hospital",
                  senha: false,
                  validador: validarsobrenome,
                  controlador: controllerEndereco,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
                child: Input(
                  label: "Complemento",
                  hint: "Ex: prox a praça chora menino",
                  senha: false,
                  validador: validarComplemento,
                  controlador: controllerComplemento,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
                child: Input(
                  mascara: [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter(),
                  ],
                  label: "Telefone",
                  hint: "(81)99999-9999",
                  senha: false,
                  validador: validarcelularHosp,
                  controlador: controllerCellHosp,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
                child: Input(
                  mascara: [
                    FilteringTextInputFormatter.digitsOnly,
                    CnpjInputFormatter()
                  ],
                  label: "CNPJ",
                  hint: "Numeros de um CNPJ",
                  senha: false,
                  tipodeteclado: TextInputType.number,
                  validador: validarcnpj,
                  controlador: controllerCnpj,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
                child: Input(
                  label: "Email",
                  hint: "Email usado pelo admin",
                  senha: false,
                  validador: validaremailHosp,
                  controlador: controllerEmailHosp,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
                child: Input(
                  label: "Senha",
                  hint: "No mínimo 8 dígitos",
                  senha: true,
                  validador: validarsenhaHosp,
                  controlador: controllerConfirmarSenhaHosp,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 22, right: 14, left: 14),
                child: Input(
                  label: "Confirmar senha",
                  hint: "Confirme sua senha",
                  senha: true,
                  validador: confirmarSenhaHosp,
                  controlador: controllerConfirmarSenhaHosp,
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
                      _registerUser();
                      uploadImageHosp(controllerEmailHosp.text, _image);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/homePage', (Route<dynamic> route) => false);
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
