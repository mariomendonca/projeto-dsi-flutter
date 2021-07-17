import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';

Future uploadImage(email, image) async {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  TaskSnapshot snapshot =
      await storage.ref().child("medicos").child(email).putFile(image);
  if (snapshot.state == TaskState.success) {
    final String downloadUrl = await snapshot.ref.getDownloadURL();
    await FirebaseFirestore.instance
        .collection("medicos")
        .doc(email)
        .update({"url": downloadUrl});
  }
}
