import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

var _db = FirebaseFirestore.instance;

class Hospital {
  String nome;
  String endereco;
  String complemento;
  String cnpj;
  String telefone;
  String senha;
  String email;
  String url;

  Hospital(this.nome, this.endereco, this.complemento, this.cnpj, this.telefone,
      this.senha, this.email, this.url);

  Map<String, dynamic> toMap() {
    return {
      "nome": nome,
      "endereco": endereco,
      "complemento": complemento,
      "cnpj": cnpj,
      "telefone": telefone,
      "senha": senha,
      "email": email,
      "url": " ",
    };
  }

  addInfo(email) {
    var hospital = Hospital(
        nome, endereco, complemento, cnpj, telefone, senha, email, url);
    _db.collection("hospitais").doc(email).set(hospital.toMap());
  }
}
