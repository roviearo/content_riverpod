import 'package:content_riverpod/state/auth/models/auth_result.dart';
import 'package:content_riverpod/state/auth/models/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authenticator {
  Authenticator();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool get isAlreadyLoggedIn => userId != null;
  UserId? get userId => FirebaseAuth.instance.currentUser?.uid;

  Future<void> logOut() async {
    await _auth.signOut();
  }

  Future<AuthResult> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return AuthResult.success;
    } catch (e) {
      return AuthResult.failure;
    }
  }
}
