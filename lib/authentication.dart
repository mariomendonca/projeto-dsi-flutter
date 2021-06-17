import 'package:firebase_auth/firebase_auth.dart';

addUser(email, password) {
  FirebaseAuth auth = FirebaseAuth.instance;
  auth
      .createUserWithEmailAndPassword(email: email, password: password)
      .then((firebaseUser) {
    print('Novo usuario! Email: ' + firebaseUser.user.email);
  }).catchError((erro) {
    print("Novo usuário: erro" + erro.toString());
  });
}
