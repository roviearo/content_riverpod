import 'dart:async';

import 'package:content_riverpod/models/user_model.dart';
import 'package:content_riverpod/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'authentication_state.dart';

class AuthenticationController extends StateNotifier<AuthenticationState> {
  final AuthRepository _authRepository;
  late final StreamSubscription _streamSubscription;

  AuthenticationController(this._authRepository)
      : super(const AuthenticationState.unauthenticared()) {
    _streamSubscription =
        _authRepository.authStateChange.listen((user) => _onUserChanged(user));
  }

  void _onUserChanged(UserModel user) {
    if (user.isEmpty) {
      state = const AuthenticationState.unauthenticared();
    } else {
      state = AuthenticationState.authenticared(user);
    }
  }
}
