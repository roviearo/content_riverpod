import 'package:content_riverpod/models/user_model.dart';
import 'package:content_riverpod/providers/auth_provider.dart';
import 'package:content_riverpod/repositories/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository();
});

final currentUserDataProvider = FutureProvider<UserModel>((ref) async {
  final uid = ref.read(authRepositoryProvider).currentUser!.uid;
  return ref.read(userRepositoryProvider).currentUserData(uid);
});
