import 'package:content_riverpod/providers/auth_provider.dart';
import 'package:content_riverpod/ui/home_screen.dart';
import 'package:content_riverpod/ui/login_screen.dart';
import 'package:content_riverpod/ui/shimmer_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return authState.when(
      data: (user) {
        if (user != null) return const HomeScreen();
        return const LoginScreen();
      },
      error: (error, stackTrace) => const LoginScreen(),
      loading: () => const ShimmerHomeScreen(),
    );
  }
}
