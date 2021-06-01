import 'package:flutter/material.dart';

class InputCadastro extends StatelessWidget {
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
      validator: (value) {
        if (value.isEmpty) {
          return "O campo não pode estar vazio";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        labelText: label,
        hintText: hint,
      ),
      maxLength: numeromaximo,
    );
  }
}
