import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:localstorage/localstorage.dart';

final LocalStorage storage = LocalStorage('localstorage_app');

void addUserToLocalStorage() async {
  //To do : pegar os dados do usuario do firebase
  CollectionReference user = FirebaseFirestore.instance.collection('pacientes');
  DocumentSnapshot<Object> snapshot =
      await user.doc(FirebaseAuth.instance.currentUser.email).get();
  if (snapshot != null) {
    Map<String, dynamic> data = snapshot.data();
    storage.setItem('user', data);
  }
}

String getUserToLocalStorage(String item) {
  Map<String, dynamic> info = storage.getItem("user");
  var dado = info[item];
  return dado;
}
