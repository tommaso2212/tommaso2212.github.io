import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal/features/google/presentation/google_login.dart';
import 'package:personal/features/login/application/login_provider.dart';
import 'package:personal/routing/app_route.dart';
import 'package:personal/routing/app_routing.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isLogged = ref.watch(loginProvider);

    if (isLogged) {
      AppRouting.go(context, AppRoute.home);
    }

    return Center(
      child: GoogleLogin(
        onPressed: () async {
          await ref.read(loginProvider.notifier).login();
        },
      ),
    );
  }
}
