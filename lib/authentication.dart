import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;

addUser(email, password) {
  auth
      .createUserWithEmailAndPassword(email: email, password: password)
      .then((firebaseUser) {
    print('Novo usuario! Email: ' + firebaseUser.user.email);
  }).catchError((erro) {
    print("Novo usuário: erro" + erro.toString());
  });
}

signIn(email, password) {
  auth
      .signInWithEmailAndPassword(email: email, password: password)
      .then((firebaseUser) {
    return print("Logged in");
  }).catchError((erro) {
    print("Não logou");
  });
}
