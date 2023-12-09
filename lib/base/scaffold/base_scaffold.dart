import 'package:flutter/material.dart';
import 'package:personal_website/service/router/app_router.dart';

class BaseScaffold extends StatelessWidget {
  final Widget child;
  const BaseScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppRouter.getName(context),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        automaticallyImplyLeading: false,
      ),
      body: child,
    );
  }
}
