import 'package:flutter/material.dart';

class InputCadastro extends StatelessWidget {
  String validarcpf(cpfcontrolador) {
    if (cpfcontrolador.lenght < 10) {
      return "Preencha os 11 digitos do seu Cpf";
    } else {
      return null;
    }
  }

  const InputCadastro({
    Key key,
    this.tipodeteclado,
    this.controlador,
    this.mensagemErro,
    this.label,
    this.hint,
    this.senha,
    this.validador,
    this.numeromaximo,
  }) : super(key: key);
  final String label;
  final String hint;
  final bool senha;
  final TextInputType tipodeteclado;
  final Function validador;
  final int numeromaximo;
  final String mensagemErro;
  final controlador;

  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.tealAccent[700]),
      keyboardType: tipodeteclado,
      obscureText: senha,
      controller: controlador,
      autofocus: false,
      validator: validador,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        labelText: label,
        hintText: hint,
      ),
      maxLength: numeromaximo,
    );
  }
}
