import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:content_riverpod/state/auth/models/auth_state.dart';

class UserInfoStorage {
  const UserInfoStorage();

  Future<bool> saveUserInfo({
    required UserId userId,
    required String displayName,
    required String? email,
    String? photoUrl,
  }) async {
    try {
      final userInfo = await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .get();

      if (userInfo.data()!.isNotEmpty) {
        await userInfo.data()!.update();
      }
    } catch (e) {}
  }
}
