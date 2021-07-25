import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmedapp/src/HomeHospital/widgets/card_hospital.dart';
import 'package:flutter/material.dart';
import 'package:strings/strings.dart';

class ScrollHosp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
        width: size.width * 0.8,
        height: size.height * 0.6,
        child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection("hospitais").snapshots(),
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
                    Map<dynamic, dynamic> hosp =
                        snapshot.data.docs[index].data();
                    return CardHosp(
                      nome: hosp["nome"].toString(),
                      endereco: hosp["endereco"].toString(),
                      complemento: hosp["complemento"].toString(),
                      telefone: hosp["telefone"].toString(),
                      url: hosp["url"].toString(),
                    );
                  });
            }));
  }
}
