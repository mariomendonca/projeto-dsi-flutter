
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

Future uploadImage(email, image) async {
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  

  firebase_storage.Reference pastaRaiz = storage.ref();
  firebase_storage.Reference arquivo = pastaRaiz
    .child("medicos")
    .child(email + "jpg");

  arquivo.putFile(image);
}
    // .child(email + "jpg");
  // FirebaseStorage arquivo = pastaRaiz
  //   .child("medicos")
  //   // .child(email + "jpg");
  //   .child(email);