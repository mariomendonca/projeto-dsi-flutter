import 'package:firebase_auth/firebase_auth.dart';

String erro = '';

class AuthenticationService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> signIn({String email, String password}) async {
    String erro2;
    await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((firebaseUser) async {
      erro2 = "LogIn";
    }).catchError((erro) async {
      erro2 = erro.toString();
      switch (erro.toString()) {
        case "[firebase_auth/wrong-password] The password is invalid or the user does not have a password.":
          erro2 = "Dados Inválidos, tente novamente.";

          break;
        case "[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.":
          erro2 = "Nenhum usuário foi encontrado com este endereço de e-mail.";

          break;
        default:
          erro2 = "O login falhou, tente novamente.";
          break;
      }
    });

    return erro2;
  }

  // ignore: missing_return
  Future<String> signUp({String email, String password}) async {
      return await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((firebaseUser) {
        print('Novo usuario! Email: ' + firebaseUser.user.email);
      }).catchError((erro) {
        print("Novo usuário: erro" + erro.toString());
      });
    }
  }

