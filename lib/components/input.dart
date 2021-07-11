import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  const Input({
    Key key,
    this.tipodeteclado,
    this.controlador,
    this.mensagemErro,
    this.label,
    this.hint,
    this.senha,
    this.validador,
    this.numeromaximo,
    this.mascara,
  }) : super(key: key);
  final String label;
  final String hint;
  final bool senha;
  final TextInputType tipodeteclado;
  final Function validador;
  final int numeromaximo;
  final String mensagemErro;
  final controlador;
  final mascara;

  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: mascara,
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
