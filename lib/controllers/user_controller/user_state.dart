// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_controller.dart';

class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserStateInitial extends UserState {
  const UserStateInitial();

  @override
  List<Object> get props => [];
}

class UserStateLoading extends UserState {
  const UserStateLoading();

  @override
  List<Object> get props => [];
}

class UserStateLoaded extends UserState {
  final UserModel user;
  const UserStateLoaded(this.user);

  @override
  List<Object> get props => [user];
}

class UserStateError extends UserState {
  const UserStateError();

  @override
  List<Object> get props => [];
}
