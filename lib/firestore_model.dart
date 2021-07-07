// import 'dart:html';

// import 'package:cloud_firestore/cloud_firestore.dart';

// class FirestoreModel {
//   String email;
//   String password;

//   FirestoreModel(String trim, {String password});
//   FirebaseFirestore db = FirebaseFirestore.instance;

//   getUser() async {
//     QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
//         .instance
//         .collection('pacientes')
//         .where(email, isEqualTo: this.email)
//         .get();
//     print(querySnapshot.docs.first.data());
//   }
// }
