import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:content_riverpod/controllers/user_controller/user_controller.dart';
import 'package:content_riverpod/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  Future<UserModel> currentUserData(String uid) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _db.collection("users").doc(uid).get();
      return UserModel.fromDocumentSnapshot(snapshot);
    } on FirebaseException catch (e) {
      throw FirebaseException(
          plugin: e.plugin, code: e.code, message: e.message);
    }
  }

  Future<String> getProfilePicture(String imageName) async {
    String downloadUrl = await _storage
        .ref()
        .child('photoProfile')
        .child(imageName)
        .getDownloadURL();

    return downloadUrl;
  }
}

final userControllerProvider =
    StateNotifierProvider<UserController, UserState>((ref) {
  return UserController(ref);
});
