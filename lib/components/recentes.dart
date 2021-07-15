import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmedapp/globals.dart';
import 'package:cmedapp/src/PerfilMed/perfil_med.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'icone.dart';

class Recentes extends StatefulWidget {
  @override
  _RecentesState createState() => _RecentesState();
}

class _RecentesState extends State<Recentes> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 15),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("pacientes")
              .doc(FirebaseAuth.instance.currentUser.email)
              .collection("consultas")
              .snapshots(),
          builder: (context, snapshots) {
            if (snapshots.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SizedBox(
                width: double.infinity,
                height: 65,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshots.data.size,
                    itemBuilder: (context, snapshot) {
                      Map<dynamic, dynamic> info =
                          snapshots.data.docs[snapshot].data();
                      if (!snapshots.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Container(
                            child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: CardRecentes(info['url'], info["id"]),
                        ));
                      }
                    }),
              );
            }
          },
        ));
  }
}

// ignore: must_be_immutable
class CardRecentes extends StatelessWidget {
  String url;
  final id;
  CardRecentes(this.url, this.id);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => PerfilMed(documentId: id,)));
      },
      child: Container(
        width: 50,
        height: 5,
        child: Text(''),
        decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(url),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(0, 191, 186, 1)),
        
      ),
    );
  }
}
