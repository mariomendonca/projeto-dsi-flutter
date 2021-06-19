import 'package:cloud_firestore/cloud_firestore.dart';

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
      "especialidade": especialidade,
      "senha": senha,
      "email": email,
      "endereco": endereco,
      "numero": numero,
      "inicioExpediente": inicioExpediente,
      "fimExpediente": fimExpediente,
      "descricao": descricao,
    };
  }

  addInfo(email) {
    var medico = Medicos(nome, sobrenome, telefone, cpf, especialidade, senha,
        email, endereco, numero, inicioExpediente, fimExpediente, descricao);
    _db.collection("medicos").doc(email).set(medico.toMap());
  }
}
