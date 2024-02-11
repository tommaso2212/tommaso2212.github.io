import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_website/service/inspect_code/presentation/inspectable_widget.dart';
import 'package:personal_website/service/router/app_router.dart';

class BaseAppBar extends StatelessWidget {
  const BaseAppBar({
    required this.children,
    required this.isBack,
    super.key,
  });

  final List<Widget> children;
  final bool isBack;

  @override
  Widget build(BuildContext context) {
    return InspectableWidget(
      path: 'lib/base/app_bar/base_app_bar.dart',
      child: Row(
        children: [
          IconButton.outlined(
            icon: Icon(isBack ? Icons.arrow_back : Icons.home_rounded),
            style: OutlinedButtonTheme.of(context).style,
            onPressed: () => isBack ? context.pop() : context.go(AppRouter.homeRoute.path),
          ),
          ...children,
        ],
      ),
    );
  }
}
