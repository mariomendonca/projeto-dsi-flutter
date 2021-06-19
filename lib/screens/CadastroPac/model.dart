import 'package:cloud_firestore/cloud_firestore.dart';

var _db = FirebaseFirestore.instance;

class Pacientes {
  String nome;
  String sobrenome;
  String telefone;
  String cpf;
  String senha;
  String email;

  Pacientes(this.nome, this.sobrenome, this.telefone, this.cpf, this.email,
      this.senha);

  Map<String, dynamic> toMap() {
    return {
      "nome": nome,
      "sobrenome": sobrenome,
      "telefone": telefone,
      "cpf": cpf,
      "senha": senha,
      "email": email,
    };
  }

  addInfo(email) {
    var paciente = Pacientes(
      nome,
      sobrenome,
      telefone,
      cpf,
      senha,
      email,
    );
    _db.collection("pacientes").doc(email).set(paciente.toMap());
  }
}
