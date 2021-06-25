import 'package:cmedapp/src/CadastroMed/model.dart';
import 'package:flutter/material.dart';

var confirmp;

String validarcpf(String value) {
  if (value.isEmpty) {
    return "Esse campo não pode estar vazio";
  } else if (value.length != 11) {
    return "Preencha os 11 digitos do seu Cpf";
  } else {
    return null;
  }
}

String confirmarSenha(value) {
  if (value.isEmpty) {
    return "Este campo não pode estar vazio. *";
  } else if (value != confirmp) {
    return "As senhas devem ser iguais! *";
  }
  return null;
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
    confirmp = value;
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
