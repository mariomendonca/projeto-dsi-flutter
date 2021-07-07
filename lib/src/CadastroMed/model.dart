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
      this.especialidade,
      this.senha,
      this.email,
      this.endereco,
      this.numero,
      this.inicioExpediente,
      this.fimExpediente,
      this.descricao);

  Map<String, dynamic> toMap() {
    return {
      "nome": nome,
      "sobrenome": sobrenome,
      "telefone": telefone,
      "cpf": cpf,
      "especialidade": especialidade, //desc
      "senha": senha,
      "email": email, // especialidade
      "endereco": endereco,
      "numero": numero, //fimExpediente
      "inicioExpediente": inicioExpediente,
      "fimExpediente": fimExpediente, //numero
      "descricao": descricao, //email
    };
  }

  addInfo(email) {
    var medico = Medicos(nome, sobrenome, telefone, cpf, especialidade, senha,
        email, endereco, numero, inicioExpediente, fimExpediente, descricao);
    print(medico.toMap());
    _db.collection("medicos").doc(email).set(medico.toMap());
  }
}
