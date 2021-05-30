import 'package:flutter/material.dart';

class InputCadastro extends StatelessWidget {
  const InputCadastro({
    Key key,
    this.label,
    this.hint,
    this.senha,
  }) : super(key: key);
  final String label;
  final String hint;
  final bool senha;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.tealAccent[700]),
      keyboardType: TextInputType.emailAddress,
      obscureText: senha,
      autofocus: false,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          labelText: label,
          hintText: hint),
    );
  }
}
