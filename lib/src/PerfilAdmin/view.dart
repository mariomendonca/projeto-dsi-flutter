import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmedapp/src/utils/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class PerfilAdmin extends StatefulWidget {
  @override
  _PerfilAdminState createState() => _PerfilAdminState();
}

class _PerfilAdminState extends State<PerfilAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyAdmin(),
    );
  }
}

class BodyAdmin extends StatefulWidget {
  @override
  _BodyAdminState createState() => _BodyAdminState();
}

class _BodyAdminState extends State<BodyAdmin> {
  void removeHospital(email) {
    FirebaseFirestore.instance
        .collection("hospitais")
        .doc(FirebaseAuth.instance.currentUser.email)
        .delete();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: 200,
      height: 200,
    );
  }
}



// child: IconButton(
//         onPressed: () {
//           removeHospital(FirebaseAuth.instance.currentUser.email);

//           Navigator.of(context).pushNamedAndRemoveUntil(
//               '/homePage', (Route<dynamic> route) => false);
//         },
//         icon: Icon(Icons.delete),
//       ),