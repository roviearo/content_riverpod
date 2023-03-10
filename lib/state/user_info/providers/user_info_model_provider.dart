import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:content_riverpod/state/auth/models/auth_state.dart';
import 'package:content_riverpod/state/user_info/models/user_info_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userInfoModelProvider =
    StreamProvider.family.autoDispose<UserInfoModel, UserId>(
  (ref, UserId userId) {
    final controller = StreamController<UserInfoModel>();

    final sub = FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.data()!.isNotEmpty) {
        final json = snapshot.data();
        final userInfoModel = UserInfoModel.fromJson(
          json!,
          userId: userId,
        );
        controller.add(userInfoModel);
      }
    });

    ref.onDispose(() {
      sub.cancel();
      controller.close();
    });

    return controller.stream;
  },
);
