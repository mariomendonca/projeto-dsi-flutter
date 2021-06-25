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

Future<void> signIn(email, password) async {
  try {
    // ignore: unused_local_variable
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return 'entrou';
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return 'não existe';
    } else if (e.code == 'wrong-password') {
      return 'senha errada';
    }
  }
}
