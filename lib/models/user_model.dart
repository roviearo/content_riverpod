import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String? email;
  final String? displayName;
  final String? photoUrl;

  const UserModel({
    required this.uid,
    this.email,
    this.displayName,
    this.photoUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
    };
  }

  static const empty = UserModel(uid: '');

  bool get isEmpty => this == UserModel.empty;

  UserModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot)
      : uid = documentSnapshot.id,
        email = documentSnapshot.data()!["email"],
        displayName = documentSnapshot.data()!["displayName"],
        photoUrl = documentSnapshot.data()!["email"];

  UserModel copyWith({
    String? uid,
    String? email,
    String? displayName,
    String? photoUrl,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }
}
