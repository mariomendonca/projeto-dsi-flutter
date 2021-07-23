import 'package:cloud_firestore/cloud_firestore.dart';

var _db = FirebaseFirestore.instance;

class Favorite {
  String nome;
  String sobrenome;
  String url;
  String especialidade;
  String email;

  Favorite(
    this.nome,
    this.sobrenome,
    this.url,
    this.especialidade,
    this.email,
  );

  Map<String, dynamic> toMap() {
    return {
      "nome": nome,
      "sobrenome": sobrenome,
      "url": url,
      "especialidade": especialidade,
      "email": email
    };
  }

  addFavorite(user, idDoctor) {
    var medico = Favorite(nome, sobrenome, url, especialidade, email);
    _db
        .collection("pacientes")
        .doc(user)
        .collection("favoritos")
        .doc(idDoctor)
        .set(medico.toMap());
  }

  removeFavorite(user, idDoctor) {
    _db
        .collection("pacientes")
        .doc(user)
        .collection("favoritos")
        .doc(idDoctor)
        .delete();
  }
}
