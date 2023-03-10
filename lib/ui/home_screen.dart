import 'package:content_riverpod/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserDataProvider);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(user.)
          ],
        ),
      ),
    );
  }
}
