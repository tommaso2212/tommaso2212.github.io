import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal/features/login/application/login_provider.dart';
import 'package:personal/features/users/application/user_provider.dart';
import 'package:personal/features/users/presentation/user_circle_avatar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var user = ref.watch(userProvider);

    return Scaffold(
      appBar: user != null
          ? AppBar(
              actions: [
                UserCirlceAvatar(
                  user: user,
                  onLogout: () => ref.read(loginProvider.notifier).logout(),
                ),
              ], 
            )
          : null,
      body: Container(),
    );
  }
}
