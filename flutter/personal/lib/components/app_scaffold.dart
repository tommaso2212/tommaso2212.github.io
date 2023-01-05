import 'package:flutter/material.dart';
import 'package:personal/constants/app_color.dart';
import 'package:personal/features/users/domain/user.dart';
import 'package:personal/routing/app_routing.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final List<Widget> appBarActions;

  const AppScaffold(
      {Key? key, required this.child, this.appBarActions = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          ...appBarActions,
          //UserAvatar(),
        ],
      ),
      body: child,
    );
  }
}
