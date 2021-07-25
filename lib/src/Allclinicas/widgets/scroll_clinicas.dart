import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:strings/strings.dart';

import 'card_clinica.dart';

class ScrollClinica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
        width: size.width * 0.8,
        height: size.height * 0.6,
        child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection("clinicas").snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.data.docs.length == 0) {
                return Center(
                    child: Text(
                  'Nenhum hspital encontrado',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ));
              }
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map<dynamic, dynamic> clinica =
                        snapshot.data.docs[index].data();
                    return CardClinica(
                      nome: clinica["nome"].toString(),
                      endereco: clinica["endereco"].toString(),
                      especialidades: clinica["especialidades"].toString(),
                      telefone: clinica["telefone"].toString(),
                      url: clinica["url"].toString(),
                    );
                  });
            }));
  }
}
