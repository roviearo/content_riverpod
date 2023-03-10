// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:content_riverpod/providers/auth_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:content_riverpod/models/user_model.dart';

part 'user_state.dart';

class UserController extends StateNotifier<UserState> {
  UserController(this.ref) : super(const UserStateInitial());

  final Ref ref;

  void currentUserData(String uid) async {
    state = const UserStateLoading();
    // try {
    //   final user = await ref.read(authRepositoryProvider).currentUserData(uid);
    //   state = const UserStateLoaded(user);
    // } catch (e) {}
  }
}
