import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

var _db = FirebaseFirestore.instance;

class Clinica {
  String nome;
  String endereco;
  String complemento;
  String especialidades;
  String cnpj;
  String telefone;
  String senha;
  String email;
  String url;

  Clinica(this.nome, this.endereco, this.complemento, this.especialidades,
      this.cnpj, this.telefone, this.senha, this.email, this.url);

  Map<String, dynamic> toMap() {
    return {
      "nome": nome,
      "endereco": endereco,
      "complemento": complemento,
      "especialidades": especialidades,
      "cnpj": cnpj,
      "telefone": telefone,
      "senha": senha,
      "email": email,
      "url": " ",
    };
  }

  addInfo(email) {
    var clinica = Clinica(nome, endereco, complemento, especialidades, cnpj,
        telefone, senha, email, url);
    _db.collection("clinicas").doc(email).set(clinica.toMap());
  }
}
