part of 'authentication_controller.dart';

enum AuthenticationStatus { authenticated, unauthenticated }

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final UserModel user;

  const AuthenticationState._({
    required this.status,
    this.user = UserModel.empty,
  });

  const AuthenticationState.authenticared(UserModel user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationState.unauthenticared()
      : this._(status: AuthenticationStatus.unauthenticated);

  @override
  List<Object> get props => [status, user];
}
