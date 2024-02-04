import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_website/service/inspect_code/presentation/inspectable_widget.dart';
import 'package:personal_website/service/router/app_router.dart';

class BaseAppBar extends StatelessWidget {
  const BaseAppBar({
    required this.children,
    super.key,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return InspectableWidget(
      path: 'lib/base/app_bar/base_app_bar.dart',
      child: Row(
        children: [
          IconButton.outlined(
            icon: const Icon(Icons.home_rounded),
            style: OutlinedButtonTheme.of(context).style,
            onPressed: () => context.go(AppRouter.homeRoute.path),
          ),
          ...children,
        ],
      ),
    );
  }
}
