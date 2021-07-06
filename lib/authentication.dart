import 'package:firebase_auth/firebase_auth.dart';
String error;
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
    auth.signInWithEmailAndPassword(email: email, password: password);
    print('entrou');
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        error = "Este e-mail já cadastrado.";
        break;
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        error = "Dados Inválidos, tente novamente.";

        break;
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        error = "Nenhum usuário foi encontrado com este endereço de e-mail.";

        break;
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        error = "Usuário desativado.";

        break;
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        error = "Foram realizadas muitas requisições para acessar esta conta.";

        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
      case "operation-not-allowed":
        error = "Erro de servidor, tente novamente mais tarde.";

        break;
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        error = "E-mail inválido.";

        break;
      default:
        error = "O login falhou, tente novamente.";
        break;
    }
  }
  if (error != null) {
    return Future.error(error);
  } else {
    return null;
  }
}
