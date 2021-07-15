import 'package:cloud_firestore/cloud_firestore.dart';

var _db = FirebaseFirestore.instance.collection("pacientes");

class MarcarConsulta {
  String dia;
  String nomeMed;
  String sobrenomeMed;
  String especialidade;
  String idMed;
  String inicioExpediente;
  String fimExpediente;
  String url;
  MarcarConsulta(this.dia, this.nomeMed, this.sobrenomeMed, this.especialidade,
      this.idMed, this.inicioExpediente, this.fimExpediente, this.url);

  Map<String, dynamic> toMap() {
    return {
      "dia": dia,
      "nome": nomeMed,
      "sobrenome": sobrenomeMed,
      "especialidade": especialidade,
      "idMed": idMed,
      "inicioExpediente": inicioExpediente,
      "fimExpediente": fimExpediente ,//desc
      "url" :url
    };
  }

  addConsulta(email) {
    var consulta = MarcarConsulta(dia, nomeMed, sobrenomeMed, especialidade,
        idMed, inicioExpediente, fimExpediente,url);
    _db.doc(email).collection("consultas").add(consulta.toMap());
  }
}
