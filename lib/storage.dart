// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class FirestoreService {
//   get(String collectionName, String field, resultfield) async {
//     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//         .collection(collectionName)
//         .where(field, isEqualTo: resultfield)
//         .get();
//     List result = [];
//     querySnapshot.docs.forEach((doc) {
//       print(result);
//       result.add(doc.data());
//     });
//     return result;
//   }
// }
