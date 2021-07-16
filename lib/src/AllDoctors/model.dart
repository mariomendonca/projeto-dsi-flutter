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
// class Medicos {
//   String nome;
//   String sobrenome;
//   String telefone;
//   String cpf;
//   String especialidade;
//   String senha;
//   String email;
//   String endereco;
//   String numero;
//   String inicioExpediente;
//   String fimExpediente;
//   String descricao;
//   String url;
//   List dias;

//   Medicos(
//       this.nome,
//       this.sobrenome,
//       this.telefone,
//       this.cpf,
//       this.especialidade,
//       this.senha,
//       this.email,
//       this.endereco,
//       this.numero,
//       this.inicioExpediente,
//       this.fimExpediente,
//       this.descricao,
//       this.url,
//       this.dias);

//   Map<String, dynamic> diastoMap() {
//     return {
//       "dom": dias[0],
//       "seg": dias[1],
//       "ter": dias[2],
//       "qua": dias[3],
//       "qui": dias[4],
//       "sex": dias[5],
//       "sab": dias[6],
//     };
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       "nome": nome,
//       "sobrenome": sobrenome,
//       "telefone": telefone,
//       "cpf": cpf,
//       "especialidade": especialidade, //desc
//       "senha": senha,
//       "email": email, // especialidade
//       "endereco": endereco,
//       "numero": numero, //fimExpediente
//       "inicioExpediente": inicioExpediente,
//       "fimExpediente": fimExpediente, //numero
//       "url": '',
//       "descricao": descricao, //email
//     };
//   }

//   addInfo(email) {
//     print(listHoras);
//     print(_horas);
//     var medico = Medicos(
//         nome,
//         sobrenome,
//         telefone,
//         cpf,
//         especialidade,
//         senha,
//         email,
//         endereco,
//         numero,
//         inicioExpediente,
//         fimExpediente,
//         descricao,
//         url,
//         dias);
//     print(medico.toMap());
//     _db.collection("medicos").doc(email).set(medico.toMap());

//     _db
//         .collection("medicos")
//         .doc(email)
//         .collection("diasdeconsulta")
//         .doc("dias")
//         .set(diastoMap());
//   }
// }
