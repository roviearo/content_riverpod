import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:content_riverpod/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  // Stream<User?> get authStateChange => _auth.idTokenChanges();
  Stream<UserModel> get user {
    return _auth.authStateChanges().map((firebaseUser) {
      return firebaseUser == null
          ? UserModel.empty
          : UserModel(
              uid: firebaseUser.uid,
              email: firebaseUser.email,
              displayName: firebaseUser.displayName,
            );
    });
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('User not found');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Wrong password');
      } else {
        throw AuthException('An error occured. Please try again later');
      }
    }
  }

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

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

class AuthException implements Exception {
  final String message;

  AuthException(this.message);

  @override
  String toString() {
    return message;
  }
}
