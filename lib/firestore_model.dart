import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'globals.dart' as globals;

addUserToLocalStorage() async {
  CollectionReference user = FirebaseFirestore.instance.collection('pacientes');
  DocumentSnapshot<Object> snapshot =
      await user.doc(FirebaseAuth.instance.currentUser.email).get();
  if (snapshot != null) {
    Map<String, dynamic> data = snapshot.data();
    globals.user = data;
    globals.nome = await data['nome'];
    globals.sobrenome = await data['sobrenome'];
  }
}
