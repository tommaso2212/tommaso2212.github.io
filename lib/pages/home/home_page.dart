import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_website/base/scaffold/base_scaffold.dart';
import 'package:personal_website/service/router/app_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => context.goNamed(AppRouter.wordleRoute.name!),
            child: Text("CLICCA QUI"),
          ),
        ],
      ),
    );
  }
}
