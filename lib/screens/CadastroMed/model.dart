import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmedapp/authentication.dart';
import 'package:cmedapp/screens/CadastroPac/model.dart';

import 'controller.dart';

var _db = FirebaseFirestore.instance;

class Medicos {
  String nome;
  String sobrenome;
  String telefone;
  String cpf;
  String especialidade;
  String senha;
  String email;
  String endereco;
  String numero;
  String inicioExpediente;
  String fimExpediente;
  String descricao;

  Medicos(
      this.nome,
      this.sobrenome,
      this.telefone,
      this.cpf,
      this.email,
      this.senha,
      this.descricao,
      this.endereco,
      this.fimExpediente,
      this.inicioExpediente,
      this.numero,
      this.especialidade);

  Map<String, dynamic> toMap() {
    return {
      "nome": nome,
      "sobrenome": sobrenome,
      "telefone": telefone,
      "cpf": cpf,
      "especialidade": descricao, //descricao
      "senha": senha,
      "email": especialidade, // especialidade
      "endereco": endereco,
      "numero": fimExpediente, //fimExpediente
      "inicioExpediente": inicioExpediente,
      "fimExpediente": numero, //numero
      "descricao": email, //email
    };
  }

  addInfo(email) {
    var medico = Medicos(nome, sobrenome, telefone, cpf, especialidade, senha,
        email, endereco, numero, inicioExpediente, fimExpediente, descricao);
    print(medico.toMap());
    _db.collection("medicos").doc(email).set(medico.toMap());
  }
}

var confirmp;

void registerUser() {
      Pacientes(
              controllerNome.text.trim(),
              controllerSobrenome.text.trim(),
              controllerCell.text,
              controllerCpf.text,
              controllerEmail.text.trim(),
              controllerSenha.text)
          .addInfo(controllerCpf.text);
      addUser(controllerEmail.text.trim(), controllerSenha.text);
    }

bool validateAndSave() {
      var formKey;
      if (formKey.currentState.validate()) {
        formKey.currentState.save();
        return true;
      } else {
        return false;
      }
    }

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
