// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:collection';

import 'package:content_riverpod/models/user_model.dart';
import 'package:content_riverpod/state/auth/models/auth_state.dart';

class UserInfoModel extends MapView<String, dynamic> {
  final UserId userId;
  final String displayName;
  final String email;
  String? photoUrl;

  UserInfoModel({
    required this.userId,
    required this.displayName,
    required this.email,
    this.photoUrl,
  }) : super({});

  UserInfoModel.fromJson(
    Map<String, dynamic> json, {
    required UserId userId,
  }) : this(
          userId: userId,
          displayName: json["displayName"] ?? '',
          email: json["email"],
          photoUrl: json["photoUrl"],
        );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModel &&
          runtimeType == other.runtimeType &&
          userId == other.uid &&
          displayName == other.displayName &&
          email == other.email &&
          photoUrl == other.photoUrl;

  @override
  int get hashCode => Object.hashAll([
        userId,
        displayName,
        email,
        photoUrl,
      ]);
}
