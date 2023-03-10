import 'package:content_riverpod/state/auth/backend/authenticator.dart';
import 'package:content_riverpod/state/auth/models/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final _authenticator = Authenticator();
  final _userInfoStorage = const UserInfoS
  AuthStateNotifier() : super(const AuthState.unknown());
}
